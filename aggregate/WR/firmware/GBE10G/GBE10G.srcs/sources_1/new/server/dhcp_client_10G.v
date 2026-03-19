/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\dhcp_client_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\dhcp_client_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:19:09 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2019
// 	Filename:  DHCP_CLIENT.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 5/3/19
//  Inheritance: 	DHCP_CLIENT.VHD 6/25/16
// 
//  description:  
//  DHCP client (on-top of UDP_TX and UDP_RX). 10G version.
//  Based on RFC2131
//  This client asks DHCP servers for an IP address and network information such as gateway, subnet mask and DNS address.
// 
//  Limitations:
//  Client and server are on the same subnet (no relay)
// 
//  Usage:
//  1. A DHCP client can be instantiated (using the DHCP_CLIENT_EN generic parameter in COM540X.vhd), but still
//  enabled/disabled dynamically at run-time using the SYNC_RESET input. Set SYNC_RESET to '1' to disable this server.
//  2. Proposed IP address is always on the same subnet as this server (i.e. same 1/2/3 MSBs as this server IPv4_ADDR)
//  4. Limited to 6-byte (Ethernet) hardware addressing
// 
//  Device utilization 
//  FF: 1263
//  LUT: 1216
//  DSP48: 0
//  18Kb BRAM: 4
//  BUFG: 1
//  Minimum period: 6.414ns (Maximum Frequency: 155.909MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module DHCP_CLIENT_10G #(
	parameter SIMULATION = 1'b0
		// 1 during simulation otherwise timers are way too long for practical VHDL simulation
)(

		//// CLK, RESET
		input   SYNC_RESET,
			// set to '1' to disable the DHCP server
		input   CLK,	// synchronous clock
			// Must be a global clocks. No BUFG instantiation within this component.
		input   TICK_4US,
		input   TICK_100MS, 
			// 100 ms tick for timer

		//// CLIENT INFO
		input   [47:0] MAC_ADDR,
			// MAC address. Unique for each network interface card.
			// Natural byte order: (MSB) 0x000102030405 (LSB) 
			// as transmitted in the Ethernet packet.
		input   [31:0] LAST_IPv4_ADDR,
			// last IP address. This DHCP client will use it to request a new IP after power up
			// to maintain some consistency. Since the FPGA is generally not capable of storing
			// this information in non-volatile memory, some external device (microcontroller, eeprom, etc)
			// should be used for persistent storage (preferred, not required)
		
		//// DHCP CLIENT CONFIGURATION: IP address, MAC address, host name
		output   [31:0] IPv4_ADDR,
			// dynamic IP address. 4 bytes for IPv4
			// Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
		output   reg  [31:0] LEASE_TIME,
			// default lease time in secs
			// FFFFFF for infinite (TBC)
		output   reg  [31:0] SUBNET_MASK,
		output   reg  [31:0] ROUTER,
		output   reg  [31:0] DNS1,
		output   reg  [31:0] DNS2,
		
		input   [15:0] IP_ID_IN,
			// 16-bit IP ID, unique for each datagram. Incremented every time
			// an IP datagram is sent (not just for this protocol).

		//// Received UDP payload 
		// DHCP message is encapsulated within a UDP frame
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

		input   [31:0] RX_SOURCE_IP_ADDR,

		//// OUTPUT: TX UDP layer -> Transmit MAC Interface
		// 32-bit CRC is automatically appended by MAC. Not supplied here.
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
			// '1' when a frame is ready to be sent (tell the COM5402 arbiter)
			// When the MAC starts reading the output buffer, it is expected that it will be
			// read until empty.

		//// TEST POINTS 
		output   [10:1] TP
);


// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // RESET ------------------------------------
reg     SYNC_RESET_local; 

// // RANDOM GENERATOR ------------------------------------
reg     [47:0] RANDOM_NO; 
reg     RANDOM_NO_REQ; 

// // TIME ------------------------------------------------
reg     [7:0] TIMER1; 
reg     [7:0] TIMER2; 
parameter [7:0] DISCOVER_RETRANSMIT = 40; 
//  4s
parameter [7:0] COLLECT_DHCPOFFERS = 20; 
//  2s
parameter [7:0] AWAIT_DHCPACK = 20; 
//  2s
reg     [15:0] TIME_CNTR; 
reg     [3:0] CNTR10; 
reg     [15:0] TIME_CNTR_AT_DHCPDISCOVER; 
reg     [31:0] LEASE_TIMER; 

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
reg     [31:0] XID; 
reg     [31:0] RX_XID; 
reg     [15:0] RX_FLAGS; 
reg     [31:0] RX_CIADDR; 
reg     [31:0] RX_YIADDR; 
reg     [31:0] RX_GIADDR; 
reg     [47:0] RX_CLIENT_MAC_ADDR; 
reg     [31:0] RX_MAGIC_COOKIE; 
parameter [31:0] MAGIC_COOKIE = 32'h 63825363; 

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
reg     [31:0] DHCP_SERVER_IP_ADDR; 
reg     [31:0] RX_IP_ADDR_LEASE_TIME; 
reg     [31:0] RX_SUBNET_MASK; 
reg     [31:0] RX_ROUTER; 
reg     [31:0] RX_DNS1; 
reg     [31:0] RX_DNS2; 
reg     RX_VALID; 
reg     RECEIVED_DHCPOFFERS; 
reg     [31:0] BEST_DHCP_SERVER_IP_ADDR; 
reg     [31:0] BEST_RX_YIADDR; 
reg     EVENT1; 
reg     EVENT2; 
reg     EVENT3; 
reg     EVENT4; 
reg     EVENT5; 
reg     [3:0] STATE; 
reg     [31:0] IPv4_ADDR_local; 

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

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // RESET ------------------------------------
//  we must hold the DHCP client in internal reset until the MAC_ADDR is defined.
initial 
   begin : process_67
   UDP_TX_EOF = 1'b 0;   
   end

initial 
   begin : process_66
   UDP_TX_SOF = 1'b 0;   
   end

initial 
   begin : process_65
   UDP_TX_DATA_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_64
   UDP_TX_DATA = {64{1'b 0}};   
   end

initial 
   begin : process_63
   WPTR = {7{1'b 0}};   
   end

initial 
   begin : process_62
   DEST_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_61
   DEST_IPv4_ADDRx = {128{1'b 0}};   
   end

initial 
   begin : process_60
   DEST_IPv4_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_59
   IPv4_ADDR_local = {32{1'b 0}};   
   end

initial 
   begin : process_58
   STATE = 0;   
   end

initial 
   begin : process_57
   EVENT5 = 1'b 0;   
   end

initial 
   begin : process_56
   EVENT4 = 1'b 0;   
   end

initial 
   begin : process_55
   EVENT3 = 1'b 0;   
   end

initial 
   begin : process_54
   EVENT2 = 1'b 0;   
   end

initial 
   begin : process_53
   EVENT1 = 1'b 0;   
   end

initial 
   begin : process_52
   BEST_RX_YIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_51
   BEST_DHCP_SERVER_IP_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_50
   RECEIVED_DHCPOFFERS = 1'b 0;   
   end

initial 
   begin : process_49
   RX_VALID = 1'b 0;   
   end

initial 
   begin : process_48
   RX_DNS2 = {32{1'b 0}};   
   end

initial 
   begin : process_47
   RX_DNS1 = {32{1'b 0}};   
   end

initial 
   begin : process_46
   RX_ROUTER = {32{1'b 0}};   
   end

initial 
   begin : process_45
   RX_SUBNET_MASK = {32{1'b 0}};   
   end

initial 
   begin : process_44
   RX_IP_ADDR_LEASE_TIME = {32{1'b 0}};   
   end

initial 
   begin : process_43
   DHCP_SERVER_IP_ADDR = {32{1'b 0}};   
   end

initial 
   begin : process_42
   DHCP_MESSAGE_TYPE = {4{1'b 0}};   
   end

initial 
   begin : process_41
   DHCP_MESSAGE = {96{1'b 0}};   
   end

initial 
   begin : process_40
   DHCP_MESSAGE_LENGTH = {8{1'b 0}};   
   end

initial 
   begin : process_39
   DHCP_OPTION = {8{1'b 0}};   
   end

initial 
   begin : process_38
   DHCP_RX_EOF2_D = 1'b 0;   
   end

initial 
   begin : process_37
   DHCP_RX_EOF2 = 1'b 0;   
   end

initial 
   begin : process_36
   DHCP_READ_STATE = 0;   
   end


initial 
   begin : process_34
   DHCP_RX_DATA2_VALID = 1'b 0;   
   end

initial 
   begin : process_33
   DHCP_RX_DATA2_VALID_E = 1'b 0;   
   end

initial 
   begin : process_32
   BUF1_SIZE = {10{1'b 0}};   
   end

initial 
   begin : process_31
   DHCP_RX_BYTE_COUNT = {10{1'b 1}};   
   end

initial 
   begin : process_30
   RX_MAGIC_COOKIE = {32{1'b 0}};   
   end

initial 
   begin : process_29
   RX_CLIENT_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_28
   RX_GIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_27
   RX_YIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_26
   RX_CIADDR = {32{1'b 0}};   
   end

initial 
   begin : process_25
   RX_FLAGS = {16{1'b 0}};   
   end

initial 
   begin : process_24
   RX_XID = {32{1'b 0}};   
   end

initial 
   begin : process_23
   XID = {32{1'b 0}};   
   end

initial 
   begin : process_22
   DHCP_RX_WORD_VALID_D = 1'b 0;   
   end

initial 
   begin : process_21
   DHCP_RX_WORD_VALID = 1'b 0;   
   end

initial 
   begin : process_20
   DHCP_RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_19
   DHCP_RX_EOF = 1'b 0;   
   end

initial 
   begin : process_18
   DHCP_RX_SOF_D = 1'b 0;   
   end

initial 
   begin : process_17
   DHCP_RX_SOF = 1'b 0;   
   end

initial 
   begin : process_16
   DHCP_RX_DATA_VALID_D = {8{1'b 0}};   
   end

initial 
   begin : process_15
   DHCP_RX_DATA_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_14
   DHCP_RX_DATA_D_FLIPPED = {64{1'b 0}};   
   end

initial 
   begin : process_13
   DHCP_RX_DATA_D = {64{1'b 0}};   
   end

initial 
   begin : process_12
   DHCP_RX_DATA = {64{1'b 0}};   
   end

initial 
   begin : process_11
   DHCP_RX_WORD_COUNT = {7{1'b 0}};   
   end

initial 
   begin : process_10
   VALID_UDP_DEST_PORT = 1'b 0;   
   end

initial 
   begin : process_9
   LEASE_TIMER = {32{1'b 0}};   
   end

initial 
   begin : process_8
   TIME_CNTR_AT_DHCPDISCOVER = {16{1'b 0}};   
   end

initial 
   begin : process_7
   CNTR10 = {4{1'b 0}};   
   end

initial 
   begin : process_6
   TIME_CNTR = {16{1'b 0}};   
   end

initial 
   begin : process_5
   TIMER2 = {8{1'b 0}};   
   end

initial 
   begin : process_4
   TIMER1 = {8{1'b 0}};   
   end

initial 
   begin : process_3
   RANDOM_NO_REQ = 1'b 0;   
   end

initial 
   begin : process_2
   RANDOM_NO = {48{1'b 0}};   
   end

initial 
   begin : process_1
   SYNC_RESET_local = 1'b 0;   
   end


always @(posedge CLK)
   begin : RESET_001
   if (CLK === 1'b 1)
      begin
      if (MAC_ADDR === 0)
         begin
         SYNC_RESET_local <= 1'b 1;   
         end
      else
         begin
         SYNC_RESET_local <= SYNC_RESET;   
         end
      end
   end

// // RANDOM GENERATOR ------------------------------------
//  The DHCP protocol requires random delays (for example for sending the first DHCPDISCOVER message).
//  We use the MAC address as seed. 

always @(posedge CLK)
   begin : RANDOM_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         RANDOM_NO <= MAC_ADDR[47:0];   
         end
      else if (RANDOM_NO_REQ === 1'b 1 )
         begin

//  for every subsequent request, get a new random number
         RANDOM_NO[47:1] <= RANDOM_NO[46:0];   
         RANDOM_NO[0] <= ~(~(~(RANDOM_NO[47] ^ RANDOM_NO[46]) ^ RANDOM_NO[20]) ^ RANDOM_NO[19]);   
//  Xilinx XAPP 052
         end
      end
   end

//  request next random number: events triggering a new draw

always @(posedge CLK)
   begin : RANDOM_GEN_002
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         RANDOM_NO_REQ <= 1'b 0;   
         end
      else if (STATE === 0 )
         begin

//  1st draw.. random delay before sending DHCPDISCOVER
         RANDOM_NO_REQ <= 1'b 1;   
         end
      else if (STATE === 1 )
         begin

//  multiple draws before selecting XID
         RANDOM_NO_REQ <= 1'b 1;   
         end
      else if (STATE === 3 & WPTR === 0 )
         begin

//  pick a new XID for each DHCPDISCOVER restart
         RANDOM_NO_REQ <= 1'b 1;   
         end
      else
         begin
         RANDOM_NO_REQ <= 1'b 0;   
         end
      end
   end

// // TIME ------------------------------------------------
//  track relative time in secs.

always @(posedge CLK)
   begin : TIME_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TIME_CNTR <= {{15{1'b 0}}, 1'b 1};   
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

//  Freeze time value upon sending DHCPDISCOVER (same value MUST be used in DHCPREQUEST)

always @(posedge CLK)
   begin : TIME_GEN_002
   if (CLK === 1'b 1)
      begin
      if (STATE === 3 & WPTR === 0)
         begin

//  start of DHCPDISCOVER
         TIME_CNTR_AT_DHCPDISCOVER <= TIME_CNTR;   
         end
      end
   end

//  lease time countdown

always @(posedge CLK)
   begin : TIME_GEN_003
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         LEASE_TIMER <= {32{1'b 0}};   
         end
      else if (STATE === 9 & EVENT3 === 1'b 1 )
         begin

//  lease time defined
         if (SIMULATION === 1'b 0)
            begin
            LEASE_TIMER <= RX_IP_ADDR_LEASE_TIME;   

//  test fast expiration
            end
         else
            begin
            LEASE_TIMER <= 32'h 00000010;   
            end
         end
      else if (TICK_100MS === 1'b 1 & CNTR10 === 9 & 
      LEASE_TIMER !== 0 )
         begin

//  LEASE_TIMER units = seconds
         LEASE_TIMER <= LEASE_TIMER - 1;   
         end
      end
   end

// // UDP RX frame ---------------------------------------
//  DHCP is encapsulated within a UDP frame
//  verify UDP destination port is 68 (x0044) DHCP client port 

always @( UDP_RX_DEST_PORT_NO ) 
VALID_UDP_DEST_PORT = UDP_RX_DEST_PORT_NO === 16'h 0044 ? 1'b 1 : 
	1'b 0; 

always @( UDP_RX_DATA ) 
DHCP_RX_DATA = UDP_RX_DATA; 

always @( VALID_UDP_DEST_PORT or UDP_RX_DATA_VALID ) 
DHCP_RX_DATA_VALID = VALID_UDP_DEST_PORT === 1'b 1 ? UDP_RX_DATA_VALID : 
	8'h 00; 

always @( UDP_RX_SOF or VALID_UDP_DEST_PORT ) 
DHCP_RX_SOF = UDP_RX_SOF & VALID_UDP_DEST_PORT; 

always @( UDP_RX_EOF or VALID_UDP_DEST_PORT ) 
DHCP_RX_EOF = UDP_RX_EOF & VALID_UDP_DEST_PORT; 

always @( UDP_RX_DATA_VALID or VALID_UDP_DEST_PORT ) 
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
      if (SYNC_RESET_local === 1'b 1 | DHCP_RX_SOF === 1'b 1)
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
            RX_XID <= DHCP_RX_DATA_D[31:0];   

//  zero other fields
// 				RX_FLAGS <= (others => '0');
// 				RX_CIADDR <= (others => '0');
            RX_YIADDR <= {32{1'b 0}};   

// 				RX_GIADDR <= (others => '0');
            RX_CLIENT_MAC_ADDR <= {48{1'b 0}};   
            RX_MAGIC_COOKIE <= {32{1'b 0}};   
            end

// 			if(DHCP_RX_WORD_COUNT = 1) then
// 				RX_FLAGS <= DHCP_RX_DATA_D(47 downto 32);
// 				RX_CIADDR <= DHCP_RX_DATA_D(31 downto 0);
// 			end if;
         if (DHCP_RX_WORD_COUNT === 2)
            begin
            RX_YIADDR <= DHCP_RX_DATA_D[63:32];   
            end
         if (DHCP_RX_WORD_COUNT === 3)
            begin
            RX_GIADDR <= DHCP_RX_DATA_D[63:32];   
            RX_CLIENT_MAC_ADDR[47:16] <= DHCP_RX_DATA_D[31:0];   
            end
         if (DHCP_RX_WORD_COUNT === 4)
            begin
            RX_CLIENT_MAC_ADDR[15:0] <= DHCP_RX_DATA_D[63:48];   
            end
         if (DHCP_RX_WORD_COUNT === 29)
            begin
            RX_MAGIC_COOKIE <= DHCP_RX_DATA_D[31:0];   
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
   for (i = 0; i <= 7; i = i + 1) begin : PARSE_001  
         always @(DHCP_RX_DATA_D) begin 
              DHCP_RX_DATA_D_FLIPPED[(7 - i) * 8 + 7:(7 - i) * 8] <= DHCP_RX_DATA_D[i * 8 + 7:i * 8];   
         end
   end
endgenerate

bram_dp2 #(
      .DATA_WIDTHA ( 8 ),
      .ADDR_WIDTHA ( 10 ),
      .DATA_WIDTHB ( 64 ),
      .ADDR_WIDTHB ( 7 )
)PARSE_002 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(1'b0),
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
          .DOB());

always @( DHCP_RX_WORD_COUNT or DHCP_RX_BYTE_COUNT ) 
   BUF1_SIZE = {DHCP_RX_WORD_COUNT, 3'b 000} + ~DHCP_RX_BYTE_COUNT; 

always @(posedge CLK)
   begin : PARSE_003
   if (CLK === 1'b 1)
      begin
      DHCP_RX_DATA2_VALID <= DHCP_RX_DATA2_VALID_E;   
//  1CLK latency to read from BRAM
      if (SYNC_RESET_local === 1'b 1 | DHCP_RX_SOF === 1'b 1)
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
      if (SYNC_RESET_local === 1'b 1)
         begin
         DHCP_READ_STATE <= 0;   
         end
      else if (DHCP_RX_BYTE_COUNT === 240 )
         begin

//  magic cookie immediately preceeds the DHCP options
         DHCP_READ_STATE <= 1;   

//  clear previous option fields
         DHCP_MESSAGE_TYPE <= {4{1'b 0}};   
         DHCP_SERVER_IP_ADDR <= {32{1'b 0}};   
         RX_IP_ADDR_LEASE_TIME <= {32{1'b 0}};   
         RX_SUBNET_MASK <= {32{1'b 0}};   
         RX_ROUTER <= {32{1'b 0}};   
         RX_DNS1 <= {32{1'b 0}};   
         RX_DNS2 <= {32{1'b 0}};   
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
               if (DHCP_OPTION === 54)
                  begin

//  DHCP server identifier
                  DHCP_SERVER_IP_ADDR <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 51)
                  begin

//  IP address lease time
                  RX_IP_ADDR_LEASE_TIME <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 1)
                  begin

//  subnet mask
                  RX_SUBNET_MASK <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 3)
                  begin

//  router
                  RX_ROUTER <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                  end
               if (DHCP_OPTION === 6)
                  begin

//  DNS
                  if (DHCP_MESSAGE_LENGTH === 4)
                     begin

//  4 bytes: 1 DNS
                     RX_DNS1 <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
//  4 bytes
                     RX_DNS2 <= {32{1'b 0}};   
                     end
                  else if (DHCP_MESSAGE_LENGTH === 8 )
                     begin

//  8 bytes: 2 DNSs
                     RX_DNS1 <= DHCP_MESSAGE[55:24];   
                     RX_DNS2 <= {DHCP_MESSAGE[23:0], DHCP_RX_DATA2};   
                     end
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

always @( * ) 
   DHCP_RX_EOF2 = ((DHCP_RX_DATA2_VALID === 1'b 1) & (DHCP_READ_STATE === 1) & (DHCP_RX_DATA2 === 8'h FF)) ? 1'b 1 : 1'b 0; 

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
      else if (DHCP_RX_EOF2 === 1'b 1 & RX_MAGIC_COOKIE !== 32'h 63825363 )
         begin
         RX_VALID <= 1'b 0;   
         end
      else if (DHCP_RX_EOF2 === 1'b 1 & RX_CLIENT_MAC_ADDR !== MAC_ADDR )
         begin

//  non-matching client MAC address (spoofing?)
         RX_VALID <= 1'b 0;   
         end
      else if (DHCP_RX_EOF2 === 1'b 1 & RX_XID !== XID )
         begin

//  non-matching XID
         RX_VALID <= 1'b 0;   
         end
      end
   end

//  select best DHCPOFFER response
//  criteria: the one that matches LAST_IPv4_ADDR, otherwise the first response

always @(posedge CLK)
   begin : BEST_DHCPOFFER_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         RECEIVED_DHCPOFFERS <= 1'b 0;   
         BEST_DHCP_SERVER_IP_ADDR <= {32{1'b 0}};   
         BEST_RX_YIADDR <= {32{1'b 0}};   
         end
      else if (STATE === 4 & MAC_TX_EOF_local === 1'b 1 )
         begin

//  sending DHCPDISCOVER
         RECEIVED_DHCPOFFERS <= 1'b 0;   
         end
      else if (EVENT1 === 1'b 1 )
         begin

//  valid DHCPOFFER
         RECEIVED_DHCPOFFERS <= 1'b 1;   
         if (RECEIVED_DHCPOFFERS === 1'b 0)
            begin

//  first DHCPOFFER after DHCPDISCOVER
            BEST_DHCP_SERVER_IP_ADDR <= DHCP_SERVER_IP_ADDR;   
            BEST_RX_YIADDR <= RX_YIADDR;   
            end
         else if (RX_YIADDR === LAST_IPv4_ADDR )
            begin

//  this DHCPOFFER matches the IP address last assigned to this device. Better choice.
            BEST_DHCP_SERVER_IP_ADDR <= DHCP_SERVER_IP_ADDR;   
            BEST_RX_YIADDR <= RX_YIADDR;   
            end
         end
      end
   end

//  change IP address

always @(posedge CLK)
   begin : CHANGE_IP_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         IPv4_ADDR_local <= {32{1'b 0}};   
         end
      else if (EVENT2 === 1'b 1 )
         begin
         IPv4_ADDR_local <= BEST_RX_YIADDR;   
         end
      end
   end

assign IPv4_ADDR = IPv4_ADDR_local; 

//  report DHCP client configuration to the device

always @(posedge CLK)
   begin : CONFIG_OUT_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         LEASE_TIME <= {32{1'b 0}};   
         SUBNET_MASK <= {32{1'b 0}};   
         ROUTER <= {32{1'b 0}};   
         DNS1 <= {32{1'b 0}};   
         DNS2 <= {32{1'b 0}};   
         end
      else if (STATE === 9 & EVENT3 === 1'b 1 )
         begin
         LEASE_TIME <= RX_IP_ADDR_LEASE_TIME;   
         SUBNET_MASK <= RX_SUBNET_MASK;   
         ROUTER <= RX_ROUTER;   
         DNS1 <= RX_DNS1;   
         DNS2 <= RX_DNS2;   
         end
      end
   end

// //-- EVENTS ---------------------------------------------------
//  1 = valid DHCPOFFER message 

always @(*) 
EVENT1 = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 2) & (STATE === 6)) ? 1'b 1 : 1'b 0; 

//  2 = finished sending DHCPREQUEST. Time to change our IP address since the follow-on DHCPACK message
//  from the DHCP server is directed to the requested IP address.

always @(*) 
EVENT2 = ((STATE === 8) & (MAC_TX_EOF_local === 1'b 1)) ? 1'b 1 : 1'b 0; 

//  3 = valid DHCPACK message from the expected DHCP server after a DHCPREQUEST

always @(*) 
EVENT3 = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 5) & (RX_SOURCE_IP_ADDR === BEST_DHCP_SERVER_IP_ADDR)) ? 1'b 1 : 1'b 0; 

//  4 = valid DHCPNAK message from the expected DHCP server

always @(*) 
EVENT4 = ((DHCP_RX_EOF2_D === 1'b 1) & (RX_VALID === 1'b 1) & (DHCP_MESSAGE_TYPE === 6) & (RX_SOURCE_IP_ADDR === BEST_DHCP_SERVER_IP_ADDR)) ? 1'b 1 : 1'b 0; 

//  5 = lease time expired

always @(*) 
EVENT5 = LEASE_TIMER === 0 ? 1'b 1 : 1'b 0; 

// //-- STATE MACHINE ---------------------------------------------------

always @(posedge CLK)
   begin : STATE_GEN_001
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
         STATE <= 0;   
//  INIT STATE

//  initialize timers
         TIMER1 <= {8{1'b 0}};   
         TIMER2 <= {8{1'b 0}};   
         end
      else if (STATE === 0 & RANDOM_NO !== 0 )
         begin

//  arm timer with random number between 0.1 - 12.6s, before sending DHCPDISCOVER
         TIMER1[6:0] <= RANDOM_NO[6:0];   

//  request next random number
         TIMER1[7:7] <= {(7 - 7 + 1){1'b 0}};   
         STATE <= 1;   
         end
      else if (STATE === 1 & TIMER1 === 0 )
         begin

//  at the end of the random delay 
//  send DHCPDISCOVER. 
         STATE <= 3;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
//  defensive. should never happen.
         end
      else if (STATE === 3 & UDP_TX_ACK_local === 1'b 1 )
         begin

//  composed UDP reply. UDP confirmed. awaiting MAC confirmation.
         STATE <= 4;   
         end
      else if (STATE === 3 & UDP_TX_NAK_local === 1'b 1 )
         begin

//  composed UDP reply. NAK from UDP_TX (abnormal). 
//  Wait before retransmitting DHCPDISCOVER.
         STATE <= 5;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
         end
      else if (STATE === 4 & MAC_TX_EOF_local === 1'b 1 )
         begin

//  MAC transmission completion confirmed. Awaiting DHCHOFFERs
//  await responses from possible multiple DHCP servers. 
         STATE <= 6;   
         TIMER1 <= COLLECT_DHCPOFFERS;   
//  wait to collect all DHCPOFFERs
         end
      else if ((STATE === 3 | STATE === 4 | STATE === 5) & TIMER1 === 0 )
         begin

//  retry sending DHCPDISCOVER
         STATE <= 3;   
//  *062516
         TIMER1 <= DISCOVER_RETRANSMIT;   
//  defensive. should rarely happen (could happen if two clients

//  start at the same time (the DHCP server may only handle one transaction at a time)
         end
      else if (STATE === 6 & TIMER1 === 0 )
         begin
         if (RECEIVED_DHCPOFFERS === 1'b 1)
            begin

//  collected at least one DHCPOFFER. Start sending DHCPREQUEST
            STATE <= 7;   
            TIMER1 <= DISCOVER_RETRANSMIT;   
//  defensive. should never happen.

//  received no DHCPOFFER
//  Wait before retransmitting DHCPDISCOVER.
            end
         else
            begin
            STATE <= 5;   
            TIMER1 <= DISCOVER_RETRANSMIT;   
            end
         end
      else if (STATE === 7 & UDP_TX_ACK_local === 1'b 1 )
         begin

//  composed UDP reply. UDP confirmed. awaiting MAC confirmation.
         STATE <= 8;   
         end
      else if (STATE === 7 & UDP_TX_NAK_local === 1'b 1 )
         begin

//  composed UDP reply. NAK from UDP_TX (abnormal). 
//  Wait before retransmitting DHCPDISCOVER.
         STATE <= 5;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
         end
      else if (STATE === 8 & MAC_TX_EOF_local === 1'b 1 )
         begin

//  MAC transmission completion confirmed. Awaiting DHCHACK
         STATE <= 9;   
         TIMER1 <= AWAIT_DHCPACK;   
//  Awaiting DHCPACK
         end
      else if ((STATE === 7 | STATE === 8 | STATE === 9) & TIMER1 === 0 )
         begin

//  retry sending DHCPDISCOVER
         STATE <= 5;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
//  defensive. should never happen.
         end
      else if (STATE === 9 & EVENT3 === 1'b 1 )
         begin

//  received a valid DHCPACK
         STATE <= 10;   
//  BOUND state
         end
      else if (STATE === 9 & EVENT4 === 1'b 1 )
         begin

//  received a valid DHCPNAK
//  Wait before retransmitting DHCPDISCOVER.
         STATE <= 5;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
         end
      else if (STATE === 9 & TIMER1 === 0 )
         begin

//  timeout waiting for a valid DHCPACK
//  Wait before retransmitting DHCPDISCOVER.
         STATE <= 5;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
         end
      else if (STATE === 10 & EVENT5 === 1'b 1 )
         begin

//  BOUND state, lease expired. Renew.
         STATE <= 7;   
         TIMER1 <= DISCOVER_RETRANSMIT;   
//  defensive. should never happen.
         end
      else if (TICK_100MS === 1'b 1 & SIMULATION === 1'b 0 | TICK_4US === 1'b 1 & SIMULATION === 1'b 1 )
         begin

//  countdown timer until expiration (0). Accelerate during simulation.
         if (TIMER1 !== 0)
            begin
            TIMER1 <= TIMER1 - 1;   
            end
         if (TIMER2 !== 0)
            begin
            TIMER2 <= TIMER2 - 1;   
            end
         end
      end
   end

// //-- TRANSMIT FIELDS ------------------------------------------
//  XID

always @(posedge CLK)
   begin : XID_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
            XID <= {32{1'b 0}};   
         end
      else if (STATE === 3 & WPTR === 0 )
         begin

//  pick a random ID before sending DHCPDISCOVER. Changes at each retransmission.
            XID <= RANDOM_NO[31:0];   
         end
      end
   end

// //-- COMPOSE MESSAGES TO DHCP SERVER --------------------------
//  WPTR is a word counter for the UDP tx payload

always @(posedge CLK)
   begin : WPTR_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET_local === 1'b 1)
         begin
            WPTR <= {7{1'b 0}};   
         end
      else if (STATE === 3 | STATE === 7 )
         begin

//  DHCPDISCOVER or DHCPREQUEST message
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
      if (SYNC_RESET_local === 1'b 1)
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
         DEST_MAC_ADDR <= 48'h FFFFFFFFFFFF;   
         if (WPTR < 32)
            begin
            UDP_TX_DATA_VALID <= 8'h FF;   
            end
         else if (WPTR === 32 )
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
            UDP_TX_DATA <= {32'h 01010600, RANDOM_NO[31:0]};   

//  op: BOOTREQUEST
//  hardware type: Ethernet
//  hardware address length
//  00
//  XID -- Note: XID is only ready at the next CLK. Use RANDOM_NO instead here
            UDP_TX_SOF <= 1'b 1;   
            end
         7'b 0000001:
            begin
            UDP_TX_DATA[63:48] <= TIME_CNTR_AT_DHCPDISCOVER;   
            UDP_TX_DATA[47:0] <= {48{1'b 0}};   

//  seconds elapsed since DHCP client began address acquisition
            UDP_TX_SOF <= 1'b 0;   
            end
         7'b 0000011:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAC_ADDR[47:16];   

//  client MAC address
            end
         7'b 0000100:
            begin
            UDP_TX_DATA[63:48] <= MAC_ADDR[15:0];   
            UDP_TX_DATA[47:0] <= {48{1'b 0}};   

//  client MAC address
            end
         7'b 0011101:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAGIC_COOKIE;   
            end
         7'b 0011110:
            begin
            UDP_TX_DATA <= {48'h 3501013D0701, MAC_ADDR[47:32]};   

//  option DHCP message type (53)
//  length
//  DHCPDISCOVER
//  option DHCP client identifier (61)
//  length
//  Ethernet
//  client MAC address
            end
         7'b 0011111:
            begin
            UDP_TX_DATA <= {MAC_ADDR[31:0], 32'h 37030103};   

//  client MAC address
//  option parameter request list (55)
//  length
//  subnet mask
//  router
            end
         7'b 0100000:
            begin
            UDP_TX_DATA <= 64'h 06FF000000000000;   

//  domain name server
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
      else if (STATE === 7 & UDP_TX_CTS === 1'b 1 )
         begin

//  DHCPREQUEST message
//  UDP destination IP address, broadcast 
         DEST_IPv4_ADDR <= 32'h FFFFFFFF;   
         DEST_MAC_ADDR <= 48'h FFFFFFFFFFFF;   
         if (WPTR < 33)
            begin
            UDP_TX_DATA_VALID <= 8'h FF;   
            end
         else if (WPTR === 33 )
            begin
            UDP_TX_DATA_VALID <= 8'h 80;   
            end
         else
            begin
            UDP_TX_DATA_VALID <= 8'h 00;   
            end
         case (WPTR)
         7'b 0000000:
            begin
            UDP_TX_DATA <= {32'h 01010600, XID};   

//  op: BOOTREQUEST
//  hardware type: Ethernet
//  hardware address length
//  00
//  XID
            UDP_TX_SOF <= 1'b 1;   
            end
         7'b 0000001:
            begin
            UDP_TX_DATA <= {TIME_CNTR_AT_DHCPDISCOVER, 48'h 000000000000};   

//  seconds elapsed since DHCP client began address acquisition. MUST be same as in DHCPDISCOVER
            UDP_TX_SOF <= 1'b 0;   
            end
         7'b 0000011:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAC_ADDR[47:16];   

//  client MAC address
            end
         7'b 0000100:
            begin
            UDP_TX_DATA[63:48] <= MAC_ADDR[15:0];   
            UDP_TX_DATA[47:0] <= {48{1'b 0}};   

//  client MAC address
            end
         7'b 0011101:
            begin
            UDP_TX_DATA[63:32] <= {32{1'b 0}};   
            UDP_TX_DATA[31:0] <= MAGIC_COOKIE;   

//  magic cookie
            end
         7'b 0011110:
            begin
            UDP_TX_DATA <= {48'h 3501033d0701, MAC_ADDR[47:32]};   

//  option DHCP message type (53)
//  length
//  DHCPREQUEST
//  option DHCP client identifier (61)
//  length
//  Ethernet
//  client MAC address
            end
         7'b 0011111:
            begin
            UDP_TX_DATA <= {MAC_ADDR[31:0], 16'h 3204, BEST_RX_YIADDR[31:16]};   

//  client MAC address
//  option requested IP address (50)
//  length
//  requested IP address
            end
         7'b 0100000:
            begin
            UDP_TX_DATA <= {BEST_RX_YIADDR[15:0], 16'h 3604, BEST_DHCP_SERVER_IP_ADDR[31:0]};   

//  requested IP address
//  option DHCP server identifier (54)
//  length
//  DHCP server ID
            end
         7'b 0100001:
            begin
            UDP_TX_DATA <= 64'h FF00000000000000;   

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

UDP_TX_10G #(
      .ADDR_WIDTH ( 7 ),     
      //  elastic buffer size as 72b * 2^ADDR_WIDTH
      .UDP_CKSUM_ENABLED ( 1'b1 ),
      .IPv6_ENABLED ( 1'b0 )
)UDP_TX_001 (
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET_local),
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
          .DEST_PORT_NO(16'h 0043),
          
//  DHCP server port (67)
          .SOURCE_PORT_NO(16'h 0044),
          
//  DHCP client port (68)
//  Configuration
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
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

// --// TEST POINTS -----------------------------
// TP(1) <= DHCP_RX_DATA_VALID;
// TP(2) <= EVENT1;
// TP(3) <= EVENT2;
// --TP(4) <= 
// --TP(5) <= 
// --TP(6) <= 
// TP(7) <= UDP_TX_CTS; 
// TP(8) <= '1' when (STATE = 3) and (UDP_TX_CTS = '1')  else '0';
// TP(9) <= MAC_TX_EOF_local;
// 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------

// including file with called functions and tasks


endmodule // module DHCP_CLIENT_10G

