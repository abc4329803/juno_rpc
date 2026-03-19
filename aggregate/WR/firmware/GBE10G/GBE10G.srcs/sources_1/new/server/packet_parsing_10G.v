/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\packet_parsing_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\packet_parsing_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:11:32 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2003-2020
// 	Filename:  PACKET_PARSING_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 2
// 	Date last modified: 9/24/20
//  Inheritance: 	COM-5402 PACKET_PARSING.VHD rev 8 12/10/15
// 
//  description: Common code. This component parses the received packets from the MAC
//  and extracts key information shared by all protocols.  
//  Reads receive packet structure on the fly and detect the following
//  (a) encapsulation: ethernet (RFC 894) or 802.2/802.3 (RFC 1042)
//  (b) type: 0800 IP datagram, 0806 ARP request/reply, 8035 RARP request/reply
//  (c) IP address match
//  (d) IP port match
//  (e) IP protocol detected: ICMP, UDP, TCP-IP
//  (f) IP checksum verification
//  (g) UDP checksum verification
//  It also saves the source IP/source LAN address on the fly to avoid doing ARPs
//  This module includes all checks which could be performed in multiple protocol modules.
//  The goal is to share these checks to save implementation gates.
//  Each protocol layer is associated with one CLK latency. 
// 
//  Limitations: 802.3/802.2 encapsulation is only detected, not supported for any protocol.
// 
//  Rev1 4/30/19 AZ
//  Added IP payload checksum computation
//  Added IPv4 broadcast address check (needed for DHCP)
//  
//  Rev 2 6/7/19 AZ
//  corrected bug clearing IPv4_PROTOCOL too early in very small frame and adjacent frames (no gap)
// 
//  Device utilization (IPv6_ENABLED='1')
//  FF: 850
//  LUT: 1468
//  DSP48: 0
//  18Kb BRAM: 0
//  BUFG: 1
//  Minimum period: 6.586ns (Maximum Frequency: 151.837MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module PACKET_PARSING_10G #(
    parameter IPv6_ENABLED = 1,
			// 0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)
	parameter SIMULATION   = 0
			// 1 during simulation with Wireshark .cap file, '0' otherwise
			// Wireshark many not be able to collect offloaded checksum computations.
			// when SIMULATION =  '1': 
			// (a) IP header checksum is valid if 0000,
			// (b) TCP checksum computation is forced to a valid 00001 irrespective of the 16-bit checksum
			// captured by Wireshark.
)(

		// CLK, RESET
		input   CLK,
		input   SYNC_RESET, 

		// RECEIVED MAC FRAME ---------------------------------------------
		input   [63:0] MAC_RX_DATA,
			// USER reads the data at the rising edge of CLK when MAC_RX_DATA_VALID /= 0
			// Bytes order: MSB was received first
			// Bytes are left aligned: first byte in MSB, occasional follow-on fill-in Bytes in the LSB(s)
			// The first destination address byte is always a MSB (MAC_RX_DATA(7:0))
		input   [7:0] MAC_RX_DATA_VALID,
		input   MAC_RX_SOF,
			// Start of Frame: one CLK-wide pulse indicating the first word in the received frame
			// aligned with MAC_RX_DATA_VALID.
		input   MAC_RX_EOF,
			// End of Frame: one CLK-wide pulse indicating the last word in the received frame
			// aligned with MAC_RX_DATA_VALID.
		input   MAC_RX_FRAME_VALID,
            // MAC frame integrity verification (at the end of frame)
		output   [10:0] MAC_RX_WORD_COUNT,
			// MAC word counter, 1 CLK after the input. 0 is the first word.

		// local IP address
		input   [31:0] IPv4_ADDR,
		input   [127:0] IPv6_ADDR, 
			// local IP address. 4 bytes for IPv4, 16 bytes for IPv6
			// Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
		input   [31:0] IPv4_MULTICAST_ADDR,
		    // to receive UDP multicast messages. One multicast address only
            // 0.0.0.0 to signify that IP multicasting is not supported here.

		// RECEIVED IP FRAME  --------------------------------------------
		// Excludes MAC layer header. Includes IP header.
		output   [63:0] IP_RX_DATA,
		output   [7:0] IP_RX_DATA_VALID, 
		output   IP_RX_SOF,
		output   IP_RX_EOF, 
		output   [10:0] IP_RX_WORD_COUNT,
		output   [1:0] IP_HEADER_FLAG,
		  // bit 1 is for the upper 32-bit
		  // bit 0 lower 32-bit

		// Received type
		output   [3:0] RX_TYPE,
			// Information stays until start of following packet.
			// 0 = unknown type
			// 1 = Ethernet encapsulation, IPv4 datagram
			// 2 = Ethernet encapsulation, ARP request/reply
			// 3 = Ethernet encapsulation, RARP request/reply
			// 5 = Ethernet encapsulation, IPv6 datagram
			// 9 = IEEE 802.3/802.2  encapsulation, IPv4 datagram (almost never used)
			// 10 = IEEE 802.3/802.2  encapsulation, ARP request/reply (almost never used)
			// 11 = IEEE 802.3/802.2  encapsulation, RARP request/reply (almost never used)
			// 13 = IEEE 802.3/802.2  encapsulation, IPv6 datagram (almost never used)
	  	output   RX_TYPE_RDY,
			// 1 CLK-wide pulse indicating that a detection was made on the received packet
			// type, and that RX_TYPE can be read.
			// Detection occurs as soon as possible, two clocks after receiving byte 13 or 21.

		//// IP type: 
		output   RX_IPv4_6n,
			// IP version. 4 or 6
		output   [7:0] RX_IP_PROTOCOL,
			// read between RX_IP_PROTOCOL_RDY (inclusive)(i.e. before IP_PAYLOAD_SOF) and IP_PAYLOAD_EOF (inclusive)
			// most common protocols: 
			// 0 = unknown, 1 = ICMP, 2 = IGMP, 6 = TCP, 17 = UDP, 41 = IPv6 encapsulation, 
			// 58 = ICMPv6, 89 = OSPF, 132 = SCTP
	  	output   RX_IP_PROTOCOL_RDY,
			// 1 CLK wide pulse. 
        
		//// basic IP validity check
		output   IP_RX_FRAME_VALID,
		output   IP_RX_FRAME_VALID2, 
			// The received IP frame is presumed valid until proven otherwise. 
			// IP frame validity checks include: 
			// (a) protocol is IP
			// (b) unicast or multicast destination IP address matches
			// (c) correct IP header checksum (IPv4 only)
			// (d) allowed IPv6
			// (e) Ethernet frame is valid (correct FCS, dest address)
			// Also compute IP_RX_FRAME_VALID2 (no IP destination check)
			// Ready at IP_RX_EOF_D2

		//// Destination IP check for IP datagram
		// IP is checked only for IP datagrams (RX_TYPE 1,5)
		// Check is against unicast or multicast IP address IPv4_ADDR, IPv6_ADDR, or IPv4_MULTICAST_ADDR
		output   VALID_UNICAST_DEST_IP, 
		output   VALID_MULTICAST_DEST_IP, 
			// 1 = valid , 0 = invalid. Read when VALID_DEST_IP_RDY = '1'
			// IPv4: checks match against IPv4_MULTICAST_ADDR and IP broadcast (full or subnet) address
			// IPv6: checks match against solicited-node multicast IP FF02....+lower 24-bit of unicast IP
		output   VALID_DEST_IP_RDY,
			// 1 CLK wide pulse. 

		//// IP header checksum verification
		output   IP_HEADER_CHECKSUM_VALID,
		output   IP_HEADER_CHECKSUM_VALID_RDY,
		
		//// Packet origin, already parsed in PACKET_PARSING (shared code)
		output   [47:0] RX_SOURCE_MAC_ADDR,   					// all received packets
		output   [127:0] RX_SOURCE_IP_ADDR, 					// IPv4,IPv6,ARP
		output   [127:0] RX_DEST_IP_ADDR,
			
		//// RECEIVED IP PAYLOAD   ---------------------------------------------

		output   reg [63:0] IP_PAYLOAD_DATA,
		output   [7:0] IP_PAYLOAD_DATA_VALID,
		output   IP_PAYLOAD_SOF,
		output   IP_PAYLOAD_EOF, 
		output   [15:0] IP_PAYLOAD_LENGTH,
			// payload length in bytes (i.e. excluding MAC and IP headers) 
		output   [10:0] IP_PAYLOAD_WORD_COUNT, 
			// 2 CLKs latency w.r.t. IP_RX_DATA
		output   VALID_IP_PAYLOAD_CHECKSUM,
			// '1' when valid IP payload checksum. Read at IP_RX_EOF_D2 or IP_PAYLOAD_EOF_D
			// verified only for IGMP messages
			
		// UDP attributes
		output   VALID_UDP_CHECKSUM,
			// '1' when valid UDP checksum(including pseudo-header). Read at IP_RX_EOF_D2 or IP_PAYLOAD_EOF_D
			// verified only for UDP messages

		//// TCP attributes
		output   VALID_TCP_CHECKSUM,
			// '1' when valid TCP checksum(including pseudo-header). Read at IP_RX_EOF_D2 or IP_PAYLOAD_EOF_D
			// verified only for TCP messages
		
		//// TEST POINTS, COMSCOPE TRACES
		output   [7:0] 		CS1,
		output   			CS1_CLK,
		output   [7:0] 		CS2, 
		output   			CS2_CLK,
		output   [10:1] 	TP
); 

//------------------------------------------------------
//      COMPONENTS
//------------------------------------------------------
//------------------------------------------------------
//      SIGNALS
//------------------------------------------------------
// NOTATIONS: 
// _E as one-CLK early sample
// _D as one-CLK delayed sample
// _D2 as two-CLKs delayed sample

reg     [7:0] MAC_RX_DATA_VALID_D; 
reg     MAC_RX_WORD_VALID_D; 
reg     MAC_RX_SOF_D; 
reg     MAC_RX_EOF_D; 
reg     [63:0] MAC_RX_DATA_D; 
reg     [10:0] MAC_RX_WORD_COUNT_local; 

// // TYPE ---------------------------------
reg     [15:0] RX_TYPE_FIELD_D; 
reg     [3:0] RX_TYPE_local; 
reg     RX_TYPE_RDY_local; 

// // SOURCE MAC ADDRESS ------------------------------------
reg     [47:0] RX_SOURCE_MAC_ADDR_local; 

// // IP DATA -------------------------------------
reg     MAC_RX_SOF_D2; 
reg     [63:48] IP_RX_DATA_CACHE; 
reg     [7:6] IP_RX_DATA_CACHE_VALID; 
reg     [63:0] IP_RX_DATA0; 
reg     [63:0] IP_RX_DATA_local; 
reg     IP_RX_WORD_VALID_local; 
reg     IP_RX_SOF_local; 
reg     IP_RX_EOF0; 
reg     IP_RX_EOF_local; 
reg     IP_RX_EOF_D; 
reg     [10:0] IP_RX_WORD_COUNT_local; 
reg     IP_RX_FLUSH_CACHE; 
reg     [7:0] IP_RX_DATA_VALID0; 
reg     [7:0] IP_RX_DATA_VALID_local; 
reg     [7:0] IP_RX_MASK_ETH_PADS; 

// // IP PROTOCOL ----------------------
reg     RX_IPv4_6n_local; 
reg     [7:0] RX_IP_PROTOCOL_local; 
reg     [7:0] IPv4_PROTOCOL; 
reg     IPv4_PROTOCOL_RDY; 
reg     [7:0] IPv6_PROTOCOL; 
reg     IPv6_PROTOCOL_RDY; 

// // IPv6 HEADER PARSING ---------------------------------------
reg     IPv6_HEADER_FLAG; 
reg     [7:0] IPv6_HEADER_WORD_CNTR; 
reg     [7:0] IPv6_NEXT_HEADER; 
reg     [1:0] IP_HEADER_FLAG_local; 

// // IPv4 HEADER PARSING ---------------------------------------
reg     [3:0] IPv4_HEADER_N32bWORDS; 
//  expressed in 32-bit words. read/use at MAC_RX_DATA_VALID_D3
reg     [3:0] IPv4_HEADER_N32bWORDS_D; 
//  expressed in 32-bit words. read/use at MAC_RX_DATA_VALID_D3
reg     [3:0] IPv4_HEADER_N32bWORDS_DEC; 
reg     [1:0] IPv4_HEADER_MASK_A; 
reg     [1:0] IPv4_HEADER_MASK; 
reg     [1:0] IPv4_HEADER_MASK_D; 

// signal IPv4_HEADER_DATA: std_logic_vector(63 downto 0) := (others => '0');
reg     IPv4_RX_EOH; 
reg     IPv4_RX_EOH_D; 
reg     [15:0] IP_TOTAL_LENGTH_DEC; 

// --// IP BYTE COUNT ----------------------
// signal MAC_RX_EOF_D2: std_logic := '0';
// signal MAC_RX_DATA_D2: std_logic_vector(7 downto 0) := x"00";
// signal IP_FRAME_FLAG: std_logic := '0';							-- read/use at MAC_RX_DATA_VALID_D2
// signal IP_HEADER_FLAG_E: std_logic := '0';							
// signal IP_FRAME_FLAG_E: std_logic := '0';						
// signal IP_RX_EOF_E: std_logic := '0';
// // VALIDATE IP ADDRESS ----------------------
reg     VALID_UNICAST_DEST_IP_local; 
reg     VALID_UNICAST_DEST_IP_MSBS; 
reg     VALID_MULTICAST_DEST_IP_local; 
reg     VALID_MULTICAST_DEST_IP_MSBS; 
reg     VALID_DEST_IP_RDY_local; 
reg     [127:0] IP_ADDR_local; 

// // VALIDATE IP HEADER CHECKSUM ----------------------
reg     [17:0] IP_RX_DATA_SUM_MSW; 
reg     [17:0] IP_RX_DATA_SUM_LSW; 
reg     [15:0] TYPE_FIELD_D2; 
reg     [17:0] HCKSUM1; 
reg     [17:0] HCKSUM2; 
reg     [5:0] HCKSUM3; 
reg     [5:0] HCKSUM3_PLUS; 
reg     [17:0] IP_HEADER_CHECKSUM_FINAL; 
reg     [17:0] IP_HEADER_CHECKSUM; 
//  16-bit sum + carry
reg     IP_HEADER_CHECKSUM_VALID_local; 
//  read/use at MAC_RX_DATA_VALID_D3
reg     IP_HEADER_CHECKSUM_VALID_RDY_local; 
//  read/use at MAC_RX_DATA_VALID_D3

// // IP LENGTH ----------------------
reg     [15:0] IP_PAYLOAD_LENGTH_local; 
//  IP payload length in bytes
reg     IP_PAYLOAD_LENGTH_RDY; 

// // SOURCE & DESTINATION IP ADDRESS -------------------------
reg     [127:0] RX_SOURCE_IP_ADDR_local; 
reg     [127:0] RX_DEST_IP_ADDR_local; 

// // CHECK IP VALIDITY ----------------------
reg     IP_RX_FRAME_VALID_local; 
reg     IP_RX_FRAME_VALID2_local; 
reg     IP_RX_FRAME_VALID3_local; 

// // IP PAYLOAD   ---------------------------------------------
reg     [31:0] IP_PAYLOAD_DATA_LS32b_D; 
reg     [3:0] IP_PAYLOAD_DATA_VALID_LSB32b_D; 
reg     [7:0] IP_PAYLOAD_DATA_VALID0; 
reg     [10:0] IP_PAYLOAD_WORD_COUNT_local; 
reg     IP_PAYLOAD_SOF0; 
reg     IP_PAYLOAD_EOF_local; 
reg     IP_PAYLOAD_EOF_D; 

// //--- UDP LAYER ---------------------------------
reg     UDPv4_CKSUM_NULL; 
reg     [17:0] CKSUM1; 
reg     [17:0] CKSUM2; 
reg     [17:0] CKSUM3; 
reg     [17:0] CKSUM3PLUS; 
reg     [17:0] RX_UDP_CKSUM_local; 
reg     VALID_UDP_CHECKSUM0; 
reg     VALID_UDP_CHECKSUM1; 
reg     VALID_UDP_CHECKSUM_local; 

// ----------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// -------------------------------------------------
// -- PACKET LAYER ---------------------------------
// -------------------------------------------------
// // PACKET WORD COUNT ----------------------
//  Most packet processing is performed with a 1CLK latency (processes MAC_RX_DATA_D and MAC_RX_DATA_VALID_D)
//  count received bytes for each incoming packet. 0 is the first word.
reg     [17:0]  IP_HEADER_CHECKSUM_001_CKSUM; 
integer k;
initial 
   begin : process_84
   VALID_UDP_CHECKSUM_local = 1'b 0;   
   end

initial 
   begin : process_83
   VALID_UDP_CHECKSUM1 = 1'b 0;   
   end

initial 
   begin : process_82
   VALID_UDP_CHECKSUM0 = 1'b 0;   
   end

initial 
   begin : process_81
   RX_UDP_CKSUM_local = {18{1'b 0}};   
   end

initial 
   begin : process_80
   CKSUM3PLUS = {18{1'b 0}};   
   end

initial 
   begin : process_79
   CKSUM3 = {18{1'b 0}};   
   end

initial 
   begin : process_78
   CKSUM2 = {18{1'b 0}};   
   end

initial 
   begin : process_77
   CKSUM1 = {18{1'b 0}};   
   end

initial 
   begin : process_76
   UDPv4_CKSUM_NULL = 1'b 0;   
   end

initial 
   begin : process_75
   IP_PAYLOAD_EOF_D = 1'b 0;   
   end

initial 
   begin : process_74
   IP_PAYLOAD_EOF_local = 1'b 0;   
   end

initial 
   begin : process_73
   IP_PAYLOAD_SOF0 = 1'b 0;   
   end

initial 
   begin : process_72
   IP_PAYLOAD_WORD_COUNT_local = {11{1'b 0}};   
   end

initial 
   begin : process_71
   IP_PAYLOAD_DATA_VALID0 = {8{1'b 0}};   
   end

initial 
   begin : process_70
   IP_PAYLOAD_DATA_VALID_LSB32b_D = {4{1'b 0}};   
   end

initial 
   begin : process_69
   IP_PAYLOAD_DATA_LS32b_D = {32{1'b 0}};   
   end

initial 
   begin : process_68
   IP_RX_FRAME_VALID3_local = 1'b 0;   
   end

initial 
   begin : process_67
   IP_RX_FRAME_VALID2_local = 1'b 0;   
   end

initial 
   begin : process_66
   IP_RX_FRAME_VALID_local = 1'b 0;   
   end

initial 
   begin : process_65
   RX_DEST_IP_ADDR_local = {128{1'b 0}};   
   end

initial 
   begin : process_64
   RX_SOURCE_IP_ADDR_local = {128{1'b 0}};   
   end

initial 
   begin : process_63
   IP_PAYLOAD_LENGTH_RDY = 1'b 0;   
   end

initial 
   begin : process_62
   IP_PAYLOAD_LENGTH_local = 16'h 0000;   
   end

initial 
   begin : process_61
   IP_HEADER_CHECKSUM_VALID_RDY_local = 1'b 0;   
   end

initial 
   begin : process_60
   IP_HEADER_CHECKSUM_VALID_local = 1'b 0;   
   end

initial 
   begin : process_59
   IP_HEADER_CHECKSUM = {18{1'b 0}};   
   end

initial 
   begin : process_58
   IP_HEADER_CHECKSUM_FINAL = {18{1'b 0}};   
   end

initial 
   begin : process_57
   HCKSUM3_PLUS = {6{1'b 0}};   
   end

initial 
   begin : process_56
   HCKSUM3 = {6{1'b 0}};   
   end

initial 
   begin : process_55
   HCKSUM2 = {18{1'b 0}};   
   end

initial 
   begin : process_54
   HCKSUM1 = {18{1'b 0}};   
   end

initial 
   begin : process_53
   TYPE_FIELD_D2 = {16{1'b 0}};   
   end

initial 
   begin : process_52
   IP_RX_DATA_SUM_LSW = {18{1'b 0}};   
   end

initial 
   begin : process_51
   IP_RX_DATA_SUM_MSW = {18{1'b 0}};   
   end

initial 
   begin : process_50
   IP_ADDR_local = 128'h 00000000000000000000000000000000;   
   end

initial 
   begin : process_49
   VALID_DEST_IP_RDY_local = 1'b 0;   
   end

initial 
   begin : process_48
   VALID_MULTICAST_DEST_IP_MSBS = 1'b 0;   
   end

initial 
   begin : process_47
   VALID_MULTICAST_DEST_IP_local = 1'b 0;   
   end

initial 
   begin : process_46
   VALID_UNICAST_DEST_IP_MSBS = 1'b 0;   
   end

initial 
   begin : process_45
   VALID_UNICAST_DEST_IP_local = 1'b 0;   
   end

initial 
   begin : process_44
   IP_TOTAL_LENGTH_DEC = {16{1'b 0}};   
   end

initial 
   begin : process_43
   IPv4_RX_EOH_D = 1'b 0;   
   end

initial 
   begin : process_42
   IPv4_RX_EOH = 1'b 0;   
   end

initial 
   begin : process_41
   IPv4_HEADER_MASK_D = {2{1'b 0}};   
   end

initial 
   begin : process_40
   IPv4_HEADER_MASK = {2{1'b 0}};   
   end

initial 
   begin : process_39
   IPv4_HEADER_MASK_A = {2{1'b 0}};   
   end

initial 
   begin : process_38
   IPv4_HEADER_N32bWORDS_DEC = {4{1'b 0}};   
   end

initial 
   begin : process_37
   IPv4_HEADER_N32bWORDS_D = {4{1'b 0}};   
   end

initial 
   begin : process_36
   IPv4_HEADER_N32bWORDS = {4{1'b 0}};   
   end

initial 
   begin : process_35
   IP_HEADER_FLAG_local = {2{1'b 0}};   
   end

initial 
   begin : process_34
   IPv6_NEXT_HEADER = {8{1'b 0}};   
   end

initial 
   begin : process_33
   IPv6_HEADER_WORD_CNTR = {8{1'b 0}};   
   end

initial 
   begin : process_32
   IPv6_HEADER_FLAG = 1'b 0;   
   end

initial 
   begin : process_31
   IPv6_PROTOCOL_RDY = 1'b 0;   
   end

initial 
   begin : process_30
   IPv6_PROTOCOL = 8'h 00;   
   end

initial 
   begin : process_29
   IPv4_PROTOCOL_RDY = 1'b 0;   
   end

initial 
   begin : process_28
   IPv4_PROTOCOL = 8'h 00;   
   end

initial 
   begin : process_27
   RX_IP_PROTOCOL_local = 8'h 00;   
   end

initial 
   begin : process_26
   RX_IPv4_6n_local = 1'b 1;   
   end

initial 
   begin : process_25
   IP_RX_MASK_ETH_PADS = {8{1'b 0}};   
   end

initial 
   begin : process_24
   IP_RX_DATA_VALID_local = {8{1'b 0}};   
   end

initial 
   begin : process_23
   IP_RX_DATA_VALID0 = {8{1'b 0}};   
   end

initial 
   begin : process_22
   IP_RX_FLUSH_CACHE = 1'b 0;   
   end

initial 
   begin : process_21
   IP_RX_WORD_COUNT_local = {11{1'b 0}};   
   end

initial 
   begin : process_20
   IP_RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_19
   IP_RX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_18
   IP_RX_EOF0 = 1'b 0;   
   end

initial 
   begin : process_17
   IP_RX_SOF_local = 1'b 0;   
   end

initial 
   begin : process_16
   IP_RX_WORD_VALID_local = 1'b 0;   
   end

initial 
   begin : process_15
   IP_RX_DATA_local = {64{1'b 0}};   
   end

initial 
   begin : process_14
   IP_RX_DATA0 = {64{1'b 0}};   
   end

initial 
   begin : process_13
   IP_RX_DATA_CACHE_VALID = {2{1'b 0}};   
   end

initial 
   begin : process_12
   IP_RX_DATA_CACHE = {16{1'b 0}};   
   end

initial 
   begin : process_11
   MAC_RX_SOF_D2 = 1'b 0;   
   end

initial 
   begin : process_10
   RX_SOURCE_MAC_ADDR_local = {48{1'b 0}};   
   end

initial 
   begin : process_9
   RX_TYPE_RDY_local = 1'b 0;   
   end

initial 
   begin : process_8
   RX_TYPE_local = 4'h 0;   
   end

initial 
   begin : process_7
   RX_TYPE_FIELD_D = {16{1'b 0}};   
   end

initial 
   begin : process_6
   MAC_RX_WORD_COUNT_local = {11{1'b 0}};   
   end

initial 
   begin : process_5
   MAC_RX_DATA_D = {64{1'b 0}};   
   end

initial 
   begin : process_4
   MAC_RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_3
   MAC_RX_SOF_D = 1'b 0;   
   end

initial 
   begin : process_2
   MAC_RX_WORD_VALID_D = 1'b 0;   
   end

initial 
   begin : process_1
   MAC_RX_DATA_VALID_D = {8{1'b 0}};   
   end



always @(posedge CLK)
   begin
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         MAC_RX_WORD_COUNT_local <= {11{1'b 0}};   
         MAC_RX_DATA_D <= {64{1'b 0}};   
         MAC_RX_DATA_VALID_D <= {8{1'b 0}};   
         MAC_RX_WORD_VALID_D <= 1'b 0;   
         MAC_RX_SOF_D <= 1'b 0;   
         MAC_RX_EOF_D <= 1'b 0;   

//  reclock data and sample clock so that they are aligned with the byte count.
//  Also blank data bytes not marked as valid  *063018
         end
      else
         begin         
        for (k = 0; k <= 7; k = k + 1) begin : MAC_RX_WORD_COUNT_001
            if (MAC_RX_DATA_VALID[k] === 1'b 1) begin
               MAC_RX_DATA_D[(8 * k)+: 8] <= MAC_RX_DATA[(8 * k)+: 8];   
            end
            else begin
               MAC_RX_DATA_D[(8 * k)+: 8] <= 'b 0;   
            end
        end
// MAC_RX_DATA_D <= MAC_RX_DATA;
         MAC_RX_DATA_VALID_D <= MAC_RX_DATA_VALID;   
         MAC_RX_SOF_D <= MAC_RX_SOF;   
         MAC_RX_EOF_D <= MAC_RX_EOF;   
         if (MAC_RX_SOF === 1'b 1)
            begin

//  just received first byte. 
            MAC_RX_WORD_COUNT_local <= {11{1'b 0}};   
            end
         else if (MAC_RX_DATA_VALID !== 0 )
            begin
            MAC_RX_WORD_COUNT_local <= MAC_RX_WORD_COUNT_local + 1;   
            end
         if (MAC_RX_DATA_VALID !== 0)
            begin
            MAC_RX_WORD_VALID_D <= 1'b 1;   
            end
         else
            begin
            MAC_RX_WORD_VALID_D <= 1'b 0;   
            end
         end
      end
   end

assign MAC_RX_WORD_COUNT = MAC_RX_WORD_COUNT_local; 

// // PACKET TYPE ---------------------------------
//  type detection at word 6 (Ethernet encapsulation, RFC 894)
//  OR at word 10 (802.3)

always @( MAC_RX_DATA_D ) 
RX_TYPE_FIELD_D = MAC_RX_DATA_D[31:16]; 

always @(posedge CLK)
   begin : DETECT_TYPE_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RX_TYPE_local <= 4'h 0;   
//  unknown type
         RX_TYPE_RDY_local <= 1'b 0;   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin

//  clear type to unknown
         RX_TYPE_local <= 4'h 0;   
//  unknown type
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 1 & RX_TYPE_local === 0 )
         begin

//  Ethernet encapsulation, RFC 894
         if (RX_TYPE_FIELD_D === 16'h 0800)
            begin

//  IPv4 datagram
            RX_TYPE_local <= 4'h 1;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 0806 )
            begin

//  ARP request/reply
            RX_TYPE_local <= 4'h 2;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 8035 )
            begin

//  RARP request/reply
            RX_TYPE_local <= 4'h 3;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 86DD )
            begin

//  IPv6 datagram
            RX_TYPE_local <= 4'h 5;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else
            begin
            RX_TYPE_RDY_local <= 1'b 0;   
            end
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 2 & RX_TYPE_local === 0 )
         begin

//  IEEE 802.3/802.2 encapsulation, RFC 1042
         if (RX_TYPE_FIELD_D === 16'h 0800)
            begin

//  IP datagram
            RX_TYPE_local <= 4'h 9;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 0806 )
            begin

//  ARP request/reply
            RX_TYPE_local <= 4'h A;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 8035 )
            begin

//  RARP request/reply
            RX_TYPE_local <= 4'h B;   
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         else if (RX_TYPE_FIELD_D === 16'h 86DD )
            begin

//  IPv6 datagram
            RX_TYPE_local <= 4'h D;   
            RX_TYPE_RDY_local <= 1'b 1;   

//  still unrecognized type after second word, declare unknown type
            end
         else
            begin
            RX_TYPE_RDY_local <= 1'b 1;   
            end
         end
      else
         begin
         RX_TYPE_RDY_local <= 1'b 0;   
         end
      end
   end

assign RX_TYPE = RX_TYPE_local; 
assign RX_TYPE_RDY = RX_TYPE_RDY_local; 

// // SOURCE MAC ADDRESS ------------------------------------

always @(posedge CLK)
   begin : CAPTURE_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RX_SOURCE_MAC_ADDR_local <= {48{1'b 0}};   
         end
      else if (MAC_RX_SOF_D === 1'b 1 & MAC_RX_DATA_VALID_D[1:0] === 2'b 11 )
         begin
         RX_SOURCE_MAC_ADDR_local[47:32] <= MAC_RX_DATA_D[15:0];   
         end
      else if (MAC_RX_WORD_COUNT_local === 1 & MAC_RX_DATA_VALID_D[7:4] === 4'b 1111 )
         begin
         RX_SOURCE_MAC_ADDR_local[31:0] <= MAC_RX_DATA_D[63:32];   
         end
      end
   end

assign RX_SOURCE_MAC_ADDR = RX_SOURCE_MAC_ADDR_local; 

// // IP DATA -------------------------------------
//  Parse the IP frame, (discard the Ethernet header), starting at the version number 
//  Most packet processing is performed with a 2CLK latency w.r.t. the input
//  Keep track of the number of IP words (first is 1), even during Ethernet short frame padding.
//  Note: IP_RX_DATA0 will be masked by IP_RX_DATA_VALID_local further down

always @(posedge CLK)
   begin : RX_IP_FRAME_GEN_001
   if (CLK === 1'b 1)
      begin
      MAC_RX_SOF_D2 <= MAC_RX_SOF_D;   
      if (SYNC_RESET === 1'b 1)
         begin
         IP_RX_DATA_CACHE <= {16{1'b 0}};   
         IP_RX_DATA_CACHE_VALID <= {2{1'b 0}};   
         IP_RX_DATA0 <= {64{1'b 0}};   
         IP_RX_WORD_COUNT_local <= {11{1'b 0}};   
         IP_RX_FLUSH_CACHE <= 1'b 0;   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin
         if (IP_RX_FLUSH_CACHE === 1'b 1)
            begin

//  special case when EOF is followed immediately by SOF
            IP_RX_DATA0[63:48] <= IP_RX_DATA_CACHE[63:48];   
            IP_RX_DATA0[47:0] <= {48{1'b 0}};   
            IP_RX_WORD_COUNT_local <= IP_RX_WORD_COUNT_local + 1;   
            IP_RX_DATA_CACHE_VALID[7:6] <= 2'b 00;   
            IP_RX_FLUSH_CACHE <= 1'b 0;   
            end
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 1 & RX_TYPE_local === 0 )
         begin

//  Ethernet encapsulation, RFC 894
         IP_RX_DATA_CACHE[63:48] <= MAC_RX_DATA_D[15:0];   
         IP_RX_DATA_CACHE_VALID[7:6] <= MAC_RX_DATA_VALID_D[1:0];   
         IP_RX_WORD_COUNT_local <= {11{1'b 0}};   
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 2 & RX_TYPE_local === 0 )
         begin

//  IEEE 802.3/802.2 encapsulation, RFC 1042
         IP_RX_DATA_CACHE[63:48] <= MAC_RX_DATA_D[15:0];   
         IP_RX_DATA_CACHE_VALID[7:6] <= MAC_RX_DATA_VALID_D[1:0];   
         IP_RX_WORD_COUNT_local <= {11{1'b 0}};   
         end
      else if (MAC_RX_WORD_VALID_D === 1'b 1 )
         begin
         IP_RX_DATA0[63:48] <= IP_RX_DATA_CACHE[63:48];   
         IP_RX_DATA0[47:0] <= MAC_RX_DATA_D[63:16];   
         IP_RX_DATA_CACHE[63:48] <= MAC_RX_DATA_D[15:0];   
         IP_RX_DATA_CACHE_VALID[7:6] <= MAC_RX_DATA_VALID_D[1:0];   
         IP_RX_WORD_COUNT_local <= IP_RX_WORD_COUNT_local + 1;   
         if (MAC_RX_DATA_VALID_D[1:0] !== 2'b 00)
            begin
            IP_RX_FLUSH_CACHE <= MAC_RX_EOF_D;   
//  maybe last (full) word, or not the last word.
            end
         end
      else if (IP_RX_FLUSH_CACHE === 1'b 1 )
         begin
         IP_RX_DATA0[63:48] <= IP_RX_DATA_CACHE[63:48];   
         IP_RX_DATA0[47:0] <= {48{1'b 0}};   
         IP_RX_WORD_COUNT_local <= IP_RX_WORD_COUNT_local + 1;   
         IP_RX_DATA_CACHE_VALID[7:6] <= 2'b 00;   
         IP_RX_FLUSH_CACHE <= 1'b 0;   
         end
      end
   end

assign IP_RX_WORD_COUNT = IP_RX_WORD_COUNT_local; 

//  reconstruct IP_RX_SOF for the IP frame

always @(posedge CLK)
   begin : RX_IP_FRAME_GEN_002
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_RX_SOF_D === 1'b 1)
         begin
         IP_RX_SOF_local <= 1'b 0;   
         end
      else if (MAC_RX_WORD_VALID_D === 1'b 1 & MAC_RX_WORD_COUNT_local === 2 & (RX_TYPE_local === 1 | RX_TYPE_local === 5) )
         begin

//  Ethernet encapsulation, RFC 894
         IP_RX_SOF_local <= 1'b 1;   
         end
      else if (MAC_RX_WORD_VALID_D === 1'b 1 & MAC_RX_WORD_COUNT_local === 3 & (RX_TYPE_local === 9 | RX_TYPE_local === 13) )
         begin

//  IEEE 802.3/802.2 encapsulation, RFC 1042
         IP_RX_SOF_local <= 1'b 1;   
         end
      else
         begin
         IP_RX_SOF_local <= 1'b 0;   
         end
      end
   end

//  reconstruct the IP_RX_DATA_VALID for the IP frame

always @(posedge CLK)
   begin : RX_IP_FRAME_GEN_003
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         IP_RX_DATA_VALID0 <= {8{1'b 0}};   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin
         if (IP_RX_FLUSH_CACHE === 1'b 1)
            begin

//  special case when EOF is followed immediately by SOF
            IP_RX_DATA_VALID0 <= {IP_RX_DATA_CACHE_VALID[7:6], 6'b 000000};   
            end
         else
            begin
            IP_RX_DATA_VALID0 <= {8{1'b 0}};   
            end
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 1 & RX_TYPE_local === 0 )
         begin

//  Ethernet encapsulation, RFC 894
         IP_RX_DATA_VALID0 <= {8{1'b 0}};   
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 2 & RX_TYPE_local === 0 )
         begin

//  IEEE 802.3/802.2 encapsulation, RFC 1042
         IP_RX_DATA_VALID0 <= {8{1'b 0}};   
         end
      else if (IP_TOTAL_LENGTH_DEC[15:14] === 2'b 00 & IP_TOTAL_LENGTH_DEC[13:3] < IP_RX_WORD_COUNT_local )
         begin

//  Ethernet frame may be padded to meet the minimum 46 Byte (IPv4) or 26 Byte (IPv6) payload length. 
//  Discard the padding here based on the IP total length
         IP_RX_DATA_VALID0 <= {8{1'b 0}};   
         end
      else if (MAC_RX_WORD_VALID_D === 1'b 1 )
         begin
         IP_RX_DATA_VALID0 <= {IP_RX_DATA_CACHE_VALID[7:6], MAC_RX_DATA_VALID_D[7:2]};   
         end
      else if (IP_RX_FLUSH_CACHE === 1'b 1 )
         begin
         IP_RX_DATA_VALID0 <= {IP_RX_DATA_CACHE_VALID[7:6], 6'b 000000};   
         end
      else
         begin
         IP_RX_DATA_VALID0 <= {8{1'b 0}};   
         end
      end
   end


always @( IP_RX_FRAME_VALID3_local or IP_RX_DATA_VALID0 or IP_RX_MASK_ETH_PADS ) 
IP_RX_DATA_VALID_local = IP_RX_FRAME_VALID3_local === 1'b 1 ? IP_RX_DATA_VALID0 & IP_RX_MASK_ETH_PADS : 8'h 00; 

//  mask Ethernet pads when short frame. Mask if not an IP frame.

always @( IP_RX_DATA_VALID_local ) 
IP_RX_WORD_VALID_local = IP_RX_DATA_VALID_local === 8'h 00 ? 1'b 0 : 1'b 1; 

//  zero (mask) IP_RX_DATA bytes based on IP_RX_DATA_VALID_local
genvar j;
generate
	for (j = 0; j <= 7; j = j + 1)	begin : RX_IP_FRAME_GEN_004
		always @(IP_RX_DATA0 or IP_RX_DATA_VALID_local) begin
	      	if (IP_RX_DATA_VALID_local[j] === 1'b 1) begin
	         	IP_RX_DATA_local[8 * j + 7:8 * j] <= IP_RX_DATA0[8 * j + 7:8 * j];   
	       	end else begin
	        	IP_RX_DATA_local[8 * j + 7:8 * j] <= {(8 * j + 7 - 8 * j + 1){1'b 0}};   
	        end
	    end
   	end
endgenerate
//  reconstruct the IP_RX_EOF for the IP frame
//  TODO: EOF MAY ARRIVE EARLIER IN THE CASE OF SHORT (<60BYTES) ETHERNET FRAMES

always @(posedge CLK)
   begin : RX_IP_FRAME_GEN_005
   if (CLK === 1'b 1)
      begin
      IP_RX_EOF_D <= IP_RX_EOF_local;   
      if (SYNC_RESET === 1'b 1)
         begin
         IP_RX_EOF0 <= 1'b 0;   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin
         if (IP_RX_FLUSH_CACHE === 1'b 1)
            begin

//  special case when EOF is followed immediately by SOF
            IP_RX_EOF0 <= 1'b 1;   
            end
         else
            begin
            IP_RX_EOF0 <= 1'b 0;   
            end
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 1 & RX_TYPE_local === 0 )
         begin

//  Ethernet encapsulation, RFC 894
         IP_RX_EOF0 <= 1'b 0;   
         end
      else if (MAC_RX_DATA_VALID_D[3:2] === 2'b 11 & MAC_RX_WORD_COUNT_local === 2 & RX_TYPE_local === 0 )
         begin

//  IEEE 802.3/802.2 encapsulation, RFC 1042
         IP_RX_EOF0 <= 1'b 0;   
         end
      else if ((MAC_RX_WORD_VALID_D === 1'b 1 | IP_RX_FLUSH_CACHE === 1'b 1) & IP_TOTAL_LENGTH_DEC[15:14] === 2'b 00 & IP_TOTAL_LENGTH_DEC[13:3] === IP_RX_WORD_COUNT_local )
         begin

//  Ethernet frame may be padded to meet the minimum 46 Byte (IPv4) or 26 Byte (IPv6) payload length. 
//  Discard the padding here based on the IP total length
         IP_RX_EOF0 <= 1'b 1;   

//  PREVIOUS CODE SMALL DOUBT 062118			
// 		elsif(MAC_RX_WORD_VALID_D = '1') and (MAC_RX_DATA_VALID_D(1 downto 0) = "00") then
// 			IP_RX_EOF0 <= '1'; 
// 		elsif(IP_RX_FLUSH_CACHE = '1') then	
// 			IP_RX_EOF0 <= '1';
         end
      else
         begin
         IP_RX_EOF0 <= 1'b 0;   
         end
      end
   end


always @( IP_RX_EOF0 or IP_RX_FRAME_VALID3_local ) 
IP_RX_EOF_local = IP_RX_EOF0 & IP_RX_FRAME_VALID3_local; 

//  mask EOF if not an IP frame
//  mask Ethernet short-frame padding bits

always @(posedge CLK)
   begin : IP_RX_MASK_ETH_PADS_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | IP_RX_WORD_COUNT_local < 2)
         begin

//  wait until RX_IPv4_6N and IP_TOTAL_LENGTH_DEC are known to generate the ethernet mask
         IP_RX_MASK_ETH_PADS <= 8'h FF;   
         end
      else if (IP_TOTAL_LENGTH_DEC[15:14] === 2'b 00 & IP_TOTAL_LENGTH_DEC[13:3] === IP_RX_WORD_COUNT_local )
         begin

//  last byte
         case (IP_TOTAL_LENGTH_DEC[2:0])
         3'b 000:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h 80;   
            end
         3'b 001:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h C0;   
            end
         3'b 010:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h E0;   
            end
         3'b 011:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h F0;   
            end
         3'b 100:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h F8;   
            end
         3'b 101:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h FC;   
            end
         3'b 110:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h FE;   
            end
         default:
            begin
            IP_RX_MASK_ETH_PADS <= 8'h FF;   
            end
         endcase
         end
      else if (IP_TOTAL_LENGTH_DEC[15:14] === 2'b 00 & IP_TOTAL_LENGTH_DEC[13:3] > IP_RX_WORD_COUNT_local )
         begin
         IP_RX_MASK_ETH_PADS <= 8'h FF;   
         end
      else
         begin
         IP_RX_MASK_ETH_PADS <= 8'h 00;   
         end
      end
   end

//  pass to other components
assign IP_RX_DATA = IP_RX_DATA_local; 
assign IP_RX_SOF = IP_RX_SOF_local; 
assign IP_RX_EOF = IP_RX_EOF_local; 
assign IP_RX_DATA_VALID = IP_RX_DATA_VALID_local; 

// // IP PROTOCOL ----------------------
//  IP version 4 or 6?  Ready at IP_RX_SOF_D

always @(posedge CLK)
   begin : DETECT_IP_PROTOCOL_001
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1)
         begin
         if (IP_RX_DATA_local[63:60] === 6)
            begin
            RX_IPv4_6n_local <= 1'b 0;   
//  IPv6
            end
         else
            begin
            RX_IPv4_6n_local <= 1'b 1;   
//  IPv4
            end
         end
      end
   end

assign RX_IPv4_6n = RX_IPv4_6n_local; 

//  IP protocol (ICMP, UDP, TCP) detection 

always @(posedge CLK)
   begin : DETECT_IPv4_PROTOCOL_002
   if (CLK === 1'b 1)
      begin
      IP_PAYLOAD_EOF_D <= IP_PAYLOAD_EOF_local;   
      if (SYNC_RESET === 1'b 1 | IP_PAYLOAD_EOF_D === 1'b 1)
         begin

//  *060719
//  reset or end of packet
//  clear type to unknown
         IPv4_PROTOCOL <= 8'h 00;   
         IPv4_PROTOCOL_RDY <= 1'b 0;   
         end
      else if (RX_IPv4_6n_local === 1'b 1 & RX_TYPE_local[2:0] === 1 & IP_RX_DATA_VALID_local[6] === 1'b 1 & IP_RX_WORD_COUNT_local === 2 )
         begin

//  IPv4. 
         IPv4_PROTOCOL <= IP_RX_DATA_local[55:48];   
         IPv4_PROTOCOL_RDY <= 1'b 1;   
         end
      else
         begin
         IPv4_PROTOCOL_RDY <= 1'b 0;   
         end
      end
   end

//  read between RX_IP_PROTOCOL_RDY (inclusive)(i.e. before IP_PAYLOAD_SOF) and IP_PAYLOAD_EOF (inclusive)

always @( RX_IPv4_6n_local or IPv4_PROTOCOL or IPv6_PROTOCOL ) 
RX_IP_PROTOCOL_local = RX_IPv4_6n_local === 1'b 1 ? IPv4_PROTOCOL : IPv6_PROTOCOL; 
assign RX_IP_PROTOCOL = RX_IP_PROTOCOL_local; 
assign RX_IP_PROTOCOL_RDY = IPv4_PROTOCOL_RDY | IPv6_PROTOCOL_RDY; 

// // IPv6 HEADER PARSING ---------------------------------------
//  outline IP header and IPv6 extension headers
//  TODO: IPv6 extension header

always @( IP_RX_SOF_local or IPv6_HEADER_FLAG or IPv4_HEADER_MASK or RX_IPv4_6n_local ) 
IP_HEADER_FLAG_local[0] = IP_RX_SOF_local | IPv6_HEADER_FLAG | IPv4_HEADER_MASK[0] & RX_IPv4_6n_local; 

always @( IP_RX_SOF_local or IPv6_HEADER_FLAG or IPv4_HEADER_MASK or RX_IPv4_6n_local ) 
IP_HEADER_FLAG_local[1] = IP_RX_SOF_local | IPv6_HEADER_FLAG | IPv4_HEADER_MASK[1] & RX_IPv4_6n_local; 
assign IP_HEADER_FLAG = IP_HEADER_FLAG_local; 

// // IPv4 HEADER PARSING ---------------------------------------
//  Parse IPv4_HEADER_N32bWORDS. To be used at MAC_RX_DATA_VALID_D3. 
//  Valid only if type is IPv4. 

always @(posedge CLK)
   begin : IPv4_HEADER_N32bWORDS_GEN
   if (CLK === 1'b 1)
      begin
      IPv4_HEADER_N32bWORDS_D <= IPv4_HEADER_N32bWORDS;   
      if (SYNC_RESET === 1'b 1 | MAC_RX_SOF_D === 1'b 1)
         begin

//  reset or new packet
//  clear last IP header length
         IPv4_HEADER_N32bWORDS <= {4{1'b 0}};   
         end
      else if (IP_RX_SOF_local === 1'b 1 & IP_RX_DATA_local[63:60] === 4 )
         begin

//  IPv4 header
         IPv4_HEADER_N32bWORDS <= IP_RX_DATA_local[59:56];   
         end
      end
   end

//  generate mask for IP header

always @( IPv4_HEADER_N32bWORDS ) 
IPv4_HEADER_N32bWORDS_DEC = IPv4_HEADER_N32bWORDS - 1; 

always @(posedge CLK)
   begin : IPv4_HEADER_MASK_001
   if (CLK === 1'b 1)
      begin
      IPv4_HEADER_MASK_D <= IPv4_HEADER_MASK;   
      if (SYNC_RESET === 1'b 1 | MAC_RX_SOF_D === 1'b 1)
         begin

//  reset or new packet
         IPv4_HEADER_MASK_A <= 2'b 00;   
         end
      else if (IP_RX_SOF_local === 1'b 1 )
         begin
         IPv4_HEADER_MASK_A <= 2'b 11;   
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 & IP_RX_WORD_COUNT_local === IPv4_HEADER_N32bWORDS_DEC[3:1] )
         begin
         if (IPv4_HEADER_N32bWORDS[0] === 1'b 0)
            begin

//  even number of 32-bit words in IP header
            IPv4_HEADER_MASK_A <= 2'b 11;   

//  odd number of 32-bit words in IP header
            end
         else
            begin
            IPv4_HEADER_MASK_A <= 2'b 10;   
            end
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 & IP_RX_WORD_COUNT_local > IPv4_HEADER_N32bWORDS_DEC[3:1] )
         begin
         IPv4_HEADER_MASK_A <= 2'b 00;   
         end
      end
   end


always @( IP_RX_SOF_local or IPv4_HEADER_MASK_A ) 
IPv4_HEADER_MASK = IP_RX_SOF_local === 1'b 1 ? 2'b 11 : 
	IPv4_HEADER_MASK_A; 

//  End Of Header, marks the last word in an IPv4 header. Aligned with IP_RX_WORD_VALID_local

always @( IPv4_HEADER_MASK_A or IP_RX_WORD_VALID_local or IP_RX_WORD_COUNT_local or IPv4_HEADER_N32bWORDS_DEC ) 
IPv4_RX_EOH = IPv4_HEADER_MASK_A !== 2'b 00 & IP_RX_WORD_VALID_local === 1'b 1 & 
      IP_RX_WORD_COUNT_local > IPv4_HEADER_N32bWORDS_DEC[3:1] ? 1'b 1 : 
	1'b 0; 

//  Masked IPv4 header (unused)
// IPv4_HEADER_DATA_GEN: process(IPv4_HEADER_MASK,IP_RX_DATA_local)
// begin
// 	if(IPv4_HEADER_MASK = "00") then
// 		IPv4_HEADER_DATA <= (others => '0');
// 	elsif(IPv4_HEADER_MASK = "10") then
// 		IPv4_HEADER_DATA(63 downto 32) <= IP_RX_DATA_local(63 downto 32);
// 		IPv4_HEADER_DATA(31 downto 0) <= (others => '0');
// 	else
// 		IPv4_HEADER_DATA <= IP_RX_DATA_local;
// 	end if;
// end process;
//  Parse IP_TOTAL_LENGTH - 1
//  Valid only if type is IPv4. 

always @(posedge CLK)
   begin : IPv4_TOTAL_LENGTH_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_RX_SOF_D === 1'b 1)
         begin

//  reset or new packet
//  clear last IP total length. Minimum length is 20 bytes
         IP_TOTAL_LENGTH_DEC <= 19;   
         end
      else if (IP_RX_SOF_local === 1'b 1 & IP_RX_DATA_local[63:60] === 4 )
         begin

//  IPv4 header
         IP_TOTAL_LENGTH_DEC <= IP_RX_DATA_local[47:32] - 1;   
         end
      else if (IP_RX_SOF_local === 1'b 1 & IP_RX_DATA_local[63:60] === 6 )
         begin

//  IPv6 header
         IP_TOTAL_LENGTH_DEC <= IP_RX_DATA_local[31:16] + 39;   
         end
      end
   end

// // VALIDATE IP HEADER CHECKSUM ----------------------
//  perform 1's complement sum of all 16-bit words within the header.
//  IP_HEADER_CHECKSUM_VALID ready 2 CLK after the last header word (RX_SAMPLE_CLK_D4_LOCAL)
//  This applies only to IPv4 (no such field in IPv6)
//  sum most significant and least significant words (used several times in this component)

always @( IP_RX_DATA_local ) 
IP_RX_DATA_SUM_MSW = IP_RX_DATA_local[63:48] + IP_RX_DATA_local[47:32]; 

always @( IP_RX_DATA_local ) 
IP_RX_DATA_SUM_LSW = IP_RX_DATA_local[31:16] + IP_RX_DATA_local[15:0]; 

always @(posedge CLK)
   begin : IP_HEADER_CHECKSUM_001
   if (CLK === 1'b 1)
      begin
      IPv4_RX_EOH_D <= IPv4_RX_EOH;   
//  end of header
      IP_HEADER_CHECKSUM_VALID_RDY_local <= IPv4_RX_EOH_D;   
      if (IP_RX_SOF_local === 1'b 1)
         begin
         HCKSUM1 <= IP_RX_DATA_SUM_MSW;   
         HCKSUM2 <= IP_RX_DATA_SUM_LSW;   
         HCKSUM3 <= {6{1'b 0}};   
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 )
         begin
         if (IPv4_HEADER_MASK[1] === 1'b 1)
            begin
            HCKSUM1 <= HCKSUM1[15:0] + IP_RX_DATA_SUM_MSW;   
            end
         if (IPv4_HEADER_MASK[0] === 1'b 1)
            begin
            HCKSUM2 <= HCKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
            end
         else
            begin
            HCKSUM2[17:16] <= {2{1'b 0}};   
//  blank carry bits, already summed into HCKSUM3_PLUS
            end
         if (IPv4_HEADER_MASK !== 2'b 00)
            begin
            HCKSUM3 <= HCKSUM3_PLUS;   
            end
         end
      IP_HEADER_CHECKSUM_FINAL <= IP_HEADER_CHECKSUM[15:0] + IP_HEADER_CHECKSUM[17:16];   
//  add carry
      end
   end


always @( HCKSUM3 or HCKSUM1 or HCKSUM2 ) 
HCKSUM3_PLUS = HCKSUM3 + HCKSUM1[17:16] + HCKSUM2[17:16]; 

always @( HCKSUM1 or HCKSUM2 or HCKSUM3_PLUS ) 
IP_HEADER_CHECKSUM = HCKSUM1[15:0] + HCKSUM2[15:0] + HCKSUM3_PLUS; 

always @( IP_HEADER_CHECKSUM_FINAL ) 
IP_HEADER_CHECKSUM_VALID_local = SIMULATION === 1'b 1 ? 1'b 1 : ((IP_HEADER_CHECKSUM_FINAL[16] === 1'b 0 & IP_HEADER_CHECKSUM_FINAL[15:0] === 16'h FFFF) ? 1'b 1 : (((IP_HEADER_CHECKSUM_FINAL[16] === 1'b 1) & (IP_HEADER_CHECKSUM_FINAL[15:0] === 16'h FFFE)) ? 1'b 1 : 1'b 0)); 

//  ignore computation during simulation with a Wireshark stimulus file as the header checksum may be incorrect (offloaded)
//  make information available to other components
assign IP_HEADER_CHECKSUM_VALID = IP_HEADER_CHECKSUM_VALID_local; 
assign IP_HEADER_CHECKSUM_VALID_RDY = IP_HEADER_CHECKSUM_VALID_RDY_local; 

// // SOURCE & DESTINATION IP ADDRESS -------------------------
//  includes IP (v4, v6) and ARP

always @(posedge CLK)
   begin : CAPTURE_SOURCE_IP_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RX_SOURCE_IP_ADDR_local <= {128{1'b 0}};   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin

//  new packet. clear field.
         RX_SOURCE_IP_ADDR_local <= {128{1'b 0}};   
         end
      else if (RX_TYPE_local[2:0] === 2 )
         begin

//  ARP request/reply 
         if (MAC_RX_DATA_VALID_D[3:0] === 4'b 1111 & MAC_RX_WORD_COUNT_local === 3)
            begin
            RX_SOURCE_IP_ADDR_local[31:0] <= MAC_RX_DATA_D[31:0];   
            end
         end
      else if (RX_IPv4_6n_local === 1'b 1 & RX_TYPE_local[2:0] === 1 & IP_RX_DATA_VALID_local[3:0] === 4'b 1111 & IP_RX_WORD_COUNT_local === 2 )
         begin

//  IPv4. 
         RX_SOURCE_IP_ADDR_local[31:0] <= IP_RX_DATA_local[31:0];   
         end
      else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & RX_TYPE_local[2:0] === 5 & IP_RX_WORD_VALID_local === 1'b 1 )
         begin

//  IPv6 (when enabled)
         if (IP_RX_WORD_COUNT_local === 2)
            begin
            RX_SOURCE_IP_ADDR_local[127:64] <= IP_RX_DATA_local;   
            end
         else if (IP_RX_WORD_COUNT_local === 3 )
            begin
            RX_SOURCE_IP_ADDR_local[63:0] <= IP_RX_DATA_local;   
            end
         end
      end
   end

assign RX_SOURCE_IP_ADDR = RX_SOURCE_IP_ADDR_local; 

always @(posedge CLK)
   begin : CAPTURE_DEST_IP_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RX_DEST_IP_ADDR_local <= {128{1'b 0}};   
         end
      else if (MAC_RX_SOF_D === 1'b 1 )
         begin

//  new packet. clear field.
         RX_DEST_IP_ADDR_local <= {128{1'b 0}};   
         end
      else if (RX_TYPE_local[2:0] === 2 )
         begin

//  ARP request 
         if (MAC_RX_DATA_VALID_D[1:0] === 2'b 11 & MAC_RX_WORD_COUNT_local === 4)
            begin
            RX_DEST_IP_ADDR_local[31:16] <= MAC_RX_DATA_D[15:0];   
            end
         else if (MAC_RX_DATA_VALID_D[7:6] === 2'b 11 & MAC_RX_WORD_COUNT_local === 5 )
            begin
            RX_DEST_IP_ADDR_local[15:0] <= MAC_RX_DATA_D[63:48];   
            end
         end
      else if (RX_IPv4_6n_local === 1'b 1 & RX_TYPE_local[2:0] === 1 & IP_RX_DATA_VALID_local[7:4] === 4'b 1111 & IP_RX_WORD_COUNT_local === 3 )
         begin

//  IPv4. 
         RX_DEST_IP_ADDR_local[31:0] <= IP_RX_DATA_local[63:32];   
         end
      else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & RX_TYPE_local[2:0] === 5 & IP_RX_WORD_VALID_local === 1'b 1 & IP_RX_WORD_COUNT_local === 4 )
         begin

//  IPv6 (when enabled) destination address upper 64-bit
         RX_DEST_IP_ADDR_local[127:64] <= IP_RX_DATA_local;   
         end
      else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & RX_TYPE_local[2:0] === 5 & IP_RX_WORD_VALID_local === 1'b 1 & IP_RX_WORD_COUNT_local === 5 )
         begin

//  IPv6 (when enabled) destination address lower 64-bit
         RX_DEST_IP_ADDR_local[63:0] <= IP_RX_DATA_local;   
         end
      end
   end

assign RX_DEST_IP_ADDR = RX_DEST_IP_ADDR_local; 

// // VALIDATE IP DESTINATION ADDRESS ----------------------
//  Check only in the case of IP datagram, as identified by the RX_TYPE = 1 
//  latency: 3 CLK after receiving the last byte of the destination address field.
//  TODO: currently checking only for UNICAST addresses. Todo: extend to multicast? broadcast? limited broadcast?

always @(posedge CLK)
   begin : DEST_IP_CHECK_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_RX_SOF_D === 1'b 1)
         begin
         VALID_UNICAST_DEST_IP_local <= 1'b 0;   
         VALID_UNICAST_DEST_IP_MSBS <= 1'b 0;   
         VALID_MULTICAST_DEST_IP_local <= 1'b 0;   
         VALID_MULTICAST_DEST_IP_MSBS <= 1'b 0;   
         VALID_DEST_IP_RDY_local <= 1'b 0;   

//  IPv4
         end
      else if (RX_IPv4_6n_local === 1'b 1 & RX_TYPE_local[2:0] === 1 & IP_RX_DATA_VALID_local[7:4] === 4'b 1111 & IP_RX_WORD_COUNT_local === 3 )
         begin

//  IPv4. 
         VALID_DEST_IP_RDY_local <= 1'b 1;   
         if (IP_RX_DATA_local[63:32] === IPv4_ADDR)
            begin

//  unicast address match
            VALID_UNICAST_DEST_IP_local <= 1'b 1;   
            end
         if (IPv4_MULTICAST_ADDR[31:24] !== 0 & IP_RX_DATA_local[63:32] === IPv4_MULTICAST_ADDR)
            begin

//  multicast address match when enabled (i.e. multicast address is not zero)
            VALID_MULTICAST_DEST_IP_local <= 1'b 1;   
            end
         else if (IP_RX_DATA_local[39:32] === 8'h FF )
            begin

//  broadcast (weak check, could be strengthened if needed) *043019
            VALID_MULTICAST_DEST_IP_local <= 1'b 1;   
            end

//  IPv6
         end
      else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & RX_TYPE_local[2:0] === 5 & IP_RX_WORD_VALID_local === 1'b 1 )
         begin
         if (IP_RX_WORD_COUNT_local === 5)
            begin
            VALID_DEST_IP_RDY_local <= 1'b 1;   
            end
         else
            begin
            VALID_DEST_IP_RDY_local <= 1'b 0;   
            end

//  unicast
         if (IP_RX_WORD_COUNT_local === 4 & IP_RX_DATA_local === IPv6_ADDR[127:64])
            begin

//  IPv6 (when enabled) destination address upper 64-bit
            VALID_UNICAST_DEST_IP_MSBS <= 1'b 1;   
            end
         else if (IP_RX_WORD_COUNT_local === 5 & IP_RX_DATA_local === IPv6_ADDR[63:0] )
            begin

//  IPv6 (when enabled) destination address lower 64-bit
            VALID_UNICAST_DEST_IP_local <= VALID_UNICAST_DEST_IP_MSBS;   
            end

//  solicited-node multicast
         if (IP_RX_WORD_COUNT_local === 4 & IP_RX_DATA_local === 64'h FF02000000000000)
            begin

//  IPv6 (when enabled) multicast destination address upper 64-bit
            VALID_MULTICAST_DEST_IP_MSBS <= 1'b 1;   
            end
         else if (IP_RX_WORD_COUNT_local === 5 & IP_RX_DATA_local[63:24] === 40'h 00000001FF & IP_RX_DATA_local[23:0] === IPv6_ADDR[23:0] )
            begin

//  IPv6 (when enabled) multicast destination address lower 64-bit
            VALID_MULTICAST_DEST_IP_local <= VALID_MULTICAST_DEST_IP_MSBS;   
            end
         end
      else
         begin
         VALID_DEST_IP_RDY_local <= 1'b 0;   
         end
      end
   end

assign VALID_UNICAST_DEST_IP = VALID_UNICAST_DEST_IP_local; 
assign VALID_MULTICAST_DEST_IP = VALID_MULTICAST_DEST_IP_local; 
assign VALID_DEST_IP_RDY = VALID_DEST_IP_RDY_local; 

// --// CHECK IP VALIDITY ----------------------
// IP_BYTE_COUNT <= IP_BYTE_COUNT_local;
// IP_RX_DATA <= MAC_RX_DATA_D2;
// IP_RX_SOF <= IP_RX_SOF_local;
// IP_RX_EOF <= IP_RX_EOF_local;
// IP_RX_DATA_VALID_local <= MAC_RX_DATA_VALID_D2 and IP_RX_FRAME_VALID and IP_FRAME_FLAG;
// IP_RX_DATA_VALID <= IP_RX_DATA_VALID_local;
// IP_RX_DATA_VALID2 <= MAC_RX_DATA_VALID_D2 and IP_RX_FRAME_VALID2 and IP_FRAME_FLAG;
// IP_HEADER_FLAG <= IP_HEADER_FLAG_local;
//  The received IP frame is presumed valid until proven otherwise. 
//  IP frame validity checks include: 
//  (a) protocol is IP
//  (b) unicast or multicast destination IP address matches
//  (c) correct IP header checksum (IPv4 only)
//  (d) allowed IPv6
//  (e) Ethernet frame is valid (correct FCS, dest address)
//  Also compute IP_RX_FRAME_VALID2 (no IP destination check)
//  Also compute IP_RX_FRAME_VALID3 (simply not IP, objective: if no IP_SOF then no IP_EOF, no IP_RX_WORD_VALID)
//  Ready at IP_RX_VALID_D (= MAC_RX_DATA_VALID_D3)

always @(posedge CLK)
   begin : IP_RX_FRAME_VALID_CHECK_001
   if (CLK === 1'b 1)
      begin
      if (MAC_RX_SOF_D2 === 1'b 1)
         begin

//  just received first byte. valid until proven otherwise
         IP_RX_FRAME_VALID_local <= 1'b 1;   
         IP_RX_FRAME_VALID2_local <= 1'b 1;   
         IP_RX_FRAME_VALID3_local <= 1'b 1;   
         end
      else
         begin
         if (RX_TYPE_RDY_local === 1'b 1 & RX_TYPE_local !== 1 & RX_TYPE_local !== 5)
            begin

//  (a) the received packet type is not an IPv4 nor IPv6 datagram 
            IP_RX_FRAME_VALID_local <= 1'b 0;   
            IP_RX_FRAME_VALID2_local <= 1'b 0;   
            IP_RX_FRAME_VALID3_local <= 1'b 0;   
            end
         if (IP_RX_SOF_local === 1'b 1 & IP_RX_DATA_local[63:60] === 6 & IPv6_ENABLED === 1'b 0)
            begin

//  (d) IPv6 frame not allowed
            IP_RX_FRAME_VALID_local <= 1'b 0;   
            IP_RX_FRAME_VALID2_local <= 1'b 0;   
            end
         if (VALID_DEST_IP_RDY_local === 1'b 1 & VALID_UNICAST_DEST_IP_local === 1'b 0 & VALID_MULTICAST_DEST_IP_local === 1'b 0)
            begin

//  (b) invalid destination IP 
            IP_RX_FRAME_VALID_local <= 1'b 0;   
            end
         if (RX_IPv4_6n_local === 1'b 1 & IP_HEADER_CHECKSUM_VALID_RDY_local === 1'b 1 & IP_HEADER_CHECKSUM_VALID_local === 1'b 0)
            begin

//  (c) invalid IP header checksum (IPv4 only)
            IP_RX_FRAME_VALID_local <= 1'b 0;   
            IP_RX_FRAME_VALID2_local <= 1'b 0;   
            end
         if (MAC_RX_EOF === 1'b 1 & MAC_RX_FRAME_VALID === 1'b 0)
            begin

//  (g) erroneous MAC frame
            IP_RX_FRAME_VALID_local <= 1'b 0;   
            IP_RX_FRAME_VALID2_local <= 1'b 0;   
            IP_RX_FRAME_VALID3_local <= 1'b 0;   
            end
         end
      end
   end

assign IP_RX_FRAME_VALID = IP_RX_FRAME_VALID_local; 
assign IP_RX_FRAME_VALID2 = IP_RX_FRAME_VALID2_local; 

// // IP PAYLOAD   ---------------------------------------------
//  64-BIT WORD ALIGNMENT
//  In IPv4, a payload frame may start with a 32-bit offset w.r.t. 64-bit words, 
//  depending on the IP header length. Perform realignment here

always @(posedge CLK)
   begin : IP_PAYLOAD_001
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1 | IP_RX_FRAME_VALID_local === 1'b 0)
         begin
         IP_PAYLOAD_DATA <= {64{1'b 0}};   
         IP_PAYLOAD_DATA_VALID0 <= {8{1'b 0}};   
         IP_PAYLOAD_WORD_COUNT_local <= {11{1'b 0}};   
         IP_PAYLOAD_DATA_VALID_LSB32b_D <= {4{1'b 0}};   
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 )
         begin

//  1 received word with 32 or 64-bit payload
         IP_PAYLOAD_DATA_LS32b_D <= IP_RX_DATA_local[31:0];   
//  remember the lower half of the previous word
         IP_PAYLOAD_DATA_VALID_LSB32b_D <= IP_RX_DATA_VALID_local[3:0];   
         if (RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS[0] === 1'b 1 & IPv4_HEADER_MASK === 2'b 00)
            begin

//  IPv4 and odd number of 32-bit words in IP header
            IP_PAYLOAD_DATA[63:32] <= IP_PAYLOAD_DATA_LS32b_D;   
            IP_PAYLOAD_DATA[31:0] <= IP_RX_DATA_local[63:32];   
            IP_PAYLOAD_DATA_VALID0[7:4] <= IP_PAYLOAD_DATA_VALID_LSB32b_D;   
            IP_PAYLOAD_DATA_VALID0[3:0] <= IP_RX_DATA_VALID_local[7:4];   
            IP_PAYLOAD_WORD_COUNT_local <= IP_PAYLOAD_WORD_COUNT_local + 1;   
            end
         else if (RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS[0] === 1'b 0 & IPv4_HEADER_MASK === 2'b 00 )
            begin
            IP_PAYLOAD_DATA <= IP_RX_DATA_local;   
            IP_PAYLOAD_DATA_VALID0 <= IP_RX_DATA_VALID_local;   
            IP_PAYLOAD_WORD_COUNT_local <= IP_PAYLOAD_WORD_COUNT_local + 1;   
            end
         else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & IPv6_HEADER_FLAG === 1'b 0 )
            begin
            IP_PAYLOAD_DATA <= IP_RX_DATA_local;   
            IP_PAYLOAD_DATA_VALID0 <= IP_RX_DATA_VALID_local;   
            IP_PAYLOAD_WORD_COUNT_local <= IP_PAYLOAD_WORD_COUNT_local + 1;   
            end
         else
            begin
            IP_PAYLOAD_DATA_VALID0 <= 8'h 00;   
            end
         end
      else if (IP_RX_EOF_D === 1'b 1 & RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS_D[0] === 1'b 1 & IP_PAYLOAD_DATA_VALID_LSB32b_D !== 4'h 0 )
         begin

//  flush remaining 32 bits in cache
         IP_PAYLOAD_DATA[63:32] <= IP_PAYLOAD_DATA_LS32b_D;   
         IP_PAYLOAD_DATA[31:0] <= {32{1'b 0}};   
         IP_PAYLOAD_DATA_VALID0[7:4] <= IP_PAYLOAD_DATA_VALID_LSB32b_D;   
         IP_PAYLOAD_DATA_VALID0[3:0] <= 4'h 0;   
         IP_PAYLOAD_WORD_COUNT_local <= IP_PAYLOAD_WORD_COUNT_local + 1;   
         IP_PAYLOAD_DATA_VALID_LSB32b_D <= 4'h 0;   
         end
      else
         begin
         IP_PAYLOAD_DATA_VALID0 <= 8'h 00;   
         end
      end
   end

assign IP_PAYLOAD_DATA_VALID = IP_RX_FRAME_VALID_local === 1'b 1 ? IP_PAYLOAD_DATA_VALID0 : 8'h 00; 
//  blank out ASAP when frame is invalid
assign IP_PAYLOAD_WORD_COUNT = IP_RX_FRAME_VALID_local === 1'b 1 ? IP_PAYLOAD_WORD_COUNT_local : {11{1'b 0}}; 

//  Generate SOF for the first word of the IP payload
//  Takes into account the possibility of a zero-length payload.

always @(posedge CLK)
   begin : IP_PAYLOAD_002
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1 | IP_RX_FRAME_VALID_local === 1'b 0)
         begin
         IP_PAYLOAD_SOF0 <= 1'b 0;   
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 & IP_PAYLOAD_WORD_COUNT_local === 0 )
         begin

//  1 received word with 32 or 64-bit payload
         if (RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_MASK === 2'b 00)
            begin

//  IPv4 
            IP_PAYLOAD_SOF0 <= 1'b 1;   
            end
         else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & IPv6_HEADER_FLAG === 1'b 0 )
            begin
            IP_PAYLOAD_SOF0 <= 1'b 1;   
            end
         else
            begin
            IP_PAYLOAD_SOF0 <= 1'b 0;   
            end
         end
      else if (IP_RX_EOF_D === 1'b 1 & IP_PAYLOAD_WORD_COUNT_local === 0 & RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS_D[0] === 1'b 1 & IP_PAYLOAD_DATA_VALID_LSB32b_D !== 4'h 0 )
         begin

//  IP payload size is 1-4 bytes => IP_PAYLOAD_SOF coincides with IP_PAYLOAD_EOF
         IP_PAYLOAD_SOF0 <= 1'b 1;   
         end
      else
         begin
         IP_PAYLOAD_SOF0 <= 1'b 0;   
         end
      end
   end

assign IP_PAYLOAD_SOF = IP_PAYLOAD_SOF0 & IP_RX_FRAME_VALID_local; 
//  blank out ASAP when frame is invalid

//  Generate EOF for the last word of the IP payload
//  Takes into account the possibility of a zero-length payload.

always @(posedge CLK)
   begin : IP_PAYLOAD_003
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1 | IP_RX_FRAME_VALID_local === 1'b 0)
         begin
         IP_PAYLOAD_EOF_local <= 1'b 0;   
         end
      else if (IP_RX_EOF_local === 1'b 1 )
         begin
         if (RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS[0] === 1'b 1 & IPv4_HEADER_MASK === 2'b 00 & IP_RX_DATA_VALID_local[3:0] === 4'h 0)
            begin
            IP_PAYLOAD_EOF_local <= 1'b 1;   
            end
         else if (RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS[0] === 1'b 0 & IPv4_HEADER_MASK === 2'b 00 )
            begin
            IP_PAYLOAD_EOF_local <= 1'b 1;   
            end
         else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n_local === 1'b 0 & IPv6_HEADER_FLAG === 1'b 0 )
            begin
            IP_PAYLOAD_EOF_local <= 1'b 1;   
            end
         end
      else if (IP_RX_EOF_D === 1'b 1 & RX_IPv4_6n_local === 1'b 1 & IPv4_HEADER_N32bWORDS_D[0] === 1'b 1 & IP_PAYLOAD_DATA_VALID_LSB32b_D !== 4'h 0 )
         begin

//  flush remaining 32 bits in cache
         IP_PAYLOAD_EOF_local <= 1'b 1;   
         end
      else
         begin
         IP_PAYLOAD_EOF_local <= 1'b 0;   
         end
      end
   end

assign IP_PAYLOAD_EOF = IP_PAYLOAD_EOF_local; 

//  Parse IP payload length (excluding IP header), expressed in bytes. 

always @(posedge CLK)
   begin : IP_PAYLOAD_004
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1)
         begin
         if (IP_RX_DATA_local[63:60] === 4)
            begin

//  IPv4 header
            IP_PAYLOAD_LENGTH_local <= IP_RX_DATA_local[47:32] - {IP_RX_DATA_local[59:56], 2'b 00};   
            IP_PAYLOAD_LENGTH_RDY <= 1'b 1;   

//  IP payload length (= UDP or TCP length) = total IP length - IP header length in bytes
            end
         else if (IPv6_ENABLED === 1'b 1 & IP_RX_DATA_local[63:60] === 6 )
            begin

//  IPv6 header
            IP_PAYLOAD_LENGTH_local <= IP_RX_DATA_local[31:16];   
            IP_PAYLOAD_LENGTH_RDY <= 1'b 1;   

//  UDP length (excludes IP header)
            end
         else
            begin
            IP_PAYLOAD_LENGTH_RDY <= 1'b 0;   
            end
         end
      end
   end

assign IP_PAYLOAD_LENGTH = IP_PAYLOAD_LENGTH_local; 

// -------------------------------------------------
// //--- UDP LAYER ---------------------------------
// -------------------------------------------------
// // UDP CHECKSUM -----------------
//  In IPv4, computing the UDP checksum is not sufficient. One must also check if the UDP checksum is zero 
//  (meaning that the sender did not compute the UDP checksum). It is captured here

always @(posedge CLK)
   begin : GET_UDP_CKSUM_IPv4
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1)
         begin
         UDPv4_CKSUM_NULL <= 1'b 0;   
//  assume sender computed a non-null checksum until we reach the actual UDP header
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 & RX_IPv4_6n_local === 1'b 1 & IPv4_PROTOCOL === 8'h 11 )
         begin

//  IPv4, UDP, new word
//  location within the 64-bit word depends on the IP header length
         if (IPv4_HEADER_MASK_D === 2'b 11 & IPv4_HEADER_MASK === 2'b 00 & IP_RX_DATA_local[15:0] === 0)
            begin
            UDPv4_CKSUM_NULL <= 1'b 1;   
            end
         if (IPv4_HEADER_MASK_D === 2'b 10 & IP_RX_DATA_local[47:32] === 0)
            begin
            UDPv4_CKSUM_NULL <= 1'b 1;   
            end
         end
      end
   end

//  for timing reasons, we limit ourselves to summing up to 3 16-bit fields per CLK 
//  Different pseudo-headers are used for IPv4 and IPv6
//  Design note: the same computation is used for UDP, TCP and IGMP. However,
//  IGMP checksum computation only includes the IP payload, without pseudo-header.
//  UDP/TCP checksum computation include both the IP payload and a pseudo-header.

always @(posedge CLK)
   begin : UDP_CKSUM_001
   if (CLK === 1'b 1)
      begin
      if (IP_RX_SOF_local === 1'b 1)
         begin
         if (IP_RX_DATA_local[63:60] === 4)
            begin

//  IPv4 header
            CKSUM1 <= IP_RX_DATA_local[47:32] - {IP_RX_DATA_local[59:56], 2'b 00};   
//  IP payload length (= UDP or TCP length) = total IP length - IP header length in bytes
            CKSUM2 <= {18{1'b 0}};   
            CKSUM3 <= {18{1'b 0}};   
//  carry
            end
         else if (IPv6_ENABLED === 1'b 1 & IP_RX_DATA_local[63:60] === 6 )
            begin

//  IPv6 header
            CKSUM1 <= IP_RX_DATA_local[31:16];   
//  UDP length (excludes IP header)
            CKSUM2 <= IP_RX_DATA_local[15:8];   
//  Next header = protocol
            CKSUM3 <= {18{1'b 0}};   
//  carry
            end
         end
      else if (IP_RX_WORD_VALID_local === 1'b 1 )
         begin
         if (RX_IPv4_6n_local === 1'b 1)
            begin

//  IPv4
            if (IP_RX_WORD_COUNT_local === 2)
               begin
               CKSUM1 <= CKSUM1[15:0] + IP_RX_DATA_local[55:48];   
//  protocol 
               CKSUM2 <= CKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
//  source address
               end
            else if (IP_RX_WORD_COUNT_local === 3 )
               begin

//  *042719
               if (IP_RX_DATA_local[55:48] === 8'h 02)
                  begin

//  IGMP protocol case, no pseudo header in the checksum, just the IP payload. reset CKSUM1/2
                  CKSUM1 <= {18{1'b 0}};   
                  CKSUM2 <= IP_RX_DATA_SUM_LSW;   

//  UDP/TCP case, keep on summing the pseudo header
                  end
               else
                  begin
                  CKSUM1 <= CKSUM1[15:0] + IP_RX_DATA_SUM_MSW;   
//  destination IP address
                  CKSUM2 <= CKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
                  end
               end
            else
               begin
               if (IP_HEADER_FLAG_local[1] === 1'b 0)
                  begin
                  CKSUM1 <= CKSUM1[15:0] + IP_RX_DATA_SUM_MSW;   
                  end
               if (IP_HEADER_FLAG_local[0] === 1'b 0)
                  begin
                  CKSUM2 <= CKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
                  end
               end
            end
         else if (IPv6_ENABLED === 1'b 1 )
            begin

//  IPv6
            if (IP_RX_WORD_COUNT_local <= 5)
               begin
               CKSUM1 <= CKSUM1[15:0] + IP_RX_DATA_SUM_MSW;   
               CKSUM2 <= CKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
//  *042918
               end
            else if (IP_HEADER_FLAG_local === 2'b 00 )
               begin
               CKSUM1 <= CKSUM1[15:0] + IP_RX_DATA_SUM_MSW;   
//  destination + source IP addresses
               CKSUM2 <= CKSUM2[15:0] + IP_RX_DATA_SUM_LSW;   
               end
            end
         CKSUM3 <= CKSUM3PLUS;   
         end
      end
   end


always @( CKSUM3 or CKSUM1 or CKSUM2 ) 
CKSUM3PLUS = CKSUM3 + CKSUM1[17:16] + CKSUM2[17:16]; 
//  for timing purposes, we need to reclock
//  ready at IP_RX_EOF_D2 = IP_PAYLOAD_EOF_D

always @(posedge CLK)
   begin : UDP_CKSUM_002
   if (CLK === 1'b 1)
      begin
      RX_UDP_CKSUM_local <= CKSUM1[15:0] + CKSUM2[15:0] + CKSUM3PLUS;   
      if (RX_IPv4_6n_local === 1'b 1 & UDPv4_CKSUM_NULL === 1'b 1)
         begin

//  UDP checksum field is zero. Acceptable for IPv4, but not for IPv6
         VALID_UDP_CHECKSUM0 <= 1'b 1;   
         end
      else
         begin
         VALID_UDP_CHECKSUM0 <= 1'b 0;   
         end
      end
   end

// VALID_UDP_CHECKSUM1 <= '1' when ((RX_UDP_CKSUM_local(15 downto 0) = x"FFFF") and (RX_UDP_CKSUM_local(17 downto 16) = "00")) 
//                             or  ((RX_UDP_CKSUM_local(15 downto 0) = x"FFFE") and (RX_UDP_CKSUM_local(17 downto 16) = "01"))
//                             or  ((RX_UDP_CKSUM_local(15 downto 0) = x"FFFD") and (RX_UDP_CKSUM_local(17 downto 16) = "10")) else 
//                        '0';
//  alternative phrasing

always @( RX_UDP_CKSUM_local ) 
VALID_UDP_CHECKSUM1 = RX_UDP_CKSUM_local[15:2] !== 14'b 11111111111111 ? 1'b 0 : (((RX_UDP_CKSUM_local[17:16]) ^ (RX_UDP_CKSUM_local[1:0] !== 2'b 11)) ? 1'b 0 : 1'b 1); 

always @( VALID_UDP_CHECKSUM0 or VALID_UDP_CHECKSUM1 ) 
VALID_UDP_CHECKSUM_local = VALID_UDP_CHECKSUM0 | VALID_UDP_CHECKSUM1; 
assign VALID_UDP_CHECKSUM = RX_IP_PROTOCOL_local === 8'h 11 ? VALID_UDP_CHECKSUM_local : 1'b 0; 
assign VALID_IP_PAYLOAD_CHECKSUM = IPv4_PROTOCOL === 8'h 02 ? VALID_UDP_CHECKSUM1 : 1'b 0; 

// ---------------------------------------------------
// ---- TCP LAYER ---------------------------------
// ---------------------------------------------------
//  
//  The TCP checksum is computed in the same manner as the UDP checksum. Sharing the same code.
//  mask the checksum when simulating using a Wireshark .cap capture file as input
//  Reason: the checksum field may be wrong due to TCP checksum offload to hardware.
// VALID_TCP_CHECKSUM <= VALID_UDP_CHECKSUM_local when (SIMULATION = '0') else '1';
assign VALID_TCP_CHECKSUM = RX_IP_PROTOCOL_local === 8'h 06 ? VALID_UDP_CHECKSUM_local : 1'b 0; 

//  Note1: TCP checksum offload can be enabled/disabled in Windows/network and sharing center.
//  Note2: TCP checksum validation can be enabled/disabled in Wireshark/Edit/Preferences/TCP
// 
// // TEST POINTS --------------------------
assign TP[1] = 1'b 0; 
assign TP[2] = ((RX_TYPE_RDY_local === 1'b 1) & (RX_TYPE_local !== 1) & (RX_TYPE_local !== 5)) ? 1'b 1 : 1'b 0; 
assign TP[3] = (IP_RX_SOF_local === 1'b 1 & (IP_RX_DATA_local[63:60] === 6) & (IPv6_ENABLED === 1'b 0)) ? 1'b 1 : 1'b 0; 
assign TP[4] = ((VALID_DEST_IP_RDY_local === 1'b 1) & (VALID_UNICAST_DEST_IP_local === 1'b 0) & (VALID_MULTICAST_DEST_IP_local === 1'b 0)) ? 1'b 1 : 1'b 0; 
assign TP[5] = ((RX_IPv4_6n_local === 1'b 1) & (IP_HEADER_CHECKSUM_VALID_RDY_local === 1'b 1) & (IP_HEADER_CHECKSUM_VALID_local === 1'b 0)) ? 1'b 1 : 1'b 0; 
assign TP[6] = ((MAC_RX_EOF === 1'b 1) & (MAC_RX_FRAME_VALID === 1'b 0)) ? 1'b 1 : 1'b 0; 
assign TP[7] = IP_HEADER_CHECKSUM_VALID_local; 
assign TP[10:8] = {3{1'b 0}}; 

always @(posedge CLK)
   begin : IPv6_HEADER_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | IP_PAYLOAD_EOF_D === 1'b 1)
         begin
         IPv6_PROTOCOL <= {8{1'b 0}};   
         IPv6_PROTOCOL_RDY <= 1'b 0;   
         IPv6_HEADER_FLAG <= 1'b 0;   
         end
      else if (IP_RX_EOF_local === 1'b 1 )
         begin
         IPv6_HEADER_FLAG <= 1'b 0;   
         end
      else if (RX_TYPE_local[2:0] === 5 & IP_RX_WORD_VALID_local === 1'b 1 & IP_RX_WORD_COUNT_local === 1 & IP_RX_DATA_local[63:60] === 6 )
         begin
         IPv6_HEADER_WORD_CNTR <= 5;   
         IPv6_NEXT_HEADER <= IP_RX_DATA_local[15:8];   
         IPv6_HEADER_FLAG <= 1'b 1;   
         end
      else if (IPv6_HEADER_FLAG === 1'b 1 & IP_RX_WORD_VALID_local === 1'b 1 )
         begin
         IPv6_HEADER_WORD_CNTR <= IPv6_HEADER_WORD_CNTR - 1;   
         if (IPv6_HEADER_WORD_CNTR === 2)
            begin
            if (IPv6_NEXT_HEADER === 0)
               ;
            else if (IPv6_NEXT_HEADER === 43 )
               ;
            else
               begin
               IPv6_HEADER_FLAG <= 1'b 0;   
               IPv6_PROTOCOL <= IPv6_NEXT_HEADER;   
               IPv6_PROTOCOL_RDY <= 1'b 1;   
               end
            end
         else if (IPv6_HEADER_WORD_CNTR === 1 )
            begin
            IPv6_HEADER_WORD_CNTR <= IP_RX_DATA_local[55:48];   
            IPv6_NEXT_HEADER <= IP_RX_DATA_local[63:56];   
            end
         end
      else
         begin
         IPv6_PROTOCOL_RDY <= 1'b 0;   
         end
      end
   end


// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
//  NOTATIONS: 
//  _E as one-CLK early sample
//  _D as one-CLK delayed sample
//  _D2 as two-CLKs delayed sample
// // WORD COUNT ----------------------

// including file with called functions and tasks


endmodule // module PACKET_PARSING_10G

