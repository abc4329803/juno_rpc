/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\igmp_query_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\igmp_query_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:20:14 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2019
// 	Filename:  IGMP_QUERY_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 4/27/19
//  Inheritance: 	IGMP_QUERY.vhd 12/27/14
// 
//  description:  detect a valid IGMP membership query and trigger a response when applicable 
//  
//  Expects the following external validation checks (in PARSING):
//  MAC address(just multicast bit), IP type, IP header checksum
//  NO prior validation for complete MAC address, IP multicast destination address, IGMP checksum
// -------------------------------------------------------------

module IGMP_QUERY_10G (
   CLK,
   SYNC_RESET,
   MULTICAST_IP_ADDR,
   IP_PAYLOAD_DATA,
   IP_PAYLOAD_DATA_VALID,
   IP_PAYLOAD_SOF,
   IP_PAYLOAD_EOF,
   IP_PAYLOAD_WORD_COUNT,
   IP_RX_FRAME_VALID2,
   RX_IP_PROTOCOL,
   VALID_MULTICAST_DEST_IP,
   VALID_IP_PAYLOAD_CHECKSUM,
   RX_DEST_IP_ADDR,
   TRIGGER_RESPONSE,
   TP);
 

input   CLK; 
input   SYNC_RESET; 
input   [31:0] MULTICAST_IP_ADDR; 
input   [63:0] IP_PAYLOAD_DATA; 
input   [7:0] IP_PAYLOAD_DATA_VALID; 
input   IP_PAYLOAD_SOF; 
input   IP_PAYLOAD_EOF; 
input   [10:0] IP_PAYLOAD_WORD_COUNT; 
input   IP_RX_FRAME_VALID2; 
input   [7:0] RX_IP_PROTOCOL; 
input   VALID_MULTICAST_DEST_IP; 
input   VALID_IP_PAYLOAD_CHECKSUM; 
input   [31:0] RX_DEST_IP_ADDR; 
output   TRIGGER_RESPONSE; 
output   [10:1] TP; 

// // CLK, RESET

wire    TRIGGER_RESPONSE; 
wire    [10:1] TP; 
reg     VALID_RX_IGMP0; 
reg     VALID_RX_IGMP1; 
reg     VALID_RX_IGMP2; 
reg     VALID_RX_IGMP; 
reg     IP_PAYLOAD_EOF_D; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // CHECK IGMP QUERY VALIDITY -----------------------------
//  The IGMP packet reception is immediately cancelled if 
//  (a) the received packet type is not an IP datagram  (done in common code PACKET_PARSING)
//  (b) invalid destination IP (done in common code PACKET_PARSING)
//  (c) incorrect IP header checksum (done in common code PACKET_PARSING)
//  (d) the received IP type is not IGMP 
//  (e) IGMP type is not membership request
//  (f) IGMP checksum is incorrect
//  (g) group address in IGMP query does not match our multicast IP address

initial 
   begin : process_5
   IP_PAYLOAD_EOF_D = 1'b 0;   
   end

initial 
   begin : process_4
   VALID_RX_IGMP = 1'b 0;   
   end

initial 
   begin : process_3
   VALID_RX_IGMP2 = 1'b 0;   
   end

initial 
   begin : process_2
   VALID_RX_IGMP1 = 1'b 0;   
   end

initial 
   begin : process_1
   VALID_RX_IGMP0 = 1'b 0;   
   end


always @(posedge CLK)
   begin : VALIDITY_CHECK_001
   if (CLK === 1'b 1)
      begin
      IP_PAYLOAD_EOF_D <= IP_PAYLOAD_EOF;   
      if (IP_PAYLOAD_SOF === 1'b 1)
         begin
         if (RX_IP_PROTOCOL !== 2)
            begin

//  (d) the received IP type is not IGMP 
            VALID_RX_IGMP0 <= 1'b 0;   
            end
         else if (IP_PAYLOAD_DATA[63:56] !== 8'h 11 )
            begin

//  (e) IGMP type is not membership request
            VALID_RX_IGMP0 <= 1'b 0;   
            end
         else
            begin
            VALID_RX_IGMP0 <= 1'b 1;   
            end
         end

//  for IGMPv2, IP_PAYLOAD_SOF and IP_PAYLOAD_EOF can be concurrent
      if (IP_PAYLOAD_EOF === 1'b 1)
         begin
         if (IP_RX_FRAME_VALID2 === 1'b 0)
            begin

//  invalid IP frame
            VALID_RX_IGMP1 <= 1'b 0;   
            end
         else
            begin
            VALID_RX_IGMP1 <= 1'b 1;   
            end
         end
      if (IP_PAYLOAD_DATA_VALID[3:0] === 4'h F & IP_PAYLOAD_WORD_COUNT === 1)
         begin

//  expecting group address
         if (RX_DEST_IP_ADDR === 32'h E0000001)
            begin

//  general IGMP query is sent to address 224.0.0.1 (all hosts)
//  The group field is zeroed when sending a General Query
            if (IP_PAYLOAD_DATA[31:0] === 0)
               begin
               VALID_RX_IGMP2 <= 1'b 1;   

//  invalid combination of zero group field and unexpected destination IP address
               end
            else
               begin
               VALID_RX_IGMP2 <= 1'b 0;   
               end
            end
         else if (IP_PAYLOAD_DATA[31:0] !== MULTICAST_IP_ADDR )
            begin

//  group-specific IGMP query
//  (g) group address does not match our multicast IP address
            VALID_RX_IGMP2 <= 1'b 0;   
            end
         else
            begin
            VALID_RX_IGMP2 <= 1'b 1;   
            end
         end
      end
   end

//  combine with the other checks done in parsing.vhd

always @( VALID_RX_IGMP0 or VALID_RX_IGMP1 or VALID_RX_IGMP2 or VALID_MULTICAST_DEST_IP or VALID_IP_PAYLOAD_CHECKSUM ) 
VALID_RX_IGMP = VALID_RX_IGMP0 & VALID_RX_IGMP1 & VALID_RX_IGMP2 & VALID_MULTICAST_DEST_IP & 
      VALID_IP_PAYLOAD_CHECKSUM; 

//  trigger a response to a query
assign TRIGGER_RESPONSE = VALID_RX_IGMP & IP_PAYLOAD_EOF_D; 

// // Test Point
assign TP[1] = IP_PAYLOAD_EOF_D; 
assign TP[2] = VALID_RX_IGMP0; 
assign TP[3] = VALID_RX_IGMP1; 
assign TP[4] = VALID_RX_IGMP2; 
assign TP[6] = VALID_RX_IGMP; 
assign TP[7] = VALID_RX_IGMP & IP_PAYLOAD_EOF_D; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // CHECK IGMP QUERY VALIDITY -----------------------------

endmodule // module IGMP_QUERY_10G

