`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 01:28:26 PM
// Design Name: 
// Module Name: AD5532HS_Config
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module AD5766#(
    parameter  SHIFT_REG_WIDTH = 24
)(
    input wire clk,              // System clock at 125 MHz
    input wire reset,            // System reset
    output reg SCLK,             // Serial clock at 25 MHz
    output reg SYNC,             // Frame synchronization signal
    output reg DIN,              // Serial data input
    input wire DOUT,
    output reg AD5766_reset,     // AD5532 reset pin (active low)
    output reg DAC_RD,
    input wire DAC_EMPTY,
    input wire [3:0] DAC_COMMAND,   // COMMAND (4 bits)
    input wire [3:0] DAC_ADDR,   // DAC address (4 bits)
    input wire [15:0] DAC_WDATA,  // DAC data (16 bits)
    input wire DAC_WVALID,         // Start signal for configuration
    output wire [15:0] DAC_RDATA,  // DAC data (16 bits)
    output wire DAC_RVALID,         // Start signal for configuration
	 inout  wire [35:0] CONTROL0,
	 output wire [2:0] state1,
	 output reg DAC_WVALID_r
);

    // Internal variables
    reg [SHIFT_REG_WIDTH - 1:0] shift_reg;    // 19-bit shift register to hold the address and data
    reg [4:0] count;           // Bit counter
    reg [3:0] sclk_divider;  // Divider for generating SCLK
//    reg DAC_WVALID_r;

    // State Machine Declaration
    localparam IDLE0 = 0,
               IDLE1 = 1,
               IDLE2 = 2,
               LOAD = 3,
               SEND = 4,
               FINISH = 5;

    reg [2:0] state = IDLE0;
	 assign state1 = state;
    always @(posedge clk) begin
        DAC_WVALID_r <= DAC_WVALID;
        if (reset) begin
            state <= IDLE0;
            SCLK <= 0;
            SYNC <= 1;
            DIN <= 0;
            AD5766_reset <= 0;   // Active low reset
            count <= 0;
            sclk_divider <= 0;
            DAC_RD <= 1'b0;
        end else begin
            AD5766_reset <= 1;   // Deactivate reset (active low)
            case (state)
                IDLE0: begin                   
                    //if (DAC_WVALID & !DAC_WVALID_r) begin
						  if (DAC_WVALID) begin
                        // Load the shift register with address and data
                        shift_reg <= {DAC_COMMAND, DAC_ADDR, DAC_WDATA};
                        state <= LOAD;
                        SYNC <= 0;  // Pull SYNC low to start the frame
                        DAC_RD <= 1'b0;
                    end else begin
                        SYNC <= 1; 
                        if(!DAC_EMPTY) begin
                            DAC_RD <= 1'b1;
                            state <= IDLE1;
                        end else begin
                            DAC_RD <= 1'b0;
                        end
                    end
                end
                IDLE1: begin
                    DAC_RD <= 1'b0;
                    state <= IDLE0;
						  if (DAC_WVALID) begin
                        // Load the shift register with address and data
                        shift_reg <= {DAC_COMMAND, DAC_ADDR, DAC_WDATA};
                        state <= LOAD;
                        SYNC <= 0;  // Pull SYNC low to start the frame
                    end
                end
                IDLE2: begin
                    state <= IDLE0;
                end
                LOAD: begin
                    // Load completed, start sending
                    SCLK <= 0;
                    state <= SEND;
                    count <= SHIFT_REG_WIDTH;  // Initialize counter for 19 bits
                    sclk_divider <= 0; // Reset SCLK divider
                end
                SEND: begin
                    if (sclk_divider == 7) begin  // Toggle SCLK every 8 system clock cycles
                        SCLK <= ~SCLK;
                        sclk_divider <= 0;
                        if (count == 0) begin
                           state <= FINISH;
                        end
                        if (!SCLK) begin  // Load DIN on high phase so it's ready for the next falling edge
                            DIN <= shift_reg[SHIFT_REG_WIDTH - 1];  // Output MSB first
                            shift_reg <= shift_reg << 1;  // Shift left
                            count <= count - 1;
                        end
                    end else begin
                        sclk_divider <= sclk_divider + 1;
                    end

                end
                FINISH: begin
                    SCLK <= 0;
                    if (sclk_divider == 7) begin 
                        DIN <= 0;
                        sclk_divider <= 0;
                        SYNC <= 1;  // End of transmission
                        state <= IDLE0;
                    end else begin
                        sclk_divider <= sclk_divider + 1;
                    end

                end
            endcase
        end
    end
    /*
    ila_8 ila_8(
        .clk(clk), // input wire clk
        .probe0(SCLK),
        .probe1(SYNC),
        .probe2(DIN),
        .probe3(AD5766_reset),
        .probe4(state),
        .probe5(shift_reg),
        .probe6(start),
        .probe7(reset),
        .probe8(DAC_ADDR),
        .probe9(DAC_WDATA),
        .probe10(count),
        .probe11(sclk_divider)
    );
    *//*

    wire [35:0] CONTROL0;
    icon_1 icon_1_inst (
        .CONTROL0(CONTROL0)  // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

*/   /* ila_1 ila_1_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG0(state),  // IN BUS [7:0]
        .TRIG1(DAC_WVALID), // IN BUS [7:0]
        .TRIG2(DAC_WVALID_r)  // IN BUS [7:0]
        // .TRIG3(DAC_nSYNC),  // IN BUS [7:0]
        // .TRIG4(DAC_SDI), // IN BUS [7:0]
        // .TRIG5(DAC_SDO), // IN BUS [7:0]
        // .TRIG6(DAC_nRESET), // IN BUS [7:0]
		// .TRIG7(DAC_WDATA_INIT), // IN BUS [7:0]
		// .TRIG8(DAC_WVALID_INIT) // IN BUS [7:0]
        // .TRIG9(DATA_OUT_VALID[1]), // IN BUS [7:0]
        // .TRIG10(DATA_OUT[1]), // IN BUS [7:0]
        // .TRIG11(k7_RxD_data_ready), // IN BUS [7:0]
        // .TRIG12(k7_RxD_data),
        // .TRIG13(DATA_LVDS33_PHSAE),
        // .TRIG14(k7_register_addr)
    ); */
endmodule