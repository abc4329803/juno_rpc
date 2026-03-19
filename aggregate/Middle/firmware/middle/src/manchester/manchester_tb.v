`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   13:19:01 11/14/2014
// Design Name:   manchester_encoder
// Module Name:   D:/WorkSpace/Work/COMET/FPGA/test_board/src/manchester_verilog/manchester_tb.v
// Project Name:  lvds_test
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: manchester_encoder
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module manchester_tb;

// Inputs
reg clk4x;
reg clk2x;
reg clk;
reg rst;
reg din;

// Outputs
wire manchester;
wire linked;
wire dout;

parameter clk_freq4x = 80000000;
parameter clk_period4x = 1000000000/clk_freq4x;
initial begin
  clk4x <= 0;
  forever #(clk_period4x/2) clk4x <= ~clk4x;
end

always @(posedge clk4x) begin
  clk2x <= ~clk2x;
end

always @(posedge clk2x) begin
  clk <= ~clk;
end

// Instantiate the Unit Under Test (UUT)
manchester_encoder uut_en (
  .clk2x(clk2x),
  .clk(clk),
  .rst(rst),
  .din(din),
  .mdo(manchester)
);

// wire clk_recieve2x, clk_recieve;
// assign clk_recieve2x = clk2x;
// assign clk_recieve = clk;

reg clk_recieve2x, clk_recieve;
always@(*) #10 clk_recieve2x = clk2x;
always@(*) #10 clk_recieve = clk;

manchester_decoder uut_de (
  .clk2x(clk_recieve2x),
  .clk(clk_recieve),
  .rst(rst),
  .mdi(manchester),
  .linked(linked),
  .dout(dout)
);

always @(posedge clk) begin
  din <= ~($random %2);
end

initial begin
  // Initialize Inputs
  clk = 0;
  clk2x = 0;
  rst = 1;
  // Wait 100 ns for global reset to finish
  #110;
  rst = 0;
  // Add stimulus here

end

endmodule

