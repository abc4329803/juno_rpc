/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\arp_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\arp_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:15:30 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2003-2020
// 	Filename:  ARP_10G.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 0
// 	Date last modified: 9/24/20
//  Inheritance: 	ARP_10G.VHD version 2, 12/10/15
// 
//  description:  Address resolution protocol, 10GbE version
//  Reads receive packet structure on the fly and generates an ARP reply.
//  Any new received packet is presumed to be an ARP request. Within a few bytes,
//  information is received as to the real protocol associated with the received packet.
//  The ARP reply generation is immediately cancelled if 
//  (a) the received packet type is not an ARP request/reply
//  (b) the Opcode does not indicate an ARP request
//  (c) the IP address does not match
//  (d) erroneous MAC frame
//  Supports only Ethernet (IEEE 802.3) encapsulation
//  ARP only applies to IPv4. For IPv6, use neighbour discovery protocol instead.
//  Any follow-on received MAC frame is discarded while a valid ARP response awaits transmission in the elastic buffer.
// -------------------------------------------------------------

module ARP_10G (

		// CLK, RESET
		input   CLK,
			// Must be a global clock. No BUFG instantiation within this component.
		input   SYNC_RESET,

		// Packet/Frame received
		input   [63:0] MAC_RX_DATA,
			// USER reads the data at the rising edge of CLK when MAC_RX_DATA_VALID /= 0
			// Bytes order: MSB was received first
			// Bytes are left aligned: first byte in MSB, occasional follow-on fill-in Bytes in the LSB(s)
			// The first destination address byte is always a MSB (MAC_RX_DATA(7:0))
		input   [7:0] MAC_RX_DATA_VALID,
			// data valid, for each byte in MAC_RX_DATA
		input   MAC_RX_SOF,
			// '1' when sending the first byte in a received packet. 
			// Aligned with MAC_RX_DATA_VALID
		input   MAC_RX_EOF,
			// '1' when sending the last byte in a received packet. 
			// Aligned with MAC_RX_DATA_VALID
		input   MAC_RX_FRAME_VALID,
			// MAC frame integrity verification (at the end of frame)
		input   [10:0] MAC_RX_WORD_COUNT,
			// MAC word counter, 1 CLK after the input. 0 is the first word.

		// Configuration data: IP address, MAC address
		input   [47:0] MAC_ADDR,
			// MAC address. Unique for each network interface card.
			// Natural byte order: (MSB) 0x000102030405 (LSB) 
			// as transmitted in the Ethernet packet.
		input   [31:0] IPv4_ADDR,
			// local IP address. 4 bytes for IPv4 only
			// Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.

		// Received type
		input   [3:0] RX_TYPE,
			// Information stays until start of following packet.
			// Only one valid types: 
			// 2 = Ethernet encapsulation, ARP request/reply
	  	input   RX_TYPE_RDY,
			// 1 CLK-wide pulse indicating that a detection was made on the received packet
			// type, and that RX_TYPE can be read.
			// Detection occurs as soon as possible, two clocks after receiving byte 13 or 21.

		// Packet origin, already parsed in PACKET_PARSING (shared code)
		input   [47:0] RX_SOURCE_MAC_ADDR,
		input   [31:0] RX_SOURCE_IP_ADDR,	// IPv4 only

		// USER -> Transmit MAC Interface
		// 32-bit CRC is automatically appended. User should not supply it.
		// Synchonous with CLK
		output  reg [63:0] 	MAC_TX_DATA,
			// MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID /= 0
		output  reg [7:0]  	MAC_TX_DATA_VALID,
			// data valid
		output   			MAC_TX_EOF,
			// '1' when sending the last byte in a packet to be transmitted. 
			// Aligned with MAC_TX_DATA_VALID
		input   			MAC_TX_CTS,
			// MAC-generated Clear To Send flow control signal. The user should check that this 
			// signal is high before sending the next MAC_TX_DATA byte. 
		output   reg 		RTS,
			// '1' when a full or partial packet is ready to be read.
			// '0' when output buffer is empty.
			// When the user starts reading the output buffer, it is expected that it will be
			// read until empty.


		
		// Test Points
		output   [10:1] TP

);



reg     [0:0] STATE = 'b0; 
reg     INPUT_ENABLED = 'b1; 
reg     [7:0] MAC_RX_DATA_VALID_D = 'b0; 
reg     MAC_RX_SOF_D = 'b0; 
reg     MAC_RX_EOF_D = 'b0; 
reg     [63:0] MAC_RX_DATA_D = 'b0; 
reg     MAC_RX_WORD_VALID_D = 'b0; 
reg     MAC_RX_EOF_D2 = 'b0; 

// // VALIDATE ARP REQUEST -----------
reg     			 VALID_ARP_REQ = 'b0; 
reg     [47:0] RX_SOURCE_MAC_ADDR0 = 'b0; 
reg     [31:0] RX_SOURCE_IP_ADDR0  = 'b0; 

// // ARP REPLY -----------------
reg     MAC_TX_EOF_local = 'b0; 
reg     [5:0] RPTR = 'b0; //  range 0 - 41

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // STATE MACHINE ------------------
//  A state machine is needed as this process is memoryless.
//  State 0 = idle or incoming packet being processed. No tx packet waiting.
//  State 1 = valid ARP request. tx packet waiting for tx capacity. Incoming packets are ignored.

always @(posedge CLK)
   begin : STATE_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         STATE <= {1{1'b 0}};   
         end
      else if (MAC_RX_EOF_D2 == 1'b 1 & VALID_ARP_REQ == 1'b 1 )
         begin

//  event = valid ARP request. Ready to send ARP reply when tx channel opens.
//  In the mean time, incoming packets are ignored.
         STATE <= 1'b 1;   
         end
      else if (MAC_TX_EOF_local == 1'b 1 )
         begin

//  event = successfully sent ARP reply. Reopen input
         STATE <= 1'b 0;   
         end
      end
   end


always @( STATE ) 
INPUT_ENABLED = STATE == 0 ? 1'b 1 : 
	1'b 0; 

always @(posedge CLK)
   begin : STATE_GEN_002
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         MAC_RX_DATA_D <= {64{1'b 0}};   
         MAC_RX_DATA_VALID_D <= {8{1'b 0}};   
         MAC_RX_SOF_D <= 1'b 0;   
         MAC_RX_EOF_D <= 1'b 0;   
         MAC_RX_WORD_VALID_D <= 1'b 0;   

//  reclock data and sample clock so that they are aligned with the word count.
         end
      else if (INPUT_ENABLED == 1'b 0 )
         begin

//  we still waiting to send the last ARP reply. Ignore any incoming packets until transmission is complete.
         MAC_RX_DATA_D <= {64{1'b 0}};   
         MAC_RX_DATA_VALID_D <= {8{1'b 0}};   
         MAC_RX_SOF_D <= 1'b 0;   
         MAC_RX_EOF_D <= 1'b 0;   
         MAC_RX_WORD_VALID_D <= 1'b 0;   
         end
      else
         begin
         MAC_RX_DATA_D <= MAC_RX_DATA;   
         MAC_RX_DATA_VALID_D <= MAC_RX_DATA_VALID;   
         MAC_RX_SOF_D <= MAC_RX_SOF;   
         MAC_RX_EOF_D <= MAC_RX_EOF;   
         if (MAC_RX_DATA_VALID != 0)
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

// 
// // VALIDATE ARP REQUEST -----------
//  The ARP reply generation is immediately cancelled if 
//  (a) the received packet type is not an ARP request/reply
//  (b) the Opcode does not indicate an ARP request
//  (c) the IP address does not match
//  (d) erroneous MAC frame
//  VALID_ARP_REQ is ready at MAC_RX_EOF_D2

always @(posedge CLK)
   begin : VALIDITY_CHECK_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         VALID_ARP_REQ <= 1'b 1;   
         MAC_RX_EOF_D2 <= 1'b 0;   
         end
      else
         begin
         MAC_RX_EOF_D2 <= MAC_RX_EOF_D;   
         if (MAC_RX_SOF_D == 1'b 1)
            begin

//  just received first byte. ARP request valid until proven otherwise
            VALID_ARP_REQ <= 1'b 1;   
            end
         else if (MAC_RX_EOF == 1'b 1 & MAC_RX_FRAME_VALID == 1'b 0 )
            begin

//  (d) erroneous MAC frame
            VALID_ARP_REQ <= 1'b 0;   
            end
         else if (MAC_RX_EOF_D == 1'b 1 & RX_TYPE != 2 )
            begin

//  (a) the received packet type is not an ARP request/reply
            VALID_ARP_REQ <= 1'b 0;   
            end
         else if (MAC_RX_WORD_VALID_D == 1'b 1 & MAC_RX_WORD_COUNT == 1 )
            begin
            if (MAC_RX_DATA_D[15:0] != 16'h 0001)
               begin

//  unexpected hardware type
               VALID_ARP_REQ <= 1'b 0;   
               end
            end
         else if (MAC_RX_WORD_VALID_D == 1'b 1 & MAC_RX_WORD_COUNT == 2 )
            begin
            if (MAC_RX_DATA_D[63:32] != 32'h 08000604)
               begin

//  unexpected protocol type, hardware length or protocol length
               VALID_ARP_REQ <= 1'b 0;   
               end
            if (MAC_RX_DATA_D[23:16] != 8'h 01)
               begin

//  (b) op field does not indicate ARP request
               VALID_ARP_REQ <= 1'b 0;   
               end
            end
         else if (MAC_RX_WORD_VALID_D == 1'b 1 & MAC_RX_WORD_COUNT == 4 )
            begin
            if (MAC_RX_DATA_VALID_D[1:0] != 2'b 11 | MAC_RX_DATA_D[15:0] != IPv4_ADDR[31:16])
               begin

//  (c) Target IP address does not match
               VALID_ARP_REQ <= 1'b 0;   
               end
            end
         else if (MAC_RX_WORD_VALID_D == 1'b 1 & MAC_RX_WORD_COUNT == 5 )
            begin
            if (MAC_RX_DATA_VALID_D[7:6] != 2'b 11 | MAC_RX_DATA_D[63:48] != IPv4_ADDR[15:0])
               begin

//  (c) Target IP address does not match
               VALID_ARP_REQ <= 1'b 0;   
               end
            end
         end
      end
   end

// // freeze source MAC address and source IP address at the end of the packet 
//  Reason: we don't want subsequent packets to change this information while we are waiting
//  to send the ARP reply.

always @(posedge CLK)
   begin : FREEZE_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         RX_SOURCE_MAC_ADDR0 <= {48{1'b 0}};   
         RX_SOURCE_IP_ADDR0 <= {32{1'b 0}};   
         end
      else if (MAC_RX_EOF == 1'b 1 & STATE == 0 )
         begin
         RX_SOURCE_MAC_ADDR0 <= RX_SOURCE_MAC_ADDR;   
         RX_SOURCE_IP_ADDR0 <= RX_SOURCE_IP_ADDR;   
         end
      end
   end

// // ARP REPLY -----------------
// // Generate ARP reply packet on the fly

always @(posedge CLK)
   begin : ARP_RESP_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         MAC_TX_DATA <= {64{1'b 0}};   
         MAC_TX_DATA_VALID <= {8{1'b 0}};   
         MAC_TX_EOF_local <= 1'b 0;   
         end
      else if (MAC_TX_CTS == 1'b 1 & RPTR <= 6 )
         begin
         case (RPTR)
         6'b 000000:
            begin
            MAC_TX_DATA[63:16] <= RX_SOURCE_MAC_ADDR0;   
//  destination Ethernet address
//  source Ethernet address 
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   

//  our Ethernet address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000001:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   

//  our Ethernet address (4 LSBs)
            MAC_TX_DATA[31:0] <= 32'h 08060001;   

//  Ethernet type, hardware type
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000010:
            begin
            MAC_TX_DATA[63:16] <= 48'h 080006040002;   

//  protocol type
//  hardware size, protocol size
//  op field. ARP reply
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   

//  source Ethernet address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000011:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   

//  our Ethernet address (4 LSBs)
            MAC_TX_DATA[31:0] <= IPv4_ADDR[31:0];   

//  sender IP address
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000100:
            begin
            MAC_TX_DATA[63:16] <= RX_SOURCE_MAC_ADDR0;   

//  destination Ethernet address
            MAC_TX_DATA[15:0] <= RX_SOURCE_IP_ADDR0[31:16];   

//  target IP address (2 MSBs)
            MAC_TX_DATA_VALID <= 8'h FF;   
            end
         6'b 000101:
            begin
            MAC_TX_DATA[63:48] <= RX_SOURCE_IP_ADDR0[15:0];   

//  target IP address (2 LSBs)
            MAC_TX_DATA[47:0] <= {48{1'b 0}};   
            MAC_TX_DATA_VALID <= 8'h C0;   
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
//  Request to send when ARP reply is ready.

always @(posedge CLK)
   begin : RTS_GEN_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1)
         begin
         RTS <= 1'b 0;   
         RPTR <= {6{1'b 0}};   
         end
      else if (STATE == 0 & MAC_RX_EOF_D2 == 1'b 1 & 
      VALID_ARP_REQ == 1'b 1 )
         begin

//  Valid  & complete ARP request was received. Start reply transmission.
         RTS <= 1'b 1;   
//  tell MAC we have a packet to send
         RPTR <= {6{1'b 0}};   
         end
      else if (MAC_TX_CTS == 1'b 1 & RPTR < 5 )
         begin

//  Assemble reply on the fly. 
//  Always Ethernet encapsulation
         RPTR <= RPTR + 1;   
//  move read pointer in response to read request
         end
      else if (MAC_TX_CTS == 1'b 1 & RPTR == 5 )
         begin
         RPTR <= RPTR + 1;   
//  move read pointer in response to read request
         RTS <= 1'b 0;   
         end
      end
   end

// // Test Point
assign TP[1] = MAC_RX_SOF_D; 
assign TP[2] = MAC_RX_WORD_VALID_D; 
assign TP[3] = STATE[0]; 
assign TP[4] = VALID_ARP_REQ; 

// TP(5) <= '1' when (unsigned(RX_TYPE) = 2) else '0';
// TP(6) <= RPTR(0);
assign TP[5] = IPv4_ADDR == 32'h A9FE5080 ? 1'b 1 : 
	1'b 0; 
assign TP[6] = MAC_TX_EOF_local; 
assign TP[10:7] = {4{1'b 0}}; 

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// // STATE MACHINE ------------------

endmodule // module ARP_10G

