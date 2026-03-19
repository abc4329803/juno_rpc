/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\bram_dp2c.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\bram_dp2c.vhd -ncc -ip
-- Date Created: Tue Nov 29 17:43:41 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  Filename:  BRAM_DP2C.VHD
//  Authors: 
//  	Xilinx UG901 Simple Dual-Port Block RAM with Single Clock (VHDL)
// 		Alain Zarembowitch / MSS
//  Version: 0
//  Last modified: 12/21/20
//  Inheritance: 	BRAM_DP2.VHD Rev2 6/29/16
// 
//  description:  synthesizable generic dual port RAM. Variant of BRAM_DP2.VHD 
//  single clock, same data width on A/B sides, A-side write, B-side read.
//  Registered output.
//  Inferred block RAM
// -------------------------------------------------------------

module bram_dp2c #(
   parameter DATA_WIDTH = 9,
   parameter ADDR_WIDTH = 11
) (

      input   CLK,
     
       // Port A
      input   CSA,   // chip select, active high
      input   WEA, // write enable, active high
      input   [ADDR_WIDTH - 1:0] ADDRA,
      input   [DATA_WIDTH - 1:0] DIA,

      // Port B
      input   CSB,   // chip select, active high
      input   [ADDR_WIDTH - 1:0] ADDRB,
      output  reg [DATA_WIDTH - 1:0] DOB
);

//  Port A


reg     [DATA_WIDTH - 1:0]  MEM [ 2**ADDR_WIDTH - 1:0]; 
reg     [DATA_WIDTH - 1:0]  DOB_local; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
//  Port A write


always @(posedge CLK)
   begin : process_1
   if (CLK === 1'b 1)
      begin
      if (CSA === 1'b 1)
         begin
         if (WEA === 1'b 1)
            begin
            MEM[ADDRA] = DIA;   
            end
         end
      end
   end

//  Port B

always @(posedge CLK)
   begin : process_2
   if (CLK === 1'b 1)
      begin
      if (CSB === 1'b 1)
         begin
         DOB <= MEM[ADDRB];   
         end
      end
   end


// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------function
//  inferred


// Subprograms that are created by VHDL2V translator
function integer power;
    input left_operand;
    integer left_operand;
    input exponent;
    integer exponent;
    integer index;
    begin
        power = 1;
        for(index = 0; index < exponent; index = index+1)
            power = power * left_operand;
    end
endfunction // power 

endmodule // module BRAM_DP2C

