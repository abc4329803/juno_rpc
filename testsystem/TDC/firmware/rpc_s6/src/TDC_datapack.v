`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:06 07/17/2013 
// Design Name: 
// Module Name:    TOP 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TDC_datapack #(
    parameter TDC_NUM = 80,
    parameter MANCHESTER_DATA_WIDTH = 112,
	 parameter TDC_DATA_WIDTH = 64,
    parameter DEAD_TIME = 19
) (

    // input CLKP,
    // input CLKN,
    input CLK_IN,  //test bench
    //	input CLKM_P,
    //	input CLKM_N,
    input reset,
	 
	 input CLK_10M_EXT,

    input  [TDC_NUM - 1:0] RPC_SIGNAL,
    input                  FB_IN,
	input                  FB_IN_VALID,
    output                 FB_OUT,
    output                 FB_OUT_EN,
    output                  DATA_OUT,
    output                 DATA_VALID,
	 input           		EXT_TRIGGER_ENABLE,
	 output           		SOFT_TRIGGER_ENABLE,
	 output                 PLL1_LOCKED,
	 output                 PLL2_LOCKED,
	 output        [1:0]    DIGITAL_SIGNAL,
	 output        [7:0]    same
    //output 					 CLK_OUT

    //	input [4:0] CTRL,

    //    input GTPD3_P,
    //    input GTPD3_N,
    //	input	GTPD3,//test
    /* 	input RXP,
	input RXN,
	output TXP,
	output TXN, */

    //	input CABLE_CLK_P,
    //	input CABLE_CLK_N,
    //	input CABLE_TX1_P,
    //	input CABLE_TX1_N,
    //	input CABLE_TX2_P,
    //	input CABLE_TX2_N,
    //	input CABLE_RSV,
    //	input CABLE_SCL,//test
    //	input CABLE_SDA,
    //	output CABLE_RX1_P,
    //	output CABLE_RX1_N,
    //	output CABLE_RX2_P,
    //	output CABLE_RX2_N

);

    //wire CLK_IN;
    //wire reset;
    wire clk250_0_pll;
    wire clk250_90_pll;
    wire clk250_180_pll;
    wire clk250_270_pll;
    wire clk125M_pll;
    wire clkm_pll;
    wire clk62M5_pll;
    wire clk200M_pll;
    wire clk250_0;
    wire clk250_90;
    wire clk250_180;
    wire clk250_270;
    wire clk125M;
    wire clkm;
    wire clk62M5;
    wire clk200M;
    wire CLKFB;
    wire CLKFBIN;
    wire LOCKED;
    //wire [63:0] signal;
    //wire [4:0] ctrl;

    //wire mgtm2d;
    //wire mgtd2m;

    // IBUFGDS: Differential Global Clock Buffer (sourced by an external pin)
    //          Spartan-6
    // Xilinx HDL Language Template, version 14.4

    //    IBUFGDS #(
    //       .DIFF_TERM("FALSE"), // Differential Termination
    //       .IOSTANDARD("DEFAULT") // Specifies the I/O standard for this buffer
    //    ) IBUFGDS_inst (
    //       .O(CLK_IN),  // Clock buffer output
    //       .I(CLKP),  // Diff_p clock buffer input
    //       .IB(CLKN) // Diff_n clock buffer input
    //    );

    // End of IBUFGDS_inst instantiation

    // PLL_BASE: Phase Locked Loop (PLL) Clock Management Component
    //           Spartan-6
    // Xilinx HDL Language Template, version 14.4

    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(8.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(4),
        .CLKOUT1_DIVIDE(4),
        .CLKOUT2_DIVIDE(4),
        .CLKOUT3_DIVIDE(4),
        .CLKOUT4_DIVIDE(5),
        .CLKOUT5_DIVIDE(8),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(90.0),
        .CLKOUT2_PHASE(180.0),
        .CLKOUT3_PHASE(270.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(180.0),
        .CLK_FEEDBACK("CLKFBOUT"),  // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
        .COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
        .DIVCLK_DIVIDE(1),  // Division value for all output clocks (1-52)
        .REF_JITTER(0.1),  // Reference Clock Jitter in UI (0.000-0.999).
        .RESET_ON_LOSS_OF_LOCK("FALSE")  // Must be set to FALSE
    ) PLL_BASE_1 (
        .CLKFBOUT(CLKFB),           // 1-bit output: PLL_BASE feedback output
        // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
        .CLKOUT0 (clk250_0_pll),
        .CLKOUT1 (clk250_90_pll),
        .CLKOUT2 (clk250_180_pll),
        .CLKOUT3 (clk250_270_pll),
        .CLKOUT4 (clk200M_pll),
        .CLKOUT5 (clk125M_pll),
        .LOCKED  (PLL1_LOCKED),          // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFB),           // 1-bit input: Feedback clock input
        .CLKIN   (CLK_IN),          // 1-bit input: Clock input
        .RST     (1'b0)            // 1-bit input: Reset input
    );

    // End of PLL_BASE_inst instantiation

    BUFG BUFG_clk250_0 (
        .O(clk250_0),  // 1-bit output: Clock buffer output
        .I(clk250_0_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_90 (
        .O(clk250_90),  // 1-bit output: Clock buffer output
        .I(clk250_90_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_180 (
        .O(clk250_180),  // 1-bit output: Clock buffer output
        .I(clk250_180_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_270 (
        .O(clk250_270),  // 1-bit output: Clock buffer output
        .I(clk250_270_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk200 (
        .O(clk200M),  // 1-bit output: Clock buffer output
        .I(clk200M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk125M (
        .O(clk125M),  // 1-bit output: Clock buffer output
        .I(clk125M_pll)  // 1-bit input: Clock buffer input
    );

    //	BUFG BUFG_clkm (
    //      .O(clkm), // 1-bit output: Clock buffer output
    //      .I(clkm_pll)  // 1-bit input: Clock buffer input
    //   );

    wire clk_10M;
    wire clk_10M_pll;
    wire clk_5M;
    wire clk_5M_pll;
    wire clk_20M;
    wire clk_20M_pll;

    wire clk_80M;
    wire clk_80M_pll;
	 
	 
//	 wire clk_10M_pll_1;
//	 wire clk_20M_pll_1;
//	 wire clk_80M_pll_1;


    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(8.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(80),
        .CLKOUT1_DIVIDE(40),
        .CLKOUT2_DIVIDE(10),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .CLK_FEEDBACK("CLKFBOUT"),  // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
        .COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
        .DIVCLK_DIVIDE(1),  // Division value for all output clocks (1-52)
        .REF_JITTER(0.1),  // Reference Clock Jitter in UI (0.000-0.999).
        .RESET_ON_LOSS_OF_LOCK("FALSE")  // Must be set to FALSE
    ) PLL_BASE_2 (
        .CLKFBOUT(CLKFBIN),      // 1-bit output: PLL_BASE feedback output
        // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
        .CLKOUT0 (clk_10M_pll),
        .CLKOUT1 (clk_20M_pll),
        .CLKOUT2 (clk_80M_pll),
        .CLKOUT3 (),
        .CLKOUT4 (),
        .CLKOUT5 (),
        .LOCKED  (PLL2_LOCKED),             // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFBIN),      // 1-bit input: Feedback clock input
        .CLKIN   (CLK_IN),       // 1-bit input: Clock input
        .RST     (1'b0)         // 1-bit input: Reset input
    );
/*
	wire CLKFBIN1;
    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(40),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(50.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(40),
        .CLKOUT1_DIVIDE(20),
        .CLKOUT2_DIVIDE(5),
        .CLKOUT3_DIVIDE(1),
        .CLKOUT4_DIVIDE(1),
        .CLKOUT5_DIVIDE(1),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .CLK_FEEDBACK("CLKFBOUT"),  // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
        .COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
        .DIVCLK_DIVIDE(1),  // Division value for all output clocks (1-52)
        .REF_JITTER(0.1),  // Reference Clock Jitter in UI (0.000-0.999).
        .RESET_ON_LOSS_OF_LOCK("FALSE")  // Must be set to FALSE
    ) PLL_BASE_3 (
        .CLKFBOUT(CLKFBIN1),      // 1-bit output: PLL_BASE feedback output
        // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
        .CLKOUT0 (clk_10M_pll),
        .CLKOUT1 (clk_20M_pll),
        .CLKOUT2 (clk_80M_pll),
        .CLKOUT3 (),
        .CLKOUT4 (),
        .CLKOUT5 (),
        .LOCKED  (),             // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFBIN1),      // 1-bit input: Feedback clock input
        .CLKIN   (CLK_10M_EXT),       // 1-bit input: Clock input
        .RST     (reset)         // 1-bit input: Reset input
    );
*/	
    BUFG BUFG_clk_10M (
        .O(clk_10M),  // 1-bit output: Clock buffer output
        .I(clk_10M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_20M (
        .O(clk_20M),  // 1-bit output: Clock buffer output
        .I(clk_20M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_80M (
        .O(clk_80M),  // 1-bit output: Clock buffer output
        .I(clk_80M_pll)  // 1-bit input: Clock buffer input
    );
    assign clkm   = CLK_IN;
    //assign clk125M = CLK_IN;


    wire [44:0] coarse_time;

    Coarse_Time_Counter CTC (
        .clk(CLK_IN),  // input clk
        .sclr(reset),  // input sclr
        .q(coarse_time[44:0])  // output [11 : 0] q
    );

    //wire	[63:0]	FULL_DATA_M_CH[ TDC_NUM - 1: 0];

    // wire	[31:0]	FULL_DATA_M_CH0;
    // wire	[31:0]	FULL_DATA_M_CH1;
    // wire	[31:0]	FULL_DATA_M_CH2;
    // wire	[31:0]	FULL_DATA_M_CH3;

    //reg	   [TDC_NUM - 1:0]		FULL_DATA_READY_M_CH;
    //wire		[TDC_NUM - 1:0]		FULL_DATA_VALID_M_CH;

    //genvar TDC_group_index;
    //generate
    //        
    //        for(TDC_group_index = 0;TDC_group_index < TDC_NUM;TDC_group_index = TDC_group_index + 1) begin
    //			PTDC_16CH #
    //			(
    //				.TDC_NUM(TDC_NUM)
    //			)
    //			PTDC_16CH_0(
    //				.HIT(SIGNAL[(TDC_group_index*TDC_NUM)+:TDC_NUM]),
    //				.reset(reset),
    //				.clk250_0(clk250_0),
    //				.clk250_90(clk250_90),
    //				.clk250_180(clk250_180),
    //				.clk250_270(clk250_270),
    //				.clk125M(clk125M),
    //				.clkm(clkm),
    //				.coarse_time(coarse_time),
    //
    //				.M_FULL_DATA_READY(FULL_DATA_READY_M_CH[TDC_group_index]),	
    //				.M_FULL_DATA(FULL_DATA_M_CH[TDC_group_index]),
    //				.M_FULL_DATA_VALID(FULL_DATA_VALID_M_CH[TDC_group_index])
    //			);
    //		end
    //endgenerate

    wire [TDC_DATA_WIDTH - 1:0] FULL_DATA_M_CH[TDC_NUM/8 - 1:0];
    wire [TDC_NUM/8 - 1:0] FULL_DATA_VALID_M_CH;
    reg [TDC_NUM/8 - 1:0] FULL_DATA_READY_M_CH;

    reg [TDC_NUM - 1:0] SIGNAL_1;
    reg [TDC_NUM - 1:0] SIGNAL_2;
    wire [TDC_NUM - 1:0] HIT;
    reg [15:0] deadtime_counter[TDC_NUM/8 - 1:0];
    reg [7:0] hitmap_r[TDC_NUM/8 - 1:0];
    reg [7:0] hitmap[TDC_NUM/8 - 1:0];
	 reg [15:0] pad_counter[TDC_NUM/8 - 1:0];
	 reg [2:0] sum1[TDC_NUM/8 - 1:0];
	 reg [2:0] sum2[TDC_NUM/8 - 1:0];
	 reg [2:0] sum3[TDC_NUM/8 - 1:0];
	 reg [2:0] sum4[TDC_NUM/8 - 1:0];
	 reg [3:0] sum5[TDC_NUM/8 - 1:0];
	 reg [3:0] sum6[TDC_NUM/8 - 1:0];
    wire [TDC_NUM/8 - 1:0] Effective_Signal;
	 reg  [TDC_NUM/8 - 1:0] sum_ready1;
	 reg  [TDC_NUM/8 - 1:0] sum_ready2;
	 wire [TDC_NUM/8 - 1:0] time_valid_f;
	 wire [TDC_NUM/8 - 1:0] data270_r;
    reg [6:0] Effective_Channel_NUM[TDC_NUM/8 - 1:0];
    wire TIM_1S_r;
	 
	 (*keep = 1*) wire [2:0] FE_time[TDC_NUM/8 - 1:0];


    (*keep = 1*)wire [TDC_NUM/8 - 1:0] hit_r1;
    (*keep = 1*)wire [TDC_NUM/8 - 1:0] hit_r2;
    (*keep = 1*)wire [TDC_NUM/8 - 1:0] hit_r3;
    wire [TDC_NUM/8 - 1:0] time_valid_r1;
    wire [TDC_NUM/8 - 1:0] time_valid_r2;
    wire [TDC_NUM/8 - 1:0] time_valid_f1;

    wire  [15:0]   SOFT_TRIGGER_RATE;
    //wire           SOFT_TRIGGER_ENABLE;
    wire           CONFIG_VALID;
    wire           FAKE_SIGNAL;
    reg   [15:0]   counter;
    always @(posedge clk_10M) begin
        if(reset) begin
            counter <= 0;
        end else if(SOFT_TRIGGER_ENABLE | EXT_TRIGGER_ENABLE) begin
            if(counter >= SOFT_TRIGGER_RATE) begin
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
    assign FAKE_SIGNAL = (counter == SOFT_TRIGGER_RATE)? 1 : 0;
    
    wire  [TDC_NUM - 1:0] SIGNAL;

    genvar i;
    genvar x;
    generate
        for (i = 0; i < TDC_NUM; i = i + 1) begin: HIT_Rising_Edge
            assign SIGNAL[i] = ( SOFT_TRIGGER_ENABLE | EXT_TRIGGER_ENABLE )? FAKE_SIGNAL : RPC_SIGNAL[i];
            always @(posedge CLK_IN) begin
                SIGNAL_1[i] <= SIGNAL[i];
                SIGNAL_2[i] <= SIGNAL_1[i];
            end
            assign HIT[i] = SIGNAL_1[i] & (!SIGNAL_2[i]);

        end
        for (i = 0; i < TDC_NUM / 8; i = i + 1) begin: PAD
            always @(posedge CLK_IN) begin
                if (reset) begin
                    deadtime_counter[i] <= 0;
                    hitmap[i] <= 0;
						  //Effective_Signal[i] <= 0;
						  sum_ready1[i] <= 1'b0;
                end else begin
						  sum_ready2[i] <= sum_ready1[i];
						  if(sum_ready1[i]) begin
								sum5[i] <= sum1[i] + sum2[i];
								sum6[i] <= sum3[i] + sum4[i];
						  end
						  if(TIM_1S_r) begin
								pad_counter[i] <= 0;
						  end else if(sum_ready2[i]) begin
								pad_counter[i] <= pad_counter[i] + sum5[i] + sum6[i];
						  end
                    //if(carrier_ready) begin
                    if (deadtime_counter[i] == 0) begin
								sum_ready1[i] <= 1'b0;
                        if(SIGNAL[i*8] || SIGNAL[i*8+1] || SIGNAL[i*8+2] || SIGNAL[i*8+3] || SIGNAL[i*8+4] || SIGNAL[i*8+5] || SIGNAL[i*8+6] || SIGNAL[i*8+7]) begin
                            deadtime_counter[i] <= 1;
                            if (SIGNAL[i*8+7]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+7];
                                Effective_Channel_NUM[i] <= i * 8 + 7;
                                hitmap[i][7] <= 1'b1;
                            end
                            if (SIGNAL[i*8+6]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+6];
                                Effective_Channel_NUM[i] <= i * 8 + 6;
                                hitmap[i][6] <= 1'b1;
                            end
                            if (SIGNAL[i*8+5]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+5];
                                Effective_Channel_NUM[i] <= i * 8 + 5;
                                hitmap[i][5] <= 1'b1;
                            end
                            if (SIGNAL[i*8+4]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+4];
                                Effective_Channel_NUM[i] <= i * 8 + 4;
                                hitmap[i][4] <= 1'b1;
                            end
                            if (SIGNAL[i*8+3]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+3];
                                Effective_Channel_NUM[i] <= i * 8 + 3;
                                hitmap[i][3] <= 1'b1;
                            end
                            if (SIGNAL[i*8+2]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+2];
                                Effective_Channel_NUM[i] <= i * 8 + 2;
                                hitmap[i][2] <= 1'b1;
                            end
                            if (SIGNAL[i*8+1]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8+1];
                                Effective_Channel_NUM[i] <= i * 8 + 1;
                                hitmap[i][1] <= 1'b1;
                            end
                            if (SIGNAL[i*8]) begin
                                //Effective_Signal[i] <= SIGNAL[i*8];
                                Effective_Channel_NUM[i] <= i * 8;
                                hitmap[i][0] <= 1'b1;
                            end
                        end else begin
                            deadtime_counter[i] <= 0;
                        end
                    end else if (deadtime_counter[i] < DEAD_TIME) begin
								sum_ready1[i] <= 1'b0;
                        deadtime_counter[i] <= deadtime_counter[i] + 1;
                        //Effective_Signal[i] <= 0;
									 if (SIGNAL[i*8+7]) begin
                                hitmap[i][7] <= 1'b1;
                            end
                            if (SIGNAL[i*8+6]) begin
                                hitmap[i][6] <= 1'b1;
                            end
                            if (SIGNAL[i*8+5]) begin
                                hitmap[i][5] <= 1'b1;
                            end
                            if (SIGNAL[i*8+4]) begin
                                hitmap[i][4] <= 1'b1;
                            end
                            if (SIGNAL[i*8+3]) begin
                                hitmap[i][3] <= 1'b1;
                            end
                            if (SIGNAL[i*8+2]) begin
                                hitmap[i][2] <= 1'b1;
                            end
                            if (SIGNAL[i*8+1]) begin
                                hitmap[i][1] <= 1'b1;
                            end
                            if (SIGNAL[i*8]) begin
                                hitmap[i][0] <= 1'b1;
                            end
                    end else if (deadtime_counter[i] == DEAD_TIME) begin
                        deadtime_counter[i] <= deadtime_counter[i] + 1;
                        hitmap_r[i] <= hitmap[i];
                        hitmap[i] <= 8'b0;
								sum1[i] <= hitmap[i][0] + hitmap[i][1];// + hitmap[i][2] + hitmap[i][3];;
								sum2[i] <= hitmap[i][2] + hitmap[i][3];
								sum3[i] <= hitmap[i][4] + hitmap[i][5];// + hitmap[i][6] + hitmap[i][7];;
								sum4[i] <= hitmap[i][6] + hitmap[i][7];
								sum_ready1[i] <= 1'b1;
								
                    end else begin
                        deadtime_counter[i] <= 0;
								sum_ready1[i] <= 1'b0;
                    end
                    //end
                end
            end
				
				assign Effective_Signal[i] = (deadtime_counter[i] > 1)? 0 : SIGNAL[i*8+7] | SIGNAL[i*8+6] | SIGNAL[i*8+5] | SIGNAL[i*8+4] | SIGNAL[i*8+3] | SIGNAL[i*8+2] | SIGNAL[i*8+1] | SIGNAL[i*8];
            Phase_TDC #(
                .chipscope(0)
            ) PTDC (
                //.hit(SIGNAL[i]),
                .hit(Effective_Signal[i]),
                .CHANNEL_NUM(Effective_Channel_NUM[i]),
                .clk0(clk250_0),
                .clk90(clk250_90),
                .clk180(clk250_180),
                .clk270(clk250_270),
                .clksys(CLK_IN),
				.clksys_180(clk125M),
                .reset(reset),
                .coarse_time(coarse_time[44:0]),
                //.time_1s(TIM_1S_r),
					 
				.FE_time(FE_time[i]),

                .clkm(clkm),
                .FULL_DATA_READY_M(FULL_DATA_READY_M_CH[i]),
                .FULL_DATA_M(FULL_DATA_M_CH[i]),
                .FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[i]),
                .time_valid_f(time_valid_f[i]),
                .data270_r(data270_r[i]),
                .hit_r1_1(hit_r1[i]),
                .hit_r2_1(hit_r2[i]),
                .hit_r3(hit_r3[i]),
                .time_valid_r1(time_valid_r1[i]),
                .time_valid_r2(time_valid_r2[i]),
                .time_valid_f1(time_valid_f1[i])

            );
        end

    endgenerate
	/*
	 (* keep = "true" *)wire [2:0] FE_time0;
	 (* keep = "true" *)wire [2:0] FE_time1;
	 (* keep = "true" *)wire [2:0] data270_0;
	 (* keep = "true" *)wire [2:0] data270_1;
	 (* keep = "true" *)wire [2:0] data0_0;
	 (* keep = "true" *)wire [2:0] data0_1;
	 (* keep = "true" *)wire [2:0] data90_0;
	 (* keep = "true" *)wire [2:0] data90_1;
	 (* keep = "true" *)wire [2:0] data180_0;
	 (* keep = "true" *)wire [2:0] data180_1;
	 (* keep = "true" *)wire time_valid_f_0;
	 (* keep = "true" *)wire time_valid_f_1;
           Phase_TDC #(
                .chipscope(0)
            ) PTDC_0 (
                //.hit(SIGNAL[i]),
                .hit(Effective_Signal[0]),
                .CHANNEL_NUM(Effective_Channel_NUM[0]),
                .clk0(clk250_0),
                .clk90(clk250_90),
                .clk180(clk250_180),
                .clk270(clk250_270),
                .clksys(clk125M),
                .reset(reset),
                .coarse_time(coarse_time[44:0]),
                //.time_1s(TIM_1S_r),

                .clkm(clkm),
                .FULL_DATA_READY_M(FULL_DATA_READY_M_CH[0]),
                .FULL_DATA_M(FULL_DATA_M_CH[0]),
                .FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[0]),
					 
					 .FE_time(FE_time0),
					 .data270(data270_0),
					 .data0(data0_0),
					 .data90(data90_0),
					 .data180(data180_0),
					 .time_valid_f(time_valid_f_0)
            );

           Phase_TDC #(
                .chipscope(0)
            ) PTDC_1 (
                //.hit(SIGNAL[i]),
                .hit(Effective_Signal[1]),
                .CHANNEL_NUM(Effective_Channel_NUM[1]),
                .clk0(clk250_0),
                .clk90(clk250_90),
                .clk180(clk250_180),
                .clk270(clk250_270),
                .clksys(clk125M),
                .reset(reset),
                .coarse_time(coarse_time[44:0]),
                //.time_1s(TIM_1S_r),

                .clkm(clkm),
                .FULL_DATA_READY_M(FULL_DATA_READY_M_CH[1]),
                .FULL_DATA_M(FULL_DATA_M_CH[1]),
                .FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[1]),
					 
					 .FE_time(FE_time1),
					 .data270(data270_1),
					 .data0(data0_1),
					 .data90(data90_1),
					 .data180(data180_1),
					 .time_valid_f(time_valid_f_1)
            );
	*/
	 //(* keep = "true" *)wire same;
	 assign DIGITAL_SIGNAL[0] = M_FULL_DATA_VALID_r;
	 assign DIGITAL_SIGNAL[1] = time_valid_f[3];
	 
	 
	 
	 assign same[0] = hit_r1[2];//(FE_time[2] == FE_time[3]) ? 1: 0;
	 assign same[1] = hit_r2[2];
	 assign same[2] = hit_r3[2];
	 assign same[3] = hit_r1[3];//(FE_time[2] == FE_time[3]) ? 1: 0;
	 assign same[4] = hit_r2[3];
	 assign same[5] = hit_r3[3];
	 assign same[6] = Effective_Signal[2];
	 assign same[7] = Effective_Signal[3];
    //wire 			time_valid_f_test;
    //wire [2:0] 	FE_time;
    //wire [2:0]  FE_time_reg_reg;
    //
    //assign      time_valid_f_test = PTDC_0[0].time_valid_f;
    //assign		FE_time = PTDC_0[0].FE_time;
    //assign		FE_time_reg_reg = PTDC_0[0].FE_time_reg_reg;

    //ALL CHANNEL DATA TO ONE AXI4-FIFO

    (* keep = "true" *)reg [TDC_DATA_WIDTH - 1:0] S_FULL_DATA;
    (* keep = "true" *)reg    S_FULL_DATA_VALID;
    (* keep = "true" *)wire    S_FULL_DATA_READY;
    wire  [TDC_DATA_WIDTH - 1:0] M_FULL_DATA;
    (* keep = "true" *)wire    M_FULL_DATA_VALID;

    (* keep = "true" *)reg [3:0] CURRENT_STATE, NEXT_STATE;



    /* genvar x;
wire  [6:0] RD_FIFO[TDC_NUM - 1:0];
generate
	for(x = 0;x < TDC_NUM;x = x + 1) begin
		assign  RD_FIFO[x] = x;
	end
endgenerate */



    always @(posedge clkm) begin
        if (reset) CURRENT_STATE <= 0;
        else CURRENT_STATE <= NEXT_STATE;
    end

    always @(CURRENT_STATE) begin
        if (CURRENT_STATE == TDC_NUM/8 - 1) begin
            NEXT_STATE = 0;
        end else begin
            NEXT_STATE = CURRENT_STATE + 1;
        end
        /* 	case(CURRENT_STATE)
		RD_FIFO_0: NEXT_STATE = RD_FIFO_1;
		RD_FIFO_1: NEXT_STATE = RD_FIFO_2;
		RD_FIFO_2: NEXT_STATE = RD_FIFO_3;
		RD_FIFO_3: NEXT_STATE = RD_FIFO_4;
		RD_FIFO_4: NEXT_STATE = RD_FIFO_5;
		RD_FIFO_5: NEXT_STATE = RD_FIFO_6;
		RD_FIFO_6: NEXT_STATE = RD_FIFO_7;
		RD_FIFO_7: NEXT_STATE = RD_FIFO_8;
		RD_FIFO_8: NEXT_STATE = RD_FIFO_9;
		RD_FIFO_9: NEXT_STATE = RD_FIFO_0;
		default:	  NEXT_STATE = RD_FIFO_0;
	endcase */
    end
	 
/*	 always @(posedge clkm) begin
        if (reset) NEXT_STATE <= 0;
        else if (NEXT_STATE == TDC_NUM/8 - 1) begin
            NEXT_STATE <= 0;
        end else begin
				NEXT_STATE <= NEXT_STATE;
		  end
    end*/

    always @(posedge clkm) begin
        if (reset) begin
            S_FULL_DATA <= 'b0;
            FULL_DATA_READY_M_CH <= 'b0;
        end else begin
				S_FULL_DATA_VALID <= 1'b0;
            if (NEXT_STATE == 0) begin
                FULL_DATA_READY_M_CH[TDC_NUM/8 - 1] <= 1'b0;
                if (FULL_DATA_VALID_M_CH[0] == 1 & S_FULL_DATA_READY) begin
                    S_FULL_DATA <= FULL_DATA_M_CH[0];
                    S_FULL_DATA_VALID <= 1'b1;//FULL_DATA_VALID_M_CH[0];
                    FULL_DATA_READY_M_CH[0] <= 1'b1;
                end else begin
                    S_FULL_DATA <= 'b0;
                    FULL_DATA_READY_M_CH[0] <= 1'b0;
                    S_FULL_DATA_VALID <= 1'b0;
                end
            end else begin
                FULL_DATA_READY_M_CH[NEXT_STATE-1] <= 1'b0;
                if (FULL_DATA_VALID_M_CH[NEXT_STATE] == 1 & S_FULL_DATA_READY) begin
                    S_FULL_DATA <= FULL_DATA_M_CH[NEXT_STATE];
                    S_FULL_DATA_VALID <= 1'b1; //FULL_DATA_VALID_M_CH[NEXT_STATE];
                    FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b1;
                end else begin
                    S_FULL_DATA <= 'b0;
                    FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
                    S_FULL_DATA_VALID <= 1'b0;
                end
            end


        end
    end

    (* keep = "true" *)reg tx_tready_i;


    ALL_CHANNEL_DATA ALL_CHANNEL_DATA (
        .s_aclk(clkm),  // input s_aclk
        .s_aresetn(!reset),  // input s_aresetn
        .s_axis_tvalid(S_FULL_DATA_VALID),  // input s_axis_tvalid
        .s_axis_tready(S_FULL_DATA_READY),  // output s_axis_tready
        .s_axis_tdata(S_FULL_DATA),  // input [63 : 0] s_axis_tdata
        .m_aclk(clk_10M),
        .m_axis_tvalid(M_FULL_DATA_VALID),  // output m_axis_tvalid
        .m_axis_tready(tx_tready_i),  // input m_axis_tready
        .m_axis_tdata(M_FULL_DATA)  // output [63 : 0] m_axis_tdata
    );

    //assign M_FULL_DATA = 64'hFC180005AA367350;

    //wire	[31:0] rx_data_i;   //test
    //wire	rx_tvalid_i;  //test
    (* keep = "true" *)reg [6:0] manchester_encoding_lock_counter;

/*    always @(posedge clk_10M or posedge reset) begin
        if (reset) begin
            //tx_tready_i <= 'b0;
            manchester_encoding_lock_counter <= 0;
        end else begin
            //if(carrier_ready) begin
            if (tx_tready_i) begin
                //tx_tready_i <= 1;
					 manchester_encoding_lock_counter <= 1;
            end else begin
                manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
                tx_tready_i <= 0;
            end
            //end
        end
    end*/

    reg  [MANCHESTER_DATA_WIDTH + 1:0] TDC_data;
    reg  [             6:0] channel;
    reg                     M_FULL_DATA_VALID_r;
	 reg                     M_FULL_DATA_VALID_rr;
    reg  [TDC_DATA_WIDTH - 1:0] M_FULL_DATA_r;

    reg  [            15:0] rates               [TDC_NUM/8 - 1:0];
    reg  [            15:0] rates_r             [TDC_NUM/8 - 1:0];
	 reg  [             5:0] deadtime            [TDC_NUM - 1:0];	

    generate
        for (i = 0; i < TDC_NUM/8; i = i + 1) begin
            always @(posedge CLK_IN) begin
                if (TIM_1S_r) begin
                    rates[i] <= pad_counter[i];
                end

            end
        end
    endgenerate

	 reg [15:0] rate_1;
    assign FB_OUT_EN = 1'b1;
    assign FB_OUT = clk_10M;
    always @(posedge clk_10M) begin
        channel <= M_FULL_DATA[54:48];
        M_FULL_DATA_VALID_r <= M_FULL_DATA_VALID;
		  M_FULL_DATA_VALID_rr <= M_FULL_DATA_VALID_r;
        M_FULL_DATA_r <= M_FULL_DATA;
		  tx_tready_i <= 'b0;
        if (reset) begin
            TDC_data <= 0;			
        end else if ((manchester_encoding_lock_counter == 0)) begin
				if(M_FULL_DATA_VALID_r) begin
					//TDC_data <= { rates[channel[6:3]], hitmap_r[channel[6:3]], M_FULL_DATA_r, 8'b11010111, 1'b1, 1'b1};
					TDC_data <= { 6'h0, M_FULL_DATA_r[63:55], rates[channel[6:3]], hitmap_r[channel[6:3]], 8'hFC, 1'b0, M_FULL_DATA_r[54:0], 8'b11010111, 1'b1, 1'b1};
					tx_tready_i <= 'b1;
					manchester_encoding_lock_counter <= 1;
				end else begin
				
				end
        end else if(manchester_encoding_lock_counter <= MANCHESTER_DATA_WIDTH + 8)begin
            TDC_data <= {1'b0, TDC_data[MANCHESTER_DATA_WIDTH+1:1]};  // right shift, LSB
				manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
        end else begin
				manchester_encoding_lock_counter <= 0;
		  end
        //else if(error_vaild) TDC_data <= {M_FULL_DATA, 1'b0, 1'b1};

    end

    //assign CLK_OUT = clkm;

    ////////////////////////////////////////////////////////////////////////////////
    // TDC data

    wire mdo;
    manchester_encoder tdc_data_enc (
        .clk2x(clk_20M),
        .clk  (clk_10M),
        .rst  (reset),
        .din  (TDC_data[0]),
        .mdo  (mdo)
    );
	 

    
//	 man dc_data_enc (
//        .clk_in(clk_10M),
//        .datain  (TDC_data[0]),
//        .dataout (mdo)
//    );

    //assign DATA_VALID = reset? 1'b0: M_FULL_DATA_VALID;
    assign DATA_VALID = M_FULL_DATA_VALID;
    //assign DATA_OUT   = reset? 1'b0: mdo;
    assign DATA_OUT   = mdo;

    //reg toggle;
    //assign DATA_VALID = toggle;
    //always @(posedge clk_10M) begin
    //  toggle <= ~toggle;
    //end

// wire  CONFIG_VALID;
assign CONFIG_VALID = FB_IN_VALID;


/* 
REGISTER_RECEIVE REGISTER_RECEIVE(
    .CLK(CLK_IN),
    .CLK2X(clk250_0),
    .CLK8X(clk_80M),
    .RESET(reset),
    .DATA_IN(FB_IN),
    .SOFT_TRIGGER_RATE(SOFT_TRIGGER_RATE),
    .SOFT_TRIGGER_ENABLE(SOFT_TRIGGER_ENABLE),
    .CONFIG_VALID(CONFIG_VALID)
);

   
wire DATA_serial;
wire [MANCHESTER_DATA_WIDTH - 1:0] TDC_decode_data;
reg [6:0] count;
reg count_en;
always @(posedge clk_10M) begin
  if(count_en) count <= count + 1'b1;
  else count <= 0;
end
// State Machine
reg [0:0] state_reg, state_next;
localparam
  IDLE = 0,
  DATA = 1;

always @(posedge clk_10M)
  if (reset) state_reg <= IDLE;
  else state_reg <= state_next;

always @(*) begin
  state_next = IDLE;
  count_en = 0;
  case(state_reg)
    IDLE: begin
      if(DATA_serial) state_next = DATA;
      else state_next = IDLE;
    end
    DATA: begin
      count_en = 1'b1;
      if(count==MANCHESTER_DATA_WIDTH) state_next = IDLE;
      else state_next = DATA;
    end
  endcase
end

reg [MANCHESTER_DATA_WIDTH:0] DATA_parallel;
always @(posedge clk_10M) begin
  if(reset) DATA_parallel <= 0;
  else if(state_reg == DATA) DATA_parallel <= {DATA_serial, DATA_parallel[MANCHESTER_DATA_WIDTH:1]};
end
assign TDC_decode_data[MANCHESTER_DATA_WIDTH - 1:0] = DATA_parallel[MANCHESTER_DATA_WIDTH:1];

manchester_decoder manchester_decoder (
  .CLK2X(clk_20M),
  .CLK8X(clk_80M),
  .CLK(clk_10M),
  .RST(reset),
  .MDI(DATA_OUT),
  .LINKED(),
  .DOUT(DATA_serial)
);
*/
//	 deman pulse_dec (
//        .clk_in(clk_10M),
//        .datain  (DATA_OUT),
//        .dataout (DATA_serial)
//    );



    /* 
GTP_IO_exdes #
(
	.USE_CHIPSCOPE(1'b0),
	.SIM_GTPRESET_SPEEDUP(1'b1)
)
GTP_MODULE
(
    // User IO
	 .tx_tvalid_i(M_FULL_DATA_VALID),
	 .tx_data_i(M_FULL_DATA),
	 .tx_tready_i(tx_tready_i),
	 .rx_data_i(rx_data_i),
	 .rx_tvalid_i(rx_tvalid_i),
	 
    .RESET(1'b0),
    .HARD_ERR(),
    .SOFT_ERR(),
    .ERR_COUNT(),
	 .do_cc_i(do_cc_i),
 
    .LANE_UP(),
    .CHANNEL_UP(),

    .INIT_CLK(clk125M),
    .GT_RESET_IN(1'b0),
    .GTPD3_P(GTPD3_P),
    .GTPD3_N(GTPD3_N),
//	 .GTPD3(GTPD3),
    // GT I/O
    .RXP(RXP),
    .RXN(RXN),
    .TXP(TXP),
    .TXN(TXN)
); */

	

/*    wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0)  // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk125M),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG0(FULL_DATA_VALID_M_CH),  // IN BUS [7:0]
        .TRIG1(Effective_Signal), // IN BUS [7:0]
        .TRIG2({reset, M_FULL_DATA_VALID_r}),  // IN BUS [7:0]
        .TRIG3(CURRENT_STATE),  // IN BUS [7:0]
        .TRIG4(time_valid_f) // IN BUS [7:0]
        //.TRIG5(coarse_time) // IN BUS [7:0]
        //	 .TRIG7(rates[4]), // IN BUS [7:0]
        //	 .TRIG8(rates[5]), // IN BUS [7:0]
        //	 .TRIG9(rates[6]), // IN BUS [7:0]
        //	 .TRIG10(rates[7]) // IN BUS [7:0]
    );*/
	 
	 


    TIMER #(
        .CLK_FREQ(10'd125)
    ) TIMER_0 (
        // System
        .CLK    (CLK_IN),    // in: System clock
        .RST    (1'b0),      // in: System reset
        // Intrrupts
        .TIM_1US(),          // out: 1 us interval
        .TIM_1MS(),          // out: 1 ms interval
        .TIM_1S (TIM_1S_r),  // out: 1 s interval
        .TIM_1M ()           // out: 1 min interval
    );


/*    generate
        for (i = 0; i < TDC_NUM; i = i + 1) begin
				always @(posedge clkm) begin
					if(HIT[i]) deadtime[i] <= 0;					
					else if(deadtime[i] < DEAD_TIME) deadtime[i] <= deadtime[i] + 1;
				end
            hit_rates hit_rates (
                .clk(CLK_IN),  // input clk
                .ce(HIT[i] & (deadtime[i] == DEAD_TIME)),
                .sclr(TIM_1S_r),  // input sclr
                .q(rates[i])  // output [15 : 0] q
            );
        end
    endgenerate*/


endmodule
