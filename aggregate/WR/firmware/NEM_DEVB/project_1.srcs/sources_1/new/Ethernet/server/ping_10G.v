/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\ping_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\ping_10G.vhd -ncc -ip
-- Date Created: Sun Nov 27 21:47:31 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2018
// 	Filename:  PING_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 3/4/18
//  Inheritance: 	PING.VHD rev 4, 12/10/15
// 
//  description:  PING protocol, 10Gb, for IPv4 and IPv6 
//  Reads a received IP/ICMP frame on the fly and generates a ping echo (Ethernet format).
//  Any new received frame is presumed to be an ICMP echo (ping) request. Within a few bytes,
//  information is received as to the real protocol associated with the received packet.
//  The ping echo generation is immediately cancelled if 
//  (a) the received packet type is not an IP datagram or IPv6 is not allowed
//  (b) the received IP type is not ICMP/ICMP6
//  (c) invalid unicast destination IP (IPv4 or IPv6)
//  (d) packet size is greater than MAX_PING_SIZE (units = 64-bit words, including IP/ICMP headers)  
//  (e) ICMP incoming packet is not an echo request (ICMP type /= x"0800") or (ICMP6 type /= 128)
//  (f) incorrect IP header checksum (IPv4 only)
//  (g) erroneous MAC frame (incorrect FCS, wrong dest MAC address)
//  Any follow-on received IP frame is discarded while a valid ping response awaits transmission in the elastic buffer.
// -------------------------------------------------------------

module PING_10G (
   CLK,
   SYNC_RESET,
   IP_RX_DATA,
   IP_RX_DATA_VALID,
   IP_RX_SOF,
   IP_RX_EOF,
   IP_RX_WORD_COUNT,
   IP_RX_FRAME_VALID2,
   VALID_UNICAST_DEST_IP,
   VALID_DEST_IP_RDY,
   RX_SOURCE_MAC_ADDR,
   RX_SOURCE_IP_ADDR,
   MAC_ADDR,
   IPv4_ADDR,
   IPv6_ADDR,
   RX_IPv4_6n,
   RX_IP_PROTOCOL,
   RX_IP_PROTOCOL_RDY,
   MAC_TX_DATA,
   MAC_TX_DATA_VALID,
   MAC_TX_EOF,
   MAC_TX_CTS,
   RTS,
   TP);
 
parameter IPv6_ENABLED = 1'b 0;
parameter MAX_PING_SIZE = 8'h FE;

//  0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)

input   CLK; 
input   SYNC_RESET; 
input   [63:0] IP_RX_DATA; 
input   [7:0] IP_RX_DATA_VALID; 
input   IP_RX_SOF; 
input   IP_RX_EOF; 
input   [10:0] IP_RX_WORD_COUNT; 
input   IP_RX_FRAME_VALID2; 
input   VALID_UNICAST_DEST_IP; 
input   VALID_DEST_IP_RDY; 
input   [47:0] RX_SOURCE_MAC_ADDR; 
input   [127:0] RX_SOURCE_IP_ADDR; 
input   [47:0] MAC_ADDR; 
input   [31:0] IPv4_ADDR; 
input   [127:0] IPv6_ADDR; 
input   RX_IPv4_6n; 
input   [7:0] RX_IP_PROTOCOL; 
input   RX_IP_PROTOCOL_RDY; 
output   [63:0] MAC_TX_DATA; 
output   [7:0] MAC_TX_DATA_VALID; 
output   MAC_TX_EOF; 
input   MAC_TX_CTS; 
output   RTS; 
output   [10:1] TP; 

// // CLK, RESET
//  Must be a global clock. No BUFG instantiation within this component.

reg     [63:0] MAC_TX_DATA; 

//  data valid
wire    [7:0] MAC_TX_DATA_VALID; 

//  '1' when sending the last byte in a packet to be transmitted. 
//  Aligned with MAC_TX_DATA_VALID
wire    MAC_TX_EOF; 

//  MAC-generated Clear To Send flow control signal. The user should check that this 
//  signal is high before sending the next MAC_TX_DATA byte. 
wire    RTS; 
wire    [10:1] TP; 

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // STATE MACHINE ------------------
reg     [0:0] STATE; 
reg     INPUT_ENABLED; 
reg     IP_RX_WORD_VALID; 
reg     RX_IPv4_6n0; 
reg     [63:0] IP_RX_DATA_PREVIOUS; 
reg     [63:0] IP_RX_DATA_MOD; 
(* MARK_DEBUG="true" *)reg     [15:0] REPLY_CHECKSUM; 
reg     [7:0] IP_RX_DATA_VALID_D; 
reg     IP_RX_EOF_D; 

// // ELASTIC BUFFER ----------------------
reg     [7:0] WPTR; 
reg     [7:0] WPTR_CONFIRMED; 
reg     WEA; 
(* MARK_DEBUG="true" *)reg     [72:0] DIA; 
(* MARK_DEBUG="true" *)wire    [72:0] DOB; 
reg     [72:0] DOB_PREVIOUS; 
reg     [7:0] RPTR; 
reg     [7:0] BUF_SIZE; 

// // VALIDATE PING REQUEST -----------
reg     VALID_PING_REQ0; 
reg     VALID_PING_REQ; 

// // OUTPUT SECTION -------------------
reg     [7:0] TX_SEQUENCE_CNTR; 
reg     [7:0] TX_SEQUENCE_CNTR_D; 
reg     DOB_SAMPLE_CLK_E; 
reg     DOB_SAMPLE_CLK; 
reg     MAC_TX_CTS_D; 
reg     MAC_TX_CTS_D2; 
reg     MAC_TX_EOF_local; 
reg     [7:0] MAC_TX_DATA_VALID_local; 
reg     RTS_local; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // STATE MACHINE ------------------
//  A state machine is needed as this process is memoryless.
//  State 0 = idle or incoming IP frame being processed. 
//  State 1 = valid ping request. tx packet waiting for tx capacity. Incoming IP frames are discarded.
(* MARK_DEBUG="true" *)reg     [16:0]  REPLY_CHECKSUM_GEN_CKSUM; 

initial 
   begin : process_28
   RTS_local = 1'b 0;   
   end

initial 
   begin : process_27
   MAC_TX_DATA_VALID_local = {8{1'b 0}};   
   end

initial 
   begin : process_26
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_25
   MAC_TX_CTS_D2 = 1'b 0;   
   end

initial 
   begin : process_24
   MAC_TX_CTS_D = 1'b 0;   
   end

initial 
   begin : process_23
   DOB_SAMPLE_CLK = 1'b 0;   
   end

initial 
   begin : process_22
   DOB_SAMPLE_CLK_E = 1'b 0;   
   end

initial 
   begin : process_21
   TX_SEQUENCE_CNTR_D = {8{1'b 0}};   
   end

initial 
   begin : process_20
   TX_SEQUENCE_CNTR = {8{1'b 0}};   
   end

initial 
   begin : process_19
   VALID_PING_REQ = 1'b 0;   
   end

initial 
   begin : process_18
   VALID_PING_REQ0 = 1'b 0;   
   end

initial 
   begin : process_17
   BUF_SIZE = {8{1'b 0}};   
   end

initial 
   begin : process_16
   RPTR = {8{1'b 1}};   
   end

initial 
   begin : process_15
   DOB_PREVIOUS = {73{1'b 0}};   
   end



initial 
   begin : process_13
   DIA = {73{1'b 0}};   
   end

initial 
   begin : process_12
   WEA = 1'b 0;   
   end

initial 
   begin : process_11
   WPTR_CONFIRMED = {8{1'b 0}};   
   end

initial 
   begin : process_10
   WPTR = {8{1'b 0}};   
   end

initial 
   begin : process_9
   IP_RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_8
   IP_RX_DATA_VALID_D = {8{1'b 0}};   
   end

initial 
   begin : process_7
   REPLY_CHECKSUM = {16{1'b 0}};   
   end

initial 
   begin : process_6
   IP_RX_DATA_MOD = {64{1'b 0}};   
   end

initial 
   begin : process_5
   IP_RX_DATA_PREVIOUS = {64{1'b 0}};   
   end

initial 
   begin : process_4
   RX_IPv4_6n0 = 1'b 0;   
   end

initial 
   begin : process_3
   IP_RX_WORD_VALID = 1'b 0;   
   end

initial 
   begin : process_2
   INPUT_ENABLED = 1'b 1;   
   end

initial 
   begin : process_1
   STATE = {1{1'b 0}};   
   end


always @(posedge CLK)
   begin : STATE_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         STATE <= {1{1'b 0}};   
         end
      else if (IP_RX_EOF_D === 1'b 1 & VALID_PING_REQ === 1'b 1 )
         begin

//  event = valid PING request. Ready to send PING reply when tx channel opens.
//  In the mean time, incoming IP frames are discarded.
         STATE <= 1'b 1;   
         end
      else if (MAC_TX_EOF_local === 1'b 1 )
         begin

//  event = successfully sent PING reply. Reopen input
         STATE <= 1'b 0;   
         end
      end
   end


always @( STATE ) 
INPUT_ENABLED = STATE === 0 ? 1'b 1 : 
	1'b 0; 

//  save previous IP word (needed information to swap fields)

always @(posedge CLK)
   begin : IN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         IP_RX_DATA_PREVIOUS <= {64{1'b 0}};   
         end
      else if (IP_RX_DATA_VALID !== 8'h 00 )
         begin
         IP_RX_DATA_PREVIOUS <= IP_RX_DATA;   
         end
      end
   end

// // freeze some parameters at the end of the packet 
//  Reason: we don't want subsequent packets to change this information while we are waiting
//  to send the echo .

always @(posedge CLK)
   begin : FREEZE_001
   if (CLK === 1'b 1)
      begin
      if (IP_RX_EOF === 1'b 1 & INPUT_ENABLED === 1'b 1)
         begin
         RX_IPv4_6n0 <= RX_IPv4_6n;   
         end
      end
   end

// // FIELDS ALTERATIONS --------------------
//  Modify the incoming words on the fly before temporary storage into elastic buffer

always @(posedge CLK)
   begin : IN_002
   if (CLK === 1'b 1)
      begin
      IP_RX_EOF_D <= IP_RX_EOF;   
      IP_RX_DATA_VALID_D <= IP_RX_DATA_VALID;   
      if (SYNC_RESET === 1'b 1 | INPUT_ENABLED === 1'b 0)
         begin
         IP_RX_DATA_MOD <= {64{1'b 0}};   
         end
      else if (RX_IPv4_6n === 1'b 1 )
         begin
         if (IP_RX_WORD_COUNT === 2)
            begin
            IP_RX_DATA_MOD[63:32] <= IP_RX_DATA[63:32];   
            IP_RX_DATA_MOD[31:0] <= IPv4_ADDR;   
//  source is our IP address
            end
         else if (IP_RX_WORD_COUNT === 3 )
            begin
            IP_RX_DATA_MOD[63:32] <= IP_RX_DATA_PREVIOUS[31:0];   
//  swap source/dest IP addresses in response
            IP_RX_DATA_MOD[31:24] <= 8'h 00;   
//  ICMP echo reply IPv4 type
            IP_RX_DATA_MOD[23:16] <= IP_RX_DATA[23:16];   
//  ICMP echo reply IPv4 code
            IP_RX_DATA_MOD[15:0] <= REPLY_CHECKSUM;   
//  ICMP echo reply IPv4 checksum
            end
         else if (IP_RX_DATA_VALID !== 8'h 00 )
            begin
            IP_RX_DATA_MOD <= IP_RX_DATA;   
            end
         end
      else if (IPv6_ENABLED === 1'b 1 & RX_IPv4_6n === 1'b 0 )
         begin
         if (IP_RX_WORD_COUNT === 2)
            begin
            IP_RX_DATA_MOD <= IPv6_ADDR[127:64];   
//  source is our IP address
            end
         else if (IP_RX_WORD_COUNT === 3 )
            begin
            IP_RX_DATA_MOD <= IPv6_ADDR[63:0];   
//  source is our IP address
            end
         else if (IP_RX_WORD_COUNT === 4 )
            begin
            IP_RX_DATA_MOD <= RX_SOURCE_IP_ADDR[127:64];   
//  destination IP
            end
         else if (IP_RX_WORD_COUNT === 5 )
            begin
            IP_RX_DATA_MOD <= RX_SOURCE_IP_ADDR[63:0];   
//  destination IP
            end
         else if (IP_RX_WORD_COUNT === 6 )
            begin
            IP_RX_DATA_MOD <= {16'h 8100, REPLY_CHECKSUM, IP_RX_DATA[31:0]};   
//  modify the ICMP checksum
            end
         else if (IP_RX_DATA_VALID !== 8'h 00 )
            begin
            IP_RX_DATA_MOD <= IP_RX_DATA;   
            end
         end
      end
   end


always @(IP_RX_DATA or RX_IPv4_6n)
   begin : REPLY_CHECKSUM_GEN
   if (RX_IPv4_6n === 1'b 1)
      begin

//  IPv4 
      REPLY_CHECKSUM_GEN_CKSUM = IP_RX_DATA[15:0];   
      REPLY_CHECKSUM_GEN_CKSUM = REPLY_CHECKSUM_GEN_CKSUM + 16'h 0800;   

//  IPv6
      end
   else
      begin
      REPLY_CHECKSUM_GEN_CKSUM = IP_RX_DATA[47:32];   
      REPLY_CHECKSUM_GEN_CKSUM = REPLY_CHECKSUM_GEN_CKSUM - 16'h 0100;   
      end
   if (REPLY_CHECKSUM_GEN_CKSUM[16] === 1'b 1)
      begin
      REPLY_CHECKSUM_GEN_CKSUM = REPLY_CHECKSUM_GEN_CKSUM + 1;   
      end
   REPLY_CHECKSUM <= REPLY_CHECKSUM_GEN_CKSUM[15:0];   
   end

// // ELASTIC BUFFER ----------------------
//  Stores the IP/ICMP frame until validity check is complete and transmission path is open 	

always @(posedge CLK)
   begin : WEA_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         WEA <= 1'b 0;   
         end
      else if (IP_RX_DATA_VALID !== 0 & INPUT_ENABLED === 1'b 1 )
         begin
         WEA <= 1'b 1;   
         end
      else
         begin
         WEA <= 1'b 0;   
         end
      end
   end

//  write pointer management

always @(posedge CLK)
   begin : WPTR_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         WPTR <= {8{1'b 0}};   
         end
      else if (IP_RX_SOF === 1'b 1 )
         begin

//  rewind write pointer 
         WPTR <= {8{1'b 0}};   
         end
      else if (WEA === 1'b 1 )
         begin
         WPTR <= WPTR + 1;   
         end
      end
   end

//  confirm WPTR when valid IP/ICMP request

always @(posedge CLK)
   begin : WPTR_CONFIRMED_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_TX_EOF_local === 1'b 1)
         begin
         WPTR_CONFIRMED <= {8{1'b 0}};   
         end
      else if (IP_RX_EOF_D === 1'b 1 & VALID_PING_REQ === 1'b 1 )
         begin
         WPTR_CONFIRMED <= WPTR + 1;   
         end
      end
   end

//  elastic buffer.
//  18Kbit buffer(s) 

always @( IP_RX_EOF_D or IP_RX_DATA_VALID_D or IP_RX_DATA_MOD ) 
DIA = {IP_RX_EOF_D, IP_RX_DATA_VALID_D, IP_RX_DATA_MOD}; 

bram_dp2 #(
      .DATA_WIDTHA (73),
      .ADDR_WIDTHA (8),
      .DATA_WIDTHB (73),
      .ADDR_WIDTHB (8)
) BRAM_DP2_001 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA),         
//  Port A Write Enable Input
          .ADDRA(WPTR),         
//  Port A 8-bit Address Input
          .DIA(DIA),        
//  Port A 65-bit Data Input
          .OEA(1'b 0),
          .DOA(),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(1'b 0),
          .ADDRB(RPTR),         
//  Port B 8-bit Address Input
          .DIB({73{1'b 0}}),
//  Port B 65-bit Data Input
          .OEB(1'b 1),
          .DOB(DOB)
);

always @( WPTR_CONFIRMED or RPTR ) 
BUF_SIZE = WPTR_CONFIRMED + ~RPTR; 
//  Port B 65-bit Data Output
//  occupied buffer space, in bytes
// // VALIDATE PING REQUEST -----------
//  The ping echo generation is immediately cancelled if 
//  (a) the received packet type is not an IP datagram or IPv6 is not allowed
//  (b) the received IP type is not ICMP/ICMP6
//  (c) invalid unicast destination IP (IPv4 or IPv6)
//  (d) packet size is greater than MAX_PING_SIZE (units = 64-bit words, including IP/ICMP headers)  
//  (e) ICMP incoming packet is not an echo request (ICMP type /= x"0800") or (ICMP6 type /= 128)
//  (f) incorrect IP header checksum (IPv4 only)
//  (g) erroneous MAC frame (incorrect FCS, wrong dest MAC address)

wire CLK_g;

BUFG BUFG_inst2(.I(CLK), .O(CLK_g));
/*   ila_2 ila2(
     .clk(CLK_g),
     .probe0(STATE),
     .probe1(MAC_TX_DATA),
     .probe2(MAC_TX_DATA_VALID),
     .probe3(IP_RX_DATA),
     .probe4(IP_RX_EOF_D),
     .probe5(VALID_PING_REQ),
     .probe6(IP_RX_DATA_VALID),
     .probe7(MAC_TX_EOF),
     .probe8(VALID_PING_REQ0),
     .probe9(TX_SEQUENCE_CNTR_D)
   ); */

always @( IP_RX_DATA_VALID ) 
IP_RX_WORD_VALID = IP_RX_DATA_VALID !== 0 ? 1'b 1 : 
	1'b 0; 

always @(posedge CLK)
   begin : VALIDITY_CHECK_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         VALID_PING_REQ0 <= 1'b 1;   
         end
      else if (IP_RX_SOF === 1'b 1 )
         begin

//  just received first word in an IP frame. Assume validity
         VALID_PING_REQ0 <= 1'b 1;   
         end
      else
         begin
         if (RX_IP_PROTOCOL_RDY === 1'b 1 & RX_IP_PROTOCOL !== 1 & 
      RX_IP_PROTOCOL !== 58)
            begin

//  (b) not ICMP nor ICMPv6
            VALID_PING_REQ0 <= 1'b 0;   
            end
         if (IP_RX_WORD_VALID === 1'b 1 & IP_RX_WORD_COUNT === 3 & 
      RX_IPv4_6n === 1'b 1 & IP_RX_DATA[31:16] !== 16'h 0800)
            begin

//  (e) IPv4 and ICMP incoming packet is not an echo request (ICMP type /= 8)
            VALID_PING_REQ0 <= 1'b 0;   
            end
         if (VALID_DEST_IP_RDY === 1'b 1 & VALID_UNICAST_DEST_IP === 1'b 0)
            begin

//  (c) invalid destination IP (IPv4 or IPv6)
            VALID_PING_REQ0 <= 1'b 0;   
            end
         if (IP_RX_WORD_VALID === 1'b 1 & IP_RX_WORD_COUNT === 6 & 
      RX_IPv4_6n === 1'b 0 & (IP_RX_DATA[63:48] !== 16'h 8000 | 
      IPv6_ENABLED === 1'b 0))
            begin

//  (e) IPv6 and ICMP6 incoming packet is not an echo request (ICMP6 type /= 128)
            VALID_PING_REQ0 <= 1'b 0;   
            end
         if (IP_RX_WORD_VALID === 1'b 1 & IP_RX_WORD_COUNT[7:0] > MAX_PING_SIZE)
            begin

//  (d) packet size is greater than MAX_PING_SIZE (units = 64-bit words, including IP/ICMP headers) 
            VALID_PING_REQ0 <= 1'b 0;   
            end
         end
      end
   end


always @( VALID_PING_REQ0 or IP_RX_FRAME_VALID2 ) 
VALID_PING_REQ = VALID_PING_REQ0 & IP_RX_FRAME_VALID2; 
//  combine with the other checks done in parsing.vhd

// // OUTPUT SECTION -------------------
//  send request to send when a valid IP/ICMP echo response is ready

always @( BUF_SIZE ) 
RTS_local = BUF_SIZE !== 0 ? 1'b 1 : 
	1'b 0; 
assign RTS = RTS_local; 

//  Output MAC frame generation

always @(posedge CLK)
   begin : RPTR_GEN_001
   if (CLK === 1'b 1)
      begin
      DOB_SAMPLE_CLK <= DOB_SAMPLE_CLK_E;   
//  latency to read from RAM
      TX_SEQUENCE_CNTR_D <= TX_SEQUENCE_CNTR;   
      MAC_TX_CTS_D <= MAC_TX_CTS;   
      MAC_TX_CTS_D2 <= MAC_TX_CTS_D;   
      if (SYNC_RESET === 1'b 1 | MAC_TX_EOF_local === 1'b 1)
         begin
         TX_SEQUENCE_CNTR <= {8{1'b 0}};   
         RPTR <= {8{1'b 1}};   
         DOB_SAMPLE_CLK_E <= 1'b 0;   
         end
      else if (RTS_local === 1'b 1 & MAC_TX_CTS === 1'b 1 )
         begin

//  buffer is not empty and MAC requests another byte
         TX_SEQUENCE_CNTR <= TX_SEQUENCE_CNTR + 1;   
         DOB_SAMPLE_CLK_E <= 1'b 1;   
         if (TX_SEQUENCE_CNTR > 0)
            begin
            RPTR <= RPTR + 1;   
            end
         end
      else
         begin
         DOB_SAMPLE_CLK_E <= 1'b 0;   
         end
      end
   end

//  remember previous word

always @(posedge CLK)
   begin : DOB_PREVIOUS_GEN_001
   if (CLK === 1'b 1)
      begin
      if (DOB_SAMPLE_CLK === 1'b 1)
         begin
         DOB_PREVIOUS <= DOB;   
         end
      end
   end


always @(posedge CLK)
   begin : MAC_TX_DATA_GEN_001
   if (CLK === 1'b 1)
      begin
      case (TX_SEQUENCE_CNTR_D)
      8'h 01:
         begin
         MAC_TX_DATA[63:16] <= RX_SOURCE_MAC_ADDR;   
//  source <-> destination MAC
         MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   
         end
      8'h 02:
         begin
         MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   
//  source <-> destination MAC
         if (RX_IPv4_6n0 === 1'b 1)
            begin
            MAC_TX_DATA[31:16] <= 16'h 0800;   
//  IPv4
            end
         else
            begin
            MAC_TX_DATA[31:16] <= 16'h 86dd;   
//  IPv6
            end
         MAC_TX_DATA[15:0] <= DOB[63:48];   
         end
      default:
         begin
         MAC_TX_DATA[63:16] <= DOB_PREVIOUS[47:0];   
         MAC_TX_DATA[15:0] <= DOB[63:48];   
         end
      endcase
      end
   end


always @(posedge CLK)
   begin : MAC_TX_DATA_VALID_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_TX_EOF_local === 1'b 1 | 
      STATE === 1'b 0)
         begin
         MAC_TX_DATA_VALID_local <= 8'h 00;   
         end
      else if (DOB_SAMPLE_CLK === 1'b 1 )
         begin
         if (TX_SEQUENCE_CNTR_D < 3)
            begin
            MAC_TX_DATA_VALID_local <= 8'h FF;   
            end
         else
            begin
            MAC_TX_DATA_VALID_local[7:2] <= DOB_PREVIOUS[69:64];   
            MAC_TX_DATA_VALID_local[1:0] <= DOB[71:70];   
            end
         end
      else if (MAC_TX_CTS_D2 === 1'b 1 & DOB_PREVIOUS[69:64] !== 0 )
         begin

//  flush last bytes
         MAC_TX_DATA_VALID_local[7:2] <= DOB_PREVIOUS[69:64];   
         MAC_TX_DATA_VALID_local[1:0] <= 2'b 00;   
         end
      else
         begin
         MAC_TX_DATA_VALID_local <= 8'h 00;   
         end
      end
   end

assign MAC_TX_DATA_VALID = MAC_TX_DATA_VALID_local; 

always @(posedge CLK)
   begin : MAC_TX_EOF_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | MAC_TX_EOF_local === 1'b 1 | 
      STATE === 1'b 0)
         begin
         MAC_TX_EOF_local <= 1'b 0;   
         end
      else if (DOB_SAMPLE_CLK === 1'b 1 )
         begin
         if (DOB_SAMPLE_CLK_E === 1'b 0 & BUF_SIZE === 0 & 
      DOB[69:64] === 0)
            begin
            MAC_TX_EOF_local <= 1'b 1;   
            end
         end
      else if (DOB_SAMPLE_CLK === 1'b 0 & MAC_TX_CTS_D2 === 1'b 1 & 
      DOB_PREVIOUS[69:64] !== 0 )
         begin

//  flush last bytes
         MAC_TX_EOF_local <= 1'b 1;   
         end
      else
         begin
         MAC_TX_EOF_local <= 1'b 0;   
         end
      end
   end

assign MAC_TX_EOF = MAC_TX_EOF_local; 

// // TEST POINTS --------------------------
assign TP[1] = IP_RX_EOF_D & VALID_PING_REQ; 

// TP(1) <= IP_RX_SOF;
assign TP[2] = IP_RX_DATA_VALID !== 8'h 00 ? 1'b 1 : 
	1'b 0; 
assign TP[3] = IP_RX_EOF; 
assign TP[4] = VALID_PING_REQ0; 
assign TP[5] = VALID_UNICAST_DEST_IP & VALID_DEST_IP_RDY; 
assign TP[6] = IP_RX_FRAME_VALID2; 
assign TP[7] = DOB_SAMPLE_CLK; 
assign TP[8] = MAC_TX_EOF_local; 
assign TP[9] = MAC_TX_DATA_VALID_local !== 8'h 00 ? 1'b 1 : 
	1'b 0; 
assign TP[10] = MAC_TX_CTS; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------

endmodule // module PING_10G

