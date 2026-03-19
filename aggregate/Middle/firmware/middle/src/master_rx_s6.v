`timescale 1ns / 1ps

module master_rx_s6 #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH = 16
)(
    input wire clk_250m,      
    input wire clk_62_5m,
	 input wire IOCE,	 
    input wire rst,
    input wire rx_p,
    input wire rx_n,
    
    output reg [1:0] uart_cmd_out, 
    output reg [PAYLOAD_WIDTH-1:0] data_out,
    output reg data_valid,
    output reg crc_error_pulse,
    input wire tim_1s,
    output wire rx_ibuf,
	 output reg [2:0] state
);

    // --- ISERDES & IBUFDS ---
    //wire rx_ibuf;
    //IBUFDS ibufds_inst (.O(rx_ibuf), .I(rx_p), .IB(rx_n));
    IBUFDS #(
        .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
        .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
        .IOSTANDARD("LVDS_33") // Specify the I/O standard
        //.SLEW("SLOW")            // Specify the output slew rate
    ) ibufds_inst (
        .O(rx_ibuf), 
        .I(rx_p), 
        .IB(rx_n)
    );

    wire [3:0] oversample_data; 
    ISERDES2 #(
        .DATA_WIDTH(4), 
        .DATA_RATE("SDR"), 
        .BITSLIP_ENABLE("FALSE"), 
        .SERDES_MODE("MASTER"), 
        .INTERFACE_TYPE("NETWORKING") // S6 ĬϽӿģʽ
    ) u_iserdes_s6 (
        .D(rx_ibuf), 
        .CE0(1'b1), 
        .CLK0(clk_250m),      // ٲʱ (IOCLK)
        .CLK1(1'b0),          // SDR ģʽ CLK1 ɲ
        .CLKDIV(clk_62_5m),   // Ƶʱ (DIVCLK)
        .RST(rst), 
        // ӳ䣺 K7 ߼һ£Q4 µλQ1 ɵλ
        .Q4(oversample_data[3]), 
        .Q3(oversample_data[2]), 
        .Q2(oversample_data[1]), 
        .Q1(oversample_data[0]),
        // δʹ
        .BITSLIP(1'b0),
        .FABRICOUT(),
		  //.IOCE(IOCE),
        .CFB0(), .CFB1(), .DFB(), .SHIFTOUT()
    );

    // ---  ---
    function automatic is_training_pattern;
        input [7:0] val;
        begin
            //  0xB5 (10110101) ѭλ
            case (val)
                8'b10110101, 8'b01101011, 8'b11010110, 8'b10101101, 
                8'b01011011, 8'b10110110, 8'b01101101, 8'b11011010: is_training_pattern = 1'b1; 
                default: is_training_pattern = 1'b0;
            endcase
        end
    endfunction

    function [15:0] next_crc;
        input [15:0] current_crc;
        input serial_in;
        begin
            next_crc = {current_crc[14:0], 1'b0} ^ ({16{(current_crc[15] ^ serial_in)}} & 16'h1021); 
        end
    endfunction

    // --- ڲź ---
    reg [1:0] best_tap; 
    reg       tap_locked;
    reg       polarity_inv;
    reg [7:0] stream_shreg [0:3]; 
    reg [8:0] match_cnt    [0:3]; // [޸]: չλָ֧
    integer i;

    localparam S_M_TRAIN      = 3'd0;
    localparam S_M_WAIT_SYNC  = 3'd1;
    localparam S_M_SCAN       = 3'd2;
    localparam S_M_DATA       = 3'd3;
    localparam S_M_CRC        = 3'd4;

    // [޸]: ֵȶ
    // 62.5MHz£128ԼΪ2us㹻˳
    localparam STRICT_LOCK_THRESHOLD = 9'd128; 

    //reg [2:0] state;
    reg [63:0] rx_shift_reg;
    reg [7:0]  bit_cnt;
    reg [15:0] crc_calc;
    reg [PAYLOAD_WIDTH-1:0] payload_shift;
    
    reg [3:0] error_counter;
    localparam MAX_ERRORS = 5;

    reg selected_bit;
    always @(*) begin
        if (polarity_inv) selected_bit = ~oversample_data[best_tap];
        else selected_bit = oversample_data[best_tap];
    end

    // --- ״̬ ---
    always @(posedge clk_62_5m) begin
        if (rst) begin
            state <= S_M_TRAIN;
            uart_cmd_out <= 2'b01;
            tap_locked <= 0;
            best_tap <= 0;
            polarity_inv <= 0;
            error_counter <= 0;
            data_valid <= 0;
            crc_error_pulse <= 0;
            payload_shift <= 0;
            for(i=0; i<4; i=i+1) begin
                stream_shreg[i] <= 0;
                match_cnt[i] <= 0;
            end
        end else begin
            data_valid <= 0;
            crc_error_pulse <= 0;
            rx_shift_reg <= {rx_shift_reg[62:0], selected_bit};

            case (state)
                S_M_TRAIN: begin // 0
                    uart_cmd_out <= 2'b01;
                    tap_locked <= 0;
                    crc_calc <= 16'hFFFF; 
                    // м 4 λȶ
                    for (i=0; i<4; i=i+1) begin
                        stream_shreg[i] <= {stream_shreg[i][6:0], oversample_data[i]};
                        
                        if (is_training_pattern(stream_shreg[i])) begin
                            // ƥ
                            if (match_cnt[i] < 500) match_cnt[i] <= match_cnt[i] + 1;
                        end else if (is_training_pattern(~stream_shreg[i])) begin
                            // ƥ
                            if (match_cnt[i] < 500) match_cnt[i] <= match_cnt[i] + 1;
                        end else begin
                            // [ؼ]: һвƥ䣬㣬ȷȶ
                            match_cnt[i] <= 0;
                        end
                    end

                    // ߼
                    if (!tap_locked) begin
                        for (i=0; i<4; i=i+1) begin
                            // [޸]: ʹøߵֵ (128)
                            if (match_cnt[i] > STRICT_LOCK_THRESHOLD) begin
                                best_tap <= i[1:0];
                                tap_locked <= 1;
                                
                                // ٴȷϼ
                                if (is_training_pattern(~stream_shreg[i])) polarity_inv <= 1;
                                else polarity_inv <= 0;
                                
                                state <= S_M_WAIT_SYNC; 
                                error_counter <= 0; // ô
                            end
                        end
                    end
                end

                S_M_WAIT_SYNC: begin // 1
                    uart_cmd_out <= 2'b10;
                    if (rx_shift_reg == 64'hE15D_98AF_2B4C_7036) begin
                        state <= S_M_SCAN;
                    end else if(tim_1s) begin
                        
                    end
                end

                S_M_SCAN: begin // 2
                    uart_cmd_out <= 2'b11; 
                    if (rx_shift_reg == 64'hE15D_98AF_2B4C_7036) begin
                        payload_shift <= {payload_shift[PAYLOAD_WIDTH-2:0], selected_bit};
                        crc_calc <= next_crc(16'hFFFF, selected_bit);
                        state <= S_M_DATA;
                        bit_cnt <= 0;
                        //crc_calc <= 16'hFFFF; 
                    end
                end

                S_M_DATA: begin // 3
                    uart_cmd_out <= 2'b11;
                    
                    
                    
                    if (bit_cnt == PAYLOAD_WIDTH - 1) begin
                        bit_cnt <= 0;
                        state <= S_M_CRC;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                        payload_shift <= {payload_shift[PAYLOAD_WIDTH-2:0], selected_bit};
                        crc_calc <= next_crc(crc_calc, selected_bit);
                    end
                end

                S_M_CRC: begin // 4
                    uart_cmd_out <= 2'b11;
                    // CRCղ֣
                    if (bit_cnt == CRC_WIDTH - 1) begin
                        
                        // ȽϽյCRC (rx_shift_reg16λ)  ֵ
                        if (rx_shift_reg[15:0] == crc_calc) begin
                            // --- CRC PASS ---
                            data_valid <= 1;
                            data_out <= payload_shift;
                            error_counter <= 0; 
                            state <= S_M_SCAN; 
                        end else begin
                            // --- CRC FAIL ---
                            crc_error_pulse <= 1;
                            
                            // ѵ߼
                            if (error_counter >= MAX_ERRORS) begin
                                state <= S_M_TRAIN; 
                                error_counter <= 0;
                            end else begin
                                error_counter <= error_counter + 1;
                                state <= S_M_SCAN;
                            end
                        end
                        bit_cnt <= 0;
                        
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
            endcase
        end
    end
/*
	 wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0) // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk_62_5m),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
		  .TRIG0(uart_cmd_out),  // IN BUS [7:0]
        .TRIG1(crc_error_pulse),
        .TRIG2(state),  // IN BUS [7:0]
        .TRIG3(payload_shift),
		  .TRIG4(crc_calc),
		  .TRIG5(rx_shift_reg[15:0]),
		  .TRIG6(data_valid),
		  .TRIG7(selected_bit),
		  .TRIG8(bit_cnt)

    );*/

endmodule