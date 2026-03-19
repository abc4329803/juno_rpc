/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\arp_cache2_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\arp_cache2_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:18:14 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules
//`include "ARP_CACHE2_10G_Behavioral.v"

// -----------------------------------------------------------
//  MSS copyright 2019
//  Filename:  ARP_CACHE2_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 1
//  Date last modified: 5/24/19
//  Inheritance: 	COM-5402 ARP_CACHE2.VHD 5/10/17 rev7
// 
//  description:  table linking 32-bit IPv4 or 128-bit IPv6 addresses to 48-bit MAC addresses and the information
//  "freshness", i.e. time last seen, in effect a routing table. 
//  Uses one 16Kbit block RAM for a maximum of 128 entries.    
//  This component determines whether the destination IP address is local or not. In the
//  latter case, the MAC address of the gateway is returned. 
//  Only records regarding local addresses are stored (i.e. not WAN addresses since these often
//  point to the router MAC address anyway).
// 
//  Assumming a 156.25 MHz clock...  
//  Time to access an existing record: between 24ns to 850ns max depending on the record location in the table.
//  An important startup issue is that ARP requests sent shortly after power up are
//  lost either at our LAN IC or at the destination LAN network interface card (PC
//  operating system slow at detecting a new LAN connection). 
// 
//  Rev1 5/24/19 
//  Corrected bug when searching for IP match at address 0
//  
//  Device utilization (IPv6_ENABLED='1')
//  FF: 1629
//  LUT: 1849
//  DSP48: 0
//  18Kb BRAM: 5
//  BUFG: 1
//  Minimum period: 4.952ns (Maximum Frequency: 201.939MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module ARP_CACHE2_10G #(
    parameter IPv6_ENABLED = 1
)
(
		// CLK, RESET
		input   		CLK,	
			// reference clock.
			// Global clock. No BUFG instantiation within this component.
		input   		SYNC_RESET,
			// synchronous reset: MANDATORY to properly initialize this component

		input   		TICK_100MS,
			// 100 ms tick for timer
		
		// User interface (query/reply)
		// (a) query
		input   [127:0] RT_IP_ADDR,
			// user query: destination IP address to resolve (could be local or remote). read when RT_REQ_RTS = '1'
		input   		RT_IPv4_6n,
            // IP version for RT_IP_ADDR: 1 for IPv4, 0 for IPv6
		input   		RT_REQ_RTS,
			// new requests will be ignored until the module is 
			// finished with the previous request/reply transaction
		output   		RT_CTS,	
			// ready to accept a new routing query.
		// (b) reply
		output   [47:0] RT_MAC_REPLY,
			// Destination MAC address associated with the destination IP address RT_IP_ADDR. 
			// Could be the Gateway MAC address if the destination IP address is outside the local area network.
		output   		RT_MAC_RDY,
			// 1 CLK pulse to read the MAC reply
			// The worst case latency from the RT_REQ_RTS request is 1.33us
			// If there is no match in the table, no response will be provided. Calling routine should
			// therefore have a timeout timer to detect lack of response.
		output   		RT_NAK,
			// 1 CLK pulse indicating that no record matching the RT_IP_ADDR was found in the table.

		// Routing information
		input   [47:0] 	MAC_ADDR,
			// local MAC address
		input   [31:0] 	IPv4_ADDR,
            // local IP address. 4 bytes for IPv4
            // Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
      input   [31:0] 	IPv4_SUBNET_MASK,
		// local subnet mask. used to distinguish local vs wan packets
      input   [31:0] 	IPv4_GATEWAY_ADDR,
		// Gateway IP address. Direct WAN packets to that gateway if non-local;
      input   [127:0] IPv6_ADDR,
         // local IP address. 16 bytes for IPv6
      input   [7:0] 	IPv6_SUBNET_PREFIX_LENGTH,
         // 128 - subnet size in bits. Usually expressed as /n. Typical range 64-128
      input   [127:0] IPv6_GATEWAY_ADDR,
            //  upper 64 bits MUST match our IPv6 address (i.e. gateway MUST be on the same network)

		// WHOIS interface (send ARP request)
		output  [127:0] WHOIS_IP_ADDR,
			// user query: IP address to resolve. read at WHOIS_START
		output   		WHOIS_IPv4_6n,
		    // IP version for WHOIS_IP_ADDR: 1 for IPv4, 0 for IPv6
		output   		WHOIS_START,
			// 1 CLK pulse to start the ARP query
			// Note: since we do not check for the WHOIS_RDY signal, there is a small probability that WHOIS is busy 
			// and that the request will be ignored. Higher-level Application should ask again in this case.

		// Source MAC/IP addresses 
		// Packet origin, parsed in PACKET_PARSING (shared code) from
		// ARP responses and IP packets. Ignored when the component is busy.
		input   		RX_SOURCE_ADDR_RDY,
		input   [47:0] 	RX_SOURCE_MAC_ADDR, // all received packets
		input   [127:0] RX_SOURCE_IP_ADDR,  // IPv4,ARP	
		input   		RX_IPv4_6n,

		// Test Points
		output   [7:0] 	SREG1,
		output   [7:0] 	SREG2, 
		output   [7:0] 	SREG3, 
		output   [7:0] 	SREG4, 
		output   [7:0] 	SREG5, 
		output   [7:0] 	SREG6, 
		output   [10:1]   TP
);
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
parameter ADDR_WIDTH = 8; 
parameter [19:0] REFRESH_PERIOD = 20'hBB8;
//  time between entries refreshed (5 minutes)

//  table size is 2^(ADDR_WIDTH-1) entries

// // TIME ------------------------------------------------
reg     [5:0] TIMER1; 
reg     [11:0] IPv4GATEWAY_REFRESH_TIMER; 
//  12-bits = 409.6s refresh max
reg     [11:0] IPv6GATEWAY_REFRESH_TIMER; 
//  12-bits = 409.6s refresh max
reg     [19:0] TIME_CNTR; 
reg     [19:0] TIMEDIFF; 

// //-- NEW QUERY IP CHECK ---------------------------------------------------
reg     [63:0] IPv6_SUBNET_MASK; 
reg     [31:0] IPv4_MASKED; 
reg     [63:0] IPv6_MASKED; 
reg     [63:0] RT_IP_ADDR_MASKED; 
reg     [127:0] RT_IP_ADDR_D; 
reg     RT_IPv4_6n_D; 
reg     EVENT1; 
reg     EVENT2; 
reg     EVENT3; 
reg     EVENT4; 
reg     EVENT5; 
reg     EVENT6; 
reg     EVENT7; 
reg     EVENT8; 
reg     EVENT9; 
reg     EVENT10; 
reg     EVENTB1; 
reg     EVENTB2; 

// //-- B-SIDE STATE MACHINE ---------------------------------------
reg     MEMORY_INITIALIZED; 
reg     [3:0] STATE_B; 
reg     [3:0] STATE_B_D; 
reg     [3:0] STATE_B_D2; 
reg     [3:0] STATE_B_D3; 
reg     [63:0] LAST_IP; 
reg     LAST_IPv4_6n; 
reg     [47:0] LAST_MAC; 
reg     [19:0] LAST_TIME; 
reg     RT_MAC_RDY_local; 
reg     RT_NAK_local; 
reg     [47:0] RT_MAC_REPLY_local; 
reg     [ADDR_WIDTH - 1:0] ADDRB; 
//  table is 128 entries x 133b + 1 bit for overflow detection
reg     [ADDR_WIDTH - 1:0] ADDRB_INC; 
reg     [ADDR_WIDTH - 1:0] ADDRB_D; 
reg     [ADDR_WIDTH - 1:0] ADDRB_D2; 
reg     WHOIS_START_local; 
reg     [127:0] WHOIS_IP_ADDR_local; 
reg     WHOIS_IPv4_6n_local; 
reg     WHOIS_IPv4GATEWAY; 
reg     WHOIS_IPv6GATEWAY; 

// //-- ROUTING TABLE ---------------------------------------------------
reg     WEA; 
reg     WEB; 
reg     ENA; 
reg     ENB; 
reg     [132:0] DIA; 
wire    [132:0] DOA; 
reg     [132:0] DOA_D; 
reg     [132:0] DIB; 
wire    [132:0] DOB; 
reg     [132:0] DOB_D; 

// //-- KEY MATCH ---------------------------------------------------
reg     [3:0] ZERO_IP_AMATCH; 
reg     [4:0] IP_KEY1_AMATCH; 
reg     [4:0] IP_KEY1_BMATCH; 
reg     IP_KEY1_MATCH; 
reg     [64:0] IP_KEY1; 
reg     [47:0] IP_KEY1_MAC; 
reg     [19:0] IP_KEY1_TIME; 
reg     [4:0] IP_KEY2_AMATCH; 
reg     [4:0] IP_KEY2_BMATCH; 
reg     IP_KEY2_MATCH; 
reg     [64:0] IP_KEY2; 
reg     [ADDR_WIDTH - 2:0] IP_KEY2_ADDR; 

// //-- NEW MAC/IP ADDRESSES ENTRY ---------------------------------------------------
reg     [47:0] RX_SOURCE_MAC_ADDR_D; 
reg     [127:0] RX_SOURCE_IP_ADDR_D; 
reg     RX_IPv4_6n_D; 
reg     [47:0] LAST_RX_MAC; 
reg     [127:0] LAST_RX_IP; 
reg     LAST_RX_IPv4_6n; 
reg     [19:0] LAST_RX_TIME; 
reg     [63:0] RX_SOURCE_IP_ADDR_MASKED; 

// //-- A-SIDE STATE MACHINE ---------------------------------------
reg     EVENTA1; 
reg     [2:0] STATE_A; 
reg     [2:0] STATE_A_D; 
reg     [2:0] STATE_A_D2; 
reg     [ADDR_WIDTH - 1:0] ADDRA; 
//  table is 128 entries x 133b + 1 bit for overflow detection
reg     [ADDR_WIDTH - 1:0] ADDRA_D; 
reg     [ADDR_WIDTH - 1:0] ADDRA_D2; 
reg     [47:0] GATEWAYv4_MAC_ADDR; 
reg     [47:0] GATEWAYv6_MAC_ADDR; 

// //-- FIND OLDEST ENTRY -----------------------------
reg     [19:0] TIME_A; 
reg     [19:0] TIME_B; 
reg     [19:0] OLDEST_TIME; 
reg     [ADDR_WIDTH - 2:0] OLDEST_ADDR; 
reg     VIRGIN; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // TIME ------------------------------------------------
//  keep track of time, by increments of 100ms
//  range: 29 hours
integer  j; 


initial 
   begin : process_84
   VIRGIN = 1'b 0;   
   end


initial 
   begin : process_83
   OLDEST_ADDR = {(ADDR_WIDTH - 2 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_82
   OLDEST_TIME = {20{1'b 0}};   
   end

initial 
   begin : process_81
   TIME_B = {20{1'b 0}};   
   end

initial 
   begin : process_80
   TIME_A = {20{1'b 0}};   
   end

initial 
   begin : process_79
   GATEWAYv6_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_78
   GATEWAYv4_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_77
   ADDRA_D2 = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_76
   ADDRA_D = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_75
   ADDRA = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_74
   STATE_A_D2 = 0;   
   end

initial 
   begin : process_73
   STATE_A_D = 0;   
   end

initial 
   begin : process_72
   STATE_A = 0;   
   end

initial 
   begin : process_71
   EVENTA1 = 1'b 0;   
   end

initial 
   begin : process_70
   RX_SOURCE_IP_ADDR_MASKED = {64{1'b 0}};   
   end

initial 
   begin : process_69
   LAST_RX_TIME = {20{1'b 0}};   
   end

initial 
   begin : process_68
   LAST_RX_IPv4_6n = 1'b 0;   
   end

initial 
   begin : process_67
   LAST_RX_IP = {128{1'b 0}};   
   end

initial 
   begin : process_66
   LAST_RX_MAC = {48{1'b 0}};   
   end

initial 
   begin : process_65
   RX_IPv4_6n_D = 1'b 0;   
   end

initial 
   begin : process_64
   RX_SOURCE_IP_ADDR_D = {128{1'b 0}};   
   end

initial 
   begin : process_63
   RX_SOURCE_MAC_ADDR_D = {48{1'b 0}};   
   end

initial 
   begin : process_62
   IP_KEY2_ADDR = {(ADDR_WIDTH - 2 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_61
   IP_KEY2 = {65{1'b 0}};   
   end

initial 
   begin : process_60
   IP_KEY2_MATCH = 1'b 0;   
   end

initial 
   begin : process_59
   IP_KEY2_BMATCH = {5{1'b 0}};   
   end

initial 
   begin : process_58
   IP_KEY2_AMATCH = {5{1'b 0}};   
   end

initial 
   begin : process_57
   IP_KEY1_TIME = {20{1'b 0}};   
   end

initial 
   begin : process_56
   IP_KEY1_MAC = {48{1'b 0}};   
   end

initial 
   begin : process_55
   IP_KEY1 = {65{1'b 0}};   
   end

initial 
   begin : process_54
   IP_KEY1_MATCH = 1'b 0;   
   end

initial 
   begin : process_53
   IP_KEY1_BMATCH = {5{1'b 0}};   
   end

initial 
   begin : process_52
   IP_KEY1_AMATCH = {5{1'b 0}};   
   end

initial 
   begin : process_51
   ZERO_IP_AMATCH = {4{1'b 0}};   
   end

initial 
   begin : process_50
   DOB_D = {133{1'b 0}};   
   end



initial 
   begin : process_48
   DIB = {133{1'b 0}};   
   end

initial 
   begin : process_47
   DOA_D = {133{1'b 0}};   
   end


initial 
   begin : process_45
   DIA = {133{1'b 0}};   
   end

initial 
   begin : process_44
   ENB = 1'b 0;   
   end

initial 
   begin : process_43
   ENA = 1'b 0;   
   end

initial 
   begin : process_42
   WEB = 1'b 0;   
   end

initial 
   begin : process_41
   WEA = 1'b 0;   
   end

initial 
   begin : process_40
   WHOIS_IPv6GATEWAY = 1'b 0;   
   end

initial 
   begin : process_39
   WHOIS_IPv4GATEWAY = 1'b 0;   
   end

initial 
   begin : process_38
   WHOIS_IPv4_6n_local = 1'b 0;   
   end

initial 
   begin : process_37
   WHOIS_IP_ADDR_local = {128{1'b 0}};   
   end

initial 
   begin : process_36
   WHOIS_START_local = 1'b 0;   
   end

initial 
   begin : process_35
   ADDRB_D2 = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_34
   ADDRB_D = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_33
   ADDRB_INC = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_32
   ADDRB = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_31
   RT_MAC_REPLY_local = {48{1'b 0}};   
   end

initial 
   begin : process_30
   RT_NAK_local = 1'b 0;   
   end

initial 
   begin : process_29
   RT_MAC_RDY_local = 1'b 0;   
   end

initial 
   begin : process_28
   LAST_TIME = {20{1'b 0}};   
   end

initial 
   begin : process_27
   LAST_MAC = {48{1'b 0}};   
   end

initial 
   begin : process_26
   LAST_IPv4_6n = 1'b 0;   
   end

initial 
   begin : process_25
   LAST_IP = {64{1'b 0}};   
   end

initial 
   begin : process_24
   MEMORY_INITIALIZED = 1'b 0;   
   end

initial 
   begin : process_23
   EVENTB2 = 1'b 0;   
   end

initial 
   begin : process_22
   EVENTB1 = 1'b 0;   
   end

initial 
   begin : process_21
   EVENT10 = 1'b 0;   
   end

initial 
   begin : process_20
   EVENT9 = 1'b 0;   
   end

initial 
   begin : process_19
   EVENT8 = 1'b 0;   
   end

initial 
   begin : process_18
   EVENT7 = 1'b 0;   
   end

initial 
   begin : process_17
   EVENT6 = 1'b 0;   
   end

initial 
   begin : process_16
   EVENT5 = 1'b 0;   
   end

initial 
   begin : process_15
   EVENT4 = 1'b 0;   
   end

initial 
   begin : process_14
   EVENT3 = 1'b 0;   
   end

initial 
   begin : process_13
   EVENT2 = 1'b 0;   
   end

initial 
   begin : process_12
   EVENT1 = 1'b 0;   
   end

initial 
   begin : process_11
   RT_IPv4_6n_D = 1'b 0;   
   end

initial 
   begin : process_10
   RT_IP_ADDR_D = {128{1'b 0}};   
   end

initial 
   begin : process_9
   RT_IP_ADDR_MASKED = {64{1'b 0}};   
   end

initial 
   begin : process_8
   IPv6_MASKED = {64{1'b 0}};   
   end

initial 
   begin : process_7
   IPv4_MASKED = {32{1'b 0}};   
   end

initial 
   begin : process_6
   IPv6_SUBNET_MASK = {64{1'b 0}};   
   end

initial 
   begin : process_5
   TIMEDIFF = {20{1'b 0}};   
   end

initial 
   begin : process_4
   TIME_CNTR = {20{1'b 0}};   
   end

initial 
   begin : process_3
   IPv6GATEWAY_REFRESH_TIMER = {12{1'b 0}};   
   end

initial 
   begin : process_2
   IPv4GATEWAY_REFRESH_TIMER = {12{1'b 0}};   
   end

initial 
   begin : process_1
   TIMER1 = 0;   
   end


always @(posedge CLK)
   begin : TIME_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         TIME_CNTR <= {20{1'b 0}};   
         end
      else if (TICK_100MS == 1'b 1 )
         begin
         TIME_CNTR <= TIME_CNTR + 1;   
         end

//  to improve timing, pre-compute TIME_CNTR - REFRESH_PERIOD
      TIMEDIFF <= TIME_CNTR - REFRESH_PERIOD;   
      end
   end

//  prevent flood of ARP requests / Neighbor solicitations being sent out

always @(posedge CLK)
   begin : TIMER1_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         TIMER1 <= 0;   
         end
      else if (WHOIS_START_local == 1'b 1 )
         begin

//  re-arm timer
         TIMER1 <= 10;   
         end
      else if (TICK_100MS == 1'b 1 & TIMER1 > 0 )
         begin
         TIMER1 <= TIMER1 - 1;   
         end
      end
   end

//  gateway MAC refresh timer. 12-bits = 409.6s refresh max

always @(posedge CLK)
   begin : IPv4GATEWAY_REFRESH_TIMER_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         IPv4GATEWAY_REFRESH_TIMER <= 11;   
//  first ARP request approximately 1s after FPGA is configured  
         end
      else if (WHOIS_IPv4GATEWAY == 1'b 1 )
         begin

//  sent the ARP request. awaiting ARP reply. Short timer value to prevent a flood of ARP requests.
//  If no gateway response, another ARP request will be sent in 30 seconds
         IPv4GATEWAY_REFRESH_TIMER <= 301;   
//  use slightly different timers to alleviate repetitive contentions
         end
      else if (RX_SOURCE_ADDR_RDY == 1'b 1 & RX_IPv4_6n == 1'b 1 & RX_SOURCE_IP_ADDR[31:0] == IPv4_GATEWAY_ADDR )
         begin

//  re-arm timer
         IPv4GATEWAY_REFRESH_TIMER <= REFRESH_PERIOD[11:0];   
         end
      else if (TICK_100MS == 1'b 1 & IPv4GATEWAY_REFRESH_TIMER > 0 )
         begin
         IPv4GATEWAY_REFRESH_TIMER <= IPv4GATEWAY_REFRESH_TIMER - 1;   
         end
      end
   end


always @(posedge CLK)
   begin : IPv6GATEWAY_REFRESH_TIMER_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1 | IPv6_ENABLED == 1'b 0)
         begin
         IPv6GATEWAY_REFRESH_TIMER <= 12;   
//  first ARP request approximately 1s after FPGA is configured  
         end
      else if (WHOIS_IPv6GATEWAY == 1'b 1 )
         begin

//  sent the ARP request. awaiting ARP reply. Short timer value to prevent a flood of ARP requests
//  If no gateway response, another ARP request will be sent in 30 seconds
         IPv6GATEWAY_REFRESH_TIMER <= 302;   
//  use slightly different timers to alleviate repetitive contentions
         end
      else if (RX_SOURCE_ADDR_RDY == 1'b 1 & RX_IPv4_6n == 1'b 0 &  RX_SOURCE_IP_ADDR == IPv6_GATEWAY_ADDR )
         begin

//  re-arm timer
         IPv6GATEWAY_REFRESH_TIMER <= REFRESH_PERIOD[11:0];   
         end
      else if (TICK_100MS == 1'b 1 & IPv4GATEWAY_REFRESH_TIMER > 0 )
         begin
         IPv6GATEWAY_REFRESH_TIMER <= IPv6GATEWAY_REFRESH_TIMER - 1;   
         end
      end
   end

// //-- NEW QUERY IP CHECK ---------------------------------------------------
//  Is target IP local or remote? If remote, the Gateway is the next hop 
//  -> search for Gateway MAC address instead.

always @(posedge CLK)
   begin : IPv6_SUBNET_MASK_GEN
   if (CLK == 1'b 1)
      begin

      for (j = 64; j <= 127; j = j + 1)
         begin
         if (j >= IPv6_SUBNET_PREFIX_LENGTH)
            begin
            IPv6_SUBNET_MASK[127 - j] <= 1'b 0;   
            end
         else
            begin
            IPv6_SUBNET_MASK[127 - j] <= 1'b 1;   
            end
         end
      end
   end


always @(posedge CLK)
   begin : LATCH_RT_IP_GEN
   if (CLK == 1'b 1)
      begin
      IPv4_MASKED <= IPv4_ADDR & IPv4_SUBNET_MASK;   
      IPv6_MASKED <= IPv6_ADDR[63:0] & IPv6_SUBNET_MASK;   
//  no need for the upper 64-bits

//  new request
      if (STATE_B == 0 & RT_REQ_RTS == 1'b 1)
         begin

//  idle + new query. freeze input information during the query 
//  just in case two requests are very close to eachother)
         if (RT_IPv4_6n == 1'b 1)
            begin
            RT_IP_ADDR_MASKED[31:0] <= RT_IP_ADDR[31:0] & IPv4_SUBNET_MASK;   
            end
         else if (IPv6_ENABLED == 1'b 1 )
            begin

//  IPv6
            RT_IP_ADDR_MASKED <= RT_IP_ADDR[63:0] & IPv6_SUBNET_MASK;   
            end
         RT_IP_ADDR_D <= RT_IP_ADDR;   
         RT_IPv4_6n_D <= RT_IPv4_6n;   

//  process events 1 CLK before use (for better timing)
         if (RT_IP_ADDR[31:24] >= 224 & RT_IP_ADDR[31:24] <= 239)
            begin
            EVENT1 <= 1'b 1;   
            end
         else
            begin
            EVENT1 <= 1'b 0;   
            end
         if (RT_IP_ADDR[31:0] == 32'h FF_FF_FF_FF)
            begin
            EVENT2 <= 1'b 1;   
            end
         else
            begin
            EVENT2 <= 1'b 0;   
            end
         if (RT_IP_ADDR[31:0] == LAST_IP[31:0] & LAST_IPv4_6n == 1'b 1 & EVENTB1 == 1'b 1)
            begin
            EVENT3 <= 1'b 1;   
            end
         else
            begin
            EVENT3 <= 1'b 0;   
            end
         if (RT_IP_ADDR[31:0] == IPv4_GATEWAY_ADDR & GATEWAYv4_MAC_ADDR != 0)
            begin
            EVENT4 <= 1'b 1;   
            end
         else
            begin
            EVENT4 <= 1'b 0;   
            end
         if (RT_IP_ADDR[31:0] == 32'h 7F000001 | RT_IP_ADDR[31:0] == IPv4_ADDR)
            begin
            EVENT5 <= 1'b 1;   
            end
         else
            begin
            EVENT5 <= 1'b 0;   
            end
         if (RT_IPv4_6n == 1'b 0 & RT_IP_ADDR[127:120] == 8'h FF)
            begin
            EVENT6 <= 1'b 1;   
            end
         else
            begin
            EVENT6 <= 1'b 0;   
            end
         if (RT_IP_ADDR[127:112] == 16'h FE80 & RT_IP_ADDR[127:64] != IPv6_ADDR[127:64])
            begin
            EVENT7 <= 1'b 1;   
            end
         else
            begin
            EVENT7 <= 1'b 0;   
            end
         if (RT_IP_ADDR[63:0] == LAST_IP[63:0] & LAST_IPv4_6n == 1'b 0 & EVENTB1 == 1'b 1)
            begin
            EVENT8 <= 1'b 1;   
            end
         else
            begin
            EVENT8 <= 1'b 0;   
            end
         if (RT_IP_ADDR[63:0] == IPv6_GATEWAY_ADDR[63:0] & GATEWAYv6_MAC_ADDR != 0)
            begin
            EVENT9 <= 1'b 1;   
            end
         else
            begin
            EVENT9 <= 1'b 0;   
            end
         if (RT_IP_ADDR[63:0] == 64'h 0000000000000001 | RT_IP_ADDR[63:0] == IPv6_ADDR[63:0])
            begin
            EVENT10 <= 1'b 1;   
            end
         else
            begin
            EVENT10 <= 1'b 0;   
            end
         end
      end
   end


always @( TIMEDIFF or LAST_TIME ) 
EVENTB1 = ((TIMEDIFF < LAST_TIME) | (TIMEDIFF[19] == 1'b 1) & (LAST_TIME[19] == 1'b 0)) ? 1'b 1 : 1'b 0; 

//  '1' when LAST_TIME is recent (i.e. occurred less than refresh period)
//  Code is a bit tricky because of the wrap-around unsigned time
//  Also because we rephrased this time comparison for better timing (TIMEDIFF is pipelined already)

always @( TIMEDIFF or IP_KEY1_TIME ) 
EVENTB2 = ((TIMEDIFF < IP_KEY1_TIME) | (TIMEDIFF[19] == 1'b 1) & (IP_KEY1_TIME[19] == 1'b 0)) ? 1'b 1 : 1'b 0; 

//  '1' when record found in database is recent enough, '0' when record is too old 
//  accept new routing queries when idle 
assign RT_CTS = STATE_B == 0 ? MEMORY_INITIALIZED : 1'b 0; 

// --//-- B-SIDE STATE MACHINE ---------------------------------------
// -- B-side of the block RAM used for (a) block RAM initialization and (b) look-up table

always @( ADDRB ) 
ADDRB_INC = ADDRB + 1; 

always @(posedge CLK)
   begin : STATE_MACHINE_B_001
   if (CLK == 1'b 1)
      begin
      ADDRB_D <= ADDRB;   
//  1 CLK delay to read data from the block RAM.
      ADDRB_D2 <= ADDRB_D;   
//  1 CLK delay to read data from the block RAM.
      STATE_B_D <= STATE_B;   
      STATE_B_D2 <= STATE_B_D;   
      STATE_B_D3 <= STATE_B_D2;   
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0 &  STATE_B != 8)
         begin
         STATE_B <= 8;   
//  start with clearing the RAMB (could remember old entries?)
         RT_MAC_REPLY_local <= {48{1'b 0}};   
         RT_MAC_RDY_local <= 1'b 0;   
         ADDRB <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
         WEB <= 1'b 1;   
         end
      else if (STATE_B == 8 )
         begin

//  one-time RAMB initialization. Scan through all the block RAM addresses 0 - 127
         if (ADDRB_INC[ADDR_WIDTH - 1] == 1'b 1)
            begin

//  done.
            MEMORY_INITIALIZED <= 1'b 1;   
            STATE_B <= 0;   
            WEB <= 1'b 0;   
            end
         else
            begin
            ADDRB <= ADDRB + 1;   
            DIB[112 + ADDR_WIDTH:113] <= ADDRB;   

//  trick so that first entry (oldest timestamp) will be at address 0 (to minimize the search time)
            end
         end
      else if (STATE_B == 0 )
         begin

//  idle
         ADDRB <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
         RT_MAC_RDY_local <= 1'b 0;   
//  clear
         if (RT_REQ_RTS == 1'b 1)
            begin

//  new query. (1 CLK duration)
            STATE_B <= 1;   
            end
         end
      else if (STATE_B == 1 )
         begin

//  In the several cases below, there is no need for a table search. STATE_B goes back to zero
         if (RT_IPv4_6n_D == 1'b 1)
            begin
            if (EVENT1 == 1'b 1)
               begin

//  new 12/21/15 AZ
//  IPv4 multicast destination
               RT_MAC_REPLY_local[47:24] <= 24'h 01_00_5E;   
               RT_MAC_REPLY_local[23:0] <= {1'b 0, RT_IP_ADDR_D[22:0]};   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT2 == 1'b 1 )
               begin

//  Broadcast IP 255.255.255.255
               RT_MAC_REPLY_local <= 48'h FF_FF_FF_FF_FF_FF;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (RT_IP_ADDR_MASKED[31:0] != IPv4_MASKED | EVENT4 == 1'b 1 )
               begin

//  remote (WAN) address. substitute Gateway IP
//  (b) Gateway IPv4
//  Do not forward IP broadcast messages to the WAN 
               RT_MAC_REPLY_local <= GATEWAYv4_MAC_ADDR;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT3 == 1'b 1 )
               begin

//  (a) same as last and last information is recent. No need to go further. Same reply. 
               RT_MAC_REPLY_local <= LAST_MAC;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT5 == 1'b 1 )
               begin

//  (c) local host 127.0.0.1. Local loopback
               RT_MAC_REPLY_local <= MAC_ADDR;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else
               begin
               STATE_B <= 2;   
               ADDRB <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
//  prepare to read in STATE_B = 3
               end
            end
         else if (IPv6_ENABLED == 1'b 1 )
            begin
            if (EVENT6 == 1'b 1)
               begin

//  IPv6 multicast destination 
               RT_MAC_REPLY_local[47:32] <= 16'h 33_33;   
               RT_MAC_REPLY_local[31:0] <= RT_IP_ADDR_D[31:0];   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT9 == 1'b 1 | EVENT7 == 1'b 1 | 
      RT_IP_ADDR_D[127:112] == 16'h FE80 & RT_IP_ADDR_MASKED[63:0] != IPv6_MASKED )
               begin

//  *042918
//  unicast destination address, different network/subnet -> remote (WAN) address. substitute Gateway IP
               RT_MAC_REPLY_local <= GATEWAYv6_MAC_ADDR;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT8 == 1'b 1 )
               begin

//  (a) same as last and last information is recent. No need to go further. Same reply. 
               RT_MAC_REPLY_local <= LAST_MAC;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else if (EVENT10 == 1'b 1 )
               begin

//  (c) Local loopback
               RT_MAC_REPLY_local <= MAC_ADDR;   
               RT_MAC_RDY_local <= 1'b 1;   
               STATE_B <= 0;   
//  back to idle
               end
            else
               begin
               STATE_B <= 2;   
               ADDRB <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
//  prepare to read in STATE_B = 3
               end
            end
         end
      else if (STATE_B == 2 )
         begin

//  SEARCH TABLE
         STATE_B <= 3;   
//  scan routing table from the bottom
         ADDRB <= ADDRB + 1;   
//  go from 0 to 1
         end
      else if (STATE_B == 3 )
         begin

//  scan records 0 - 127 or until we find the target IP address
//  is there a match with the query?
         if (IP_KEY1_MATCH == 1'b 1)
            begin

//  found a match
            RT_MAC_REPLY_local <= IP_KEY1_MAC;   
            RT_MAC_RDY_local <= 1'b 1;   
            STATE_B <= 0;   
//  back to idle
            end
         else if (ADDRB_D2[ADDR_WIDTH - 1] == 1'b 1 )
            begin

//  no match found. reached end of range and yet no match.
//  note STATE_B=3 is extended three more clocks to wait for the last possible key match
//  send out an ARP request IF some conditions are met
            STATE_B <= 0;   
//  back to idle

//  scan until we find the Target IP address
            end
         else
            begin
            ADDRB <= ADDRB + 1;   
//  just look up the IP key to scan fast
            end
         end
      end
   end

assign RT_MAC_RDY = RT_MAC_RDY_local; 
assign RT_NAK = RT_NAK_local; 
assign RT_MAC_REPLY = RT_MAC_REPLY_local; 

always @(posedge CLK)
   begin : STATE_MACHINE_B_010
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0)
         begin
         WHOIS_START_local <= 1'b 0;   
         end
      else if (STATE_B == 3 & IP_KEY1_MATCH == 1'b 1 )
         begin

//  found a match
         if (EVENTB2 == 1'b 0)
            begin

//  If the record is too old, send another ARP request to refresh the table
            WHOIS_IPv4_6n_local <= RT_IPv4_6n_D;   
            WHOIS_START_local <= 1'b 1;   
            if (RT_IPv4_6n_D == 1'b 1)
               begin

//  IPv4
               WHOIS_IP_ADDR_local[31:0] <= RT_IP_ADDR_D[31:0];   
               WHOIS_IP_ADDR_local[127:32] <= {96{1'b 0}};   
               end
            else if (IPv6_ENABLED == 1'b 1 )
               begin

//  IPv6
               WHOIS_IP_ADDR_local[63:0] <= RT_IP_ADDR_D[63:0];   
               WHOIS_IP_ADDR_local[127:64] <= RT_IP_ADDR_D[127:64];   
               end
            end
         end
      else if (STATE_B == 3 & ADDRB_D2[ADDR_WIDTH - 1] == 
      1'b 1 )
         begin

//  no. reached end of range and yet no match
//  send out an ARP request IF some conditions are met
         if (RT_IP_ADDR_D[63:0] != WHOIS_IP_ADDR_local[63:0] | RT_IPv4_6n_D != WHOIS_IPv4_6n_local | TIMER1 == 0)
            begin

//  different address from last ARP request
//  OR elapsed enough time since last similar ARP request
            WHOIS_IPv4_6n_local <= RT_IPv4_6n_D;   
            WHOIS_START_local <= 1'b 1;   
            if (RT_IPv4_6n_D == 1'b 1)
               begin

//  IPv4
               WHOIS_IP_ADDR_local[31:0] <= RT_IP_ADDR_D[31:0];   
               WHOIS_IP_ADDR_local[127:32] <= {96{1'b 0}};   
               end
            else if (IPv6_ENABLED == 1'b 1 )
               begin

//  IPv6
               WHOIS_IP_ADDR_local <= RT_IP_ADDR_D;   
               end
            end
         end
      else if (STATE_B == 0 & IPv4GATEWAY_REFRESH_TIMER == 0 & WHOIS_IPv4GATEWAY == 1'b 0 )
         begin

//  refresh gateway IPv4 MAC 
         WHOIS_IP_ADDR_local[31:0] <= IPv4_GATEWAY_ADDR;   
         WHOIS_IP_ADDR_local[127:32] <= {96{1'b 0}};   
         WHOIS_IPv4_6n_local <= 1'b 1;   
         WHOIS_START_local <= 1'b 1;   
         WHOIS_IPv4GATEWAY <= 1'b 1;   
         end
      else if (IPv6_ENABLED == 1'b 1 & STATE_B == 0 & 
      IPv6GATEWAY_REFRESH_TIMER == 0 & WHOIS_IPv6GATEWAY == 1'b 0 )
         begin

//  refresh gateway IPv6 MAC
         WHOIS_IP_ADDR_local <= IPv6_GATEWAY_ADDR;   
         WHOIS_IPv4_6n_local <= 1'b 0;   
         WHOIS_START_local <= 1'b 1;   
         WHOIS_IPv6GATEWAY <= 1'b 1;   
         end
      else
         begin
         WHOIS_START_local <= 1'b 0;   
         WHOIS_IPv4GATEWAY <= 1'b 0;   
         WHOIS_IPv6GATEWAY <= 1'b 0;   
         end
      end
   end

assign WHOIS_START = WHOIS_START_local; 
assign WHOIS_IP_ADDR = WHOIS_IP_ADDR_local; 
assign WHOIS_IPv4_6n = WHOIS_IPv4_6n_local; 

//  break down state machine into smaller parts (otherwise timing is bad)

always @(posedge CLK)
   begin : STATE_MACHINE_B_002
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0)
         begin
         LAST_IP <= {64{1'b 0}};   
         LAST_IPv4_6n <= 1'b 0;   
         LAST_MAC <= {48{1'b 0}};   
         LAST_TIME <= {20{1'b 0}};   
         end
      else if (STATE_B_D3 == 3 )
         begin

//  scan records 0 - 127 or until we find the target IP address
//  is there a match with the query?
         if (IP_KEY1_MATCH == 1'b 1)
            begin

//  yes!
//  remember last valid response just in case someone asks again (saves time)
            LAST_IP <= RT_IP_ADDR_D[63:0];   
            LAST_IPv4_6n <= RT_IPv4_6n_D;   
            LAST_MAC <= IP_KEY1_MAC;   
            LAST_TIME <= IP_KEY1_TIME;   
            end
         end
      end
   end


always @(posedge CLK)
   begin : STATE_MACHINE_B_003
   if (CLK == 1'b 1)
      begin

// if (STATE_B = 3) and (ADDRB(ADDR_WIDTH-1) = '1') and ((RT_IP_ADDR_D(63 downto 0) /= DOB(63 downto 0)) or (RT_IPv4_6n_D /= DOB(112))) then 
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0 & STATE_B != 8)
         begin
         RT_NAK_local <= 1'b 0;   
//  clear
         end
      else if (STATE_B == 3 & IP_KEY1_MATCH == 1'b 0 & ADDRB_D2[ADDR_WIDTH - 1] == 1'b 1 )
         begin

//  *080918
//  scan records 0 - 127 or until we find the target IP address
//  no. reached end of range and yet no match
//  send a NAK to the caller
         RT_NAK_local <= 1'b 1;   
         end
      else
         begin
         RT_NAK_local <= 1'b 0;   
//  clear
         end
      end
   end

// //-- ROUTING TABLE ---------------------------------------------------
//  Each entry comprises 133 bits: 64-bit IP address (full IPv4 or the local part of IPv6) + 1-bit IPversion + 48-bit MAC address + 20-bit TIME  

always @( SYNC_RESET ) 
   ENA = SYNC_RESET == 1'b 1 ? 1'b 0 : 1'b 1; 
//  to prevent warnings in modelsim

always @( SYNC_RESET ) 
   ENB = SYNC_RESET == 1'b 1 ? 1'b 0 : 1'b 1; 

//  split into narrower 18Kb BRAMs for slightly better timing on Xilinx (marginal improvement 070918)
//  original: one 133 bit-wide BRAM

bram_dp2 #(
      .DATA_WIDTHA ( 5 ),
      .ADDR_WIDTHA ( ADDR_WIDTH - 1 ),
      
//  2^(ADDR_WIDTH-1) entries 
      .DATA_WIDTHB ( 5 ),
      .ADDR_WIDTHB ( ADDR_WIDTH - 1 )
) BRAM_DP2_001b (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[ADDR_WIDTH - 2:0]),
          .DIA(DIA[132:128]),
          .OEA(1'b 1),
          .DOA(DOA[132:128]),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[ADDR_WIDTH - 2:0]),
          .DIB(DIB[132:128]),
          .OEB(1'b 1),
          .DOB(DOB[132:128])
);

genvar i;
generate
   for (i = 0; i <= 3; i = i + 1) begin : IP_KEY1_MATCH_DETECT_001
      always @(posedge CLK) begin
   

//  break 64-bit comparison into 4*16-bit comparisons
//  A side      
         if (DOA[16 * i + 15:16 * i] == IP_KEY1[16 * i + 15:16 * i]) begin
            IP_KEY1_AMATCH[i] <= 1'b 1;   
         end else begin
            IP_KEY1_AMATCH[i] <= 1'b 0;   
         end
//  B side 
         if (DOB[16 * i + 15:16 * i] == IP_KEY1[16 * i + 15:16 * i]) begin
            IP_KEY1_BMATCH[i] <= 1'b 1;   
         end else begin
            IP_KEY1_BMATCH[i] <= 1'b 0;   
         end
      end  
   end
endgenerate

always @(posedge CLK)
   begin
      begin
         DOA_D <= DOA;   
         DOB_D <= DOB;   


//  break 64-bit comparison into 4*16-bit comparisons
   //  A side

         if (DOA[112] == IP_KEY1[64])  begin
            IP_KEY1_AMATCH[4] <= 1'b 1;   
         end else begin
            IP_KEY1_AMATCH[4] <= 1'b 1;   
         end

   //  B side

         if (DOB[112] == IP_KEY1[64]) begin
            IP_KEY1_BMATCH[4] <= 1'b 1;   
         end else begin
            IP_KEY1_BMATCH[4] <= 1'b 1;   
         end
      end
   end

//  for timing purposes pipeline the large comparisons into smaller subsets
generate
   for (i = 0; i <= 3; i = i + 1) begin : IP_KEY2_MATCH_DETECT_001
      always @(posedge CLK) begin
      //  break 64-bit comparison into 4*16-bit comparisons
      //  A side
         if (DOA[16 * i + 15:16 * i] == IP_KEY2[16 * i + 15:16 * i]) begin
            IP_KEY2_AMATCH[i] <= 1'b 1;   
         end else begin
            IP_KEY2_AMATCH[i] <= 1'b 0;   
         end
      //  B side
         if (DOB[16 * i + 15:16 * i] == IP_KEY2[16 * i + 15:16 * i]) begin
            IP_KEY2_BMATCH[i] <= 1'b 1;   
         end else begin
            IP_KEY2_BMATCH[i] <= 1'b 0;   
         end
      end
   end
endgenerate

always @(posedge CLK) begin
//  break 64-bit comparison into 4*16-bit comparisons
//  A side

      if (DOA[112] == IP_KEY2[64]) begin
         IP_KEY2_AMATCH[4] <= 1'b 1;   
      end else begin
         IP_KEY2_AMATCH[4] <= 1'b 1;   
      end

//  B side

      if (DOB[112] == IP_KEY2[64]) begin
         IP_KEY2_BMATCH[4] <= 1'b 1;   
      end else begin
         IP_KEY2_BMATCH[4] <= 1'b 1;   
      end
end

//  same for zero address. break into 4*16 comparisons for timing
generate
   for (i = 0; i <= 3; i = i + 1) begin : ZERO_IP_MATCH_DETECT_001
      always @(posedge CLK) begin
//  break 64-bit comparison into 4*16-bit comparisons
         if (DOA[16 * i + 15:16 * i] == 16'h 0000) begin
               ZERO_IP_AMATCH[i] <= 1'b 1;   
         end else begin
               ZERO_IP_AMATCH[i] <= 1'b 0;   
         end
      end
   end
endgenerate
// //-- KEY MATCH ---------------------------------------------------

always @( RT_IPv4_6n_D or RT_IP_ADDR_D ) 
IP_KEY1 = {RT_IPv4_6n_D, RT_IP_ADDR_D[63:0]}; 

always @( RX_IPv4_6n_D or RX_SOURCE_IP_ADDR_D ) 
IP_KEY2 = {RX_IPv4_6n_D, RX_SOURCE_IP_ADDR_D[63:0]}; 

//  Since both A and B sides of the block RAM are independently searching for IP address keys,
//  it will save time if we check both A and B outputs for match.
//  IP_KEY_MATCH and IP_KEY1_ADDR valid during STATE_X_D3		

always @(posedge CLK)
   begin : IP_KEY1_MATCH_DETECT_002
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         IP_KEY1_MATCH <= 1'b 0;   
         IP_KEY1_MAC <= {48{1'b 0}};   
         IP_KEY1_TIME <= {20{1'b 0}};   
         end
      else if ((STATE_B_D2 == 2 | STATE_B_D2 == 3) & IP_KEY1_BMATCH == 5'b 11111 )
         begin

//  *052419
//  found a match for IP_KEY1 at ADDRB_D2 while scanning B-side
         IP_KEY1_MATCH <= 1'b 1;   
         IP_KEY1_MAC <= DOB_D[111:64];   
         IP_KEY1_TIME <= DOB_D[132:113];   
         end
      else if (STATE_A_D2 == 3 & IP_KEY1_AMATCH == 5'b 11111 )
         begin

//  found a match for IP_KEY1 at ADDRA_D2 while scanning A-side
         IP_KEY1_MATCH <= 1'b 1;   
         IP_KEY1_MAC <= DOA_D[111:64];   
         IP_KEY1_TIME <= DOA_D[132:113];   
         end
      else
         begin
         IP_KEY1_MATCH <= 1'b 0;   
         end
      end
   end

//  IP_KEY_MATCH and IP_KEY2_ADDR valid during STATE_X_D3		

always @(posedge CLK)
   begin : IP_KEY2_MATCH_DETECT_002
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         IP_KEY2_MATCH <= 1'b 0;   
         IP_KEY2_ADDR <= {(ADDR_WIDTH - 2 - 0 + 1){1'b 0}};   
         end
      else if (STATE_B_D2 == 3 & IP_KEY2_BMATCH == 5'b 11111 )
         begin

//  found a match for IP_KEY2 at ADDRB_D2 while scanning B-side
         IP_KEY2_MATCH <= 1'b 1;   
         IP_KEY2_ADDR <= ADDRB_D2[ADDR_WIDTH - 2:0];   
         end
      else if (STATE_A_D2 == 3 & IP_KEY2_AMATCH == 5'b 11111 )
         begin

//  found a match for IP_KEY2 at ADDRA_D2 while scanning A-side
         IP_KEY2_MATCH <= 1'b 1;   
         IP_KEY2_ADDR <= ADDRA_D2[ADDR_WIDTH - 2:0];   
         end
      else
         begin
         IP_KEY2_MATCH <= 1'b 0;   
         end
      end
   end

// //-- NEW MAC/IP ADDRESSES ---------------------------------------------------
//  Received another entry (decoded from received an IP or ARP response packet)

always @(posedge CLK)
   begin : NEW_ENTRY_001
   if (CLK == 1'b 1)
      begin

//  new entry
      if (STATE_A == 0 & RX_SOURCE_ADDR_RDY == 1'b 1)
         begin

//  idle + new entry. freeze input information during the processing 
//  just in case two requests are very close to eachother.
         RX_SOURCE_MAC_ADDR_D <= RX_SOURCE_MAC_ADDR;   
         RX_SOURCE_IP_ADDR_D <= RX_SOURCE_IP_ADDR;   
         RX_IPv4_6n_D <= RX_IPv4_6n;   
         if (RX_IPv4_6n == 1'b 1)
            begin
            RX_SOURCE_IP_ADDR_MASKED[31:0] <= RX_SOURCE_IP_ADDR[31:0] & IPv4_SUBNET_MASK;   
            end
         else if (IPv6_ENABLED == 1'b 1 )
            begin

//  IPv6
            RX_SOURCE_IP_ADDR_MASKED <= RX_SOURCE_IP_ADDR[63:0] & IPv6_SUBNET_MASK;   
            end
         end

//  special case/shortcut: detect Gateway4 MAC address immediately (saves time instead of searching)
      if (SYNC_RESET == 1'b 1)
         begin
         GATEWAYv4_MAC_ADDR <= {48{1'b 0}};   
         end
      else if (RX_SOURCE_ADDR_RDY == 1'b 1 & RX_IPv4_6n == 1'b 1 & RX_SOURCE_IP_ADDR[31:0] == IPv4_GATEWAY_ADDR )
         begin
         GATEWAYv4_MAC_ADDR <= RX_SOURCE_MAC_ADDR;   
         end

//  special case/shortcut: detect Gateway6 MAC address immediately (saves time instead of searching)
      if (SYNC_RESET == 1'b 1)
         begin
         GATEWAYv6_MAC_ADDR <= {48{1'b 0}};   
         end
      else if (RX_SOURCE_ADDR_RDY == 1'b 1 & IPv6_ENABLED == 1'b 1 & RX_IPv4_6n == 1'b 0 & RX_SOURCE_IP_ADDR == IPv6_GATEWAY_ADDR )
         begin
         GATEWAYv6_MAC_ADDR <= RX_SOURCE_MAC_ADDR;   
         end
      end
   end

// //-- A-SIDE STATE MACHINE ---------------------------------------
//  A-side of the block RAM used for (a) finding out the oldest entry and (b) save MAC/IP/timestamp
//  based on received packets (ARP response or IP)

always @( TIMEDIFF or LAST_RX_TIME ) 
EVENTA1 = ((TIMEDIFF < LAST_RX_TIME) | (TIMEDIFF[19] == 1'b 1) & (LAST_RX_TIME[19] == 1'b 0)) ? 1'b 1 : 1'b 0; 

//  '1' when LAST_RX_TIME is recent (i.e. occurred less than refresh period)
//  Code is a bit tricky because of the wrap-around unsigned time
//  Also because we rephrased this time comparison for better timing (TIMEDIFF is pipelined already)

always @(posedge CLK)
   begin : STATE_MACHINE_A_GEN
   if (CLK == 1'b 1)
      begin
      ADDRA_D <= ADDRA;   
      ADDRA_D2 <= ADDRA_D;   
      STATE_A_D <= STATE_A;   
      STATE_A_D2 <= STATE_A_D;   
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0)
         begin
         STATE_A <= 0;   
         WEA <= 1'b 0;   
         DIA <= {133{1'b 0}};   
         ADDRA <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
         LAST_RX_MAC <= {48{1'b 0}};   
         LAST_RX_IP <= {128{1'b 0}};   
         LAST_RX_TIME <= {20{1'b 0}};   
         end
      else if (STATE_A == 0 )
         begin
         WEA <= 1'b 0;   
         if (RX_SOURCE_ADDR_RDY == 1'b 1)
            begin

//  idle + new entry. 
            STATE_A <= 1;   
            ADDRA <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
            end
         end
      else if (STATE_A == 1 )
         begin
         if (RX_IPv4_6n_D == 1'b 1)
            begin

//  SKIP LOOKUP CASES, don't waste time re-entering the information.
            if (RX_SOURCE_IP_ADDR_D[31:0] == 0)
               begin

//  (a) meaningless zero IP address -> skip
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[31:0] == 32'h 7F000001 )
               begin

//  (b) meaningless localhost address -> skip
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[31:0] == IPv4_ADDR )
               begin

//  (c) meaningless self address -> skip
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[31:0] == LAST_RX_IP[31:0] & LAST_RX_IPv4_6n == 1'b 1 & EVENTA1 == 1'b 1 )
               begin

//  (d) duplicate entry. We just wrote this one.
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_MASKED[31:0] != IPv4_MASKED )
               begin

//  (e) WAN address. No need to store the MAC address because it has already
//  been replaced by that of the gateway.
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[31:0] == IPv4_GATEWAY_ADDR )
               begin

//  (f) special case: gateway address is handled by a shortcut to minimize search time.
               STATE_A <= 0;   
//  go back to idle.

//  SEARCH ROUTING TABLE
//  search routing table by IP address key.
               end
            else
               begin
               STATE_A <= 2;   
               end
            end
         else if (IPv6_ENABLED == 1'b 1 & RX_IPv4_6n_D == 1'b 0 )
            begin

//  SKIP LOOKUP CASES, don't waste time re-entering the information.
            if (RX_SOURCE_IP_ADDR_D == 0)
               begin

//  (a) meaningless zero IP address -> skip
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D == 1 )
               begin

//  (b) meaningless localhost address -> skip
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D == IPv6_ADDR )
               begin

//  (c) meaningless self address -> skip
               STATE_A <= 0;   
//  go back to idle.

// elsif(RX_SOURCE_IP_ADDR_D(63 downto 0) = LAST_RX_IP(63 downto 0)) and (LAST_RX_IPv4_6n = '0') and ((TIME_CNTR - LAST_RX_TIME) < REFRESH_PERIOD) then
//  rephrasing for better timing
               end
            else if (RX_SOURCE_IP_ADDR_D[63:0] == LAST_RX_IP[63:0] & LAST_RX_IPv4_6n == 1'b 0 & TIMEDIFF < LAST_RX_TIME )
               begin

//  (d) duplicate entry. We just wrote this one.
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[127:112] == 16'h FE80 & RX_SOURCE_IP_ADDR_D[111:64] != IPv6_ADDR[111:64] )
               begin

//  (e) WAN unicast address. No need to store the MAC address because it has already
//  been replaced by that of the gateway.
               STATE_A <= 0;   
//  go back to idle.
               end
            else if (RX_SOURCE_IP_ADDR_D[127:112] == 16'h FE80 & RX_SOURCE_IP_ADDR_MASKED[63:0] != IPv6_MASKED )
               begin

//  (f) WAN unicast address. No need to store the MAC address because it has already
//  been replaced by that of the gateway.
               STATE_A <= 0;   
//  go back to idle.

//  SEARCH ROUTING TABLE
//  search routing table by IP address key.
               end
            else
               begin
               STATE_A <= 2;   
               end
            end
         else
            begin
            STATE_A <= 0;   
//  go back to idle. 
            end
         end
      else if (STATE_A == 2 )
         begin

//  needed an extra clock before starting the search
         STATE_A <= 3;   
         ADDRA <= ADDRA + 1;   
         end
      else if (STATE_A == 3 )
         begin

//  scan address range 0 - 128 or until we find the target IP address
         if (IP_KEY2_MATCH == 1'b 1)
            begin

//  found a match
            ADDRA <= {1'b 0, IP_KEY2_ADDR};   
            STATE_A <= 4;   
//  go write the MAC/IP/Timestamp to the routing table
            end
         else if (ADDRA_D2[ADDR_WIDTH - 1] == 1'b 1 )
            begin

//  reached the end of the scan without any key match
//  note STATE_A=3 is extended three more clocks to wait for the last possible key match
//  find the oldest table entry and overwrite it with the newer MAC/IP/Timestamp.
            ADDRA <= {1'b 0, OLDEST_ADDR};   
//  design note: OLDEST_ADDR is only used following a full table scan
            STATE_A <= 4;   
            end
         else if (ADDRA[ADDR_WIDTH - 1] == 1'b 0 )
            begin

//  scan until we find the IP address key
            ADDRA <= ADDRA + 1;   
            end
         end
      else if (STATE_A == 4 )
         begin

//  write IP address  + v4/v6n + MAC address + timestamp. A total of 133 bits 
         WEA <= 1'b 1;   
         DIA[63:0] <= RX_SOURCE_IP_ADDR_D[63:0];   
         DIA[111:64] <= RX_SOURCE_MAC_ADDR_D;   
         DIA[112] <= RX_IPv4_6n_D;   
         DIA[132:113] <= TIME_CNTR;   
         STATE_A <= 0;   

//  remember so that we don't waste time doing successive repetitive write with the same parameters
         LAST_RX_IP <= RX_SOURCE_IP_ADDR_D;   
         LAST_RX_MAC <= RX_SOURCE_MAC_ADDR_D;   
         LAST_RX_IPv4_6n <= RX_IPv4_6n_D;   
         LAST_RX_TIME <= TIME_CNTR;   
         end
      end
   end

// //-- FIND OLDEST ENTRY -----------------------------

always @( DOA ) 
TIME_A = DOA[132:113]; 

always @( DOB ) 
TIME_B = DOB[132:113]; 

always @(posedge CLK)
   begin : OLDEST_DETECT_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1 | MEMORY_INITIALIZED == 1'b 0)
         begin
            OLDEST_TIME <= {20{1'b 0}};   
            OLDEST_ADDR <= {(ADDR_WIDTH - 2 - 0 + 1){1'b 0}};   
            VIRGIN <= 1'b 0;   
         end
      else if (STATE_A == 0 )
         begin
            VIRGIN <= 1'b 0;   
         end
      else if (STATE_A == 3 & ZERO_IP_AMATCH == 4'b 1111 & VIRGIN == 1'b 0 )
         begin

//  virgin record. perfect for use as 'oldest entry'
//  detect virgin record while scanning A side. Never been written to before. Therefore can be
//  used as 'oldest' record. 
            OLDEST_ADDR <= ADDRA_D2[ADDR_WIDTH - 2:0];   
            VIRGIN <= 1'b 1;   
//  lowest address is better (shorter search). Stop updating OLDEST_ADDR
         end
      else if (STATE_A == 3 & IP_KEY2_MATCH == 1'b 0 & ADDRA_D2[ADDR_WIDTH - 1] == 1'b 1 )
         begin

//  reached the end of scan. No IP_KEY2 match
//  oldest entry or virgin entry is overwritten.... thus is no longer the oldest. Reset
            OLDEST_TIME <= TIME_CNTR;   
//  reset time

// 		elsif (STATE_B_D = 3) and (ADDRB_D(1 downto 0)= "10") and (OLDEST_TIME(19 downto 18) = "00") 
// 				and (TIME_B(19 downto 18) = "11") then
// 			-- found older entry (accounting for modulo time) while reading B-side
// 			OLDEST_TIME <= TIME_B;
// 			OLDEST_ADDR <= ADDRB_D(8 downto 2) & "00";
// 		elsif (STATE_B_D = 3) and (ADDRB_D(1 downto 0)= "10") and (OLDEST_TIME > TIME_B) then
// 			-- found older entry while reading B-side
// 			OLDEST_TIME <= TIME_B;
// 			OLDEST_ADDR <= ADDRB_D(8 downto 2) & "00";
         end
      else if (STATE_A == 3 & VIRGIN == 1'b 0 & OLDEST_TIME[19:18] == 2'b 00 & TIME_A[19:18] == 2'b 11 )
         begin

//  found older entry (accounting for modulo time) while reading A-side
//  Note: virgin entry has precedence
            OLDEST_TIME <= TIME_A;   
            OLDEST_ADDR <= ADDRA_D[ADDR_WIDTH - 2:0];   
         end
      else if (STATE_A == 3 & VIRGIN == 1'b 0 & OLDEST_TIME > TIME_A )
         begin

//  found older entry while reading A-side
//  Note: virgin entry has precedence
            OLDEST_TIME <= TIME_A;   
            OLDEST_ADDR <= ADDRA_D[ADDR_WIDTH - 2:0];   
         end
      end
   end

// --// Test Point
// TP(1) <= RT_REQ_RTS;
// TP(2) <= '1' when (STATE_B = 0) else '0';  --RT_CTS 
// TP(3) <= RT_MAC_RDY_local;
// TP(4) <= RT_NAK_local;
// TP(5) <= WHOIS_START_local;
// TP(6) <= RX_SOURCE_ADDR_RDY;
// TP(7) <= '1' when (STATE_A = 0) else '0';
// TP(8) <= '1' when (STATE_A = 3) and (IP_KEY2_MATCH = '1') else '0';
// TP(9) <= '1' when (STATE_A = 3) and (ADDRA_D(7) = '1') else '0';
// TP(10) <= '1' when (STATE_A = 4) else '0';
assign TP[1] = IPv4GATEWAY_REFRESH_TIMER == 0 ? 1'b 1 : 1'b 0; 
assign TP[2] = STATE_B == 0 ? 1'b 1 : 1'b 0; 
assign TP[3] = WHOIS_IPv4GATEWAY; 

// --SREG1 <= OLDEST_ADDR(7 downto 0);
// --SREG2 <= LAST_IP(31 downto 24);
// --SREG3 <= LAST_IP(23 downto 16);
// --SREG4 <= LAST_IP(15 downto 8);
// --SREG5 <= LAST_IP(7 downto 0);
// --SREG6 <= OLDEST_ADDR(7 downto 0);

bram_dp2 #(
    .DATA_WIDTHA ( 32 ),
    .ADDR_WIDTHA ( ADDR_WIDTH - 1 ),
    .DATA_WIDTHB ( 32 ),
    .ADDR_WIDTHB ( ADDR_WIDTH - 1)
)BRAM_DP2_001_BRAM_DP2_00x_0 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[ADDR_WIDTH - 2:0]),
          .DIA(DIA[32 * 0 + 31:32 * 0]),
          .OEA(1'b 1),
          .DOA(DOA[32 * 0 + 31:32 * 0]),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[ADDR_WIDTH - 2:0]),
          .DIB(DIB[32 * 0 + 31:32 * 0]),
          .OEB(1'b 1),
          .DOB(DOB[32 * 0 + 31:32 * 0]));

bram_dp2 #(
    .DATA_WIDTHA ( 32 ),
    .ADDR_WIDTHA ( ADDR_WIDTH - 1 ),
    .DATA_WIDTHB ( 32 ),
    .ADDR_WIDTHB ( ADDR_WIDTH - 1)
) BRAM_DP2_001_BRAM_DP2_00x_1 (.CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[ADDR_WIDTH - 2:0]),
          .DIA(DIA[32 * 1 + 31:32 * 1]),
          .OEA(1'b 1),
          .DOA(DOA[32 * 1 + 31:32 * 1]),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[ADDR_WIDTH - 2:0]),
          .DIB(DIB[32 * 1 + 31:32 * 1]),
          .OEB(1'b 1),
          .DOB(DOB[32 * 1 + 31:32 * 1]));

bram_dp2 #(
    .DATA_WIDTHA ( 32 ),
    .ADDR_WIDTHA ( ADDR_WIDTH - 1 ),
    .DATA_WIDTHB ( 32 ),
    .ADDR_WIDTHB ( ADDR_WIDTH - 1)
) BRAM_DP2_001_BRAM_DP2_00x_2 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[ADDR_WIDTH - 2:0]),
          .DIA(DIA[32 * 2 + 31:32 * 2]),
          .OEA(1'b 1),
          .DOA(DOA[32 * 2 + 31:32 * 2]),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[ADDR_WIDTH - 2:0]),
          .DIB(DIB[32 * 2 + 31:32 * 2]),
          .OEB(1'b 1),
          .DOB(DOB[32 * 2 + 31:32 * 2]));

bram_dp2 #(
    .DATA_WIDTHA ( 32 ),
    .ADDR_WIDTHA ( ADDR_WIDTH - 1 ),
    .DATA_WIDTHB ( 32 ),
    .ADDR_WIDTHB ( ADDR_WIDTH - 1)
) BRAM_DP2_001_BRAM_DP2_00x_3 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),
          .ADDRA(ADDRA[ADDR_WIDTH - 2:0]),
          .DIA(DIA[32 * 3 + 31:32 * 3]),
          .OEA(1'b 1),
          .DOA(DOA[32 * 3 + 31:32 * 3]),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(WEB),
          .ADDRB(ADDRB[ADDR_WIDTH - 2:0]),
          .DIB(DIB[32 * 3 + 31:32 * 3]),
          .OEB(1'b 1),
          .DOB(DOB[32 * 3 + 31:32 * 3]));

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------

// including file with called functions and tasks


endmodule // module ARP_CACHE2_10G

