`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/21 14:41:17
// Design Name: 
// Module Name: Faninout
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


module Faninout#(
   NUM = 16
)(
	//SYS
/* 	input	INIT_CLK_P,
	input INIT_CLK_N, */
	input RESET_IN,

   input EXT_CLK,
   output TRIG_OUT,

//  // SFP
//	output          SFP_TXP,    	// Tx signal line
//	output          SFP_TXN,    	//
//	input           SFP_RXP,    	// Rx signal line
//	input           SFP_RXN,     	//
 //FMC interface
//	inout wire [3:0] CLK_OUT,
	// inout wire [NUM-1:0] FPGA_OUT,

   inout [33:0] LA_P,
   inout [33:0] LA_N,
	//DEBUG
	output	[5:0] 	LED,
	input [3:0] SW,
	//input  	TRIG_IN,
	//output	TRIG_OUT,
	//output	[3:0] GPIO_JP,
    //SITCP
	output wire SFP_TXP,
	output wire SFP_TXN,
	input wire clk_p_sitcp,
	input wire clk_n_sitcp,
	input wire SFP_RXP,
	input wire SFP_RXN,
	output wire [3:0]GPIO
    );
   
/////////////////////////////////////////////////////////////////////////////////////////////
// clock & reset
wire clk125;
wire locked0;
wire init_rst = ~locked0;

// wire init_clk_bufg;
// IBUFDS clkin1_ibufgds
//    (.O  (init_clk_bufg),
//     .I  (INIT_CLK_P),
//     .IB (INIT_CLK_N));

IBUFDS #(
   .DIFF_TERM("TRUE"),       // Differential Termination
   .IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE"
   .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
) clksitcp_ibufgds (
   .O(clk_sitcp),  // Buffer output
   .I(clk_p_sitcp),  // Diff_p buffer input (connect directly to top-level port)
   .IB(clk_n_sitcp) // Diff_n buffer input (connect directly to top-level port)
);    

// ODELAYE2: Output Fixed or Variable Delay Element
//           7 Series
// Xilinx HDL Language Template, version 2022.1

// IDELAYCTRL: IDELAYE2/ODELAYE2 Tap Delay Value Control
//             7 Series
// Xilinx HDL Language Template, version 2022.1

//(* IODELAY_GROUP = "odelay" *) // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
//
//IDELAYCTRL IDELAYCTRL_inst (
//   .RDY(RDY),       // 1-bit output: Ready output
//   .REFCLK(clk_200_sitcp), // 1-bit input: Reference clock input
//   .RST(0)        // 1-bit input: Active high reset input
//);
//
//// End of IDELAYCTRL_inst instantiation
//
//(* IODELAY_GROUP = "odelay" *) // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
//
//ODELAYE2 #(
//   .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
//   .DELAY_SRC("CLKIN"),           // Delay input (ODATAIN, CLKIN)
//   .HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//   .ODELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//   .ODELAY_VALUE(5),                // Output delay tap setting (0-31)
//   .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
//   .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
//   .SIGNAL_PATTERN("CLOCK")          // DATA, CLOCK input signal
//)
//ODELAYE2_inst (
//   .CNTVALUEOUT(), // 5-bit output: Counter value output
//   .DATAOUT(signal_delay),         // 1-bit output: Delayed data/clock output
//   .C(0),                     // 1-bit input: Clock input
//   .CE(1),                   // 1-bit input: Active high enable increment/decrement input
//   .CINVCTRL(0),       // 1-bit input: Dynamic clock inversion input
//   .CLKIN(signal_bufg),             // 1-bit input: Clock delay input
//   .CNTVALUEIN(0),   // 5-bit input: Counter value input
//   .INC(0),                 // 1-bit input: Increment / Decrement tap delay input
//   .LD(0),                   // 1-bit input: Loads ODELAY_VALUE tap delay in VARIABLE mode, in VAR_LOAD or
//                              // VAR_LOAD_PIPE mode, loads the value of CNTVALUEIN
//   .LDPIPEEN(0),       // 1-bit input: Enables the pipeline register to load data
//   .ODATAIN(0),         // 1-bit input: Output delay data input
//   .REGRST(0)            // 1-bit input: Active-high reset tap-delay input
//);

// End of ODELAYE2_inst instantiation    
//clkin_gen clkin_gen_i
//   (// Clock in ports
//    .clk_in1_p(INIT_CLK_P),    // IN
//    .clk_in1_n(INIT_CLK_N),    // IN
//    // Clock out ports
//    .clk_out1(clk125),     // OUT 
//    // Status and control signals
//    .reset(RESET_IN),// IN
//    .locked(locked0));      // OUT

clk_sitcp_wiz clk_sitcp_wiz
   (// Clock in ports
    .clk_in1(clk_sitcp),    // IN
    // Clock out ports
    .clk_out1(clk_200_sitcp),     // OUT 
    .clk_out2(clk_125_nobuffer),
    // Status and control signals
    .reset(0),// IN
    .locked(clk_locked_sitcp));      // OUT  .

/* wire clk10, clk100;

clkin_gen clkin_gen_i
   (// Clock in ports
    .clk_in1(init_clk_bufg),    // IN
    // Clock out ports
    .clk_out1(clk10),     // OUT 
    .clk_out2(clk100),     // OUT 
    // Status and control signals
    .reset(0),// IN
    .locked(locked0));      // OUT */

wire extclk125;
wire locked1;
//IBUF clkin1_ibufg
//   (.O  (trig_in_ibuf),
//    .I  (TRIG_IN));
    
IBUF clk_125_ibufg
   (.O  (clk_125),
    .I  (clk_125_nobuffer));

   wire EXT_CLK_BUF;
   BUFG bufg_EXTCLK (
		.I     (EXT_CLK),
		.O     (EXT_CLK_BUF)
	 );
    
//clkex_gen clkex_gen_i
//   (// Clock in ports
//    .clk_in1(trig_in_ibuf),    // IN
//    // Clock out ports
//    .clk_out1(extclk125),     // OUT 
//    // Status and control signals
//    .reset(0),// IN
//    .locked(locked1));      // OUT
//BUFG ibufg_exclk(.I(TRIG_IN),.O(extclk125));
//assign locked1 = 1;

reg [31:0] cnt0,cnt1;
/////////////////////////////////////////////////////////////////////////////////////////////
// sma
wire [15:0]sma_clk;
wire [7:0] dir;
wire [7:0] noe;

//SW[3:2] 00:clk125;10:TRIG_IN;01:cnt[26];

//wire out_sig = (SW[3:2]==2'b00)? clk125 : (SW[3:2]==2'b01)? cnt1[29] : (SW[3:2]==2'b10)? trig_in_ibuf:0;

//wire out_sig = clk125 ;
//wire out_sig = clk100;
wire [1:0] o_clk_p;
wire [1:0] o_clk_n;

//generate for(genvar i=0; i<2; i=i+1) begin
//   ODDR #(
//      .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
//      .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
//      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
//   ) ODDR_inst (
//      .Q(sma_clk[i]),   // 1-bit DDR output
//      .C(out_sig),   // 1-bit clock input
//      .CE(1), // 1-bit clock enable input
//      .D1(1), // 1-bit data input (positive edge)
//      .D2(0), // 1-bit data input (negative edge)
//      .R(0),   // 1-bit reset
//      .S(0)    // 1-bit set
//   );
//end
//endgenerate


generate for(genvar j=0; j<2; j=j+1) begin
   // OBUFDS: Differential Output Buffer
   //         7 Series
   // Xilinx HDL Language Template, version 2021.2
   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_inst (
      .O(o_clk_p[j]),     // Diff_p output (connect directly to top-level port)
      .OB(o_clk_n[j]),   // Diff_n output (connect directly to top-level port)
      .I(sma_clk[j])      // Buffer input
   );
   end
endgenerate

//ODDR #(
//      .DDR_CLK_EDGE("OPPOSITE_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE" 
//      .INIT(1'b0),    // Initial value of Q: 1'b0 or 1'b1
//      .SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC" 
//   ) ODDR_inst (
//      .Q(TRIG_OUT),   // 1-bit DDR output
//      .C(out_sig),   // 1-bit clock input
//      .CE(1), // 1-bit clock enable input
//      .D1(1), // 1-bit data input (positive edge)
//      .D2(0), // 1-bit data input (negative edge)
//      .R(0),   // 1-bit reset
//      .S(0)    // 1-bit set
//   );

//assign noe = 8'b0;
//assign dir = 8'b0;

reg  TDC_RST_R;
wire TDC_RST;

/////////////////////////////////////////////////////////////////////////////////////////////
//assign CLK_OUT[3:0]=sma[3:0];

/*
reg [4:0] TDC_RST_COUNTER;

wire TDC_RST_R;

always @(posedge clk100) begin
   if(TDC_RST_R) begin
      TDC_RST_COUNTER <= 0;
      TDC_RST <= 1'b1;
   end else if(TDC_RST_COUNTER <= 10) begin
      TDC_RST_COUNTER <= TDC_RST_COUNTER + 1;
      TDC_RST <= 1;
   end else begin 
      TDC_RST_COUNTER <= TDC_RST_COUNTER;
      TDC_RST <= 0;
   end
end

    Flag_CrossDomain rst_pulse_CrossDomain (
      .clkA(clk_125),
      .FlagIn_clkA(TDC_RST_ON),
      .clkB(clk100),
      .FlagOut_clkB(TDC_RST)
    );
*/
always @(posedge clk_125) begin
   TDC_RST_R <= TDC_RST_ON;
end  

// wire TDC_RST_S;

//    Flag_CrossDomain RST_CrossDomain (
//       .clkA(clk_125),
//       .FlagIn_clkA(TDC_RST_R),
//       .clkB(EXT_CLK),
//       .FlagOut_clkB(TDC_RST_S)
//    );
wire fifo_empty;

fifo_generator_1 RST_CrossDomain (
  .wr_clk(clk_125),  // input wire wr_clk
  .rd_clk(EXT_CLK),  // input wire rd_clk
  .din(1'b0),        // input wire [0 : 0] din
  .wr_en(TDC_RST_ON),    // input wire wr_en
  .rd_en(~fifo_empty),    // input wire rd_en
  .dout(),      // output wire [0 : 0] dout
  .full(),      // output wire full
  .empty(fifo_empty),    // output wire empty
  .valid(TDC_RST)    // output wire valid
);

//assign TDC_RST = TDC_RST_S;  

reg [19:0]clk_cnt;
reg signal_out;
reg signal_out_delay;

always@(posedge clk_200_sitcp)begin
//   signal_out_delay <= signal_out;
	if(clk_cnt == 15'd20_000 - 1'b1)begin
		signal_out <= ~signal_out;
		clk_cnt <= 0;		
	end
	else begin
		signal_out <= signal_out;
		clk_cnt <= clk_cnt + 1'd1;	
	end
end

//(* KEEP="TRUE" *)(* dont_touch = "true" *)wire signalout;
//
//(* KEEP="TRUE" *)(* dont_touch = "true" *)BUFG signal_buf
//   (.O  (signal_bufg),
//    .I  (signalout));

//(* KEEP="TRUE" *)LUT5 #(
//   .INIT(32'h00000002)  // Specify LUT Contents
//) LUT5_inst (
//   .O(signalout),   // LUT general output
//   .I0(signal_out), // LUT input
//   .I1(0), // LUT input
//   .I2(0), // LUT input
//   .I3(0), // LUT input
//   .I4(0)  // LUT input
//);

wire [1:0]signal_out_p;
wire [1:0]signal_out_n;

wire signalout_delay = signal_out_delay;

OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_inst1 (
      .O(signal_out_p[0]),     // Diff_p output (connect directly to top-level port)
      .OB(signal_out_n[0]),   // Diff_n output (connect directly to top-level port)
      .I(signal_out)      // Buffer input
);

OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_inst2 (
      .O(signal_out_p[1]),     // Diff_p output (connect directly to top-level port)
      .OB(signal_out_n[1]),   // Diff_n output (connect directly to top-level port)
      .I(signal_out)      // Buffer input
);

//assign FPGA_OUT[3:0]=RST_SELECT? {signal_out,signal_out,signal_out,signal_out}:{TDC_RST,TDC_RST,TDC_RST,TDC_RST};
//assign CLK_OUT[3:0]={signal_out_n[1],signal_out_p[1],signal_out_n[0],signal_out_p[0]};
/////////////////////////////////////////////////////////////////////////////////////////////
// debug
//reg [27:0] cnt0,cnt1;
always @(posedge clk_125) begin
  if(~locked0) cnt0 <= 0;
  else cnt0 <= cnt0 + 1'b1;
end
/*
    ila_4 ila(
      .clk(clk_100),
      .probe0(TDC_RST_R)
    );
 
    
    OBUF OBUF_inst3 (
    .I(init_clk_bufg),
    .O(FPGA_OUT[2])
   );
    */

//wire [7:0] dir;
//wire [7:0] noe;

assign noe = 8'b0;
assign dir = 8'b0;

wire FPGA_OUT;

assign FPGA_OUT = SW[0]? TDC_RST : clk_125;
assign TRIG_OUT = TDC_RST;

/////////////////////////////////////////////////////////////////////////////////////////////
// fmc mapping
assign LA_P[2] = FPGA_OUT;
assign LA_N[2] = FPGA_OUT;
assign LA_P[3] = dir[0];
assign LA_N[3] = dir[1];
assign LA_P[4] = FPGA_OUT;
assign LA_N[4] = FPGA_OUT;
assign LA_P[7] = noe[0];
assign LA_N[7] = noe[1];
assign LA_P[11] = FPGA_OUT;
assign LA_N[11] = FPGA_OUT;
assign LA_P[15] = FPGA_OUT;
assign LA_N[15] = FPGA_OUT;
assign LA_P[16] = dir[2];
assign LA_N[16] = dir[3];
assign LA_P[19] = FPGA_OUT;
assign LA_N[19] = FPGA_OUT;

//assign LA_P[19] = user_clk_1_p;
//assign LA_N[19] = user_clk_1_n;


assign LA_P[20] = noe[2];
assign LA_N[20] = noe[3];
assign LA_P[21] = FPGA_OUT;
assign LA_N[21] = FPGA_OUT;
assign LA_P[24] = noe[4];
assign LA_N[24] = noe[5];

//assign LA_P[24] = user_clk_2_p;
//assign LA_N[24] = user_clk_2_n;

assign LA_P[25] = dir[4];
assign LA_N[25] = dir[5];
assign LA_P[28] = FPGA_OUT;
assign LA_N[28] = FPGA_OUT;
assign LA_P[30] = FPGA_OUT;
assign LA_N[30] = FPGA_OUT;
assign LA_P[32] = noe[6];

//assign LA_P[32] = 1'b0; //user_clk_3;

assign LA_N[32] = noe[7];
assign LA_P[33] = dir[6];
assign LA_N[33] = dir[7];



// assign LA_P[2] = 0;
// assign LA_N[2] = 0;
// assign LA_P[3] = dir[0];
// assign LA_N[3] = dir[1];
// assign LA_P[4] = 0;
// assign LA_N[4] = 0;
// assign LA_P[7] = noe[0];
// assign LA_N[7] = noe[1];
// assign LA_P[11] = 0;
// assign LA_N[11] = 0;
// assign LA_P[15] = 0;
// assign LA_N[15] = 0;
// assign LA_P[16] = dir[2];
// assign LA_N[16] = dir[3];
// assign LA_P[19] = 0;
// assign LA_N[19] = 0;
// assign LA_P[20] = noe[2];
// assign LA_N[20] = noe[3];
// assign LA_P[21] = 0;
// assign LA_N[21] = 0;
// assign LA_P[24] = sma[0];
// assign LA_N[24] = sma[1];
// assign LA_P[25] = dir[4];
// assign LA_N[25] = dir[5];
// assign LA_P[28] = 0;
// assign LA_N[28] = 0;
// assign LA_P[30] = 0;
// assign LA_N[30] = 0;
// assign LA_P[32] = sma[2];
// assign LA_N[32] = 0;
// assign LA_P[33] = dir[6];
// assign LA_N[33] = dir[7];


assign LED[0] = cnt0[26];
assign LED[1] = locked0;

always @(posedge extclk125) begin
  if(~locked1) cnt1 <= 0;
  else cnt1 <= cnt1 + 1'b1;
end
assign LED[2] = cnt1[26];
assign LED[3] = locked1;
assign LED[4] = clk_locked_sitcp;

assign LED[5] = SW[0];


//assign GPIO_JP[0] = init_clk_bufg;
//assign GPIO_JP[1] = clk125;

SiTCP_rfd_top SiTCP_rfd_top(
        //sys
        .clk125_sys(clk_125),
        .clk200(clk_200_sitcp),
        .clk125_eth(clk_125),
        .gtpclkin(clk_125_nobuffer),
        .locked(clk_locked_sitcp),
        //tcp
	    .sys_din(SiTCP_din),
	    .SFP_TXP(SFP_TXP),
	    .SFP_TXN(SFP_TXN),
	    .SFP_RXP(SFP_RXP),
	    .SFP_RXN(SFP_RXN),
        .din_valid(SiTCPin_valid),
        .sitcp_fifo_full(sitcp_fifo_full),
        //不知道干嘛的
	    .CLK_IN(CLK_IN),
	    .TRIG_IN(0),
	    .GPIO(GPIO),
	    .SW(4'b0111),
        //UDP
        .FPGADATA_REN(FPGADATA_REN),
        .FPGADATA_EMPTY(FPGADATA_EMPTY),
        .FPGA_DATA(FPGA_DATA),
        .FPGADATA_VALID(FPGADATA_VALID),
        .RST_SELECT(RST_SELECT),
        .TDC_RST_ON(TDC_RST_ON)
    );


   ila_0 ila(
     .clk(clk_125),
     .probe0(TDC_RST),
     .probe1(TDC_RST_ON),
     .probe2(SW)
   );

   ila_0 ila1(
     .clk(EXT_CLK),
     .probe0(TDC_RST),
     .probe1(TDC_RST_ON),
     .probe2(sitcp_fifo_full)
   );
endmodule
