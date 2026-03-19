`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:42 11/10/2013 
// Design Name: 
// Module Name:    Pulser 
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
module Pulser(CIN,CK,POUT);

	input CIN;
	input CK;
	output POUT;

	reg cin0;
	reg cin1;
	reg cin2;

	always@(posedge CK) begin
		cin0 <= CIN;
		cin1 <= cin0;
		cin2 <= (~cin1)&cin0;
	end

	assign POUT = cin2;

endmodule
