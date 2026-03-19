/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\udp_rx_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\udp_rx_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:28:00 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2018
// 	Filename:  UDP_RX_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 4/29/18
//  Inheritance: 	COM-5402 UDP_RX.VHD 7/31/15
// 
//  description:  UDP protocol (receive-only) 10Gb, for IPv4 and IPv6  
//  Receives and validates UDP frames. The data segment of the UDP frame is immediately 
//  forwarded to the application without any intermediate storage in an elastic buffer.
//  Thus the application must be capable of receiving data at full speed (156.25MHz/64-bit wide).
//  
//  Various validation checks are performed in real-time while receiving a new frame.
//  If any of the check fails, the UDP_RX_DATA_VALID is cleared. It is therefore IMPORTANT
//  that the application rejects frame if UDP_RX_FRAME_VALID = '0' at the end of the frame  
//  (UDP_RX_EOF = '1'). 
//  
//  Validation checks:
//  MAC address, IP type, IP destination address, UDP protocol, 
//  UDP destination port, IP header checksum, UDP checksum
//  
//  As there is no difference between IPv4 and IPv6 for UDP, this component is compatible with 
//  both IPv4 and IPv6.
// -------------------------------------------------------------

module UDP_RX_10G (
   CLK,
   SYNC_RESET,
   IP_PAYLOAD_DATA,
   IP_PAYLOAD_DATA_VALID,
   IP_PAYLOAD_SOF,
   IP_PAYLOAD_EOF,
   IP_PAYLOAD_WORD_COUNT,
   IP_RX_FRAME_VALID,
   RX_IP_PROTOCOL,
   VALID_UDP_CHECKSUM,
   PORT_NO,
   CHECK_UDP_RX_DEST_PORT_NO,
   UDP_RX_DATA,
   UDP_RX_DATA_VALID,
   UDP_RX_SOF,
   UDP_RX_EOF,
   UDP_RX_FRAME_VALID,
   UDP_RX_SRC_PORT,
   UDP_RX_DEST_PORT,
   TP);
 

input   CLK; 
input   SYNC_RESET; 
input   [63:0] IP_PAYLOAD_DATA; 
input   [7:0] IP_PAYLOAD_DATA_VALID; 
input   IP_PAYLOAD_SOF; 
input   IP_PAYLOAD_EOF; 
input   [10:0] IP_PAYLOAD_WORD_COUNT; 
input   IP_RX_FRAME_VALID; 
input   [7:0] RX_IP_PROTOCOL; 
input   VALID_UDP_CHECKSUM; 
input   [15:0] PORT_NO; 
input   CHECK_UDP_RX_DEST_PORT_NO; 
output   [63:0] UDP_RX_DATA; 
output   [7:0] UDP_RX_DATA_VALID; 
output   UDP_RX_SOF; 
output   UDP_RX_EOF; 
output   UDP_RX_FRAME_VALID; 
output   [15:0] UDP_RX_SRC_PORT; 
output   [15:0] UDP_RX_DEST_PORT; 
output   [10:1] TP; 

// // CLK, RESET

reg     [63:0] UDP_RX_DATA; 

//  delineates the UDP data field
reg     [7:0] UDP_RX_DATA_VALID; 

//  1 CLK pulse indicating that UDP_RX_DATA is the first byte in the UDP data field.
reg     UDP_RX_SOF; 

//  1 CLK pulse indicating that UDP_RX_DATA is the last byte in the UDP data field.
//  ALWAYS CHECK UDP_RX_FRAME_VALID at the end of packet (UDP_RX_EOF = '1') to confirm
//  that the UDP packet is valid. External buffer may have to backtrack to the the last
//  valid pointer to discard an invalid UDP packet.
//  Reason: we only knows about bad UDP packets at the end.
wire    UDP_RX_EOF; 

//  check entire frame validity at UDP_RX_EOF
wire    UDP_RX_FRAME_VALID; 

//  Identify the source UDP port. Read when UDP_RX_EOF = '1' 
reg     [15:0] UDP_RX_SRC_PORT; 

//  Identify the destination UDP port. Read when UDP_RX_EOF = '1' 
//  Test Points
reg     [15:0] UDP_RX_DEST_PORT; 
wire    [10:1] TP; 
reg     [15:0] LENGTH; 

// // CHECK UDP VALIDITY -----------------------------
reg     VALID_RX_UDP0; 
reg     VALID_RX_UDP; 

//  Remove UDP header
reg     UDP_PAYLOAD_FLAG; 
reg     UDP_PAYLOAD_SOF_FLAG; 
reg     UDP_RX_EOF_local; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // PARSE UDP HEADER --------------------------

initial 
   begin : process_6
   UDP_RX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_5
   UDP_PAYLOAD_SOF_FLAG = 1'b 0;   
   end

initial 
   begin : process_4
   UDP_PAYLOAD_FLAG = 1'b 0;   
   end

initial 
   begin : process_3
   VALID_RX_UDP = 1'b 0;   
   end

initial 
   begin : process_2
   VALID_RX_UDP0 = 1'b 0;   
   end

initial 
   begin : process_1
   LENGTH = {16{1'b 0}};   
   end


always @(posedge CLK)
   begin : UDP_HEADER_001
   if (CLK === 1'b 1)
      begin
      if (IP_PAYLOAD_SOF === 1'b 1)
         begin
         UDP_RX_SRC_PORT <= IP_PAYLOAD_DATA[63:48];   
         UDP_RX_DEST_PORT <= IP_PAYLOAD_DATA[47:32];   
         LENGTH <= IP_PAYLOAD_DATA[31:16];   
         end
      end
   end

// // CHECK UDP VALIDITY -----------------------------
//  The UDP packet reception is immediately cancelled if 
//  (a) the received packet type is not an IP datagram  (done in common code PACKET_PARSING)
//  (b) invalid destination IP  (done in common code PACKET_PARSING)
//  (c) incorrect IP header checksum (IPv4 only) (done in common code PACKET_PARSING)
//  (d) the received IP type is not UDP 
//  (e) destination port number is not the specified PORT_NO (checking is user-enabled)
//  (f) UDP checksum is incorrect

always @(posedge CLK)
   begin : VALIDITY_CHECK_001
   if (CLK === 1'b 1)
      begin
      if (IP_PAYLOAD_SOF === 1'b 1)
         begin
         if (RX_IP_PROTOCOL !== 17)
            begin

//  received protocol is not UDP
            VALID_RX_UDP0 <= 1'b 0;   
            end
         else if (CHECK_UDP_RX_DEST_PORT_NO === 1'b 1 & PORT_NO !== IP_PAYLOAD_DATA[47:32] )
            begin

//  user asked us to check the destination port number and it does not match.
//  Note: in some applications where UDP_RX_10G.vhd is shared by multiple UDP ports (DHCP server for example), 
//  the destination port number check is better done outside this component.
            VALID_RX_UDP0 <= 1'b 0;   
            end
         else
            begin
            VALID_RX_UDP0 <= 1'b 1;   
            end
         end
      else if (IP_PAYLOAD_EOF === 1'b 1 & IP_RX_FRAME_VALID === 1'b 0 )
         begin
         VALID_RX_UDP0 <= 1'b 0;   
         end
      end
   end

assign UDP_RX_FRAME_VALID = VALID_RX_UDP0 & VALID_UDP_CHECKSUM & UDP_RX_EOF_local; 
//  combine with the other checks done in parsing.vhd

//  validity assessment is complete at IP_PAYLOAD_EOF_D = UDP_RX_EOF
// // COPY UDP DATA TO APPLICATION INTERFACE ------------------------
//  Algorithm: UDP header is 8-byte long = 1 word. So just skip the first IP payload word.
//  TODO: verify that in the case of very short (<60 bytes) Ethernet frames, the zero padding
//  is removed in packet_parsing.vhd
//  Remove UDP header

always @(posedge CLK)
   begin : UDP_PAYLOAD_001
   if (CLK === 1'b 1)
      begin
      if (IP_PAYLOAD_EOF === 1'b 1)
         begin
         UDP_PAYLOAD_FLAG <= 1'b 0;   
         end
      else if (IP_PAYLOAD_SOF === 1'b 1 )
         begin
         UDP_PAYLOAD_FLAG <= 1'b 1;   
         end
      if (IP_PAYLOAD_SOF === 1'b 1 & IP_PAYLOAD_EOF === 1'b 0)
         begin
         UDP_PAYLOAD_SOF_FLAG <= 1'b 1;   
         end
      else if (IP_PAYLOAD_DATA_VALID !== 0 | IP_PAYLOAD_EOF === 1'b 1 )
         begin
         UDP_PAYLOAD_SOF_FLAG <= 1'b 0;   
         end
      end
   end

//  reclock to align UDP_RX_EOF with the late arrival of VALID_UDP_CHECKSUM

always @(posedge CLK)
   begin : OUTPUT_001
   if (CLK === 1'b 1)
      begin
      UDP_RX_DATA <= IP_PAYLOAD_DATA;   
      if (UDP_PAYLOAD_FLAG === 1'b 1 & VALID_RX_UDP0 === 1'b 1)
         begin
         UDP_RX_DATA_VALID <= IP_PAYLOAD_DATA_VALID;   
         end
      else
         begin
         UDP_RX_DATA_VALID <= {8{1'b 0}};   
         end
      if (UDP_PAYLOAD_SOF_FLAG === 1'b 1 & VALID_RX_UDP0 === 1'b 1 & 
      IP_PAYLOAD_DATA_VALID !== 0)
         begin
         UDP_RX_SOF <= 1'b 1;   
         end
      else
         begin
         UDP_RX_SOF <= 1'b 0;   
         end
      UDP_RX_EOF_local <= IP_PAYLOAD_EOF & UDP_PAYLOAD_FLAG & VALID_RX_UDP0;   
      end
   end

assign UDP_RX_EOF = UDP_RX_EOF_local; 

// // Test Point
//  unused here
//  TP(1) <= ...

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // PARSE UDP HEADER --------------------------

endmodule // module UDP_RX_10G

