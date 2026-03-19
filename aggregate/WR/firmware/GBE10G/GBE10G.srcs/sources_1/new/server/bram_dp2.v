
`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules
//`include "BRAM_DP2_Behavioral.v"

// -----------------------------------------------------------
//  Filename:  BRAM_DP2.VHD
//  Authors: 
//  	from http://www.xilinx.com/support/documentation/sw_manuals/xilinx14_4/xst_v6s6.pdf
// 		Alain Zarembowitch / MSS
//  Version: Rev 3
//  Last modified: 3/1/20
//  Inheritance: 	BRAM_DP.VHD 5/7/15
// 
//  description:  synthesizable generic dual port RAM
// 
//  Rev 1b 6/21/16 AZ
//  Switched to numeric_std library
//  Initialize to zero during simulation
// 
//  Rev 2 6/29/16 AZ
//  Added asymmetrical case (different data widths on A and B ports)
// 
//  Rev 3 3/1/20 AZ
//  enforce write before read as expected (Vivado bad inference otherwise)
// -------------------------------------------------------------

module bram_dp2 #(
  parameter DATA_WIDTHA = 9,
  parameter ADDR_WIDTHA = 11,
	parameter DATA_WIDTHB = 9,
	parameter ADDR_WIDTHB = 11

	// total size on A size MUST match total size on B side 
	// (DATA_WIDTHA * 2**ADDR_WIDTHA) == (DATA_WIDTHB * 2**ADDR_WIDTHB)
)(
// chip select, active high
input   					CLKA, 
input   					CSA, // chip select, active high
input   					WEA, // write enable, active high/
input   					OEA, // output enable, active high
input   [ADDR_WIDTHA - 1:0] ADDRA, 
input   [DATA_WIDTHA - 1:0] DIA, 
output  [DATA_WIDTHA - 1:0] DOA, 
input   					CLKB, 
input   					CSB, // chip select, active high
input   					WEB, // write enable, active high
input   					OEB, // output enable, active high
input   [ADDR_WIDTHB - 1:0] ADDRB, 
input   [DATA_WIDTHB - 1:0] DIB, 
output  [DATA_WIDTHB - 1:0] DOB
); 


parameter MIN_DATA_WIDTH = DATA_WIDTHA; 
parameter MAX_DATA_WIDTH = DATA_WIDTHB; 
parameter MIN_ADDR_WIDTH = ADDR_WIDTHB; 
parameter MAX_ADDR_WIDTH = ADDR_WIDTHA; 
parameter RATIO = MAX_DATA_WIDTH / MIN_DATA_WIDTH; 
parameter log2RATIO = ADDR_WIDTHA - ADDR_WIDTHB; 

//  infered
//reg     [MIN_DATA_WIDTH - 1:0] MEM [ /* VHDL ** operator */ power (2, MAX_ADDR_WIDTH) - 1:0]; 
reg     [DATA_WIDTHA - 1:0] DOA_local = 'b0; 
reg     [DATA_WIDTHB - 1:0] DOB_local = 'b0; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
//  Port A


reg 	[MIN_DATA_WIDTH-1:0] MEM[(2**MAX_ADDR_WIDTH)-1:0]; 

always @(posedge CLKA)
   begin : process_1
   if (CLKA == 1'b 1)
      begin
      if (CSA == 1'b 1)
         begin
         if (WEA == 1'b 1)
            begin
				MEM[ADDRA] <= DIA;   
            end
         DOA_local <= MEM[ADDRA];   
         end
      end
   end

//  tri-state output
assign DOA = (CSA == 1'b 1 & OEA == 1'b 1) ? DOA_local : {(DATA_WIDTHA - 1 - 0 + 1){1'b Z}}; 

//  Port B

genvar i;
generate
	for (i = 0; i <= RATIO - 1; i = i + 1) begin
		always @(posedge CLKB)
		   begin : process_2
		   if (CLKB == 1'b 1)
			  begin
			  if (CSB == 1'b 1)
				 begin		 
					if (WEB == 1'b 1)
						begin
							MEM[ADDRB] <= DIB[(i + 1) * MIN_DATA_WIDTH - 1:i * MIN_DATA_WIDTH];   
						end
					DOB_local[(i + 1) * MIN_DATA_WIDTH - 1:i * MIN_DATA_WIDTH] <= MEM[ADDRB];   					
				 end
			  end
		   end
	end
endgenerate
//  tri-state output
assign DOB = (CSB == 1'b 1 & OEB == 1'b 1) ? DOB_local : {(DATA_WIDTHB - 1 - 0 + 1){1'b Z}}; 

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------function
// function max(L,R:INTEGER) return INTEGER is
// begin
// 	if (L > R) then
// 		return L;
// 	else
// 		return R;
// 	end if;
// end;
// function min(L,R:INTEGER) return INTEGER is
// begin
// 	if(L < R) then
// 		return L;
// 	else
// 		return R;
// 	end if;
// end;
//  see users constraints in generic section


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

// including file with called functions and tasks


endmodule // module BRAM_DP2

