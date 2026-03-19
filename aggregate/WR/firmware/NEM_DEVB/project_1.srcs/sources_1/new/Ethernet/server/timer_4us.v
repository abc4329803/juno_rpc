/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\timer_4us.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\timer_4us.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:08:17 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2004-2015
// 	Filename:  TIMER_1MS.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 5
// 	Date last modified: 12/10/15
//  Inheritance: 	none
// 
//  description:  Creates a 4us timer tick which can be used to create other timers
//  with 4us increment. Function is shared with all.
// 
//  Rev 3 5/15/11 AZ
//  Added 100ms tick
// 
//  Rev 4 1/11/14 AZ
//  Extended CLK_COUNTER precision to operate at higher FPGA clock frequency (from ?????? ???????)
//  Switched to numeric_std.
// 
//  Rev 5 12/10/15 AZ
//  replaced ASYNC_RESET with SYNC_RESET
// -------------------------------------------------------------

module TIMER_4US #(
	parameter CLK_FREQUENCY = 120
)(
		// CLK, RESET
		input   		CLK,
			// usage: specify the CLK frequency in MHz in the generic section above
		input   		SYNC_RESET,

		output   		TICK_4US,
		output   reg	TICK_100MS 
			// 1 CLK-wide pulse every four microseconds and 100ms
); 
//  CLK frequency in MHz. Needed to compute actual delays.

reg     [9:0] CLK_COUNTER = 'b0; 
parameter CLK_DIV = CLK_FREQUENCY * 4 - 1; 
//   CLK_FREQ MHz*4usec -1;
reg     TICK_4US_local = 'b0; 
reg     [15:0] CLK_COUNTER2 = 'b0; 
parameter CLK_DIV2 = 24999; 
//   100ms/4us - 1

//  TEST TEST TEST TEST
// constant CLK_DIV2: integer := 24; --  100Us/4us - 1
// constant CLK_DIV2: integer := 2; --  10Us/4us - 1
// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------


always @(posedge CLK)
   begin : CLK_DIV_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         CLK_COUNTER <= {10{1'b 0}};   
         TICK_4US_local <= 1'b 0;   
         end
      else if (CLK_COUNTER != CLK_DIV )
         begin
         CLK_COUNTER <= CLK_COUNTER + 1;   
         TICK_4US_local <= 1'b 0;   
         end
      else
         begin
         CLK_COUNTER <= {10{1'b 0}};   
         TICK_4US_local <= 1'b 1;   
         end
      end
   end

assign TICK_4US = TICK_4US_local; 

always @(posedge CLK)
	begin : TICK_100MS_GEN
		if (CLK == 1'b1) begin
		  if (SYNC_RESET == 1'b1)
			 begin
				 CLK_COUNTER2 <= {16{1'b0}};   
				 TICK_100MS <= 1'b0;   
			 end
		  else if (TICK_4US_local == 1'b1 )
			 begin
			 if (CLK_COUNTER2 != CLK_DIV2)
				begin
					CLK_COUNTER2 <= CLK_COUNTER2 + 1;   
					TICK_100MS <= 1'b0;   
				end
			 else
				begin
					CLK_COUNTER2 <= {16{1'b 0}};   
					TICK_100MS <= 1'b1;   
				end
			 end
		  else
			 begin
				TICK_100MS <= 1'b0;   
			 end
		end
	end


// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------

endmodule // module TIMER_4US

