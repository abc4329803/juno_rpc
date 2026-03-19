// AD5766 power-on init controller (Verilog-2001)
// Drives an existing SPI-packeter IP via (DAC_COMMAND, DAC_ADDR, DAC_WDATA, DAC_WVALID)
// Sequence: RESET -> DITHER POWER DOWN (all) -> SPAN=5V (P=midscale) -> per-channel voltages
// Outputs 'init_done' high when initialization fully completed.

module ad5766_spi_init #
(
    parameter integer GAP_CYCLES = 511  // gap cycles between command strobes (for safety)
)
(
    input  wire        clk,        // system clock
    input  wire        rst,      // async reset, active low
    // interface to your existing SPI/IP "packer"
    output reg  [3:0]  DAC_COMMAND,
    output reg  [3:0]  DAC_ADDR,
    output reg  [15:0] DAC_WDATA,
    output reg         DAC_WVALID,
    // status
    output reg         init_done,
    output reg [2:0]   state
);

    // ========= constants from datasheet =========
    // Command nibbles
    localparam [3:0] CMD_DAISY      = 4'h0; // (unused here)
    localparam [3:0] CMD_WRITE_IN   = 4'h1; // write input only
    localparam [3:0] CMD_WRITE_UPD  = 4'h2; // write input & DAC (update)
    localparam [3:0] CMD_SW_LDAC    = 4'h3; // software LDAC (unused here)
    localparam [3:0] CMD_SPAN       = 4'h4; // span register
    localparam [3:0] CMD_POWER      = 4'h5; // power control family (addr subcode)
    localparam [3:0] CMD_WRITE_ALL  = 4'h6; // write same data to all DACs (unused)
    localparam [3:0] CMD_SW_RESET   = 4'h7; // software full reset

    // POWER CONTROL sub-address to select "Dither Power Control Register"
    // D19..D16 must be 0001 per datasheet Table 26 -> we put this in the 4-bit "ADDR" field.
    localparam [3:0] ADDR_PWR_DITHER = 4'h1;

    // SPAN data for 5 V with Power-Up Condition = Midscale (P1:P0=01, S2:S0=110) -> 0x000E
    localparam [15:0] SPAN_P_MID_S_PM5 = 16'h000E;

    // Software reset magic data (Table "Software Full Reset Register"): 0x1234
    localparam [15:0] RESET_MAGIC = 16'h1234;

    // Precomputed codes for requested voltages in 5 V span:
    // V = -2.0 V  -> code = round(((-2) - (-5))/10 * 65535) = 19660 = 0x4CCC
    // V = +0.4 V  -> code = round(((0.4) - (-5))/10 * 65535) = 35389 = 0x8A3D
    // V = 0 V     -> code = 0x8000 (midscale)
    localparam [15:0] CODE_NEG2V = 16'h4CCC;
    //localparam [15:0] CODE_P040V = 16'h89D0; //8A3D: 400mV;8CCC: 500 mV; 8F5C: 600mV; 91EC:700 mV; 947B: 800 mV
    localparam [15:0] CODE_P040V = 16'h8CCC; //8A3D: 400mV;8CCC: 500 mV; 8F5C: 600mV;
	 localparam [15:0] CODE_0V    = 16'h8000;

    // FSM
    localparam [2:0] S_IDLE   = 3'd0;
    localparam [2:0] S_SEND   = 3'd1;
    localparam [2:0] S_GAP    = 3'd2;
    localparam [2:0] S_NEXT   = 3'd3;
    localparam [2:0] S_DONE   = 3'd4;

    //reg [2:0]  state;
    reg [7:0]  step;        // which command in the sequence
    reg [3:0]  ch;          // channel index for per-channel writes
    reg [8:0]  gap_cnt;

    // dither power-down bitmap: D15..D0 = 1 => power-down dither for that channel
    localparam [15:0] DITHER_PD_ALL = 16'hFFFF;

    // helper: return data code by channel
    function [15:0] code_for_channel;
        input [3:0] ch_in;
        begin
            case (ch_in)
                4'd1, 4'd4, 4'd6, 4'd7, 4'd10, 4'd13, 4'd15: code_for_channel = CODE_NEG2V;  // -2 V
                4'd2, 4'd5, 4'd9, 4'd11, 4'd12, 4'd14:       code_for_channel = CODE_P040V;  // +0.4 V
                default:                                     code_for_channel = CODE_0V;     // 0 V
            endcase
        end
    endfunction

    // drive a single-cycle WVALID with fields prepared
    task emit_cmd;
        input [3:0] c;
        input [3:0] a;
        input [15:0] d;
        begin
            DAC_COMMAND <= c;
            DAC_ADDR    <= a;
            DAC_WDATA   <= d;
            DAC_WVALID  <= 1'b1;  // one-cycle strobe in S_SEND
        end
    endtask

    // main FSM
    always @(posedge clk) begin
        if (rst) begin
            state       <= S_IDLE;
            step        <= 8'd0;
            ch          <= 4'd0;
            gap_cnt     <= 8'd0;
            DAC_COMMAND <= 4'd0;
            DAC_ADDR    <= 4'd0;
            DAC_WDATA   <= 16'd0;
            DAC_WVALID  <= 1'b0;
            init_done   <= 1'b0;
        end else begin
            // default
            DAC_WVALID <= 1'b0;

            case (state)
            // kick off immediately after reset release
            S_IDLE: begin
                init_done <= 1'b0;
                state     <= S_SEND;
            end

            // issue current step command
            S_SEND: begin
                // Step 0: Software Full Reset
                if (step == 8'd0) begin
                    emit_cmd(CMD_SW_RESET, 4'h0, RESET_MAGIC);
                    state   <= S_GAP;
                    gap_cnt <= GAP_CYCLES[8:0];
                end
                // Step 1: Dither Power Control -> power-down all channels' dither blocks
                else if (step == 8'd1) begin
                    emit_cmd(CMD_POWER, ADDR_PWR_DITHER, DITHER_PD_ALL);
                    state   <= S_GAP;
                    gap_cnt <= GAP_CYCLES[8:0];
                end
                // Step 2: SPAN = 5 V, Power-up condition = Midscale
                else if (step == 8'd2) begin
                    emit_cmd(CMD_SPAN, 4'h0, SPAN_P_MID_S_PM5);
                    // prepare per-channel loop
                    ch      <= 4'd0;
                    state   <= S_GAP;
                    gap_cnt <= GAP_CYCLES[8:0];
                end
                // Step 3..(3+15): write & update each channel
                else if (step >= 8'd3 && step <= 8'd18) begin
                    emit_cmd(CMD_WRITE_UPD, ch[3:0], code_for_channel(ch));
                    state   <= S_GAP;
                    gap_cnt <= GAP_CYCLES[8:0];
                end
                else begin
                    // all done
                    state   <= S_DONE;
                end
            end

            // inter-command gap to avoid back-to-back pushing if the downstream needs a breather
            S_GAP: begin
                if (gap_cnt != 8'd0) begin
                    gap_cnt <= gap_cnt - 8'd1;
                end else begin
                    state   <= S_NEXT;
                end
            end

            // advance to next step/channel
            S_NEXT: begin
                if (step >= 8'd3 && step <= 8'd18) begin
                    // advancing channels
                    if (ch != 4'd15) begin
                        ch   <= ch + 4'd1;
                        step <= step + 8'd1;
                        state<= S_SEND;
                    end else begin
                        // finished last channel -> move to done
                        step  <= step + 8'd1; // becomes 19
                        state <= S_SEND;      // S_SEND will place us into S_DONE
                    end
                end else begin
                    // steps 0..2 or others
                    step  <= step + 8'd1;
                    state <= S_SEND;
                end
            end

            S_DONE: begin
                init_done <= 1'b1;
                // stay here; no further writes  ᡰһֱͣá
            end

            default: state <= S_IDLE;
            endcase
        end
    end
	 
/*
    wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0)  // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

     ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG0(state),  // IN BUS [7:0]
        .TRIG1(step), // IN BUS [7:0]
        .TRIG2(DAC_COMMAND),  // IN BUS [7:0]
        .TRIG3(DAC_ADDR),  // IN BUS [7:0]
        .TRIG4(DAC_WDATA), // IN BUS [7:0]
        .TRIG5(DAC_WVALID), // IN BUS [7:0]
        .TRIG6(rst) // IN BUS [7:0]
		// .TRIG7(k7_TRAINNING_ENABLE), // IN BUS [7:0]
		// .TRIG8(FB_LVDS33[1]), // IN BUS [7:0]
        // .TRIG9(DATA_OUT_VALID[1]), // IN BUS [7:0]
        // .TRIG10(DATA_OUT[1]), // IN BUS [7:0]
        // .TRIG11(k7_RxD_data_ready), // IN BUS [7:0]
        // .TRIG12(k7_RxD_data),
        // .TRIG13(DATA_LVDS33_PHSAE),
        // .TRIG14(k7_register_addr)
    ); */


endmodule
