/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\igmp_report_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\igmp_report_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:20:12 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2019
// 	Filename:  IGMP_REPORT_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 4/28/19
//  Inheritance: 	IGMP_REPORT.VHD rev1 12/26/12
// 
//  description:  send an IGMP membership report out to whom it may concern
// -------------------------------------------------------------

module IGMP_REPORT_10G (
      // CLK, RESET
      input   CLK,
      input   SYNC_RESET,
         // CLK-synchronous reset. MANDATORY after IPv4_ADDR and MULTICAST_IP_ADDR are defined. 
      
      // Control
      input   IGMP_START,
         // 1 CLK pulse to start the IGMP report
         // new requests will be ignored until the module is 
         // finished with the previous request. 

      // Configuration data: IP address, MAC address
      input   [47:0] MAC_ADDR,
         // MAC address. Unique for each network interface card.
         // Natural byte order: (MSB) 0x000102030405 (LSB) 
         // as transmitted in the Ethernet packet.
      input   [31:0] IPv4_ADDR,
         // local IP address
         // Natural order (MSB) 172.16.1.128 (LSB)
      input   [15:0] IP_ID,
            // 16-bit IP ID, unique for each IP frame. Incremented every time
            // an IP frame is sent .
      input   [31:0] MULTICAST_IP_ADDR,
         // multicast IP address to report. 

      //// Transmit frame/packet to MAC interface
      // 32-bit CRC is automatically appended. User should not supply it.
      // Synchonous with CLK
      output  reg  [63:0] MAC_TX_DATA,
         // MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID /= 0
      output  reg  [7:0] MAC_TX_DATA_VALID,
         // data valid
      output   MAC_TX_EOF,
         // '1' when sending the last byte in a packet to be transmitted. 
         // Aligned with MAC_TX_DATA_VALID
      input   MAC_TX_CTS,
         // MAC-generated Clear To Send flow control signal. The user should check that this 
         // signal is high before sending the next MAC_TX_DATA byte. 
      output   RTS,
         // '1' when a full or partial packet is ready to be read.
         // '0' when output buffer is empty.
         // When the user starts reading the output buffer, it is expected that it will be
         // read until empty.


      // Test Points
      output   [10:1] TP
);


reg     STATE; 
reg     [4:0] TX_PACKET_SEQUENCE; 
//  46 bytes max 
reg     MAC_TX_DATA_VALID_E; 
reg     MAC_TX_EOF_local; 
reg     RTS_local; 
reg     [15:0] IP_ID_D; 

// // ICMP CHECKSUM -----------------
reg     [1:0] CKSUM_SEQ_CNTR; 
reg     [17:0] IP_HEADER_CKSUM0; 
reg     [17:0] IP_HEADER_CKSUM_FINAL; 
reg     [17:0] IGMP_CKSUM; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------

initial 
   begin : process_10
   IGMP_CKSUM = {18{1'b 0}};   
   end

initial 
   begin : process_9
   IP_HEADER_CKSUM_FINAL = {18{1'b 0}};   
   end

initial 
   begin : process_8
   IP_HEADER_CKSUM0 = {18{1'b 0}};   
   end

initial 
   begin : process_7
   CKSUM_SEQ_CNTR = {2{1'b 0}};   
   end

initial 
   begin : process_6
   IP_ID_D = {16{1'b 0}};   
   end

initial 
   begin : process_5
   RTS_local = 1'b 0;   
   end

initial 
   begin : process_4
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_3
   MAC_TX_DATA_VALID_E = 1'b 0;   
   end

initial 
   begin : process_2
   TX_PACKET_SEQUENCE = {5{1'b 1}};   
   end

initial 
   begin : process_1
   STATE = 1'b 0;   
   end


always @(posedge CLK)
   begin : TX_SEQUENCE_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | IGMP_START === 1'b 1 & 
      STATE === 1'b 0 | MAC_TX_EOF_local === 1'b 1)
         begin
         TX_PACKET_SEQUENCE <= {5{1'b 1}};   
         MAC_TX_DATA_VALID_E <= 1'b 0;   
         end
      else if (STATE === 1'b 1 & MAC_TX_CTS === 1'b 1 )
         begin

//  read the next word
         TX_PACKET_SEQUENCE <= TX_PACKET_SEQUENCE + 1;   
         MAC_TX_DATA_VALID_E <= 1'b 1;   
         end
      else
         begin
         MAC_TX_DATA_VALID_E <= 1'b 0;   
         end
      end
   end

//  aligned with MAC_TX_DATA_VALID

always @(posedge CLK)
   begin : MAX_TX_EOF_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_TX_EOF_local === 1'b 1)
         begin
         MAC_TX_EOF_local <= 1'b 0;   
         MAC_TX_DATA_VALID <= 8'h 00;   
         end
      else if (MAC_TX_DATA_VALID_E === 1'b 1 )
         begin
         if (TX_PACKET_SEQUENCE === 5)
            begin

//  IGMP report done. transmitting the last word (46-bytes)
            MAC_TX_DATA_VALID <= 8'h FC;   
//  last word contains only 6 bytes
            MAC_TX_EOF_local <= 1'b 1;   
            end
         else
            begin
            MAC_TX_DATA_VALID <= 8'h ff;   
            MAC_TX_EOF_local <= 1'b 0;   
            end
         end
      else
         begin
         MAC_TX_DATA_VALID <= 8'h 00;   
         MAC_TX_EOF_local <= 1'b 0;   
         end
      end
   end

assign MAC_TX_EOF = MAC_TX_EOF_local; 

//  State machine

always @(posedge CLK)
   begin : RTS_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RTS_local <= 1'b 0;   
         STATE <= 1'b 0;   
         end
      else
         begin
         if (IGMP_START === 1'b 1 & STATE === 1'b 0)
            begin

//  new transaction. Sending IGMP report
            RTS_local <= 1'b 1;   
            STATE <= 1'b 1;   

//  freeze IP_ID
            IP_ID_D <= IP_ID;   
            end
         else if (MAC_TX_EOF_local === 1'b 1 )
            begin

//  done. transmitting the last word
            RTS_local <= 1'b 0;   
            STATE <= 1'b 0;   
            end
         end
      end
   end

assign RTS = RTS_local; 

// --// Generate IGMP report

always @(posedge CLK)
   begin : MAC_TX_DATA_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         MAC_TX_DATA <= {64{1'b 0}};   
         end
      else if (MAC_TX_CTS === 1'b 1 )
         begin
         case (TX_PACKET_SEQUENCE)
         5'b 00000:
            begin
            MAC_TX_DATA[63:39] <= {24'h 01005E, 1'b 0};   
//  Ethernet header
//  reserved a block of Ethernet addresses that map on to the Class D multicast addresses
//  The reserved address 0x0100.5e00.0000 is used by Ethernet to determine a unique multicast MAC
//  destination MAC address: multicast.
            MAC_TX_DATA[38:16] <= MULTICAST_IP_ADDR[22:0];   
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   
            end
         5'b 00001:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   
            MAC_TX_DATA[31:0] <= 32'h 08004600;   
//  Ethernet type, IP version 4, 24-byte header length, DSCP 0
            end
         5'b 00010:
            begin
            MAC_TX_DATA[63:48] <= 16'h 0020;   
//  total length 32	 
            MAC_TX_DATA[47:32] <= IP_ID_D;   
            MAC_TX_DATA[31:0] <= 32'h 00000102;   
//  flags, fragment offset, TTL always 1, protocol IGMP
            end
         5'b 00011:
            begin
            MAC_TX_DATA[63:48] <= IP_HEADER_CKSUM_FINAL[15:0];   
//  IP header checksum   
            MAC_TX_DATA[47:16] <= IPv4_ADDR;   
//  sender IP address  
            MAC_TX_DATA[15:0] <= MULTICAST_IP_ADDR[31:16];   
//  multicast IP address being reported
            end
         5'b 00100:
            begin
            MAC_TX_DATA[63:48] <= MULTICAST_IP_ADDR[15:0];   
//  multicast IP address being reported 

//  options
            MAC_TX_DATA[47:16] <= 32'h 94040000;   
//  router alert: every router examines packet

//  IGMPv2
            MAC_TX_DATA[15:0] <= 16'h 1600;   
//  membership report, maximum response time	
            end
         default:
            begin

// when "00101" => 
            MAC_TX_DATA[63:48] <= IGMP_CKSUM[15:0];   
//  IP checksum
            MAC_TX_DATA[47:16] <= MULTICAST_IP_ADDR;   
//  group address
            MAC_TX_DATA[15:0] <= {16{1'b 0}};   
            end
         endcase
         end
      end
   end

// // IP HEADER CHECKSUM -----------------
//  Computed at reset, since all the information is fixed (except for IP_ID which changes at every message)

always @(posedge CLK)
   begin : CKSUM_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_SEQ_CNTR <= 2'b 11;   
         end
      else if (CKSUM_SEQ_CNTR > 0 )
         begin
         CKSUM_SEQ_CNTR <= CKSUM_SEQ_CNTR - 1;   
         end
      end
   end


always @(posedge CLK)
   begin : IP_HEADER_CKSUM_002
   if (CLK === 1'b 1)
      begin

//  fixed part of the IP header checksum. 
      if (SYNC_RESET === 1'b 1)
         begin
         IP_HEADER_CKSUM0 <= IPv4_ADDR[31:16] + IPv4_ADDR[15:0];   
         end
      else if (CKSUM_SEQ_CNTR === 2'b 11 )
         begin
         IP_HEADER_CKSUM0 <= IP_HEADER_CKSUM0 + MULTICAST_IP_ADDR[31:16];   
         end
      else if (CKSUM_SEQ_CNTR === 2'b 10 )
         begin
         IP_HEADER_CKSUM0 <= IP_HEADER_CKSUM0 + MULTICAST_IP_ADDR[15:0];   
         end
      else if (CKSUM_SEQ_CNTR === 2'b 01 )
         begin
         IP_HEADER_CKSUM0 <= IP_HEADER_CKSUM0 + {2'b 00, 16'h DB26};   

//  constant is the sum of x4600 + x0020 + x0102 + x9404
         end

//  variable part of the IP header checksum. Add IP_ID
      if (MAC_TX_CTS === 1'b 1)
         begin
         if (TX_PACKET_SEQUENCE === 5'b 00000)
            begin
            IP_HEADER_CKSUM_FINAL <= IP_HEADER_CKSUM0 + IP_ID_D;   
            end
         else if (TX_PACKET_SEQUENCE === 5'b 00001 )
            begin

//  carry, first pass
            IP_HEADER_CKSUM_FINAL <= IP_HEADER_CKSUM_FINAL[15:0] + IP_HEADER_CKSUM_FINAL[17:16];   
            end
         else if (TX_PACKET_SEQUENCE === 5'b 00010 )
            begin

//  final carry + final inversion
            IP_HEADER_CKSUM_FINAL <= ~(IP_HEADER_CKSUM_FINAL[15:0] + IP_HEADER_CKSUM_FINAL[17:16]);   
            end
         end
      end
   end


always @(posedge CLK)
   begin : IGMP_CKSUM_001
   if (CLK === 1'b 1)
      begin

//  fixed part of the IGMP checksum. 
      if (SYNC_RESET === 1'b 1)
         begin
         IGMP_CKSUM <= MULTICAST_IP_ADDR[31:16] + MULTICAST_IP_ADDR[15:0];   
         end
      else if (CKSUM_SEQ_CNTR === 2'b 11 )
         begin
         IGMP_CKSUM <= IGMP_CKSUM + {2'b 00, 16'h 1600};   

//  constant
         end
      else if (CKSUM_SEQ_CNTR === 2'b 10 )
         begin

//  possible carry + final inversion
         IGMP_CKSUM <= ~(IGMP_CKSUM[15:0] + IGMP_CKSUM[17:16]);   
         end
      end
   end

// // Test Point
// TP(1) <= IGMP_START;
// TP(2) <= MAC_TX_CTS;
// TP(3) <= MAC_TX_DATA_VALID_E;
// TP(4) <= MAX_TX_EOF_local;
// TP(5) <= RTS_local;

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------

// including file with called functions and tasks


endmodule // module IGMP_REPORT_10G

