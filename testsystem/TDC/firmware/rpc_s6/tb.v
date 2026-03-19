`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:07:37 07/28/2025
// Design Name:   TDC_datapack
// Module Name:   C:/Users/Public/rpc_s6/tb.v
// Project Name:  rpc_s6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TDC_datapack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg CLK_IN;
	reg reset;
	reg CLK_10M_EXT;
	reg [79:0] RPC_SIGNAL;
	reg FB_IN;
	reg FB_IN_VALID;
	reg EXT_TRIGGER_ENABLE;

	// Outputs
	wire FB_OUT;
	wire FB_OUT_EN;
	wire DATA_OUT;
	wire DATA_VALID;
	wire SOFT_TRIGGER_ENABLE;

	// Instantiate the Unit Under Test (UUT)
	TDC_datapack uut (
		.CLK_IN(CLK_IN), 
		.reset(reset), 
		.CLK_10M_EXT(CLK_10M_EXT), 
		.RPC_SIGNAL(RPC_SIGNAL), 
		.FB_IN(FB_IN), 
		.FB_IN_VALID(FB_IN_VALID), 
		.FB_OUT(FB_OUT), 
		.FB_OUT_EN(FB_OUT_EN), 
		.DATA_OUT(DATA_OUT), 
		.DATA_VALID(DATA_VALID), 
		.EXT_TRIGGER_ENABLE(EXT_TRIGGER_ENABLE), 
		.SOFT_TRIGGER_ENABLE(SOFT_TRIGGER_ENABLE)
	);

	initial begin
		// Initialize Inputs
		CLK_IN = 0;
		reset = 0;
		CLK_10M_EXT = 0;
		RPC_SIGNAL = 80'h1;
		FB_IN = 0;
		FB_IN_VALID = 0;
		EXT_TRIGGER_ENABLE = 0;

		forever #4 CLK_IN <= ~CLK_IN;

		// Wait 100 ns for global reset to finish
		#200;
		RPC_SIGNAL <= 80'h3;
		// #2;
		// RPC_SIGNAL[1] = 1;
		// #16;
		// RPC_SIGNAL[0] = 0;
		// #18;
		// RPC_SIGNAL[1] = 0;
        
		// Add stimulus here

	end
      
endmodule

