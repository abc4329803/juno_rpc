/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\dhcp_server_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\dhcp_server_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:19:24 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2019
// 	Filename:  DHCP_SERVER_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 5/3/19
//  Inheritance: DHCP_SERVER.vhd  6/26/16
// 
//  description:  
//  DHCP server (on-top of UDP_TX and UDP_RX). 10G version.
//  Based on RFC2131
//  Supports dynamic and automatic allocation:
//  dynamic allocation: A network administrator assigns a range of IP addresses to DHCP, and each client computer on the LAN 
//  is configured to request an IP address from the DHCP server during network initialization. The request-and-grant process 
//  uses a lease concept with a controllable time period, allowing the DHCP server to reclaim (and then reallocate) IP 
//  addresses that are not renewed.
//  automatic allocation: The DHCP server permanently assigns a free IP address to a requesting client from the range defined 
//  by the administrator. This is like dynamic allocation, but the DHCP server keeps a table of past IP address assignments, 
//  so that it can preferentially assign to a client the same IP address that the client previously had.
// 
//  Limitations:
//  No support for static allocation.
//  Client and server are on the same subnet (no relay)
// 
//  Usage:
//  1. A DHCP server can be instantiated (using the DHCP_SERVER_EN generic parameter in COM5502/3.vhd), but still
//  enabled/disabled dynamically at run-time using the SYNC_RESET input. Set SYNC_RESET to '1' to disable this server.
//  2. After changing DHCP server configuration parameter, the server must be reset.
//  3. Proposed IP address is always on the same subnet as this server (i.e. same 3 MSBs as this server IPv4_ADDR)
//  4. Limited to 6-byte (Ethernet) hardware addressing
// 
//  Device utilization 
//  FF: 1534
//  LUT: 1399
//  DSP48: 0
//  36Kb BRAM: 5
//  BUFG: 1
//  Minimum period: 6.122ns (Maximum Frequency: 163.359MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module DHCP_SERVER_10G (

		// CLK, RESET
		input   SYNC_RESET,
			// set to '1' to disable the DHCP server
		input   CLK,  	// synchronous clock
			// Must be a global clocks. No BUFG instantiation within this component.
		input   TICK_4US,
		input   TICK_100MS,
			// 100 ms tick for timer

		// DHCP SERVER CONFIGURATION: IP address, MAC address, host name
		input   [47:0]  MAC_ADDR,
			// MAC address. Unique for each network interface card.
			// Natural byte order: (MSB) 0x000102030405 (LSB) 
			// as transmitted in the Ethernet packet.
		input   [31:0]  IPv4_ADDR,
		input   [127:0] IPv6_ADDR,
			// this DHCP server IP address. 4 bytes for IPv4, 16 bytes for IPv6
			// Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
		input   [47:0] HOST_NAME,	// 6 char max or hash if longer		
		input   [7:0] IP_MIN,
		input   [7:0] NIPs,
			// range of IP addresses to be assigned by this DHCP server
			// the actual address is in the form IPv4_ADDR for the 3 MSB, and a subnet address between IP_MIN (inclusive)
			// and IP_MIN + NIPs -1 (inclusive)
			// Maximum 128 entries.
			// For example, if IPv4_ADDR = 172.16.1.3, IP_MIN = 10, NIPs = 10, this DHCP server will assign and keep track of 
			// IP addresses in the range 172.16.1.10 and 172.16.1.19 (inclusive).
		input   [31:0] LEASE_TIME,
			// lease time in secs
		input   [31:0] SUBNET_MASK,
		input   [31:0] ROUTER,
		input   [31:0] DNS,
		
		input   [15:0] IP_ID_IN,
			// 16-bit IP ID, unique for each datagram. Incremented every time
			// an IP datagram is sent (not just for this protocol).

		// Received UDP payload 
		   //DHCP message is encapsulated within a UDP frame
		input   [63:0] UDP_RX_DATA,
 		    // byte order: MSB first (reason: easier to read contents during simulation)
		input   [7:0] UDP_RX_DATA_VALID,
		input   UDP_RX_SOF,
		input   UDP_RX_EOF,
			// 1 CLK pulse indicating that UDP_RX_DATA is the last word in the UDP data field.
			// ALWAYS CHECK UDP_RX_FRAME_VALID at the end of packet (UDP_RX_EOF = '1') to confirm
			// that the UDP packet is valid. External buffer may have to backtrack to the the last
			// valid pointer to discard an invalid UDP packet.
			// Reason: we only knows about bad UDP packets at the end.
		input   UDP_RX_FRAME_VALID,
			// check entire frame validity at UDP_RX_EOF
		input   [15:0] UDP_RX_DEST_PORT_NO,
				// Identify the destination UDP port. Read when UDP_RX_EOF = '1' 

		// IP type, already parsed in PACKET_PARSING (shared code)
		input   [31:0] RX_SOURCE_IP_ADDR,

		// OUTPUT: TX UDP layer -> Transmit MAC Interface
		 //32-bit CRC is automatically appended by MAC. Not supplied here.
		output   [63:0] MAC_TX_DATA,
			// MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID /= 0
		output   [7:0] MAC_TX_DATA_VALID,
			// data valid
		output   MAC_TX_EOF,
			// '1' when sending the last byte in a packet to be transmitted. 
			// Aligned with MAC_TX_DATA_VALID
		input   MAC_TX_CTS,
			// MAC-generated Clear To Send flow control signal. The user should check that this 
			// signal is high before sending the next MAC_TX_DATA byte. 
		output   RTS,
			// '1' when a frame is ready to be sent (tell the COM550X arbiter)
			// When the MAC starts reading the output buffer, it is expected that it will be
			// read until empty.

		// TEST POINTS 
//		N_DHCPDISCOVER_OUT: out std_logic_vector(7 downto 0);
//			// monitors the number of received DHCPDISCOVER messages, modulo 256
//		N_DHCPREQUEST1_OUT: out std_logic_vector(7 downto 0);
//			// monitors the number of received DHCPREQUEST messages addressed to this server (continuation of the DHCPDISCOVER), modulo 256
//		N_DHCPREQUEST2_OUT: out std_logic_vector(7 downto 0);
//			// monitors the number of DHCPREQUEST messages for renewing state
//		N_DHCPREQUEST3_OUT: out std_logic_vector(7 downto 0);
//			// monitors the number of DHCPREQUEST messages (INIT REBOOT STATE)
//		N_DHCPACK_OUT: out std_logic_vector(7 downto 0);
//			// monitors the number of successful DHCPACK messages sent, concluding the dynamic IP address assignment, modulo 256
				
		output   [10:1] TP
);

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // TIME ------------------------------------------------
reg     [5:0] TIMER; 
reg     [31:0] TIME_CNTR; 
reg     [3:0] CNTR10; 

// // UDP RX frame ---------------------------------------
reg     VALID_UDP_DEST_PORT; 
reg     [6:0] DHCP_RX_WORD_COUNT; 
reg     [63:0] DHCP_RX_DATA; 
reg     [63:0] DHCP_RX_DATA_D; 
reg     [63:0] DHCP_RX_DATA_D_FLIPPED; 
reg     [7:0] DHCP_RX_DATA_VALID; 
reg     [7:0] DHCP_RX_DATA_VALID_D; 
reg     DHCP_RX_SOF; 
reg     DHCP_RX_SOF_D; 
reg     DHCP_RX_EOF; 
reg     DHCP_RX_EOF_D; 
reg     DHCP_RX_WORD_VALID; 
reg     DHCP_RX_WORD_VALID_D; 
reg     [47:0] CLIENT_MAC_ADDR; 
reg     [31:0] XID; 
reg     [31:0] XID4RESPONSE; 
reg     [15:0] FLAGS; 
reg     [31:0] CIADDR; 
reg     [31:0] GIADDR; 
reg     [31:0] MAGIC_COOKIE; 

//  word to byte serialization
reg     [9:0] DHCP_RX_BYTE_COUNT; 
reg     [9:0] BUF1_SIZE; 
reg     DHCP_RX_DATA2_VALID_E; 
reg     DHCP_RX_DATA2_VALID; 
wire    [7:0] DHCP_RX_DATA2; 
reg     [1:0] DHCP_READ_STATE; 
reg     DHCP_RX_EOF2; 
reg     DHCP_RX_EOF2_D; 
reg     [7:0] DHCP_OPTION; 
reg     [7:0] DHCP_MESSAGE_LENGTH; 
reg     [95:0] DHCP_MESSAGE; 
reg     [3:0] DHCP_MESSAGE_TYPE; 
reg     [55:0] DHCP_CLIENT_ID; 
reg     [55:0] DHCP_CLIENT_ID_D; 
reg     DHCP_CLIENT_ID_MATCH; 
reg     [31:0] DHCP_REQUESTED_IP_ADDR; 
reg     [31:0] DHCP_SERVER_IP_ADDR; 
reg     [23:0] DHCP_PARAMETERS_REQUEST; 
reg     [47:0] DHCP_HOST_NAME; 
//  6 char max or hash if longer		
reg     RX_VALID; 
reg     EVENT0; 
reg     EVENT1; 
reg     EVENT2A; 
reg     EVENT2B; 
reg     EVENT2C; 
reg     EVENT2D; 
reg     EVENT3A; 
reg     EVENT3B; 
reg     EVENT3C; 

// signal EVENT4: std_logic := '0'; 
reg     EVENT6; 

// signal EVENT7: std_logic := '0'; 
// signal EVENT8: std_logic := '0'; 
reg     EVENT10; 
reg     EVENT11; 
reg     [4:0] STATE; 

// //-- TABLE ---------------------------------------------------
reg     WEA; 
reg     WEB; 
reg     [31:0] DIA; 
reg     [31:0] DIB; 
wire    [31:0] DOA; 
wire    [31:0] DOB; 

// 
// //-- SEARCH STATE MACHINE ---------------------------------------
reg     TRIGGER_SEARCH_BY_CLIENTID; 
reg     [1:0] SEARCH_STATE; 
reg     [1:0] SEARCH_STATE_D; 
reg     [1:0] SEARCH_STATE_D2; 
reg     SEARCH_COMPLETE; 
reg     SEARCH_COMPLETE_D; 
reg     SEARCH_COMPLETE_D2; 
reg     [9:0] ADDRA; 
//  table is 512 x 36 + 1 bit for overflow detection
reg     [9:0] ADDRA_PLUS; 
//  table is 512 x 36 + 1 bit for overflow detection
reg     [9:0] ADDRA_D; 
reg     [9:0] ADDRA_D2; 
reg     [9:0] ADDRB; 
//  table is 512 x 36 + 1 bit for overflow detection
reg     FOUND_CLIENT_ID; 
reg     FOUND_CLIENT_ID_D; 
reg     [7:0] FOUND_IP; 
reg     [7:0] FOUND_IP_PLUSMIN; 
reg     [7:0] FOUND_OLDEST_IP; 
reg     [31:0] FOUND_OLDEST_EXPIRATION_TIME; 
reg     EXPIRED_OLDEST_ENTRY; 
reg     [31:0] PROPOSED_IP_ADDR; 
reg     IP_MATCH; 
reg     IP_MATCH_MSB; 

// //-- COMPOSE REPLY --------------------------
reg     [31:0] DEST_IPv4_ADDR; 
reg     [127:0] DEST_IPv4_ADDRx; 
reg     [47:0] DEST_MAC_ADDR; 
reg     [6:0] WPTR; 
//  maximum size 576Bytes or 73 Words
reg     [63:0] UDP_TX_DATA; 
reg     [7:0] UDP_TX_DATA_VALID; 
reg     UDP_TX_SOF; 
reg     UDP_TX_EOF; 
wire    UDP_TX_CTS; 
wire    UDP_TX_ACK_local; 
wire    UDP_TX_NAK_local; 
wire    MAC_TX_EOF_local; 

// 
// //-- MONITORING ---------------------------------
reg     [7:0] N_DHCPDISCOVER; 
reg     [7:0] N_DHCPREQUEST1; 
reg     [7:0] N_DHCPREQUEST2; 
reg     [7:0] N_DHCPREQUEST3; 
reg     [7:0] N_DHCPACK; 

// 
// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // TIME ------------------------------------------------
//  track relative time in secs.
wire    [31:0] PROPOSED_IP_ADDR_wire; 


initial 
   begin : process_102
   N_DHCPACK = {8{1'b 0}};   
   end

initial 
   begin : process_101
   N_DHCPREQUEST3 = {8{1'b 0}};   
   end

initial 
   begin : process_100
   N_DHCPREQUEST2 = {8{1'b 0}};   
   end

initial 
   begin : process_99
   N_DHCPREQUEST1 = {8{1'b 0}};   
   end

initial 
   begin : process_98
   N_DHCPDISCOVER = {8{1'b 0}};   
   end







initial 
   begin : process_93
   UDP_TX_EOF = 1'b 0;   
   end

initial 
   begin : process_92
   UDP_TX_SOF = 1'b 0;   
   end

initial 
   begin : process_91
   UDP_TX_DATA_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_90
   UDP_TX_DATA = {64{1'b 0}};   
   end

initial 
   begin : process_89
   WPTR = {7{1'b 0}};   
   end

initial 
   begin : process_88
   DEST_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_87
   DEST_IPv4_ADDRx = {128{1'b 0}};   
   end

initial 
   begin : process_86
   DEST_IPv4_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_85
   IP_MATCH_MSB = 1'b 0;   
   end

initial 
   begin : process_84
   IP_MATCH = 1'b 0;   
   end

initial 
   begin : process_83
   PROPOSED_IP_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_82
   EXPIRED_OLDEST_ENTRY = 1'b 0;   
   end

initial 
   begin : process_81
   FOUND_OLDEST_EXPIRATION_TIME = {32{1'b 0}};   
   end

initial 
   begin : process_80
   FOUND_OLDEST_IP = {8{1'b 0}};   
   end

initial 
   begin : process_79
   FOUND_IP_PLUSMIN = {8{1'b 0}};   
   end

initial 
   begin : process_78
   FOUND_IP = {8{1'b 0}};   
   end

initial 
   begin : process_77
   FOUND_CLIENT_ID_D = 1'b 0;   
   end

initial 
   begin : process_76
   FOUND_CLIENT_ID = 1'b 0;   
   end

initial 
   begin : process_75
   ADDRB = {10{1'b 0}};   
   end

initial 
   begin : process_74
   ADDRA_D2 = {10{1'b 0}};   
   end

initial 
   begin : process_73
   ADDRA_D = {10{1'b 0}};   
   end

initial 
   begin : process_72
   ADDRA_PLUS = {10{1'b 0}};   
   end

initial 
   begin : process_71
   ADDRA = {10{1'b 0}};   
   end

initial 
   begin : process_70
   SEARCH_COMPLETE_D2 = 1'b 0;   
   end

initial 
   begin : process_69
   SEARCH_COMPLETE_D = 1'b 0;   
   end

initial 
   begin : process_68
   SEARCH_COMPLETE = 1'b 0;   
   end

initial 
   begin : process_67
   SEARCH_STATE_D2 = 0;   
   end

initial 
   begin : process_66
   SEARCH_STATE_D = 0;   
   end

initial 
   begin : process_65
   SEARCH_STATE = 0;   
   end

initial 
   begin : process_64
   TRIGGER_SEARCH_BY_CLIENTID = 1'b 0;   
   end

initial 
   begin : process_61
   DIB = {32{1'b 0}};   
   end

initial 
   begin : process_60
   DIA = {32{1'b 0}};   
   end

initial 
   begin : process_59
   WEB = 1'b 0;   
   end

initial 
   begin : process_58
   WEA = 1'b 0;   
   end

initial 
   begin : process_57
   STATE = 0;   
   end

initial 
   begin : process_56
   EVENT11 = 1'b 0;   
   end

initial 
   begin : process_55
   EVENT10 = 1'b 0;   
   end

initial 
   begin : process_54
   EVENT6 = 1'b 0;   
   end

initial 
   begin : process_53
   EVENT3C = 1'b 0;   
   end

initial 
   begin : process_52
   EVENT3B = 1'b 0;   
   end

initial 
   begin : process_51
   EVENT3A = 1'b 0;   
   end

initial 
   begin : process_50
   EVENT2D = 1'b 0;   
   end

initial 
   begin : process_49
   EVENT2C = 1'b 0;   
   end

initial 
   begin : process_48
   EVENT2B = 1'b 0;   
   end

initial 
   begin : process_47
   EVENT2A = 1'b 0;   
   end

initial 
   begin : process_46
   EVENT1 = 1'b 0;   
   end

initial 
   begin : process_45
   EVENT0 = 1'b 0;   
   end

initial 
   begin : process_44
   RX_VALID = 1'b 0;   
   end

initial 
   begin : process_43
   DHCP_HOST_NAME = {48{1'b 0}};   
   end

initial 
   begin : process_42
   DHCP_PARAMETERS_REQUEST = {24{1'b 0}};   
   end

initial 
   begin : process_41
   DHCP_SERVER_IP_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_40
   DHCP_REQUESTED_IP_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_39
   DHCP_CLIENT_ID_MATCH = 1'b 0;   
   end

initial 
   begin : process_38
   DHCP_CLIENT_ID_D = {56{1'b 0}};   
   end

initial 
   begin : process_37
   DHCP_CLIENT_ID = {56{1'b 0}};   
   end

initial 
   begin : process_36
   DHCP_MESSAGE_TYPE = {4{1'b 0}};   
   end

initial 
   begin : process_35
   DHCP_MESSAGE = {96{1'b 0}};   
   end

initial 
   begin : process_34
   DHCP_MESSAGE_LENGTH = {8{1'b 0}};   
   end

initial 
   begin : process_33
   DHCP_OPTION = {8{1'b 0}};   
   end

initial 
   begin : process_32
   DHCP_RX_EOF2_D = 1'b 0;   
   end

initial 
   begin : process_31
   DHCP_RX_EOF2 = 1'b 0;   
   end

initial 
   begin : process_30
   DHCP_READ_STATE = 0;   
   end

initial 
   begin : process_28
   DHCP_RX_DATA2_VALID = 1'b 0;   
   end

initial 
   begin : process_27
   DHCP_RX_DATA2_VALID_E = 1'b 0;   
   end

initial 
   begin : process_26
   BUF1_SIZE = {10{1'b 0}};   
   end

initial 
   begin : process_25
   DHCP_RX_BYTE_COUNT = {10{1'b 1}};   
   end

initial 
   begin : process_24
   MAGIC_COOKIE = {32{1'b 0}};   
   end

initial 
   begin : process_23
   GIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_22
   CIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_21
   FLAGS = {16{1'b 0}};   
   end

initial 
   begin : process_20
   XID4RESPONSE = {32{1'b 0}};   
   end

initial 
   begin : process_19
   XID = {32{1'b 0}};   
   end

initial 
   begin : process_18
   CLIENT_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_17
   DHCP_RX_WORD_VALID_D = 1'b 0;   
   end

initial 
   begin : process_16
   DHCP_RX_WORD_VALID = 1'b 0;   
   end

initial 
   begin : process_15
   DHCP_RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_14
   DHCP_RX_EOF = 1'b 0;   
   end

initial 
   begin : process_13
   DHCP_RX_SOF_D = 1'b 0;   
   end

initial 
   begin : process_12
   DHCP_RX_SOF = 1'b 0;   
   end

initial 
   begin : process_11
   DHCP_RX_DATA_VALID_D = {8{1'b 0}};   
   end

initial 
   begin : process_10
   DHCP_RX_DATA_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_9
   DHCP_RX_DATA_D_FLIPPED = {64{1'b 0}};   
   end

initial 
   begin : process_8
   DHCP_RX_DATA_D = {64{1'b 0}};   
   end

initial 
   begin : process_7
   DHCP_RX_DATA = {64{1'b 0}};   
   end

initial 
   begin : process_6
   DHCP_RX_WORD_COUNT = {7{1'b 0}};   
   end

initial 
   begin : process_5
   VALID_UDP_DEST_PORT = 1'b 0;   
   end

initial 
   begin : process_4
   CNTR10 = {4{1'b 0}};   
   end

initial 
   begin : process_3
   TIME_CNTR = {32{1'b 0}};   
   end

initial 
   begin : process_2
   TIMER = 0;   
   end


always @(posedge CLK)
   begin : TIME_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TIME_CNTR <= {{31{1'b 0}}, 1'b 1};   
         CNTR10 <= {4{1'b 0}};   
         end
      else if (TICK_100MS === 1'b 1 )
         begin
         if (CNTR10 === 9)
            begin

//  TIME_CNTR units = seconds
            CNTR10 <= {4{1'b 0}};   
            TIME_CNTR <= TIME_CNTR + 1;   
            end
         else
            begin
            CNTR10 <= CNTR10 + 1;   
            end
         end
      end
   end

// // UDP RX frame ---------------------------------------
//  DHCP is encapsulated within a UDP frame
//  verify UDP destination port is 67 (x0043)  67 is the DHCP server port

always @( * ) 
VALID_UDP_DEST_PORT = UDP_RX_DEST_PORT_NO === 16'h 0043 ? 1'b 1 : 1'b 0; 

always @( * ) 
DHCP_RX_DATA = UDP_RX_DATA; 

always @( * ) 
DHCP_RX_DATA_VALID = VALID_UDP_DEST_PORT === 1'b 1 ? UDP_RX_DATA_VALID : 8'h 00; 

always @( * ) 
DHCP_RX_SOF = UDP_RX_SOF & VALID_UDP_DEST_PORT; 

always @( * ) 
DHCP_RX_EOF = UDP_RX_EOF & VALID_UDP_DEST_PORT; 

always @( * ) 
DHCP_RX_WORD_VALID = ((UDP_RX_DATA_VALID !== 8'h 00) & (VALID_UDP_DEST_PORT === 1'b 1)) ? 1'b 1 : 1'b 0; 

//  keep track of the received DHCP rx pointer
//  Pointer DHCP_RX_WORD_COUNT aligned with DHCP_RX_DATA_VALID_D
//  DHCP message datagram can be up to 576 bytes, thus DHCP_RX_WORD_COUNT 7-bits

always @(posedge CLK)
   begin : DHCP_RX_BYTE_COUNT_GEN
   if (CLK === 1'b 1)
      begin
      DHCP_RX_DATA_D <= DHCP_RX_DATA;   
      DHCP_RX_DATA_VALID_D <= DHCP_RX_DATA_VALID;   
      DHCP_RX_WORD_VALID_D <= DHCP_RX_WORD_VALID;   
      DHCP_RX_SOF_D <= DHCP_RX_SOF;   
      DHCP_RX_EOF_D <= DHCP_RX_EOF;   
      if (SYNC_RESET === 1'b 1 | DHCP_RX_SOF === 1'b 1)
         begin
         DHCP_RX_WORD_COUNT <= {7{1'b 0}};   
         end
      else if (DHCP_RX_WORD_VALID_D === 1'b 1 )
         begin
         if (DHCP_RX_WORD_COUNT[6] === 1'b 0)
            begin

//  max 64. should not normally happen. 
            DHCP_RX_WORD_COUNT <= DHCP_RX_WORD_COUNT + 1;   
            end
         end
      end
   end

//  capture relevant fields (only while STATE = 6)

always @(posedge CLK)
   begin : GET_FIELDS_002
   if (CLK === 1'b 1)
      begin
      if (DHCP_RX_WORD_VALID_D === 1'b 1 & STATE === 6)
         begin

//  *062516
         if (DHCP_RX_SOF_D === 1'b 1)
            begin

//  transaction ID
            XID <= DHCP_RX_DATA_D[31:0];   
            end
         if (DHCP_RX_WORD_COUNT === 1)
            begin
            FLAGS <= DHCP_RX_DATA_D[47:32];   
            CIADDR <= DHCP_RX_DATA_D[31:0];   
            end
         if (DHCP_RX_WORD_COUNT === 3)
            begin
            GIADDR <= DHCP_RX_DATA_D[63:32];   

//  assumes a 6-byte Ethernet address (out of 16-byte field)
            CLIENT_MAC_ADDR[47:16] <= DHCP_RX_DATA_D[31:0];   
            end
         if (DHCP_RX_WORD_COUNT === 4)
            begin
            CLIENT_MAC_ADDR[15:0] <= DHCP_RX_DATA_D[63:48];   
            end
         if (DHCP_RX_WORD_COUNT === 29)
            begin
            MAGIC_COOKIE <= DHCP_RX_DATA_D[31:0];   
            end
         end
      end
   end

//  parse the variable-length DHCP fields, starting immediately after the magic cookie		
//  serialize word through a small (1KB) DPRAM
//  this eases the parsing of the option fields
//  DHCP message datagram can be up to 576 bytes
//  flip LSB/MSB
genvar i;
generate
    for (i = 0; i <= 7; i = i + 1) begin
		always @(DHCP_RX_DATA_D)
		    begin : PARSE_001
				DHCP_RX_DATA_D_FLIPPED[(7 - i) * 8 + 7:(7 - i) * 8] <= DHCP_RX_DATA_D[i * 8 + 7:i * 8];   
			end
    end
endgenerate

bram_dp2 #(
          .DATA_WIDTHA (8),
          .ADDR_WIDTHA (10),
          .DATA_WIDTHB (64),
          .ADDR_WIDTHB (7)
)
PARSE_002 (
		    .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(1'b 0),
          .ADDRA(DHCP_RX_BYTE_COUNT),
          .DIA('b0),
          .OEA(1'b 1),
          .DOA(DHCP_RX_DATA2),
          
//  byte-wide
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(DHCP_RX_WORD_VALID_D),
          .ADDRB(DHCP_RX_WORD_COUNT),
          .DIB(DHCP_RX_DATA_D_FLIPPED),
          .OEB(1'b 0),
          .DOB()
);

always @( DHCP_RX_WORD_COUNT or DHCP_RX_BYTE_COUNT ) 
BUF1_SIZE = {DHCP_RX_WORD_COUNT, 3'b 000} + ~DHCP_RX_BYTE_COUNT; 

always @(posedge CLK)
   begin : PARSE_003
   if (CLK === 1'b 1)
      begin
      DHCP_RX_DATA2_VALID <= DHCP_RX_DATA2_VALID_E;   
//  1CLK latency to read from BRAM
      if (SYNC_RESET === 1'b 1 | DHCP_RX_SOF === 1'b 1)
         begin
         DHCP_RX_BYTE_COUNT <= {10{1'b 1}};   
         DHCP_RX_DATA2_VALID_E <= 1'b 0;   
         end
      else if (BUF1_SIZE > 0 )
         begin
         DHCP_RX_BYTE_COUNT <= DHCP_RX_BYTE_COUNT + 1;   
         DHCP_RX_DATA2_VALID_E <= 1'b 1;   
         end
      else
         begin
         DHCP_RX_DATA2_VALID_E <= 1'b 0;   
         end
      end
   end

//  parse the variable-length DHCP fields, starting immediately after the magic cookie		

always @(posedge CLK)
   begin : PARSE_DHCP_FIELDS
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         DHCP_READ_STATE <= 0;   
         end
      else if (DHCP_RX_BYTE_COUNT === 240 )
         begin

//  magic cookie immediately preceeds the DHCP options
         DHCP_READ_STATE <= 1;   

//  clear previous option fields
         DHCP_MESSAGE_TYPE <= {4{1'b 0}};   
         DHCP_CLIENT_ID <= {56{1'b 0}};   
         DHCP_REQUESTED_IP_ADDR <= {32{1'b 0}};   
         DHCP_SERVER_IP_ADDR <= {32{1'b 0}};   
         DHCP_HOST_NAME <= {48{1'b 0}};   
         end
      else if (DHCP_RX_DATA2_VALID === 1'b 1 )
         begin
         if (DHCP_READ_STATE === 1)
            begin
            if (DHCP_RX_DATA2 === 8'h FF)
               begin

//  end of DHCP options
               DHCP_READ_STATE <= 0;   
               end
            else
               begin
               DHCP_READ_STATE <= 2;   
               DHCP_OPTION <= DHCP_RX_DATA2;   
               DHCP_MESSAGE <= {96{1'b 0}};   
//  clear message field before next option
               end
            end
         else if (DHCP_READ_STATE === 2 )
            begin
            DHCP_READ_STATE <= 3;   
            DHCP_MESSAGE_LENGTH <= DHCP_RX_DATA2;   
            end
         else if (DHCP_READ_STATE === 3 )
            begin
            if (DHCP_MESSAGE_LENGTH === 1)
               begin

//  reached end of DHCP message
               DHCP_READ_STATE <= 1;   

//  save in various fields
               if (DHCP_OPTION === 53)
                  begin

//  DHCP message type
                  DHCP_MESSAGE_TYPE <= DHCP_RX_DATA2[3:0];   
//  1-8
                  end
               if (DHCP_OPTION === 61)
                  begin

//  client identifier
                  DHCP_CLIENT_ID <= {DHCP_MESSAGE[47:0], DHCP_RX_DATA2};   
//  7 bytes
                  end
               if (DHCP_OPTION === 50)
                  begin

//  requested IP address
                  DHCP_REQUESTED_IP_ADDR <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 54)
                  begin

//  DHCP server identifier
                  DHCP_SERVER_IP_ADDR <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 55)
                  begin

//  DHCP parameters request list
                  DHCP_PARAMETERS_REQUEST <= {DHCP_MESSAGE[15:0], DHCP_RX_DATA2};   
//  3 bytes
                  end
               if (DHCP_OPTION === 12)
                  begin

//  host name
                  DHCP_HOST_NAME <= {DHCP_MESSAGE[39:0], DHCP_RX_DATA2};   
//  6 char max or hash if longer	
                  end
               end
            else
               begin
               DHCP_MESSAGE <= {DHCP_MESSAGE[87:0], DHCP_RX_DATA2};   
               DHCP_MESSAGE_LENGTH <= DHCP_MESSAGE_LENGTH - 1;   
               end
            end
         end
      end
   end

//  generate an EOF on the other side of the serialization buffer

always @( DHCP_RX_DATA2_VALID or DHCP_READ_STATE or DHCP_RX_DATA2 ) 
DHCP_RX_EOF2 = DHCP_RX_DATA2_VALID === 1'b 1 & DHCP_READ_STATE === 1 & 
      DHCP_RX_DATA2 === 8'h FF ? 1'b 1 : 
	1'b 0; 

//  check incoming message validity
//  ready at DHCP_RX_EOF1_D

always @(posedge CLK)
   begin : VALID_CHECK_001
   if (CLK === 1'b 1)
      begin
      DHCP_RX_EOF2_D <= DHCP_RX_EOF2;   
      if (UDP_RX_SOF === 1'b 1)
         begin
         RX_VALID <= 1'b 1;   
//  valid by default, until proven otherwise
         end
      else if (UDP_RX_EOF === 1'b 1 & UDP_RX_FRAME_VALID === 1'b 0 )
         begin

//  invalid UDP message
         RX_VALID <= 1'b 0;   
         end
      else if (DHCP_RX_EOF2 === 1'b 1 & MAGIC_COOKIE !== 32'h 63825363 )
         begin
         RX_VALID <= 1'b 0;   
         end
      end
   end

// //-- EVENTS ---------------------------------------------------
//  0 = start of new rx message addressed to port 67 (x0043)

always @( * ) 
EVENT0 = UDP_RX_DEST_PORT_NO === 67 ? DHCP_RX_SOF : 1'b 0; 

//  10 = end of invalid rx message (before parallel to serial buffer)

always @( * ) 
EVENT10 = ((UDP_RX_FRAME_VALID === 1'b 0) | (UDP_RX_DEST_PORT_NO !== 67)) ? DHCP_RX_EOF : 1'b 0; 

//  11 = end of invalid rx message (after parallel to serial buffer)

always @( * ) 
EVENT11 = RX_VALID === 1'b 0 ? DHCP_RX_EOF2_D : 1'b 0; 

//  1 = DHCP Discover message (DHCPDISCOVER).

always @( * ) 
EVENT1 = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 1)) ? 1'b 1 : 1'b 0; 

//  3 = DHCP Request message (DHCPREQUEST) addressed to the right DHCP server

always @( * ) 
EVENT3A = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 3) & (DHCP_SERVER_IP_ADDR === IPv4_ADDR)) ? 1'b 1 : 1'b 0; 

//  3 = DHCP Request message (DHCPREQUEST) for renewing 

always @( * ) 
EVENT3B = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 3) & (DHCP_SERVER_IP_ADDR === 0) & (DHCP_REQUESTED_IP_ADDR === 0) & ((CIADDR & SUBNET_MASK) === (IPv4_ADDR & SUBNET_MASK))) ? 1'b 1 : 1'b 0; 

//  client IP addr on the correct network
//  3 = DHCP Request message (DHCPREQUEST) for init-reboot 

always @( * ) 
EVENT3C = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 3) & (DHCP_SERVER_IP_ADDR === 0) & (DHCP_REQUESTED_IP_ADDR !== 0) & (CIADDR === 0)) ? 1'b 1 : 1'b 0; 

// -- 4 = DHCP Request message (DHCPDECLINE).
// EVENT4 <= '1' when (DHCP_RX_EOF2_D = '1') and (RX_VALID = '1') and (DHCP_MESSAGE_TYPE = 4) else '0';
// 
//  6 = end of message (whether valid or processed or not)

always @( * ) 
EVENT6 = DHCP_RX_EOF2_D === 1'b 1 ? 1'b 1 : 1'b 0; 

// -- 7 = DHCP Request message (DHCPRELEASE).
// EVENT7 <= '1' when (DHCP_RX_EOF2_D = '1') and (RX_VALID = '1') and (DHCP_MESSAGE_TYPE = 7) else '0';
// 
// -- 8 = DHCP Request message (DHCPINFORM).
// EVENT8 <= '1' when (DHCP_RX_EOF2_D = '1') and (RX_VALID = '1') and (DHCP_MESSAGE_TYPE = 8) else '0';
// 
//  search by client ID complete, found match

always @( * ) 
EVENT2A = SEARCH_COMPLETE_D2 & FOUND_CLIENT_ID; 

//  search by client ID complete, found no entry 

always @( * ) 
EVENT2B = SEARCH_COMPLETE_D2 & ~FOUND_CLIENT_ID; 

//  search by client ID complete, found no entry and oldest entry has expired (free to re-assign)

always @( * ) 
EVENT2C = SEARCH_COMPLETE_D2 & ~FOUND_CLIENT_ID & EXPIRED_OLDEST_ENTRY; 

//  search by client ID complete, found match, IP request matches table entry

always @( * ) 
EVENT2D = SEARCH_COMPLETE_D2 & FOUND_CLIENT_ID & IP_MATCH; 

// //-- STATE MACHINE ---------------------------------------------------
//  new replace too large ifthenelse with case for better timing

always @(posedge CLK)
   begin : STATE_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         STATE <= 0;   
//  idle
         TRIGGER_SEARCH_BY_CLIENTID <= 1'b 0;   
         end
      else if (EVENT10 === 1'b 1 | EVENT11 === 1'b 1 )
         begin

//  invalid rx UDP frame
         STATE <= 0;   
//  idle
         end
      else
         begin
         case (STATE)
         0:
            begin
            if (EVENT0 === 1'b 1)
               begin

//  new incoming message. start parsing fields
               STATE <= 6;   
               end
            end
         6:
            begin

// ------- DHCPDISCOVER --------------------------------	
            if (EVENT1 === 1'b 1)
               begin

//  received valid DHCPDISCOVER, start table search
               STATE <= 1;   
               N_DHCPDISCOVER <= N_DHCPDISCOVER + 1;   

//  freeze key fields (XID, client ID) for response
               XID4RESPONSE <= XID;   
               DHCP_CLIENT_ID_D <= DHCP_CLIENT_ID;   
               TRIGGER_SEARCH_BY_CLIENTID <= 1'b 1;   

// ------- DHCPREQUEST (SELECTING STATE) --------------------------------	
               end
            else if (EVENT3A === 1'b 1 )
               begin

//  received DHCP Request message (DHCPREQUEST) addressed to the right DHCP server
               STATE <= 8;   
               N_DHCPREQUEST1 <= N_DHCPREQUEST1 + 1;   

//  save XID for response
               XID4RESPONSE <= XID;   
               DHCP_CLIENT_ID_D <= DHCP_CLIENT_ID;   
               TRIGGER_SEARCH_BY_CLIENTID <= 1'b 1;   

// ------- DHCPREQUEST (RENEWING STATE) --------------------------------	
               end
            else if (EVENT3B === 1'b 1 )
               begin

//  received DHCP Request message (DHCPREQUEST) for renewing 
               STATE <= 16;   
               N_DHCPREQUEST2 <= N_DHCPREQUEST1 + 2;   

//  save XID for response
               XID4RESPONSE <= XID;   
               DHCP_CLIENT_ID_D <= DHCP_CLIENT_ID;   

// ------- DHCPREQUEST (INIT REBOOT STATE) --------------------------------	
               end
            else if (EVENT3C === 1'b 1 )
               begin
               if (DHCP_REQUESTED_IP_ADDR & SUBNET_MASK === IPv4_ADDR & SUBNET_MASK)
                  begin

//  correct network. next verify table
                  STATE <= 24;   
                  N_DHCPREQUEST3 <= N_DHCPREQUEST3 + 1;   

//  save XID for response
                  XID4RESPONSE <= XID;   
                  DHCP_CLIENT_ID_D <= DHCP_CLIENT_ID;   

//  incorrect network. send DHCPNAK 
                  end
               else
                  begin
                  STATE <= 26;   
                  end
               end
            else if (EVENT6 === 1'b 1 )
               begin

//  end of message, none of the above. Back to idle
               STATE <= 0;   
               end
            end
         1:
            begin
            TRIGGER_SEARCH_BY_CLIENTID <= 1'b 0;   
            if (EVENT2A === 1'b 1)
               begin

//  search by client ID complete, found match
//  send DHCPOFFER
               PROPOSED_IP_ADDR[7:0] <= FOUND_IP_PLUSMIN;   
               STATE <= 3;   
               end
            else if (EVENT2C === 1'b 1 )
               begin

//  search by client ID complete, found no entry and oldest entry has expired (free to re-assign)
               STATE <= 2;   
               end
            end
         2:
            begin

//  done creating new entry with client ID from DHCPDISCOVER
//  send DHCPOFFER
            PROPOSED_IP_ADDR[7:0] <= FOUND_OLDEST_IP + IP_MIN;   
            STATE <= 3;   
            end
         3:
            begin
            if (UDP_TX_ACK_local === 1'b 1)
               begin

//  composed UDP reply. UDP confirmed. awaiting MAC confirmation.
               STATE <= 4;   
               end
            else if (UDP_TX_NAK_local === 1'b 1 )
               begin

//  composed UDP reply. NAK from UDP_TX (abnormal). Abort.
               STATE <= 0;   
               end
            end
         4:
            begin
            if (MAC_TX_EOF_local === 1'b 1)
               begin

//  MAC transmission completion confirmed
               STATE <= 0;   
               end
            end
         8:
            begin
            TRIGGER_SEARCH_BY_CLIENTID <= 1'b 0;   
            if (EVENT2D === 1'b 1)
               begin

//  search by client ID complete, matching IP request/table index
//  write new expiration
               STATE <= 9;   
               end
            else if (EVENT2B === 1'b 1 )
               begin

//  no match
//  TODO
               STATE <= 0;   
               end
            end
         9:
            begin

//  send DHCPACK
            PROPOSED_IP_ADDR[7:0] <= FOUND_IP_PLUSMIN;   
            STATE <= 10;   
            end
         10:
            begin
            if (UDP_TX_ACK_local === 1'b 1)
               begin

//  composed UDP reply. UDP confirmed. awaiting MAC confirmation.
               STATE <= 11;   
               end
            else if (UDP_TX_NAK_local === 1'b 1 )
               begin

//  composed UDP reply. NAK from UDP_TX (abnormal). Abort.
               STATE <= 0;   
               end
            end
         11:
            begin
            if (MAC_TX_EOF_local === 1'b 1)
               begin

//  MAC transmission completion confirmed
               STATE <= 0;   
               N_DHCPACK <= N_DHCPACK + 1;   
               end
            end
         16:
            begin

//  waiting 1 CLK to read/verify the client ID from the table
            STATE <= 17;   
            end
         17:
            begin

//  wait one more CLK to do a large comparison (timing0
            STATE <= 18;   
            end
         18:
            begin
            if (DHCP_CLIENT_ID_MATCH === 1'b 1)
               begin

//  client ID matches information in table
//  write new expiration date, send DHCPACK
               STATE <= 9;   

//  abnormal case. IP address to renew is not associated with the correct client ID in the table
               end
            else
               begin
               STATE <= 0;   
               end
            end
         24:
            begin

//  correct network. 
//  waiting 1 CLK to read/verify the client ID from the table
            STATE <= 25;   
            end
         25:
            begin
            if (DOA === 0)
               begin

//  DHCP server has no record of this client. 
//  server MUST remain silent
               STATE <= 0;   
               end
            else if (DOA[23:0] === DHCP_CLIENT_ID_D[55:32] & DOB === DHCP_CLIENT_ID_D[31:0] )
               begin

//  client ID matches information in table
//  write new expiration date, send DHCPACK
               STATE <= 9;   

//  abnormal case. Requested IP address is not associated with the correct client ID in the table
//  send DHCPNAK
               end
            else
               begin
               STATE <= 26;   
               end
            end
         26:
            begin
            if (UDP_TX_ACK_local === 1'b 1)
               begin

//  composed UDP reply. UDP confirmed. awaiting MAC confirmation.
               STATE <= 27;   
               end
            else if (UDP_TX_NAK_local === 1'b 1 )
               begin

//  composed UDP reply. NAK from UDP_TX (abnormal). Abort.
               STATE <= 0;   
               end
            end
         27:
            begin
            if (MAC_TX_EOF_local === 1'b 1)
               begin

//  MAC transmission completion confirmed
               STATE <= 0;   
               end
            end
         default:
            ;
         endcase
         end
      end
   end

assign PROPOSED_IP_ADDR_wire[31:8] = IPv4_ADDR[31:8]; 

//  Proposed IP address is always on the same subnet as this server (i.e. same 3 MSBs as this server IPv4_ADDR)
// //-- TABLE ---------------------------------------------------
//  Each entry comprises 4 * 36-bit locations. 128 entries max.
//  location0: 8-bit spare + 24-bit client identifier (47:32) + 4-bit spare (parity)
//  location1: 32-bit client identifier (31:0) + 4-bit spare (parity)
//  location2: 32-bit TIME (31:0) + 4-bit spare (parity)
//  location3: spare
//  One table entry per bindable IP address.
//  IP address binding is implied by the address.
//  the actual address is in the form IPv4_ADDR for the 3 MSB, and a subnet address between IP_MIN (inclusive)
//  and IP_MIN + NIPs -1 (inclusive)
//  For example, if IPv4_ADDR = 172.16.1.3, IP_MIN = 10, NIPs = 10, this DHCP server will assign and keep track of 
//  IP addresses in the range 172.16.1.10 and 172.16.1.19 (inclusive).

always @(PROPOSED_IP_ADDR_wire[31:8])
   begin : process_1
   PROPOSED_IP_ADDR[31:8] <= PROPOSED_IP_ADDR_wire[31:8];   
   end


bram_dp2 #(
           .DATA_WIDTHA (32),
           .ADDR_WIDTHA (9),
           .DATA_WIDTHB (32),
           .ADDR_WIDTHB (9)
)RAMB1_1 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[8:0]),
          .DIA(DIA),
          .OEA(1'b 1),
          .DOA(DOA),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[8:0]),
          .DIB(DIB),
          .OEB(1'b 1),
          .DOB(DOB));

always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_001a
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         SEARCH_STATE <= 0;   
         end
      else if (SEARCH_STATE === 0 )
         begin
         if (TRIGGER_SEARCH_BY_CLIENTID === 1'b 1)
            begin
            SEARCH_STATE <= 1;   
            end
         else if (STATE === 2 )
            begin

//  (over)write oldest expired entry with this new DHCPDISCOVER client ID
            SEARCH_STATE <= 2;   
            WEA <= 1'b 1;   
            WEB <= 1'b 1;   
            end
         else if (STATE === 9 )
            begin

//  write new expiration 
            SEARCH_STATE <= 3;   
            WEA <= 1'b 1;   
            WEB <= 1'b 0;   
            end
         end
      else if (SEARCH_STATE === 1 )
         begin
         if (ADDRA_PLUS[9] === 1'b 1)
            begin

//  scan complete
            SEARCH_STATE <= 0;   
            end
         end
      else if (SEARCH_STATE === 2 )
         begin

//  done creating new entry in table with client ID from DHCPDISCOVER
         SEARCH_STATE <= 0;   
         WEA <= 1'b 0;   
         WEB <= 1'b 0;   
         end
      else if (SEARCH_STATE === 3 )
         begin

//  done updating entry in table with fresh expiration
         SEARCH_STATE <= 0;   
         WEA <= 1'b 0;   
         end
      end
   end


// //-- SEARCH STATE MACHINE ---------------------------------------
//  search the table based on a client ID
//  new simplified process for timing 4/5/14 az

always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_001b
   if (CLK === 1'b 1)
      begin
      if (SEARCH_STATE === 0 & TRIGGER_SEARCH_BY_CLIENTID === 1'b 0)
         begin
         if (STATE === 2)
            begin

//  (over)write oldest expired entry with this new DHCPDISCOVER client ID
            DIA[23:0] <= DHCP_CLIENT_ID_D[55:32];   
            DIB <= DHCP_CLIENT_ID_D[31:0];   
            end
         else if (STATE === 9 )
            begin

//  write new expiration 
            DIA <= TIME_CNTR + LEASE_TIME;   
            end
         end
      end
   end

//  new simplified process for timing 4/5/14 az

always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_001c
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         SEARCH_COMPLETE <= 1'b 0;   
         end
      else if (SEARCH_STATE === 1 & ADDRA_PLUS[9] === 1'b 1 )
         begin

//  scan complete
         SEARCH_COMPLETE <= 1'b 1;   
//  aligned with last search in SEARCH_STATE_D/ADDRA_D
         end
      else
         begin
         SEARCH_COMPLETE <= 1'b 0;   
         end
      end
   end


always @( ADDRA ) 
ADDRA_PLUS = ADDRA + 2; 

always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_001d
   if (CLK === 1'b 1)
      begin
      if (SEARCH_STATE === 0)
         begin
         if (TRIGGER_SEARCH_BY_CLIENTID === 1'b 1)
            begin
            ADDRA <= {10{1'b 0}};   
            ADDRB <= {{9{1'b 0}}, 1'b 1};   
            end
         else if (STATE === 2 )
            begin

//  (over)write oldest expired entry with this new DHCPDISCOVER client ID
            ADDRA <= {FOUND_OLDEST_IP, 2'b 00};   
            ADDRB <= {FOUND_OLDEST_IP, 2'b 01};   
            end
         else if (STATE === 9 )
            begin

//  write new expiration 
            ADDRA <= {FOUND_IP, 2'b 10};   
            end
         else if (STATE === 16 )
            begin

//  read client ID from the table (to verify)
            ADDRA <= {(CIADDR[7:0] - IP_MIN), 2'b 00};   
            ADDRB <= {(CIADDR[7:0] - IP_MIN), 2'b 01};   
            end
         else if (STATE === 24 )
            begin

//  read client ID from the table (to verify)
            ADDRA <= {(DHCP_REQUESTED_IP_ADDR[7:0] - IP_MIN), 2'b 00};   
            ADDRB <= {(DHCP_REQUESTED_IP_ADDR[7:0] - IP_MIN), 2'b 01};   
            end
         end
      else if (SEARCH_STATE === 1 & ADDRA_PLUS[9] === 1'b 0 )
         begin

//  scan all 128 positions
         ADDRA <= ADDRA_PLUS;   
         ADDRB <= ADDRB + 2;   
         end
      end
   end

//  important for better timing. Aligned with ADDRA_D2

always @(posedge CLK)
   begin : DHCP_CLIENT_ID_MATCH_GEN
   if (CLK === 1'b 1)
      begin
      ADDRA_D2 <= ADDRA_D;   
      if (DOA[23:0] === DHCP_CLIENT_ID_D[55:32] & DOB === DHCP_CLIENT_ID_D[31:0])
         begin
         DHCP_CLIENT_ID_MATCH <= 1'b 1;   
         end
      else
         begin
         DHCP_CLIENT_ID_MATCH <= 1'b 0;   
         end
      end
   end


always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_002
   if (CLK === 1'b 1)
      begin
      ADDRA_D <= ADDRA;   
//  1 CLK delay between ADDRA and DOA
      SEARCH_STATE_D <= SEARCH_STATE;   
      SEARCH_COMPLETE_D <= SEARCH_COMPLETE;   
      FOUND_CLIENT_ID_D <= FOUND_CLIENT_ID;   
      if (SYNC_RESET === 1'b 1 | SEARCH_STATE_D2 === 0)
         begin
         FOUND_CLIENT_ID <= 1'b 0;   
         end
      else if (SEARCH_STATE_D2 === 1 & DHCP_CLIENT_ID_MATCH === 1'b 1 )
         begin

//  found matching client ID. Aligned with ADDRA_D3
         FOUND_CLIENT_ID <= 1'b 1;   
         FOUND_IP <= ADDRA_D2[9:2];   
//  to make up the real IP address, add IP_MIN and subnet address
         end
      else if (SEARCH_STATE === 0 & STATE === 16 )
         begin

//  DHCPREQUEST generated during RENEWING state. save pointer, we'll need it later to write the expiration date
         FOUND_IP <= CIADDR[7:0] - IP_MIN;   
         end
      end
   end


always @( FOUND_IP or IP_MIN ) 
FOUND_IP_PLUSMIN = FOUND_IP + IP_MIN; 

//  found IP address in table = DHCP requested IP address

always @( FOUND_IP_PLUSMIN or DHCP_REQUESTED_IP_ADDR or IP_MATCH_MSB ) 
IP_MATCH = ((FOUND_IP_PLUSMIN === DHCP_REQUESTED_IP_ADDR[7:0]) & (IP_MATCH_MSB === 1'b 1)) ? 1'b 1 : 1'b 0; 

//  pipelining for better timing of the above statement

always @(posedge CLK)
   begin : IP_MATCH_MSB_GEN
   if (CLK === 1'b 1)
      begin
      if (DHCP_REQUESTED_IP_ADDR[31:8] === IPv4_ADDR[31:8])
         begin
         IP_MATCH_MSB <= 1'b 1;   
         end
      else
         begin
         IP_MATCH_MSB <= 1'b 0;   
         end
      end
   end

//  find the oldest expired entry

always @(posedge CLK)
   begin : SEARCH_STATE_MACHINE_003
   if (CLK === 1'b 1)
      begin
      SEARCH_STATE_D2 <= SEARCH_STATE_D;   
      if (SEARCH_STATE_D === 1 & ADDRA_D[9:2] === 0)
         begin

//  *062516
//  first result in the search is the 'oldest' until older ones are found subsequently
         FOUND_OLDEST_EXPIRATION_TIME <= DOA;   
         FOUND_OLDEST_IP <= ADDRA_D[9:2];   
//  to make up the real IP address, add IP_MIN and subnet address
         end
      else if (SEARCH_STATE_D === 1 & ADDRA_D[1] === 1'b 1 & 
      FOUND_OLDEST_EXPIRATION_TIME[31:30] === 2'b 00 & DOA[31:30] === 2'b 11 )
         begin

//  found new oldest
         FOUND_OLDEST_EXPIRATION_TIME <= DOA;   
         FOUND_OLDEST_IP <= ADDRA_D[9:2];   
//  to make up the real IP address, add IP_MIN and subnet address
         end
      else if (SEARCH_STATE_D === 1 & ADDRA_D[1] === 1'b 1 & 
      DOA < FOUND_OLDEST_EXPIRATION_TIME )
         begin
         FOUND_OLDEST_EXPIRATION_TIME <= DOA;   
         FOUND_OLDEST_IP <= ADDRA_D[9:2];   
//  to make up the real IP address, add IP_MIN and subnet address
         end
      end
   end

//  is oldest entry expired?

always @(posedge CLK)
   begin : EXPIRATION_CHECK_001
   if (CLK === 1'b 1)
      begin
      SEARCH_COMPLETE_D2 <= SEARCH_COMPLETE_D;   
      if (SYNC_RESET === 1'b 1 | SEARCH_STATE_D2 === 0)
         begin
         EXPIRED_OLDEST_ENTRY <= 1'b 0;   
         end
      else if (FOUND_OLDEST_EXPIRATION_TIME[31:30] === 2'b 11 & TIME_CNTR[31:30] === 2'b 00 )
         begin

//  expired entry
         EXPIRED_OLDEST_ENTRY <= 1'b 1;   
         end
      else if (FOUND_OLDEST_EXPIRATION_TIME < TIME_CNTR )
         begin

//  expired entry
         EXPIRED_OLDEST_ENTRY <= 1'b 1;   
         end
      end
   end

// //-- COMPOSE REPLY TO DHCP CLIENT --------------------------
//  WPTR is a word counter for the UDP tx payload

always @(posedge CLK)
   begin : WPTR_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         WPTR <= {7{1'b 0}};   
         end
      else if (STATE === 3 | STATE === 10 | 
      STATE === 26 )
         begin

//  DHCPOFFER message
//  DHCPACK message
//  DHCPNAK message
         if (UDP_TX_CTS === 1'b 1)
            begin
            WPTR <= WPTR + 1;   
            end
         end
      else
         begin
         WPTR <= {7{1'b 0}};   
         end
      end
   end


always @(posedge CLK)
   begin : COMPOSE_TX
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         UDP_TX_DATA_VALID <= 8'h 00;   
         UDP_TX_SOF <= 1'b 0;   
         UDP_TX_EOF <= 1'b 0;   
         end
      else if (STATE === 3 & UDP_TX_CTS === 1'b 1 )
         begin

//  DHCPDISCOVER message
//  UDP destination IP address, broadcast 
         DEST_IPv4_ADDR <= 32'h FFFFFFFF;   
         DEST_MAC_ADDR <= CLIENT_MAC_ADDR;   
         if (WPTR < 34)
            begin
            UDP_TX_DATA_VALID <= 8'h FF;   
            end
         else if (WPTR === 34 )
            begin
            UDP_TX_DATA_VALID <= 8'h C0;   
            end
         else
            begin
            UDP_TX_DATA_VALID <= 8'h 00;   
            end
         case (WPTR)
         7'b 0000000:
            begin
            UDP_TX_DATA <= {32'h 02010600, XID4RESPONSE};   

//  op: BOOTREPLY
//  hardware type: Ethernet
//  hardware address length
//  00
//  XID4RESPONSE
            UDP_TX_SOF <= 1'b 1;   
            end
         7'b 0000001:
            begin
            UDP_TX_DATA <= {64{1'b 0}};   

//  0000
//  unicast flag
//  reserved flags
//  00000000
            UDP_TX_SOF <= 1'b 0;   
            end
         7'b 0000010:
            begin
            UDP_TX_DATA <= {PROPOSED_IP_ADDR, 32'h 00000000};   

//  proposed IP address
            end
         7'b 0000011:
            begin
            UDP_TX_DATA <= {GIADDR, CLIENT_MAC_ADDR[47:16]};   

//  GIADDR
//  client MAC address
            end
         7'b 0000100:
            begin
            UDP_TX_DATA <= {CLIENT_MAC_ADDR[15:0], 48'h 000000000000};   

//  client MAC address
            end
         7'b 0011101:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAGIC_COOKIE;   
            end
         7'b 0011110:
            begin
            UDP_TX_DATA <= {40'h 3501023604, IPv4_ADDR[31:8]};   

//  option DHCP message type (53)
//  length
//  DHCPOFFER
//  option DHCP server identifier (54)
//  length
//  server IP address
            end
         7'b 0011111:
            begin
            UDP_TX_DATA <= {IPv4_ADDR[7:0], 16'h 3304, LEASE_TIME[31:0], 8'h 01};   

//  server IP address
//  option lease time (51)
//  length
//  lease time
//  option subnet mask (01)
            end
         7'b 0100000:
            begin
            UDP_TX_DATA <= {8'h 04, SUBNET_MASK, 16'h 0304, ROUTER[31:24]};   

//  length
//  SUBNET_MASK
//  option router (03)
//  length
//  ROUTER
            end
         7'b 0100001:
            begin
            UDP_TX_DATA <= {ROUTER[23:0], 16'h 0604, DNS[31:8]};   

//  ROUTER
//  option DNS (06)
//  length
//  DNS
            end
         7'b 0100010:
            begin
            UDP_TX_DATA <= {DNS[7:0], 56'h FF000000000000};   

//  DNS
//  option end (255)
            UDP_TX_EOF <= 1'b 1;   
            end
         default:
            begin
            UDP_TX_DATA <= {64{1'b 0}};   
            UDP_TX_SOF <= 1'b 0;   
            UDP_TX_EOF <= 1'b 0;   
            end
         endcase
         end
      else if (STATE === 10 )
         begin

//  DHCACK message
         DEST_IPv4_ADDR <= PROPOSED_IP_ADDR;   
         DEST_MAC_ADDR <= CLIENT_MAC_ADDR;   

//  UDP destination IP address 
         if (WPTR < 34)
            begin
            UDP_TX_DATA_VALID <= 8'h FF;   
            end
         else if (WPTR === 34 )
            begin
            UDP_TX_DATA_VALID <= 8'h C0;   
            end
         else
            begin
            UDP_TX_DATA_VALID <= 8'h 00;   
            end
         case (WPTR)
         7'b 0000000:
            begin
            UDP_TX_DATA <= {32'h 02010600, XID4RESPONSE};   

//  op: BOOTREPLY
//  hardware type: Ethernet
//  hardware address length
//  00
//  XID4RESPONSE
            UDP_TX_SOF <= 1'b 1;   
            end
         7'b 0000001:
            begin
            UDP_TX_DATA <= {64{1'b 0}};   

//  0000
//  unicast flag
//  reserved flags
//  00000000
            UDP_TX_SOF <= 1'b 0;   
            end
         7'b 0000010:
            begin
            UDP_TX_DATA <= {PROPOSED_IP_ADDR, 32'h 00000000};   

//  proposed IP address
            end
         7'b 0000011:
            begin
            UDP_TX_DATA <= {GIADDR, CLIENT_MAC_ADDR[47:16]};   

//  GIADDR
//  client MAC address
            end
         7'b 0000100:
            begin
            UDP_TX_DATA <= {CLIENT_MAC_ADDR[15:0], 48'h 000000000000};   

//  client MAC address
            end
         7'b 0011101:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAGIC_COOKIE;   
            end
         7'b 0011110:
            begin
            UDP_TX_DATA <= {40'h 3501053604, IPv4_ADDR[31:8]};   

//  option DHCP message type (53)
//  length
//  DHCPACK
//  option DHCP server identifier (54)
//  length
//  server IP address
            end
         7'b 0011111:
            begin
            UDP_TX_DATA <= {IPv4_ADDR[7:0], 16'h 3304, LEASE_TIME[31:0], 8'h 01};   

//  server IP address
//  option lease time (51)
//  length
//  lease time
//  option subnet mask (01)
            end
         7'b 0100000:
            begin
            UDP_TX_DATA <= {8'h 04, SUBNET_MASK, 16'h 0304, ROUTER[31:24]};   

//  length
//  SUBNET_MASK
//  option router (03)
//  length
//  ROUTER
            end
         7'b 0100001:
            begin
            UDP_TX_DATA <= {ROUTER[23:0], 16'h 0604, DNS[31:8]};   

//  ROUTER
//  option DNS (06)
//  length
//  DNS
            end
         7'b 0100010:
            begin
            UDP_TX_DATA <= {DNS[7:0], 56'h FF000000000000};   

//  DNS
//  option end (255)
            UDP_TX_EOF <= 1'b 1;   
            end
         default:
            begin
            UDP_TX_DATA <= {64{1'b 0}};   
            UDP_TX_SOF <= 1'b 0;   
            UDP_TX_EOF <= 1'b 0;   
            end
         endcase
         end
      else if (STATE === 26 )
         begin

//  DHCNAK message
         DEST_IPv4_ADDR <= PROPOSED_IP_ADDR;   

//  UDP destination IP address 
         if (GIADDR === 0)
            begin

//  client on same subnet as server. Broadcast DHCPNAK
            DEST_MAC_ADDR <= 48'h FFFFFFFFFFFF;   
            end
         else
            begin
            DEST_MAC_ADDR <= CLIENT_MAC_ADDR;   
            end
         if (WPTR < 31)
            begin
            UDP_TX_DATA_VALID <= 8'h FF;   
            end
         else if (WPTR === 31 )
            begin
            UDP_TX_DATA_VALID <= 8'h C0;   
            end
         else
            begin
            UDP_TX_DATA_VALID <= 8'h 00;   
            end
         case (WPTR)
         7'b 0000000:
            begin
            UDP_TX_DATA <= {32'h 02010600, XID4RESPONSE};   

//  op: BOOTREPLY
//  hardware type: Ethernet
//  hardware address length
//  00
//  XID4RESPONSE
            UDP_TX_SOF <= 1'b 1;   
            end
         7'b 0000001:
            begin
            UDP_TX_DATA[63:48] <= {16{1'b 0}};   
            if (GIADDR !== 0)
               begin

//  client on a different subnet. set broadcast flag
               UDP_TX_DATA[47:40] <= 8'h 80;   
//  broadcast flag
               end
            else
               begin
               UDP_TX_DATA[47:40] <= 8'h 00;   
//  unicast flag
               end
            UDP_TX_DATA[39:0] <= {40{1'b 0}};   

//  0000
//  unicast/broadcast flag
//  reserved flags
//  00000000
            UDP_TX_SOF <= 1'b 0;   
            end
         7'b 0000010:
            begin
            UDP_TX_DATA <= {PROPOSED_IP_ADDR, 32'h 00000000};   

//  proposed IP address
            end
         7'b 0000011:
            begin
            UDP_TX_DATA <= {GIADDR, CLIENT_MAC_ADDR[47:16]};   

//  GIADDR
//  client MAC address
            end
         7'b 0000100:
            begin
            UDP_TX_DATA <= {CLIENT_MAC_ADDR[15:0], 48'h 000000000000};   

//  client MAC address
            end
         7'b 0011101:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAGIC_COOKIE;   
            end
         7'b 0011110:
            begin
            UDP_TX_DATA <= {40'h 3501063604, IPv4_ADDR[31:8]};   

//  option DHCP message type (53)
//  length
//  DHCPNAK
//  option DHCP server identifier (54)
//  length
//  server IP address
            end
         7'b 0011111:
            begin
            UDP_TX_DATA <= {IPv4_ADDR[7:0], 56'h FF000000000000};   

//  server IP address
//  option end (255)
            end
         default:
            begin
            UDP_TX_DATA <= {64{1'b 0}};   
            UDP_TX_SOF <= 1'b 0;   
            UDP_TX_EOF <= 1'b 0;   
            end
         endcase
         end
      else
         begin
         UDP_TX_DATA_VALID <= 8'h 00;   
         UDP_TX_SOF <= 1'b 0;   
         UDP_TX_EOF <= 1'b 0;   
         end
      end
   end


always @( DEST_IPv4_ADDR ) 
DEST_IPv4_ADDRx = {96'h 000000000000000000000000, DEST_IPv4_ADDR}; 
defparam
      UDP_TX_001.ADDR_WIDTH = 7,
      
//  elastic buffer size as 72b * 2^ADDR_WIDTH
UDP_TX_001.UDP_CKSUM_ENABLED = 1'b 1,
      UDP_TX_001.IPv6_ENABLED = 1'b 0;
UDP_TX_10G UDP_TX_001 (.CLK(CLK),
          .SYNC_RESET(SYNC_RESET),
          .TICK_4US(TICK_4US),
          
//  Application interface
          .APP_DATA(UDP_TX_DATA),
          .APP_DATA_VALID(UDP_TX_DATA_VALID),
          .APP_SOF(UDP_TX_SOF),
          .APP_EOF(UDP_TX_EOF),
          .APP_CTS(UDP_TX_CTS),
          .ACK(UDP_TX_ACK_local),
          .NAK(UDP_TX_NAK_local),
          .DEST_IP_ADDR(DEST_IPv4_ADDRx),
          .IPv4_6n(1'b 1),
          .DEST_PORT_NO(16'h 0044),
          
//  DHCP client port (68)
          .SOURCE_PORT_NO(16'h 0043),
          
//  DHCP server port (67)
//  Configuration
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR),
          .IPv6_ADDR({128{1'b 0}}),
          .IP_ID(IP_ID_IN),
          
//  Routing
          .RT_IP_ADDR(),
          .RT_IPv4_6n(),
          .RT_REQ_RTS(),
          .RT_REQ_CTS(1'b 1),
          .RT_MAC_REPLY(DEST_MAC_ADDR),
          .RT_MAC_RDY(1'b 1),
          .RT_NAK(1'b 0),
          
//  MAC interface
          .MAC_TX_DATA(MAC_TX_DATA),
          .MAC_TX_DATA_VALID(MAC_TX_DATA_VALID),
          .MAC_TX_EOF(MAC_TX_EOF_local),
          .MAC_TX_CTS(MAC_TX_CTS),
          .RTS(RTS),
          .TP());
assign MAC_TX_EOF = MAC_TX_EOF_local; 

// -- DHCP message check
// -- source IP is 0.0.0.0.
// --		RX_SOURCE_IP_ADDR: in std_logic_vector(31 downto 0); 
// -- DHCP source port is 68
// -- Destination IP is 255.x.x.x
// 
// --// CHECK DHCP VALIDITY -----------------------------
// -- validate DHCL rx frame
// -- (a) received frame is a valid UDP frame
// -- (b) source IP address is 0.0.0.0.
// -- (c) received port is 67
// -- (d) source port is 68
// 
// 
// 
// --// TEST POINTS -----------------------------
// --TP(1) <= DHCP_RX_DATA_VALID;
// --TP(2) <= EVENT1;
// --TP(3) <= EVENT2A;
// --TP(4) <= EVENT2B;
// --TP(5) <= EVENT2C;
// --TP(6) <= EVENT2D;
// --TP(7) <= UDP_TX_CTS; 
// --TP(8) <= '1' when (STATE = 3) and (UDP_TX_CTS = '1')  else '0';
// --TP(9) <= MAC_TX_EOF_local;
// 
// N_DHCPDISCOVER_OUT <= N_DHCPDISCOVER;
// N_DHCPREQUEST1_OUT <= N_DHCPREQUEST1;
// N_DHCPREQUEST2_OUT <= N_DHCPREQUEST2;
// N_DHCPREQUEST3_OUT <= N_DHCPREQUEST3;
// N_DHCPACK_OUT <= N_DHCPACK;
// 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------

endmodule // module DHCP_SERVER_10G

