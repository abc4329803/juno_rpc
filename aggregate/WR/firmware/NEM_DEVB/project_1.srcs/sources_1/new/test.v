`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2025 09:11:59 AM
// Design Name: 
// Module Name: test
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


module test(
input        EXT_CLK,
input        CAL1,
output       testfpgaclk,
output       testsysclk
    );

    wire EXT_CLK_BUF;

    BUFG BUFG_inst (
      .O( EXT_CLK_BUF), // 1-bit output: Clock output
      .I( EXT_CLK )  // 1-bit input: Clock input
   ); 

    wire CAL1_CLK_BUF;

    BUFG BUFG_inst2 (
      .O( CAL1_CLK_BUF), // 1-bit output: Clock output
      .I( CAL1 )  // 1-bit input: Clock input
   ); 


   wire clk_25M_W;
wire locked_125M_W;

assign testfpgaclk = clk_25M_W;
assign testsysclk = CAL1_CLK_BUF;
wire clkfb_in;

  clk_wiz_tcp clk_wiz_tcp1
   (
    // Clock out ports
    .clk_out1(clk_25M_W),     // output clk_out1
    .reset(1'b0), // input reset
    .locked(locked_125M_W),       // output locked
   // Clock in ports
    .clk_in1(CAL1_CLK_BUF)      // input clk_in1 clk_125M
);

  ila_2 ila_2 (
    .clk(CAL1_CLK_BUF), // input wire clk
    .probe0(locked_125M_W) // i
  );
endmodule
