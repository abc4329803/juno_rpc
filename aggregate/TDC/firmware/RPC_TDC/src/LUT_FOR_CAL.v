`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:07 10/09/2013 
// Design Name: 
// Module Name:    LUT_FOR_CAL 
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
module LUT_FOR_CAL(
	input 	clk,
	
	input		TIME_WIDTH,
	
	output	Q
    );

wire	clk;

wire	[16:0] TIME_WIDTH;

reg	[8:0] Q;

always@(posedge clk) begin
	case(TIME_WIDTH)
	17'b0 : Q <= 9'b0;
	17'b1	: Q <= 9'b1;
	default : Q <= 9'b0;
	endcase
end

endmodule
