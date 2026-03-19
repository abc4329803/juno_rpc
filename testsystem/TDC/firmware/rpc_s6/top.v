`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	EPD, IHEP
// Engineer:   Ning Zhe
// 
// Create Date:    09:16:28 03/28/2025 
// Design Name: 
// Module Name:    top 
// Project Name:   rpc  tdc
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
module top#(
	parameter  TDC_NUM = 80
)(

	input 	wire       	 	RESET_IN,
	input 	wire       	 	CLK_IN,
	output   wire 		 		DATA_OUT,
	output   wire        	FB_OUT,
	
	//input    wire           CLK_10M_EXT,
	
	
	input 	wire [8:1] 		P1S,
	input 	wire [8:1] 		P2S,
	input 	wire [8:1] 		P3S,
	input 	wire [8:1] 		P4S,
	input 	wire [8:1] 		P5S,
	input 	wire [8:1] 		P6S,
	input 	wire [8:1] 		P7S,
	input 	wire [8:1] 		P8S,
	input 	wire [8:1] 		P9S,
	input 	wire [8:1] 		P10S,
	
	output   wire [9:1]		TEST1,
	input   wire         	TEST2
    );

	//inout data;
	//reg fb_in1;
	wire CLK_10M;

	//data为输出时
	//wire FB_OUT_EN;
	//assign FB_OUT=FB_OUT_EN?FB_OUT1:1'bz;//en_output控制三态门

	wire CLK_OUT;
	wire DATA_OUT1;
	wire DATA_VALID;
	wire SOFT_TRIGGER_ENABLE;

	wire CLK_BUF;
	BUFG BUFG_inst (
      .O(CLK_BUF), // 1-bit output: Clock buffer output
      .I(CLK_IN)  // 1-bit input: Clock buffer input
   );
	wire locked;
	wire PLL1_LOCKED;
	wire PLL2_LOCKED;
/*	dcm dcm
   (// Clock in ports
    .CLK_IN1(CLK_IN),      // IN
    // Clock out ports
    .CLK_OUT1(CLK_BUF),     // OUT
    // Status and control signals
    .RESET(1'b0),// IN
    .LOCKED(locked));  */

	 
	 reg toggle;
    //assign DATA_VALID = toggle;
    always @(posedge CLK_10M) begin
      toggle <= ~toggle;
    end
	 reg RESET_SYNC;
	 always@(posedge CLK_BUF) begin
		  RESET_SYNC <= TEST2;
	 end
	 
	 
	 wire [1:0] DIGITAL_SIGNAL;
	 wire [7:0] same;
	 
	 
	 assign TEST1[1] = DIGITAL_SIGNAL[0];
	 assign TEST1[3] = toggle;//SOFT_TRIGGER_ENABLE;
	 //assign TEST2[10] = DATA_OUT1;
	 //assign FB_OUT = locked;
	 
	//assign DATA_OUT = 1'b1;
	//assign FB_OUT = 1'b1;

	// assign TEST[1] = 1'b1;
	 assign TEST1[2] = RESET_SYNC;
	// assign TEST[3] = 1'b1;
	 assign TEST1[4] = same[6];
	 assign TEST1[5] = same[1];
	 assign TEST1[6] = same[2];
	 assign TEST1[7] = same[3];
	 assign TEST1[8] = same[4];
	 assign TEST1[9] = same[7];
	// assign TEST[10] = 1'b1;	

	wire [TDC_NUM - 1: 0] signal;
//	genvar TDC_group_index;
//	generate
//		for(TDC_group_index = 0;TDC_group_index < TDC_group_num;TDC_group_index = TDC_group_index + 1) begin
//		
//		end
//	endgenerate
//	assign signal[2:0] = TEST1[3:1];
//	assign signal[3] = RESET_IN;
// 	assign signal[7:4] = P1S[8:5];

 	assign signal[7:0]   = P1S[8:1] ;
	assign signal[15:8]  = P2S[8:1] ;
	assign signal[23:16] = P3S[8:1] ;
	assign signal[31:24] = P4S[8:1] ;
	assign signal[39:32] = P5S[8:1] ;
	assign signal[47:40] = P6S[8:1] ;
	assign signal[55:48] = P7S[8:1] ;
	assign signal[63:56] = P8S[8:1] ;
	assign signal[71:64] = P9S[8:1] ;
	assign signal[79:72] = P10S[8:1] ;


    TDC_datapack #(
		.TDC_NUM(80),
		.MANCHESTER_DATA_WIDTH(112)
	 )TDC_datapack(
		.CLK_IN(CLK_BUF),
		.reset(RESET_SYNC),
		.CLK_10M_EXT(),
		.RPC_SIGNAL(signal),
		.FB_IN(1'b1),
		.FB_IN_VALID(),
		.FB_OUT(CLK_10M),
		.FB_OUT_EN(),
		.DATA_OUT(DATA_OUT),
		.DATA_VALID(DATA_VALID),  ///
		.EXT_TRIGGER_ENABLE(1'b0),
		.SOFT_TRIGGER_ENABLE(SOFT_TRIGGER_ENABLE),
		.PLL1_LOCKED(PLL1_LOCKED),
		.PLL2_LOCKED(PLL2_LOCKED),
		.DIGITAL_SIGNAL(DIGITAL_SIGNAL),
		.same(same)
		//.CLK_OUT(CLK_OUT)
	);

/*	wire clk_obuf;
	ODDR2 #(
	.DDR_ALIGNMENT("NONE"),    // "NONE", "C0", "C1"
	.INIT(1'b0),
	.SRTYPE("SYNC")
	) u_oddr2 (
	.Q   (clk_obuf),  // 输出到 OBUF，再到管脚
	.C0  (DATA_VALID),       // 上升沿时钟
	.C1  (~DATA_VALID),      // 下降沿时钟
	.CE  (1'b1),
	.D0  (1'b1),      // 输出 '1' 在上升沿
	.D1  (1'b0),      // 输出 '0' 在下降沿
	.R   (1'b0),
	.S   (1'b0)
	);

	OBUF u_obuf(
	.I(clk_obuf),
	.O(FB_OUT)  // 这个连到你的 .ucf 或 .xdc 管脚
	);*/


	assign DATA_OUT1 = DATA_OUT;
	
	//assign FB_OUT = 1'b1;
	ODDR2 #(
		.DDR_ALIGNMENT("NONE"), // Sets output alignment to “NONE”, “C0” or “C1”
		.INIT(1'b0), // Sets initial state of the Q output to 1’b0 or 1’b1
		.SRTYPE("SYNC") // Specifies “SYNC” or “ASYNC” set/reset
	) ODDR2_inst0 (
		.Q(FB_OUT), // 1-bit DDR output data
		.C0(CLK_10M), // 1-bit clock input
		.C1(~CLK_10M), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D0(1'b1), // 1-bit data input (associated with C0)
		.D1(1'b0), // 1-bit data input (associated with C1)
		.R(1'b0), // 1-bit reset input
		.S(1'b0) // 1-bit set input
	);
	
	/*
		ODDR2 #(
		.DDR_ALIGNMENT("NONE"), // Sets output alignment to “NONE”, “C0” or “C1”
		.INIT(1'b0), // Sets initial state of the Q output to 1’b0 or 1’b1
		.SRTYPE("SYNC") // Specifies “SYNC” or “ASYNC” set/reset
	) ODDR2_inst1 (
		.Q(TEST1[3]), // 1-bit DDR output data
		.C0(CLK_10M), // 1-bit clock input
		.C1(~CLK_10M), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D0(1'b1), // 1-bit data input (associated with C0)
		.D1(1'b0), // 1-bit data input (associated with C1)
		.R(1'b0), // 1-bit reset input
		.S(1'b0) // 1-bit set input
	);
	*/
/*	(* keep = "true" *)	reg toggle;
	always@(posedge DATA_VALID) begin
		if(RESET_IN) toggle <= 0;
		   toggle <= ~toggle;
	end
	assign FB_OUT = toggle;*/
//	assign DATA_OUT = toggle;
//wire [35:0] CONTROL0;
//icon_0 icon_0_inst (
//	 .CONTROL0(CONTROL0) // INOUT BUS [35:0]
//	 //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
//);
//
//ila_0 ila_0_inst (
//	 .CONTROL(CONTROL0), // INOUT BUS [35:0]
//	 .CLK(CLK_BUF), // IN
//	 .TRIG0(P1S), // IN BUS [7:0]
//	 .TRIG1(P2S), // IN BUS [7:0]
//	 .TRIG2(P3S), // IN BUS [7:0]
//	 .TRIG3(P4S), // IN BUS [7:0]
//	 .TRIG4(P5S), // IN BUS [7:0]
//	 .TRIG5(P6S), // IN BUS [7:0]
//	 .TRIG6(P7S), // IN BUS [7:0]
//	 .TRIG7(P8S), // IN BUS [7:0]
//	 .TRIG8(P9S), // IN BUS [7:0]
//	 .TRIG9(P10S) // IN BUS [7:0]
//);
// vio vio_inst (
// 	 .CONTROL(CONTROL1), // INOUT BUS [35:0]
// 	 .ASYNC_OUT(ASYNC_OUT) // OUT BUS [7:0]
// );


	
endmodule
