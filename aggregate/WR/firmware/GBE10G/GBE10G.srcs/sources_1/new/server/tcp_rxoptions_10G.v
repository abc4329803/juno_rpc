/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_rxoptions_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_rxoptions_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:29:49 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2021
//  Filename:  TCP_RXOPTIONS_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 0
// 	Date last modified: 1/19/21
//  Inheritance: 	n/a
// 
//  description:  
//  Decode TCPv4 option upon receiving SYN message from client. 
//  10Gbits/s.
//  Supports IPv4 and IPv6. 
//  Portable VHDL
// 
//  Device utilization (ADDR_WIDTH = 10, UDP_CKSUM_ENABLED='1',IPv6_ENABLED='1')
//  FF: 39
//  LUT: 
//  DSP48: 0
//  18Kb BRAM: 
//  BUFG: 
//  Minimum period:  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module TCP_RXOPTIONS_10G (
   CLK,
   SYNC_RESET,
   RX_TCP_DATA_OFFSET,
   IP_PAYLOAD_DATA,
   IP_PAYLOAD_WORD_VALID,
   IP_PAYLOAD_WORD_COUNT,
   TCP_OPTION_MSS,
   TCP_OPTION_MSS_VALID,
   TCP_OPTION_WINDOW_SCALE,
   TCP_OPTION_WINDOW_SCALE_VALID,
   TCP_OPTION_SACK_PERMITTED,
   TCP_OPTION_SACK_PERMITTED_VALID,
   TP);
 

input   CLK; 
input   SYNC_RESET; 
input   [3:0] RX_TCP_DATA_OFFSET; 
input   [63:0] IP_PAYLOAD_DATA; 
input   IP_PAYLOAD_WORD_VALID; 
input   [10:0] IP_PAYLOAD_WORD_COUNT; 
output   [15:0] TCP_OPTION_MSS; 
output   TCP_OPTION_MSS_VALID; 
output   [3:0] TCP_OPTION_WINDOW_SCALE; 
output   TCP_OPTION_WINDOW_SCALE_VALID; 
output   TCP_OPTION_SACK_PERMITTED; 
output   TCP_OPTION_SACK_PERMITTED_VALID; 
output   [10:1] TP; 

//  CLK must be a global clock 156.25 MHz or faster to match the 10Gbps MAC speed.

reg     [15:0] TCP_OPTION_MSS; 
reg     TCP_OPTION_MSS_VALID; 
reg     [3:0] TCP_OPTION_WINDOW_SCALE; 
reg     TCP_OPTION_WINDOW_SCALE_VALID; 
reg     TCP_OPTION_SACK_PERMITTED; 

//  read the options at EVENT1 = one clock after IP_PAYLOAD_EOF
//  _VALID is '0' if option was not received
// // TEST POINTS 
reg     TCP_OPTION_SACK_PERMITTED_VALID; 
wire    [10:1] TP; 
reg     [3:0] IP_PAYLOAD_WORD_COUNTx2; 
reg     EVEN_OPTION; 
reg     ODD_OPTION; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------

initial 
   begin : process_3
   ODD_OPTION = 1'b 0;   
   end

initial 
   begin : process_2
   EVEN_OPTION = 1'b 0;   
   end

initial 
   begin : process_1
   IP_PAYLOAD_WORD_COUNTx2 = 4'h 0;   
   end


always @( IP_PAYLOAD_WORD_COUNT ) 
IP_PAYLOAD_WORD_COUNTx2 = {IP_PAYLOAD_WORD_COUNT[2:0], 1'b 0}; 

//  option in even-count TCP data offset (starting at 6)

always @( IP_PAYLOAD_WORD_COUNT or IP_PAYLOAD_WORD_COUNTx2 or RX_TCP_DATA_OFFSET or IP_PAYLOAD_WORD_VALID ) 
EVEN_OPTION = IP_PAYLOAD_WORD_COUNT[10:3] === 0 & IP_PAYLOAD_WORD_COUNT[2:0] > 2 & 
      IP_PAYLOAD_WORD_COUNTx2 <= RX_TCP_DATA_OFFSET ? IP_PAYLOAD_WORD_VALID : 
	1'b 0; 

always @( IP_PAYLOAD_WORD_COUNT or IP_PAYLOAD_WORD_COUNTx2 or RX_TCP_DATA_OFFSET or IP_PAYLOAD_WORD_VALID ) 
ODD_OPTION = IP_PAYLOAD_WORD_COUNT[10:3] === 0 & IP_PAYLOAD_WORD_COUNT[2:0] > 3 & 
      IP_PAYLOAD_WORD_COUNTx2 <= RX_TCP_DATA_OFFSET + 1 ? IP_PAYLOAD_WORD_VALID : 
	1'b 0; 

//  decode even-count TCP options
//  MSS option

always @(posedge CLK)
   begin : TCP_OPTION_MSS_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TCP_OPTION_MSS <= {16{1'b 0}};   
         TCP_OPTION_MSS_VALID <= 1'b 0;   
         end
      else if (EVEN_OPTION === 1'b 1 & IP_PAYLOAD_DATA[31:24] === 8'h 02 )
         begin

//  MSS option
         TCP_OPTION_MSS <= IP_PAYLOAD_DATA[15:0];   
         TCP_OPTION_MSS_VALID <= 1'b 1;   
         end
      else if (ODD_OPTION === 1'b 1 & IP_PAYLOAD_DATA[63:56] === 8'h 02 )
         begin

//  MSS option
         TCP_OPTION_MSS <= IP_PAYLOAD_DATA[47:32];   
         TCP_OPTION_MSS_VALID <= 1'b 1;   
         end
      end
   end


always @(posedge CLK)
   begin : TCP_OPTION_WINDOW_SCALE_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TCP_OPTION_WINDOW_SCALE <= {4{1'b 0}};   
         TCP_OPTION_WINDOW_SCALE_VALID <= 1'b 0;   
         end
      else if (EVEN_OPTION === 1'b 1 & IP_PAYLOAD_DATA[31:16] === 16'h 0103 )
         begin

//  Window Scale option
         TCP_OPTION_WINDOW_SCALE <= IP_PAYLOAD_DATA[3:0];   
         TCP_OPTION_WINDOW_SCALE_VALID <= 1'b 1;   
         end
      else if (ODD_OPTION === 1'b 1 & IP_PAYLOAD_DATA[63:48] === 16'h 0103 )
         begin

//  Window Scale option
         TCP_OPTION_WINDOW_SCALE <= IP_PAYLOAD_DATA[35:32];   
         TCP_OPTION_WINDOW_SCALE_VALID <= 1'b 1;   
         end
      end
   end


always @(posedge CLK)
   begin : TCP_OPTION_SACK_PERMITTED_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TCP_OPTION_SACK_PERMITTED <= 1'b 0;   
         TCP_OPTION_SACK_PERMITTED_VALID <= 1'b 0;   
         end
      else if (EVEN_OPTION === 1'b 1 & IP_PAYLOAD_DATA[31:8] === 24'h 010104 )
         begin

//  SACK permitted option
         TCP_OPTION_SACK_PERMITTED <= 1'b 1;   
         TCP_OPTION_SACK_PERMITTED_VALID <= 1'b 1;   
         end
      else if (ODD_OPTION === 1'b 1 & IP_PAYLOAD_DATA[63:40] === 24'h 010104 )
         begin

//  SACK permitted option
         TCP_OPTION_SACK_PERMITTED <= 1'b 1;   
         TCP_OPTION_SACK_PERMITTED_VALID <= 1'b 1;   
         end
      end
   end

// //-- TEST POINTS ---------------------------------
assign TP[10:1] = {10{1'b 0}}; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------

endmodule // module TCP_RXOPTIONS_10G

