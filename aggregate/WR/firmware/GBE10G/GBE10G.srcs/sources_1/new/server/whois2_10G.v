/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\whois2_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\whois2_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:17:44 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2018
//  Filename:  WHOIS2_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 0
//  Date last modified: 7/30/18
//  Inheritance: 	COM-5402 WHOIS2.VHD rev1 8/8/12
// 
//  description:  Asks around who is (given IP address) using the 
//  Address Resolution Protocol (ARP) for IPv4 or Neighbor Discovery Protocol (NDP) for IPv6. 10Gb.
// -------------------------------------------------------------

module WHOIS2_10G (
   SYNC_RESET,
   CLK,
   WHOIS_IP_ADDR,
   WHOIS_IPv4_6n,
   WHOIS_START,
   WHOIS_RDY,
   MAC_ADDR,
   IPv4_ADDR,
   IPv6_ADDR,
   MAC_TX_DATA,
   MAC_TX_DATA_VALID,
   MAC_TX_EOF,
   MAC_TX_CTS,
   RTS,
   TP);
 
parameter IPv6_ENABLED = 1'b 0;

//  0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)

input   SYNC_RESET; 
input   CLK; 
input   [127:0] WHOIS_IP_ADDR; 
input   WHOIS_IPv4_6n; 
input   WHOIS_START; 
output   WHOIS_RDY; 
input   [47:0] MAC_ADDR; 
input   [31:0] IPv4_ADDR; 
input   [127:0] IPv6_ADDR; 
output   [63:0] MAC_TX_DATA; 
output   [7:0] MAC_TX_DATA_VALID; 
output   MAC_TX_EOF; 
input   MAC_TX_CTS; 
output   RTS; 
output   [10:1] TP; 

// // CLK, RESET

wire    WHOIS_RDY; 

//  MAC address. Unique for each network interface card.
//  Natural byte order: (MSB = REG32) 0x000102030405 (LSB = REG37) 
//  as transmitted in the Ethernet packet.
reg     [63:0] MAC_TX_DATA; 

//  one CLK-wide pulse indicating a new word is sent on MAC_TX_DATA
reg     [7:0] MAC_TX_DATA_VALID; 

//  End of Frame: one CLK-wide pulse indicating the last word in the transmit frame.
//  aligned with MAC_TX_DATA_VALID.
wire    MAC_TX_EOF; 

//  1 CLK-wide pulse requesting output samples. Check RTS first.
wire    RTS; 
wire    [10:1] TP; 
reg     WHOIS_STATE; 
reg     [127:0] WHOIS_IP_ADDR_D; 
reg     [127:0] DEST_IPv6_ADDR; 
reg     WHOIS_IPv4_6n_D; 

// // ICMP CHECKSUM -----------------
reg     [2:0] CKSUM_SEQ_CNTR; 
reg     [19:0] CKSUM_PART1; 
reg     [19:0] CKSUM_PART2; 
reg     [15:0] CKSUM; 

// // ARP request
reg     [4:0] TX_PACKET_SEQUENCE; 
//  42 bytes max IPv4, ? IPv6
reg     MAC_TX_DATA_VALID_E; 
reg     MAC_TX_EOF_local; 
reg     RTS_local; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------

initial 
   begin : process_12
   RTS_local = 1'b 0;   
   end

initial 
   begin : process_11
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_10
   MAC_TX_DATA_VALID_E = 1'b 0;   
   end

initial 
   begin : process_9
   TX_PACKET_SEQUENCE = {5{1'b 1}};   
   end

initial 
   begin : process_8
   CKSUM = {16{1'b 0}};   
   end

initial 
   begin : process_7
   CKSUM_PART2 = {20{1'b 0}};   
   end

initial 
   begin : process_6
   CKSUM_PART1 = {20{1'b 0}};   
   end

initial 
   begin : process_5
   CKSUM_SEQ_CNTR = 3'b 000;   
   end

initial 
   begin : process_4
   WHOIS_IPv4_6n_D = 1'b 0;   
   end

initial 
   begin : process_3
   DEST_IPv6_ADDR = {128{1'b 0}};   
   end

initial 
   begin : process_2
   WHOIS_IP_ADDR_D = {128{1'b 0}};   
   end

initial 
   begin : process_1
   WHOIS_STATE = 1'b 0;   
   end


always @( WHOIS_IP_ADDR_D ) 
DEST_IPv6_ADDR = {104'h FF0200000000000000000001FF, WHOIS_IP_ADDR_D[23:0]}; 

// // Generate ARP/NDP query

always @(posedge CLK)
   begin : ARP_RESP_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         MAC_TX_DATA <= {64{1'b 0}};   
         end
      else if (WHOIS_IPv4_6n_D === 1'b 1 )
         begin

//  IPv4 address -> send an ARP request. 42 bytes.
         case (TX_PACKET_SEQUENCE)
         5'b 00000:
            begin
            MAC_TX_DATA <= {48'h FFFFFFFFFFFF, MAC_ADDR[47:32]};   
//  Ethernet header
//  destination MAC address: broadcast. fixed at the time of connection establishment.
            end
         5'b 00001:
            begin
            MAC_TX_DATA <= {MAC_ADDR[31:0], 32'h 08060001};   

//  source Ethernet address  +  Ethernet type  + hardware type
            end
         5'b 00010:
            begin
            MAC_TX_DATA <= {48'h 080006040001, MAC_ADDR[47:32]};   

//  protocol type + hardware size, protocol size + op field. ARP request + sender Ethernet address
            end
         5'b 00011:
            begin
            MAC_TX_DATA <= {MAC_ADDR[31:0], IPv4_ADDR};   

//  sender Ethernet address + sender IP address
            end
         5'b 00100:
            begin
            MAC_TX_DATA <= {48'h 000000000000, WHOIS_IP_ADDR_D[31:16]};   

//  target Ethernet address + target IP address
            end
         5'b 00101:
            begin
            MAC_TX_DATA <= {WHOIS_IP_ADDR_D[15:0], 48'h 000000000000};   

//  target IP address
            end
         default:
            begin
            MAC_TX_DATA <= {64{1'b 0}};   
//  default & trailer	
            end
         endcase
         end
      else if (IPv6_ENABLED === 1'b 1 )
         begin

//  IPv6 address -> send a Neighbor solicitation message.86 bytes
         case (TX_PACKET_SEQUENCE)
         5'b 00000:
            begin
            MAC_TX_DATA <= {24'h 3333ff, WHOIS_IP_ADDR_D[23:0], MAC_ADDR[47:32]};   
//  Ethernet header
//  destination MAC address: broadcast. fixed at the time of connection establishment.
            end
         5'b 00001:
            begin
            MAC_TX_DATA <= {MAC_ADDR[31:0], 32'h 86DD6000};   

//  source Ethernet address  +  Ethernet type IPv6 + hardware type
            end
         5'b 00010:
            begin
            MAC_TX_DATA <= {48'h 000000203AFF, IPv6_ADDR[127:112]};   

//  payload length (32), next header ICMPv6 (58), hop limit (255), source IP address
            end
         5'b 00011:
            begin
            MAC_TX_DATA <= IPv6_ADDR[111:48];   

//  source IP address
            end
         5'b 00100:
            begin
            MAC_TX_DATA <= {IPv6_ADDR[47:0], 16'h FF02};   

//  source IP address, destination IP address
            end
         5'b 00101:
            begin
            MAC_TX_DATA <= 64'h 0000000000000000;   

//  destination IP address
            end
         5'b 00110:
            begin
            MAC_TX_DATA <= {24'h 0001FF, WHOIS_IP_ADDR_D[23:0], 16'h 8700};   

//  destination IP address, ICMPv6 neighbor solicitation
            end
         5'b 00111:
            begin
            MAC_TX_DATA <= {CKSUM, 32'h 00000000, WHOIS_IP_ADDR_D[127:112]};   

//  checksum, target address
            end
         5'b 01000:
            begin
            MAC_TX_DATA <= WHOIS_IP_ADDR_D[111:48];   

//  target address
            end
         5'b 01001:
            begin
            MAC_TX_DATA <= {WHOIS_IP_ADDR_D[47:0], 16'h 0101};   

//  target IP address, ICMPv6 option
            end
         5'b 01010:
            begin
            MAC_TX_DATA <= {MAC_ADDR, 16'h 0000};   

//  link layer address
            end
         default:
            begin
            MAC_TX_DATA <= {64{1'b 0}};   
//  default & trailer    
            end
         endcase
         end
      end
   end

// // ICMP CHECKSUM -----------------
//  The ICMP reply checksum is computed in two parts: one part at reset, based on the IPv6_ADDR and MAC_ADDR. 
//  The second part is computed for each valid received ICMP message.

always @(posedge CLK)
   begin : TX_SEQUENCE_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1 | WHOIS_START === 1'b 1 & 
      WHOIS_STATE === 1'b 0 | MAC_TX_EOF_local === 1'b 1)
         begin

//  *073018
         TX_PACKET_SEQUENCE <= {5{1'b 1}};   
         MAC_TX_DATA_VALID_E <= 1'b 0;   
         end
      else if (WHOIS_STATE === 1'b 1 & MAC_TX_CTS === 1'b 1 )
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
         if (WHOIS_IPv4_6n_D === 1'b 1 & TX_PACKET_SEQUENCE === 5)
            begin

//  IPv4 ARP done. transmitting the last word (42-bytes)
            MAC_TX_DATA_VALID <= 8'h c0;   
//  last word contains only 2 bytes
            MAC_TX_EOF_local <= 1'b 1;   
            end
         else if (WHOIS_IPv4_6n_D === 1'b 0 & TX_PACKET_SEQUENCE === 10 )
            begin

//  IPv6 Neighbor solicitation done. transmitting the last word (86-bytes)
            MAC_TX_DATA_VALID <= 8'h fc;   
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

//  WHOIS state machine

always @(posedge CLK)
   begin : RTS_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RTS_local <= 1'b 0;   
         WHOIS_STATE <= 1'b 0;   
         end
      else
         begin
         if (WHOIS_START === 1'b 1 & WHOIS_STATE === 1'b 0)
            begin

//  new transaction. Sending ARP or NDP request
            RTS_local <= 1'b 1;   
            WHOIS_STATE <= 1'b 1;   

//  freeze whois IP address and IPversion
            WHOIS_IP_ADDR_D <= WHOIS_IP_ADDR;   
            WHOIS_IPv4_6n_D <= WHOIS_IPv4_6n;   
            end
         else if (MAC_TX_EOF_local === 1'b 1 )
            begin

//  done. transmitting the last word
            RTS_local <= 1'b 0;   
            WHOIS_STATE <= 1'b 0;   
            end
         end
      end
   end

assign RTS = RTS_local; 
assign WHOIS_RDY = RTS_local | WHOIS_START; 

// // Test Point
assign TP[1] = WHOIS_START; 
assign TP[2] = MAC_TX_CTS; 

// TP(3) <= MAC_TX_DATA_VALID_E;
assign TP[4] = MAC_TX_EOF_local; 
assign TP[5] = RTS_local; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------

endmodule // module WHOIS2_10G

