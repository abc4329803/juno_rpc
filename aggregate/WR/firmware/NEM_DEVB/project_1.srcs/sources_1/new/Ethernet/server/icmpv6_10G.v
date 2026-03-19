/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\icmpv6_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\icmpv6_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:16:57 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2018
// 	Filename:  ICMPV6_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 3/4/18
//  Inheritance: 	n/a
// 
//  description:  ICMPV6 protocol, 10Gb 
//  Reads a received IP/ICMP frame on the fly and generate responses (Ethernet format).
//  Any new received frame is presumed to be a valid ICMPv6 message. Within a few bytes,
//  information is received as to the real protocol associated with the received packet.
//  The ping echo generation is immediately cancelled if 
//  (a) not IPv6
//  (b) invalid target IP (unicast or multicast)
//  (c) not ICMPv6 
//  (d) ICMPv6 type not a neighbor solicitation
//  (e) ICMPv6 solicited IP address does not match 
//  (f) erroneous MAC frame
//  Any follow-on received IP frame is discarded while a valid response awaits transmission in the elastic buffer.
// 
//  Device utilization (IPv6_ENABLED='1')
//  FF: 301
//  LUT: 835
//  DSP48: 0
//  18Kb BRAM: 0
//  BUFG: 1
//  Minimum period: 4.683ns (Maximum Frequency: 213.516MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module ICMPV6_10G (
   CLK,
   SYNC_RESET,
   IP_RX_DATA,
   IP_RX_DATA_VALID,
   IP_RX_SOF,
   IP_RX_EOF,
   IP_RX_WORD_COUNT,
   IP_RX_FRAME_VALID,
   RX_SOURCE_MAC_ADDR,
   RX_SOURCE_IP_ADDR,
   MAC_ADDR,
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
 

input   CLK; 
input   SYNC_RESET; 
input   [63:0] IP_RX_DATA; 
input   [7:0] IP_RX_DATA_VALID; 
input   IP_RX_SOF; 
input   IP_RX_EOF; 
input   [10:0] IP_RX_WORD_COUNT; 
input   IP_RX_FRAME_VALID; 
input   [47:0] RX_SOURCE_MAC_ADDR; 
input   [127:0] RX_SOURCE_IP_ADDR; 
input   [47:0] MAC_ADDR; 
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
reg     [7:0] MAC_TX_DATA_VALID; 

//  '1' when sending the last byte in a packet to be transmitted. 
//  Aligned with MAC_TX_DATA_VALID
wire    MAC_TX_EOF; 

//  MAC-generated Clear To Send flow control signal. The user should check that this 
//  signal is high before sending the next MAC_TX_DATA byte. 
reg     RTS; 
wire    [10:1] TP; 
reg     [0:0] STATE; 
reg     INPUT_ENABLED; 
reg     IP_RX_WORD_VALID; 
reg     IP_RX_EOF_D; 

// // VALIDATE ICMP MESSAGE -----------
reg     VALID_ICMP_MSG0; 
reg     VALID_ICMP_MSG; 
reg     NEIGHBOR_SOLICITATION_FLAG; 
reg     ECHO_REQUEST_FLAG; 
reg     VALID_NEIGHBOR_SOLICITATION_MSG; 

// signal VALID_ECHO_REQUEST_MSG: std_logic := '0';
reg     [47:0] RX_SOURCE_MAC_ADDR0; 
reg     [127:0] RX_SOURCE_IP_ADDR0; 
reg     [15:0] REPLY_CHECKSUM; 

// // ICMP CHECKSUM -----------------
reg     [2:0] CKSUM_SEQ_CNTR; 
reg     [19:0] CKSUM_PART1; 
reg     [19:0] CKSUM_PART2; 

// // ICMP REPLY -----------------
reg     MAC_TX_EOF_local; 
reg     [5:0] RPTR; 
//  range 0 - 10

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // STATE MACHINE ------------------
//  A state machine is needed as this process is memoryless.
//  State 0 = idle or incoming packet being processed. No tx packet waiting.
//  State 1 = valid ICMP request. tx packet waiting for tx capacity. Incoming packets are ignored.

initial 
   begin : process_17
   RPTR = {6{1'b 0}};   
   end

initial 
   begin : process_16
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_15
   CKSUM_PART2 = {20{1'b 0}};   
   end

initial 
   begin : process_14
   CKSUM_PART1 = {20{1'b 0}};   
   end

initial 
   begin : process_13
   CKSUM_SEQ_CNTR = 3'b 000;   
   end

initial 
   begin : process_12
   REPLY_CHECKSUM = {16{1'b 0}};   
   end

initial 
   begin : process_11
   RX_SOURCE_IP_ADDR0 = {128{1'b 0}};   
   end

initial 
   begin : process_10
   RX_SOURCE_MAC_ADDR0 = {48{1'b 0}};   
   end

initial 
   begin : process_9
   VALID_NEIGHBOR_SOLICITATION_MSG = 1'b 0;   
   end

initial 
   begin : process_8
   ECHO_REQUEST_FLAG = 1'b 0;   
   end

initial 
   begin : process_7
   NEIGHBOR_SOLICITATION_FLAG = 1'b 0;   
   end

initial 
   begin : process_6
   VALID_ICMP_MSG = 1'b 0;   
   end

initial 
   begin : process_5
   VALID_ICMP_MSG0 = 1'b 0;   
   end

initial 
   begin : process_4
   IP_RX_EOF_D = 1'b 0;   
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
      else if (IP_RX_EOF_D === 1'b 1 & INPUT_ENABLED === 1'b 1 & 
      VALID_NEIGHBOR_SOLICITATION_MSG === 1'b 1 )
         begin

//  event = valid ICMP message. Ready to send reply when tx channel opens.
//  In the mean time, incoming packets are ignored.
         STATE <= 1'b 1;   
         end
      else if (MAC_TX_EOF_local === 1'b 1 )
         begin

//  event = successfully sent ICMP reply. Reopen input
         STATE <= 1'b 0;   
         end
      end
   end


always @( STATE ) 
INPUT_ENABLED = STATE === 0 ? 1'b 1 : 
	1'b 0; 

// // VALIDATE ICMP MESSAGE -----------

always @( IP_RX_DATA_VALID ) 
IP_RX_WORD_VALID = IP_RX_DATA_VALID !== 0 ? 1'b 1 : 
	1'b 0; 

always @(posedge CLK)
   begin : VALIDITY_CHECK_001
   if (CLK === 1'b 1)
      begin
      IP_RX_EOF_D <= IP_RX_EOF;   
      if (INPUT_ENABLED === 1'b 1)
         begin
         if (IP_RX_SOF === 1'b 1)
            begin

//  just received first byte. ICMP message valid until proven otherwise
            VALID_ICMP_MSG0 <= 1'b 1;   
            end
         else
            begin
            if (RX_IPv4_6n === 1'b 1)
               begin

//  (a) not IPv6
               VALID_ICMP_MSG0 <= 1'b 0;   
               end
            if (RX_IP_PROTOCOL_RDY === 1'b 1 & RX_IP_PROTOCOL !== 58)
               begin

//  (c) not ICMPv6 
               VALID_ICMP_MSG0 <= 1'b 0;   
               end
            end
         end
      end
   end


always @( VALID_ICMP_MSG0 or IP_RX_FRAME_VALID ) 
VALID_ICMP_MSG = VALID_ICMP_MSG0 & IP_RX_FRAME_VALID; 
//  combine with the other checks done in parsing.vhd

//  Neighbor solicitation flag

always @(posedge CLK)
   begin : VALIDITY_CHECK_002
   if (CLK === 1'b 1)
      begin
      if (INPUT_ENABLED === 1'b 1 & IP_RX_SOF === 1'b 1)
         begin
         NEIGHBOR_SOLICITATION_FLAG <= 1'b 1;   
         end
      else if (INPUT_ENABLED === 1'b 1 & IP_RX_WORD_VALID === 1'b 1 )
         begin
         if (IP_RX_WORD_COUNT === 6 & IP_RX_DATA[63:48] !== 16'h 8700)
            begin

//  (e) ICMPv6 type not a neighbor solicitation
            NEIGHBOR_SOLICITATION_FLAG <= 1'b 0;   
            end
         end
      end
   end


always @( VALID_ICMP_MSG or NEIGHBOR_SOLICITATION_FLAG ) 
VALID_NEIGHBOR_SOLICITATION_MSG = VALID_ICMP_MSG & NEIGHBOR_SOLICITATION_FLAG; 

// -- Echo (ping) request flag (Note: implemented in PING.VHD)
// VALIDITY_CHECK_003: process(CLK)
// begin
// 	if rising_edge(CLK) then
// 		if(INPUT_ENABLED = '1') and (IP_RX_SOF = '1') then
// 			ECHO_REQUEST_FLAG <= '1';
//         elsif(INPUT_ENABLED = '1') and (IP_RX_WORD_VALID = '1') and (unsigned(IP_RX_WORD_COUNT) = 6)  and (IP_RX_DATA(63 downto 48) /= x"8000") then
//             -- (d) ICMPv6 type not an echo request
//             ECHO_REQUEST_FLAG <= '0';
//         end if;
// 	end if;
// end process;
// VALID_ECHO_REQUEST_MSG <= VALID_ICMP_MSG and ECHO_REQUEST_FLAG;
// // freeze source MAC address and source IP address at the end of the packet 
//  Reason: we don't want subsequent packets to change this information while we are waiting
//  to send the ICMP reply.

always @(posedge CLK)
   begin : FREEZE_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RX_SOURCE_MAC_ADDR0 <= {48{1'b 0}};   
         RX_SOURCE_IP_ADDR0 <= {128{1'b 0}};   
         end
      else if (IP_RX_EOF === 1'b 1 & INPUT_ENABLED === 1'b 1 )
         begin
         RX_SOURCE_MAC_ADDR0 <= RX_SOURCE_MAC_ADDR;   
         RX_SOURCE_IP_ADDR0 <= RX_SOURCE_IP_ADDR;   
         end
      end
   end

// // ICMP CHECKSUM -----------------
//  The ICMP reply checksum is computed in two parts: one part at reset, based on the IPv6_ADDR and MAC_ADDR. 
//  The second part is computed for each valid received ICMP message.

always @(posedge CLK)
   begin : CKSUM_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_SEQ_CNTR <= 3'b 101;   
         end
      else if (CKSUM_SEQ_CNTR > 0 )
         begin
         CKSUM_SEQ_CNTR <= CKSUM_SEQ_CNTR - 1;   
         end
      end
   end


always @(posedge CLK)
   begin : CKSUM_002
   if (CLK === 1'b 1)
      begin

//  fixed part of the checksum is initialized at reset
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_PART1 <= {IPv6_ADDR[127:112], 1'b 0} + {IPv6_ADDR[111:96], 1'b 0};   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 101 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + {IPv6_ADDR[95:80], 1'b 0} + {IPv6_ADDR[79:64], 1'b 0};   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 100 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + {IPv6_ADDR[63:48], 1'b 0} + {IPv6_ADDR[47:32], 1'b 0};   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 011 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + {IPv6_ADDR[31:16], 1'b 0} + {IPv6_ADDR[15:0], 1'b 0};   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 010 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + MAC_ADDR[47:32] + MAC_ADDR[31:16];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 001 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + MAC_ADDR[15:0] + 16'h EA5B;   
//  constant is the sum of 3A + 20 + 8800 + 6000 + 0201 
         end
      if (MAC_TX_CTS === 1'b 1)
         begin

//  variable part of the checksum depends on the ICMP message originator
         case (RPTR)
         6'b 000001:
            begin
            CKSUM_PART2 <= CKSUM_PART1 + RX_SOURCE_IP_ADDR0[127:112] + RX_SOURCE_IP_ADDR0[111:96];   
            end
         6'b 000010:
            begin
            CKSUM_PART2 <= CKSUM_PART2 + RX_SOURCE_IP_ADDR0[95:80] + RX_SOURCE_IP_ADDR0[79:64];   
            end
         6'b 000011:
            begin
            CKSUM_PART2 <= CKSUM_PART2 + RX_SOURCE_IP_ADDR0[63:48] + RX_SOURCE_IP_ADDR0[47:32];   
            end
         6'b 000100:
            begin
            CKSUM_PART2 <= CKSUM_PART2 + RX_SOURCE_IP_ADDR0[31:16] + RX_SOURCE_IP_ADDR0[15:0];   
            end
         6'b 000101:
            begin
            CKSUM_PART2 <= CKSUM_PART2[15:0] + CKSUM_PART2[19:16];   
            end
         6'b 000110:
            begin
            CKSUM_PART2 <= CKSUM_PART2[15:0] + CKSUM_PART2[19:16];   
            end
         default:
            ;
         endcase
         end
      end
   end


always @( CKSUM_PART2 ) 
REPLY_CHECKSUM = ~CKSUM_PART2[15:0]; 

// // ICMP REPLY -----------------
// // Generate ICMP reply packet on the fly

always @(posedge CLK)
   begin : ICMP_RESP_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         MAC_TX_DATA <= {64{1'b 0}};   
         MAC_TX_DATA_VALID <= {8{1'b 0}};   
         MAC_TX_EOF_local <= 1'b 0;   
         end
      else if (MAC_TX_CTS === 1'b 1 & RPTR <= 10 )
         begin
         case (RPTR)
         6'b 000000:
            begin
            MAC_TX_DATA[63:16] <= RX_SOURCE_MAC_ADDR0;   

//  destination ethernet address
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   

//  our Ethernet address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000001:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   

//  our Ethernet address (4 LSBs)
            MAC_TX_DATA[31:0] <= 32'h 86DD6000;   

//  Ethernet type, hardware type IPv6
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000010:
            begin
            MAC_TX_DATA[63:16] <= 48'h 000000203aff;   

//  ICMPv6,32 bytes header length, hop
            MAC_TX_DATA[15:0] <= IPv6_ADDR[127:112];   

//  our source IPv6 address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000011:
            begin
            MAC_TX_DATA <= IPv6_ADDR[111:48];   

//  our source IPv6 address (cont'd)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000100:
            begin
            MAC_TX_DATA[63:16] <= IPv6_ADDR[47:0];   

//  our source IPv6 address (LSBs)
            MAC_TX_DATA[15:0] <= RX_SOURCE_IP_ADDR0[127:112];   

//  target IP address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000101:
            begin
            MAC_TX_DATA <= RX_SOURCE_IP_ADDR0[111:48];   

//  target IP address (cont'd)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000110:
            begin
            MAC_TX_DATA[63:16] <= RX_SOURCE_IP_ADDR0[47:0];   

//  target IP address (LSBs)
            MAC_TX_DATA[15:0] <= 16'h 8800;   

//  neighbor advertisement message, code 0
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000111:
            begin
            MAC_TX_DATA[63:48] <= REPLY_CHECKSUM;   

//  checksum
            MAC_TX_DATA[47:16] <= 32'h 60000000;   

//  router flag = 0, solicited flag = 1, overide cache entry = 1
            MAC_TX_DATA[15:0] <= IPv6_ADDR[127:112];   

//  target address
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 001000:
            begin
            MAC_TX_DATA <= IPv6_ADDR[111:48];   

//  target IP address (cont'd)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 001001:
            begin
            MAC_TX_DATA[63:16] <= IPv6_ADDR[47:0];   

//  target IP address (LSBs)
            MAC_TX_DATA[15:0] <= 16'h 0201;   

//  target link layer address, length 8 bytes
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 001010:
            begin
            MAC_TX_DATA[63:16] <= MAC_ADDR;   
            MAC_TX_DATA[15:0] <= 16'h 0000;   

//  our Ethernet address 
            MAC_TX_DATA_VALID <= 8'h FC;   
            MAC_TX_EOF_local <= 1'b 1;   
            end
         default:
            begin
            MAC_TX_DATA <= {64{1'b 0}};   
            MAC_TX_DATA_VALID <= 8'h 00;   
            MAC_TX_EOF_local <= 1'b 0;   
            end
         endcase
         end
      else
         begin
         MAC_TX_DATA_VALID <= 8'h 00;   
         MAC_TX_EOF_local <= 1'b 0;   
         end
      end
   end

assign MAC_TX_EOF = MAC_TX_EOF_local; 

// // Sequence reply transmission and Flow control 
//  Request to send when ICMP reply is ready.

always @(posedge CLK)
   begin : RTS_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RTS <= 1'b 0;   
         RPTR <= {6{1'b 0}};   
         end
      else if (IP_RX_EOF_D === 1'b 1 & INPUT_ENABLED === 1'b 1 & 
      VALID_NEIGHBOR_SOLICITATION_MSG === 1'b 1 )
         begin

//  Valid  & complete ICMP neighbor solicitation was received. Start reply transmission.
         RTS <= 1'b 1;   
//  tell MAC we have a packet to send
         RPTR <= {6{1'b 0}};   
         end
      else if (MAC_TX_CTS === 1'b 1 & RPTR < 10 )
         begin

//  Assemble reply on the fly. 
//  Always Ethernet encapsulation
         RPTR <= RPTR + 1;   
//  move read pointer in response to read request
         end
      else if (MAC_TX_CTS === 1'b 1 & RPTR === 10 )
         begin
         RPTR <= RPTR + 1;   
//  move read pointer in response to read request
         RTS <= 1'b 0;   
         end
      end
   end

// // TEST POINTS --------------------------
assign TP[1] = STATE[0]; 
assign TP[2] = IP_RX_WORD_VALID; 
assign TP[3] = VALID_NEIGHBOR_SOLICITATION_MSG; 
assign TP[4] = MAC_TX_EOF_local; 
assign TP[5] = MAC_TX_CTS; 
assign TP[6] = RPTR[0]; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // STATE MACHINE ------------------

endmodule // module ICMPV6_10G

