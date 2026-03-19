/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_tx_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_tx_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:29:38 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2018-2021
//  Filename:  TCP_TX_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 2
//  Date last modified: 1/18/21
//  Inheritance: 	COM-5402 (1G) TCP_TX.VHD rev2 12/10/15
// 
//  description:  Sends a TCP packet, including the IP and MAC headers. 10Gbits/s.
//  All input information is available at the time of the transmit trigger.
// 
//  Device utilization (MSS = 1460, IPv6_ENABLED='1')
//  FF: 681
//  LUT: 1331
//  DSP48: 0
//  18Kb BRAM: 0
//  BUFG: 1
//  Minimum period: 6.408ns (Maximum Frequency: 156.055MHz) Artix7-100T -1 speed grade
// 
//  Rev 1 1/18/20 AZ
//  corrected bug in the TCP option field (MSS size)
// 
//  Rev 2 1/18/21 AZ
//  Added TCP option for window scaling
// -------------------------------------------------------------

module TCP_TX_10G (
   CLK,
   SYNC_RESET,
   MAC_ADDR,
   IPv4_ADDR,
   IPv6_ADDR,
   TX_PACKET_SEQUENCE_START,
   TX_DEST_MAC_ADDR_IN,
   TX_DEST_IP_ADDR_IN,
   TX_DEST_PORT_NO_IN,
   TX_SOURCE_PORT_NO_IN,
   TX_IPv4_6n_IN,
   TX_SEQ_NO_IN,
   TX_ACK_NO_IN,
   TX_ACK_WINDOW_LENGTH_IN,
   IP_ID_IN,
   TX_FLAGS_IN,
   TX_PACKET_TYPE_IN,
   TX_WINDOW_SCALE_IN,
   TX_PAYLOAD_DATA,
   TX_PAYLOAD_DATA_VALID,
   TX_PAYLOAD_WORD_VALID,
   TX_PAYLOAD_DATA_EOF,
   TX_PAYLOAD_RTS,
   TX_PAYLOAD_CTS,
   TX_PAYLOAD_SIZE,
   TX_PAYLOAD_CHECKSUM,
   MAC_TX_DATA,
   MAC_TX_DATA_VALID,
   MAC_TX_EOF,
   MAC_TX_CTS,
   TP);
 


input   CLK; 
input   SYNC_RESET; 
input   [47:0] MAC_ADDR; 
input   [31:0] IPv4_ADDR; 
input   [127:0] IPv6_ADDR; 
input   TX_PACKET_SEQUENCE_START; 
input   [47:0] TX_DEST_MAC_ADDR_IN; 
input   [127:0] TX_DEST_IP_ADDR_IN; 
input   [15:0] TX_DEST_PORT_NO_IN; 
input   [15:0] TX_SOURCE_PORT_NO_IN; 
input   TX_IPv4_6n_IN; 
input   [31:0] TX_SEQ_NO_IN; 
input   [31:0] TX_ACK_NO_IN; 
input   [15:0] TX_ACK_WINDOW_LENGTH_IN; 
input   [15:0] IP_ID_IN; 
input   [7:0] TX_FLAGS_IN; 
input   [1:0] TX_PACKET_TYPE_IN; 
input   [3:0] TX_WINDOW_SCALE_IN; 
input   [63:0] TX_PAYLOAD_DATA; 
input   [7:0] TX_PAYLOAD_DATA_VALID; 
input   TX_PAYLOAD_WORD_VALID; 
input   TX_PAYLOAD_DATA_EOF; 
input   TX_PAYLOAD_RTS; 
output   TX_PAYLOAD_CTS; 
input   [15:0] TX_PAYLOAD_SIZE; 
input   [17:0] TX_PAYLOAD_CHECKSUM; 
output   [63:0] MAC_TX_DATA; 
output   [7:0] MAC_TX_DATA_VALID; 
output   MAC_TX_EOF; 
input   MAC_TX_CTS; 
output   [10:1] TP; 

parameter MSSv6 = 1440;
parameter MSSv4 = 1460;
//
parameter IPv6_ENABLED = 1'b1;

// // CLK, RESET
//  Must be a global clock. No BUFG instantiation within this component.

wire    TX_PAYLOAD_CTS; 

//  packet size (TCP payload data only). valid (and fixed) while TX_RTS = '1'.
reg     [63:0] MAC_TX_DATA; 

//  data valid
reg     [7:0]   MAC_TX_DATA_VALID; 

//  '1' when sending the last byte in a packet to be transmitted. 
//  Aligned with MAC_TX_DATA_VALID
wire    MAC_TX_EOF; 

//  MAC-generated Clear To Send flow control signal, indicating room in the 
//  MAC tx elastic buffer for a complete maximum size frame 1518B. 
//  The user should check that this signal is high before deciding to send
//  sending the next frame. 
//  Note: MAC_TX_CTS may go low while the frame is transfered in. Ignore it as space is guaranteed
//  at the start of frame.
// 		-- Test Points
wire    [10:1] TP; 
reg     [47:0] TX_DEST_MAC_ADDR; 
reg     [127:0] TX_DEST_IP_ADDR; 
reg     [15:0] TX_DEST_PORT_NO; 
reg     [15:0] TX_SOURCE_PORT_NO; 
reg     TX_IPv4_6n; 
reg     [3:0] TX_TCP_HEADER_LENGTH; 
//  in 32-bit words

// signal TX_TCP_HEADER_LENGTH_DEC: unsigned(3 downto 0) := (others => '0');	-- in 32-bit words
reg     [15:0] TX_TCP_PAYLOAD_SIZE; 
//  TCP payload size in bytes.
reg     [31:0] TX_SEQ_NO; 
reg     [31:0] TX_ACK_NO; 
reg     [15:0] TX_ACK_WINDOW_LENGTH; 
reg     [15:0] IP_ID; 
reg     [7:0] TX_FLAGS; 
reg     [1:0] TX_PACKET_TYPE; 
reg     [3:0] TX_WINDOW_SCALE; 

// // TX IP HEADER CHECKSUM ---------------------------------------------
reg     [7:0] TX_PACKET_SEQUENCE_START_SHIFT; 
reg     [18:0] CKSUM_PART1; 
reg     [2:0] CKSUM_SEQ_CNTR; 
reg     [17:0] IP_HEADER_CHECKSUM; 
reg     [17:0] IP_HEADER_CHECKSUM0; 
reg     [17:0] IP_HEADER_CHECKSUM_PLUS; 
reg     [15:0] IP_HEADER_CHECKSUM_FINAL; 

// //-- TCP TX CHECKSUM  ---------------------------
reg     [17:0] CKSUM4; 
reg     [17:0] CKSUM5; 
reg     [17:0] CKSUM6; 
reg     [17:0] CKSUM7; 
reg     [17:0] CKSUM8; 
reg     [3:0] CKSUM_CARRY2; 
reg     [3:0] CKSUM_CARRY4; 
reg     [15:0] TCP_CHECKSUM; 

// //---- TX PACKET ASSEMBLY   ----------------------
reg     TX_PAYLOAD_CTS_FLAG; 
reg     [15:0] TCP_HEADER_BYTE12_13; 
reg     [63:0] TX_PAYLOAD_DATA_PREVIOUS; 
reg     [7:0] TX_PAYLOAD_DATA_VALID_PREVIOUS; 
reg     TX_PAYLOAD_DATA_EOF_PREVIOUS; 
reg     MAC_TX_CTS_D; 
reg     MAC_TX_CTS_D2; 
reg     TX_PAYLOAD_CTS_FLAG0; 
reg     TX_ACTIVE0; 
reg     TX_ACTIVE; 
reg     [10:0] TX_WORD_COUNTER; 
reg     [10:0] TX_WORD_COUNTER_D; 
reg     MAC_TX_WORD_VALID_E2; 
reg     MAC_TX_WORD_VALID_E; 
reg     MAC_TX_WORD_VALID; 
reg     MAC_TX_EOF_local; 
reg     TX_TCP_LAST_HEADER_BYTE; 
reg     [15:0] TX_IP_LENGTH; 
reg     [7:0] MAC_TX_DATA_D; 

// // TX TCP CHECKSUM ---------------------------------------------
// signal TX_TCP_HEADER_D: std_logic := '0';
// signal TX_TCP_CKSUM_DATA: std_logic_vector(15 downto 0) := (others => '0');
// signal TX_TCP_CKSUM_FLAG: std_logic := '0';
// signal TX_TCP_CHECKSUM: unsigned(16 downto 0) := (others => '0');
// signal TX_TCP_CHECKSUM_FINAL: unsigned(15 downto 0) := (others => '0');
reg     [15:0] TX_TCP_LENGTH; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// //---- FREEZE INPUTS -----------------------
//  Latch in all key fields at the start trigger

initial 
   begin : process_49
   TX_TCP_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_48
   MAC_TX_DATA_D = {8{1'b 0}};   
   end

initial 
   begin : process_47
   TX_IP_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_46
   TX_TCP_LAST_HEADER_BYTE = 1'b 0;   
   end

initial 
   begin : process_45
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_44
   MAC_TX_WORD_VALID = 1'b 0;   
   end

initial 
   begin : process_43
   MAC_TX_WORD_VALID_E = 1'b 0;   
   end

initial 
   begin : process_42
   MAC_TX_WORD_VALID_E2 = 1'b 0;   
   end

initial 
   begin : process_41
   TX_WORD_COUNTER_D = {11{1'b 0}};   
   end

initial 
   begin : process_40
   TX_WORD_COUNTER = {11{1'b 0}};   
   end

initial 
   begin : process_39
   TX_ACTIVE = 1'b 0;   
   end

initial 
   begin : process_38
   TX_ACTIVE0 = 1'b 0;   
   end

initial 
   begin : process_37
   TX_PAYLOAD_CTS_FLAG0 = 1'b 0;   
   end

initial 
   begin : process_36
   MAC_TX_CTS_D2 = 1'b 0;   
   end

initial 
   begin : process_35
   MAC_TX_CTS_D = 1'b 0;   
   end

initial 
   begin : process_34
   TX_PAYLOAD_DATA_EOF_PREVIOUS = 1'b 0;   
   end

initial 
   begin : process_33
   TX_PAYLOAD_DATA_VALID_PREVIOUS = {8{1'b 0}};   
   end

initial 
   begin : process_32
   TX_PAYLOAD_DATA_PREVIOUS = {64{1'b 0}};   
   end

initial 
   begin : process_31
   TCP_HEADER_BYTE12_13 = {16{1'b 0}};   
   end

initial 
   begin : process_30
   TX_PAYLOAD_CTS_FLAG = 1'b 0;   
   end

initial 
   begin : process_29
   TCP_CHECKSUM = {16{1'b 0}};   
   end

initial 
   begin : process_28
   CKSUM_CARRY4 = {4{1'b 0}};   
   end

initial 
   begin : process_27
   CKSUM_CARRY2 = {4{1'b 0}};   
   end

initial 
   begin : process_26
   CKSUM8 = {18{1'b 0}};   
   end

initial 
   begin : process_25
   CKSUM7 = {18{1'b 0}};   
   end

initial 
   begin : process_24
   CKSUM6 = {18{1'b 0}};   
   end

initial 
   begin : process_23
   CKSUM5 = {18{1'b 0}};   
   end

initial 
   begin : process_22
   CKSUM4 = {18{1'b 0}};   
   end

initial 
   begin : process_21
   IP_HEADER_CHECKSUM_FINAL = {16{1'b 0}};   
   end

initial 
   begin : process_20
   IP_HEADER_CHECKSUM_PLUS = {18{1'b 0}};   
   end

initial 
   begin : process_19
   IP_HEADER_CHECKSUM0 = {18{1'b 0}};   
   end

initial 
   begin : process_18
   IP_HEADER_CHECKSUM = {18{1'b 0}};   
   end

initial 
   begin : process_17
   CKSUM_SEQ_CNTR = {3{1'b 0}};   
   end

initial 
   begin : process_16
   CKSUM_PART1 = {19{1'b 0}};   
   end

initial 
   begin : process_15
   TX_PACKET_SEQUENCE_START_SHIFT = {8{1'b 0}};   
   end

initial 
   begin : process_14
   TX_WINDOW_SCALE = {4{1'b 0}};   
   end

initial 
   begin : process_13
   TX_PACKET_TYPE = {2{1'b 0}};   
   end

initial 
   begin : process_12
   TX_FLAGS = {8{1'b 0}};   
   end

initial 
   begin : process_11
   IP_ID = {16{1'b 0}};   
   end

initial 
   begin : process_10
   TX_ACK_WINDOW_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_9
   TX_ACK_NO = {32{1'b 0}};   
   end

initial 
   begin : process_8
   TX_SEQ_NO = {32{1'b 0}};   
   end

initial 
   begin : process_7
   TX_TCP_PAYLOAD_SIZE = {16{1'b 0}};   
   end

initial 
   begin : process_6
   TX_TCP_HEADER_LENGTH = {4{1'b 0}};   
   end

initial 
   begin : process_5
   TX_IPv4_6n = 1'b 0;   
   end

initial 
   begin : process_4
   TX_SOURCE_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_3
   TX_DEST_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_2
   TX_DEST_IP_ADDR = {128{1'b 0}};   
   end

initial 
   begin : process_1
   TX_DEST_MAC_ADDR = {48{1'b 0}};   
   end


always @(posedge CLK)
   begin : FREEZE_KEY_FIELDS_001
   if (CLK === 1'b 1)
      begin
      if (TX_PACKET_SEQUENCE_START === 1'b 1)
         begin

//  Freeze parameters which can change 
//  while we are sending the TCP packet to the MAC layer
         TX_DEST_MAC_ADDR <= TX_DEST_MAC_ADDR_IN;   
         TX_DEST_IP_ADDR <= TX_DEST_IP_ADDR_IN;   
         TX_DEST_PORT_NO <= TX_DEST_PORT_NO_IN;   
         TX_SOURCE_PORT_NO <= TX_SOURCE_PORT_NO_IN;   
         TX_IPv4_6n <= TX_IPv4_6n_IN;   
         IP_ID <= IP_ID_IN;   
         end
      end
   end


always @(posedge CLK)
   begin : FREEZE_KEY_FIELDS_002
   if (CLK === 1'b 1)
      begin
      if (TX_PACKET_SEQUENCE_START === 1'b 1)
         begin

//  latch in key fields at start of packet assembly (they can change during packet assembly, 
//  for example if an ACK is received).
         TX_SEQ_NO <= TX_SEQ_NO_IN;   
         TX_ACK_NO <= TX_ACK_NO_IN;   
         TX_ACK_WINDOW_LENGTH <= TX_ACK_WINDOW_LENGTH_IN;   
         TX_FLAGS <= TX_FLAGS_IN;   
         TX_PACKET_TYPE <= TX_PACKET_TYPE_IN;   
         TX_WINDOW_SCALE <= TX_WINDOW_SCALE_IN;   
         if (TX_PACKET_TYPE_IN === 1)
            begin
            TX_TCP_HEADER_LENGTH <= 4'h 7;   
//  28 bytes, includes two TCP options (MSS, window scaling).

//  default length
            end
         else
            begin
            TX_TCP_HEADER_LENGTH <= 4'h 5;   
//  20 bytes, default
            end
         if (TX_PACKET_TYPE_IN === 3)
            begin

//  payload size from TCP_TXBUF
            TX_TCP_PAYLOAD_SIZE <= TX_PAYLOAD_SIZE;   

//  no payload
            end
         else
            begin
            TX_TCP_PAYLOAD_SIZE <= {16{1'b 0}};   
            end
         end
      end
   end

// //---- TX PACKET SIZE ---------------------------

always @(posedge CLK)
   begin : TX_PACKET_TYPE_GEN_001
   if (CLK === 1'b 1)
      begin
      TX_TCP_LENGTH <= {10'b 0000000000, TX_TCP_HEADER_LENGTH, 2'b 00} + TX_TCP_PAYLOAD_SIZE;   

//  total TCP frame size, in bytes. Part of TCP pseudo-header needed for TCP checksum computation
//  total IP frame size, in bytes. IP header is always the standard size of 20 bytes (IPv4) or 40 bytes (IPv6)
//  ready at TX_PACKET_SEQUENCE_START_D3
      if (TX_IPv4_6n === 1'b 1)
         begin
         TX_IP_LENGTH <= TX_TCP_LENGTH + 20;   
         end
      else
         begin
         TX_IP_LENGTH <= TX_TCP_LENGTH + 40;   
         end
      end
   end

// // IP HEADER CHECKSUM ----------------------
//  Transmit IP packet header checksum. Only applies to IPv4 (no header checksum in IPv6)
//  We must start the checksum early as the checksum field is not the last word in the header.
//  perform 1's complement sum of all 16-bit words within the header.
//  the checksum must be ready when TX_WORD_COUNTER_D=3
// -- Note: same code used in udp_tx.vhd

always @(posedge CLK)
   begin : IP_HEADER_CHECKSUM_001
   if (CLK === 1'b 1)
      begin
      IP_HEADER_CHECKSUM0 <= {2'b 01, 16'h 8406} + IPv4_ADDR[31:16] + IPv4_ADDR[15:0];   
//  x"4500" + x"4000" + x"FF06"
      if (TX_PACKET_SEQUENCE_START === 1'b 1 & TX_IPv4_6n_IN === 1'b 0)
         begin
//  the IP header checksum applies only to IPv4
         IP_HEADER_CHECKSUM <= {18{1'b 0}};   
         end
      else if (TX_PACKET_SEQUENCE_START === 1'b 1 & TX_IPv4_6n_IN === 1'b 1 )
         begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM0[15:0] + IP_HEADER_CHECKSUM0[17:16] + IP_ID_IN;   
         end
      else if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1 )
         begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + TX_DEST_IP_ADDR[15:0];   
         end
      else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 )
         begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + TX_DEST_IP_ADDR[31:16];   
         end
      else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 )
         begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + TX_IP_LENGTH;   
         end
      else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 )
         begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS;   
         end
      end
   end


always @( IP_HEADER_CHECKSUM ) 
IP_HEADER_CHECKSUM_PLUS = IP_HEADER_CHECKSUM[15:0] + IP_HEADER_CHECKSUM[17:16]; 

always @( IP_HEADER_CHECKSUM ) 
IP_HEADER_CHECKSUM_FINAL = ((IP_HEADER_CHECKSUM[16] === 1'b 1) & (IP_HEADER_CHECKSUM[0] === 1'b 0)) ? 16'h FFFF : ((IP_HEADER_CHECKSUM[16] === 1'b 1 & IP_HEADER_CHECKSUM[0] === 1'b 1) ? 16'h FFFE : ~IP_HEADER_CHECKSUM[15:0]); 

// //-- TCP TX CHECKSUM  ---------------------------
//  Compute the TCP payload checksum (excluding headers).
//  Different pseudo-headers are used for IPv4 and IPv6
//  for IPv6, pre-compute the IPv6 address checksum. Only once at reset.

always @(posedge CLK)
   begin : TCP_CKSUM_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_SEQ_CNTR <= 3'b 110;   
         end
      else if (CKSUM_SEQ_CNTR > 0 )
         begin
         CKSUM_SEQ_CNTR <= CKSUM_SEQ_CNTR - 1;   
         end
      end
   end


always @(posedge CLK)
   begin : TCP_CKSUM_002
   if (CLK === 1'b 1)
      begin

//  fixed part of the checksum is initialized at reset
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_PART1 <= IPv6_ADDR[127:112] + IPv6_ADDR[111:96];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 110 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[95:80];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 101 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[79:64];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 100 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[63:48];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 011 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[47:32];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 010 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[31:16];   
         end
      else if (CKSUM_SEQ_CNTR === 3'b 001 )
         begin
         CKSUM_PART1 <= CKSUM_PART1 + IPv6_ADDR[15:0];   
         end
      end
   end

//  Checksum computation must be complete by the time TX_WORD_COUNTER reaches 5(IPv4) or 7 (IPv6). So we only have 5 iterations maximum to sum the pseudo header.

always @(posedge CLK)
   begin : TCP_CKSUM_003
   if (CLK === 1'b 1)
      begin
      TX_PACKET_SEQUENCE_START_SHIFT[7:0] <= {TX_PACKET_SEQUENCE_START_SHIFT[6:0], TX_PACKET_SEQUENCE_START};   
      if (TX_PACKET_SEQUENCE_START === 1'b 1)
         begin
         if (TX_PACKET_TYPE_IN === 3)
            begin

//  payload size from TCP_TXBUF
            CKSUM4 <= TX_PAYLOAD_CHECKSUM[15:0] + 16'h 0006;   
//  data checksum + TCP protocol
            end
         else if (TX_PACKET_TYPE_IN === 1 )
            begin
            if (TX_WINDOW_SCALE_IN !== 4'h 0)
               begin

//  TCP option: MSS, window scale, no payload data
               if (TX_IPv4_6n_IN === 1'b 1)
                  begin
                  CKSUM4 <= MSSv4 + 16'h 020A + 16'h 0103 + {12'h 030, TX_WINDOW_SCALE_IN};   
//  TCP protocol + MSS options  
                  end
               else
                  begin
                  CKSUM4 <= MSSv6 + 16'h 020A + 16'h 0103 + {12'h 030, TX_WINDOW_SCALE_IN};   
//  TCP protocol + MSS options  
                  end

//  TCP option: MSS, no payload data
               end
            else
               begin
               if (TX_IPv4_6n_IN === 1'b 1)
                  begin
                  CKSUM4 <= MSSv4 + 16'h 020A;   
//  TCP protocol + MSS options  
                  end
               else
                  begin
                  CKSUM4 <= MSSv6 + 16'h 020A;   
//  TCP protocol + MSS options  
                  end
               end

//  (unsigned(TX_PACKET_TYPE_IN) = 2) then
//  no payload data
            end
         else
            begin
            CKSUM4 <= {2'b 00, 16'h 0006};   
//  TCP protocol  
            end
         CKSUM5 <= TX_SOURCE_PORT_NO_IN + TX_DEST_PORT_NO_IN;   
//  src + dest ports 
         CKSUM6 <= TX_SEQ_NO_IN[31:16] + TX_SEQ_NO_IN[15:0];   
         CKSUM7 <= TX_ACK_NO_IN[31:16] + TX_ACK_NO_IN[15:0];   
         if (TX_PACKET_TYPE_IN === 3)
            begin

//  payload size from TCP_TXBUF
            CKSUM8 <= TX_PAYLOAD_CHECKSUM[17:16];   
//  carry bits
            end
         else
            begin
            CKSUM8 <= {18{1'b 0}};   
            end
         end
      else
         begin
         if (TX_IPv4_6n === 1'b 1)
            begin

//  IPv4
            if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1)
               begin
               CKSUM4 <= CKSUM4[15:0] + IPv4_ADDR[31:16];   
//  src IP address
               CKSUM5 <= CKSUM5[15:0] + IPv4_ADDR[15:0];   
//  src IP address
               CKSUM6 <= CKSUM6[15:0] + TX_DEST_IP_ADDR[31:16];   
//  dest IP address
               CKSUM7 <= CKSUM7[15:0] + TX_DEST_IP_ADDR[15:0];   
//  dest IP address
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + TCP_HEADER_BYTE12_13;   
               CKSUM5 <= CKSUM5[15:0] + TX_ACK_WINDOW_LENGTH;   
               CKSUM6 <= CKSUM6[15:0] + TX_TCP_LENGTH;   
//  + TCP length
               CKSUM7[17:16] <= 2'b 00;   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM6[15:0];   
               CKSUM5 <= CKSUM5[15:0] + CKSUM7[15:0];   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM5[15:0];   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY2;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[4] === 1'b 1 )
               begin
               CKSUM8 <= CKSUM8 + CKSUM4[15:0] + CKSUM4[17:16];   
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[5] === 1'b 1 )
               begin
               CKSUM8 <= CKSUM8[15:0] + CKSUM8[17:16];   
               end
            end
         else if (IPv6_ENABLED === 1'b 1 )
            begin

//  IPv6
            if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1)
               begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM_PART1[15:0];   
               CKSUM5 <= CKSUM5[15:0] + CKSUM_PART1[18:16];   
               CKSUM6 <= CKSUM6[15:0] + TX_DEST_IP_ADDR[127:112];   
               CKSUM7 <= CKSUM7[15:0] + TX_DEST_IP_ADDR[111:96];   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[95:80];   
//  dest IP address
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[79:64];   
//  dest IP address
               CKSUM6 <= CKSUM6[15:0] + TX_DEST_IP_ADDR[63:48];   
               CKSUM7 <= CKSUM7[15:0] + TX_DEST_IP_ADDR[47:32];   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[31:16];   
//  dest IP address
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[15:0];   
//  dest IP address
               CKSUM6 <= CKSUM6[15:0] + TCP_HEADER_BYTE12_13;   
               CKSUM7 <= CKSUM7[15:0] + TX_ACK_WINDOW_LENGTH;   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + TX_TCP_LENGTH;   
//  + TCP length
               CKSUM5 <= CKSUM5[15:0] + CKSUM7[15:0];   
               CKSUM6[17:16] <= 2'b 00;   
               CKSUM7[17:16] <= 2'b 00;   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY4;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[4] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM6[15:0];   
               CKSUM5[17:16] <= 2'b 00;   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY2;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[5] === 1'b 1 )
               begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM5[15:0];   
               CKSUM8 <= CKSUM8 + CKSUM_CARRY2;   
//  carry
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[6] === 1'b 1 )
               begin
               CKSUM8 <= CKSUM8 + CKSUM4[15:0] + CKSUM4[17:16];   
               end
            else if (TX_PACKET_SEQUENCE_START_SHIFT[7] === 1'b 1 )
               begin
               CKSUM8 <= CKSUM8[15:0] + CKSUM8[17:16];   
               end
            end
         end
      end
   end


always @( CKSUM4 or CKSUM5 ) 
CKSUM_CARRY2 = CKSUM4[17:16] + CKSUM5[17:16]; 

always @( CKSUM4 or CKSUM5 or CKSUM6 or CKSUM7 ) 
CKSUM_CARRY4 = CKSUM4[17:16] + CKSUM5[17:16] + CKSUM6[17:16] + CKSUM7[17:16]; 

always @( CKSUM8 ) 
TCP_CHECKSUM = ~CKSUM8[15:0]; 

// //---- TX PACKET ASSEMBLY   ---------------------
//  Transmit packet is assembled on the fly, consistent with our design goal
//  of minimizing storage in each TCP_SERVER component.
//  The packet includes the lower layers, i.e. IP layer and Ethernet layer.
//  
//  First, we tell the outsider arbitration that we are ready to send by raising RTS high.
//  When the transmit path becomes available, the arbiter tells us to go ahead with the transmission MAC_TX_CTS = '1'

always @(posedge CLK)
   begin : STATE_MACHINE_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TX_ACTIVE0 <= 1'b 0;   
         end
      else if (TX_PACKET_SEQUENCE_START === 1'b 1 )
         begin
         TX_ACTIVE0 <= 1'b 1;   
         end
      else if (MAC_TX_EOF_local === 1'b 1 )
         begin
         TX_ACTIVE0 <= 1'b 0;   
         end
      end
   end


always @( TX_ACTIVE0 or MAC_TX_EOF_local ) 
TX_ACTIVE = TX_ACTIVE0 & ~MAC_TX_EOF_local; 

always @(posedge CLK)
   begin : TX_SCHEDULER_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TX_WORD_COUNTER <= {11{1'b 1}};   
         TX_WORD_COUNTER_D <= {11{1'b 1}};   
         MAC_TX_WORD_VALID_E2 <= 1'b 0;   
         MAC_TX_WORD_VALID_E <= 1'b 0;   
         end
      else
         begin
         MAC_TX_WORD_VALID_E <= MAC_TX_WORD_VALID_E2;   
         TX_WORD_COUNTER_D <= TX_WORD_COUNTER;   
         if (TX_PACKET_SEQUENCE_START === 1'b 1)
            begin
            TX_WORD_COUNTER <= {11{1'b 1}};   
            MAC_TX_WORD_VALID_E2 <= 1'b 0;   
            end
         else if (TX_ACTIVE === 1'b 1 & MAC_TX_CTS === 1'b 1 )
            begin
            TX_WORD_COUNTER <= TX_WORD_COUNTER + 1;   
            MAC_TX_WORD_VALID_E2 <= 1'b 1;   
//  enable path to MAC
            end
         else
            begin
            MAC_TX_WORD_VALID_E2 <= 1'b 0;   
            end
         end
      end
   end


always @( TX_TCP_HEADER_LENGTH ) 
TCP_HEADER_BYTE12_13[15:12] = TX_TCP_HEADER_LENGTH; 

initial 
   TCP_HEADER_BYTE12_13[11:8] = 4'b 0000; 

always @( TX_FLAGS ) 
TCP_HEADER_BYTE12_13[7:0] = TX_FLAGS; 

//  re-align bytes from payload data word to  MAC_TX_DATA word

always @(posedge CLK)
   begin : WORD_ALIGN_001
   if (CLK === 1'b 1)
      begin
      MAC_TX_CTS_D <= MAC_TX_CTS;   
      MAC_TX_CTS_D2 <= MAC_TX_CTS_D;   
      if (TX_PAYLOAD_WORD_VALID === 1'b 1)
         begin

//  = MAC_TX_CTS_D2 when there is payload data
         TX_PAYLOAD_DATA_PREVIOUS <= TX_PAYLOAD_DATA;   
         TX_PAYLOAD_DATA_VALID_PREVIOUS <= TX_PAYLOAD_DATA_VALID;   
         TX_PAYLOAD_DATA_EOF_PREVIOUS <= TX_PAYLOAD_DATA_EOF;   
         end
      else if (TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & MAC_TX_CTS_D2 === 1'b 1 )
         begin
         TX_PAYLOAD_DATA_VALID_PREVIOUS <= 8'h 00;   
         TX_PAYLOAD_DATA_EOF_PREVIOUS <= 1'b 0;   
         end
      end
   end


always @(posedge CLK)
   begin : MAC_TX_DATA_GEN_001
   if (CLK === 1'b 1)
      begin
      if (TX_IPv4_6n === 1'b 1)
         begin

//  IPv4
         case (TX_WORD_COUNTER_D)
         11'b 00000000000:
            begin
            MAC_TX_DATA[63:16] <= TX_DEST_MAC_ADDR;   
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   
            end
         11'b 00000000001:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   
            MAC_TX_DATA[31:0] <= 32'h 08004500;   
            end
         11'b 00000000010:
            begin
            MAC_TX_DATA[63:48] <= TX_IP_LENGTH;   
            MAC_TX_DATA[47:32] <= IP_ID;   
            MAC_TX_DATA[31:0] <= 32'h 4000FF06;   
//  don't fragment, 255 hop limit, TCP
            end
         11'b 00000000011:
            begin
            MAC_TX_DATA[63:48] <= IP_HEADER_CHECKSUM_FINAL;   
//  IP header checksum   
            MAC_TX_DATA[47:16] <= IPv4_ADDR;   
//  source IP address   
            MAC_TX_DATA[15:0] <= TX_DEST_IP_ADDR[31:16];   
//  destination IP address   
            end
         11'b 00000000100:
            begin
            MAC_TX_DATA[63:48] <= TX_DEST_IP_ADDR[15:0];   
//  destination IP address  
            MAC_TX_DATA[47:32] <= TX_SOURCE_PORT_NO;   
            MAC_TX_DATA[31:16] <= TX_DEST_PORT_NO;   
            MAC_TX_DATA[15:0] <= TX_SEQ_NO[31:16];   
            end
         11'b 00000000101:
            begin
            MAC_TX_DATA[63:48] <= TX_SEQ_NO[15:0];   
            MAC_TX_DATA[47:16] <= TX_ACK_NO[31:0];   
//  ack number;
            MAC_TX_DATA[15:0] <= TCP_HEADER_BYTE12_13;   
            end
         11'b 00000000110:
            begin
            MAC_TX_DATA[63:48] <= TX_ACK_WINDOW_LENGTH;   
            MAC_TX_DATA[47:32] <= TCP_CHECKSUM;   
            MAC_TX_DATA[31:16] <= 16'h 0000;   
            if (TX_PACKET_TYPE === 1)
               begin

//  TCP option: MSS
               MAC_TX_DATA[15:0] <= 16'h 0204;   
               end
            else if (TX_PACKET_TYPE === 3 & TX_PAYLOAD_WORD_VALID === 1'b 1 )
               begin
               MAC_TX_DATA[15:0] <= TX_PAYLOAD_DATA[63:48];   
               end
            else
               begin
               MAC_TX_DATA[15:0] <= {16{1'b 0}};   
               end
            end
         default:
            begin
            if (TX_WORD_COUNTER_D === 7 & TX_PACKET_TYPE === 1)
               begin

//  TCP option: MSS. No payload data
               MAC_TX_DATA[63:48] <= MSSv4;   
//  TCP option: window scaling (when not zero)
               if (TX_WINDOW_SCALE !== 4'h 0)
                  begin
                  MAC_TX_DATA[47:24] <= 24'h 010303;   
                  end
               else
                  begin
                  MAC_TX_DATA[47:24] <= 24'h 000000;   
                  end
               MAC_TX_DATA[23:16] <= {4'b 0000, TX_WINDOW_SCALE};   
               MAC_TX_DATA[15:0] <= {16{1'b 0}};   
               end
            else if (TX_PACKET_TYPE === 3 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1)
                  begin
                  MAC_TX_DATA[63:16] <= TX_PAYLOAD_DATA_PREVIOUS[47:0];   
                  MAC_TX_DATA[15:0] <= TX_PAYLOAD_DATA[63:48];   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & 
      TX_PAYLOAD_DATA_VALID_PREVIOUS[5] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_DATA[63:16] <= TX_PAYLOAD_DATA_PREVIOUS[47:0];   
                  MAC_TX_DATA[15:0] <= {16{1'b 0}};   
                  end
               end
            end
         endcase
         end
      else if (IPv6_ENABLED === 1'b 1 )
         begin

//  IPv6
         case (TX_WORD_COUNTER_D)
         11'b 00000000000:
            begin
            MAC_TX_DATA[63:16] <= TX_DEST_MAC_ADDR;   
            MAC_TX_DATA[15:0] <= MAC_ADDR[47:32];   
            end
         11'b 00000000001:
            begin
            MAC_TX_DATA[63:32] <= MAC_ADDR[31:0];   
            MAC_TX_DATA[31:0] <= 32'h 86dd6000;   
            end
         11'b 00000000010:
            begin
            MAC_TX_DATA[63:48] <= 16'h 0000;   
            MAC_TX_DATA[47:32] <= TX_TCP_LENGTH;   
//  payload length
            MAC_TX_DATA[31:16] <= 16'h 06FF;   
//  TCP, 255 hop limit
            MAC_TX_DATA[15:0] <= IPv6_ADDR[127:112];   
            end
         11'b 00000000011:
            begin
            MAC_TX_DATA <= IPv6_ADDR[111:48];   
            end
         11'b 00000000100:
            begin
            MAC_TX_DATA[63:16] <= IPv6_ADDR[47:0];   
            MAC_TX_DATA[15:0] <= TX_DEST_IP_ADDR[127:112];   
            end
         11'b 00000000101:
            begin
            MAC_TX_DATA <= TX_DEST_IP_ADDR[111:48];   
            end
         11'b 00000000110:
            begin
            MAC_TX_DATA[63:16] <= TX_DEST_IP_ADDR[47:0];   
            MAC_TX_DATA[15:0] <= TX_SOURCE_PORT_NO;   
            end
         11'b 00000000111:
            begin
            MAC_TX_DATA[63:48] <= TX_DEST_PORT_NO;   
            MAC_TX_DATA[47:16] <= TX_SEQ_NO[31:0];   
            MAC_TX_DATA[15:0] <= TX_ACK_NO[31:16];   
            end
         11'b 00000001000:
            begin
            MAC_TX_DATA[63:48] <= TX_ACK_NO[15:0];   
            MAC_TX_DATA[47:32] <= TCP_HEADER_BYTE12_13;   
            MAC_TX_DATA[31:16] <= TX_ACK_WINDOW_LENGTH;   
            MAC_TX_DATA[15:0] <= TCP_CHECKSUM;   
            end
         11'b 00000001001:
            begin
            MAC_TX_DATA[63:48] <= 16'h 0000;   
            if (TX_PACKET_TYPE === 1)
               begin

//  TCP option: MSS
               MAC_TX_DATA[47:32] <= 16'h 0240;   
               MAC_TX_DATA[31:16] <= MSSv6;   
//  TCP option: window scaling (when not zero)
               if (TX_WINDOW_SCALE !== 4'h 0)
                  begin
                  MAC_TX_DATA[15:0] <= 16'h 0103;   
                  end
               else
                  begin
                  MAC_TX_DATA[15:0] <= 16'h 0000;   
                  end
               end
            else if (TX_PACKET_TYPE === 3 & TX_PAYLOAD_WORD_VALID === 1'b 1 )
               begin
               MAC_TX_DATA[47:0] <= TX_PAYLOAD_DATA[63:16];   
               end
            else
               begin
               MAC_TX_DATA[47:0] <= {48{1'b 0}};   
               end
            end
         default:
            begin
            if (TX_WORD_COUNTER_D === 11'b 00000001010 & TX_PACKET_TYPE === 1)
               begin

//  TCP option: window scaling (cont'd)
//  TCP option: window scaling (when not zero)
               if (TX_WINDOW_SCALE !== 4'h 0)
                  begin
                  MAC_TX_DATA[63:56] <= 8'h 03;   
                  end
               else
                  begin
                  MAC_TX_DATA[63:56] <= 8'h 00;   
                  end
               MAC_TX_DATA[55:48] <= {4'b 0000, TX_WINDOW_SCALE};   
               MAC_TX_DATA[47:0] <= {48{1'b 0}};   
               end
            else if (TX_PACKET_TYPE === 3 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1)
                  begin
                  MAC_TX_DATA[63:48] <= TX_PAYLOAD_DATA_PREVIOUS[15:0];   
                  MAC_TX_DATA[47:0] <= TX_PAYLOAD_DATA[63:16];   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & TX_PAYLOAD_DATA_VALID_PREVIOUS[1] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_DATA[63:48] <= TX_PAYLOAD_DATA_PREVIOUS[15:0];   
                  MAC_TX_DATA[47:0] <= {48{1'b 0}};   
                  end
               end
            end
         endcase
         end
      end
   end


always @(posedge CLK)
   begin : MAC_TX_DATA_VALID_GEN_001
   if (CLK === 1'b 1)
      begin
      MAC_TX_WORD_VALID <= MAC_TX_WORD_VALID_E;   
      if (MAC_TX_WORD_VALID_E === 1'b 1)
         begin
         if (TX_IPv4_6n === 1'b 1)
            begin

//  IPv4
            if (TX_WORD_COUNTER_D <= 5)
               begin
               MAC_TX_DATA_VALID <= 8'h FF;   
               end
            else if (TX_WORD_COUNTER_D === 6 )
               begin
               if (TX_PACKET_TYPE === 1)
                  begin

//  TCP options: MSS
                  MAC_TX_DATA_VALID <= 8'h FF;   
                  end
               else if (TX_PACKET_TYPE === 3 & TX_PAYLOAD_WORD_VALID === 1'b 1 )
                  begin
                  MAC_TX_DATA_VALID <= {6'b 111111, TX_PAYLOAD_DATA_VALID[7:6]};   

//  TX_PACKET_TYPE = 2
                  end
               else
                  begin
                  MAC_TX_DATA_VALID <= 8'h FC;   
                  end
               end
            else if (TX_WORD_COUNTER_D === 7 )
               begin
               if (TX_PACKET_TYPE === 1)
                  begin

//  TCP options: MSS, window scaling
                  MAC_TX_DATA_VALID <= 8'h FC;   
                  end
               else if (TX_PACKET_TYPE === 3 )
                  begin
                  if (TX_PAYLOAD_WORD_VALID === 1'b 1)
                     begin
                     MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[5:0], TX_PAYLOAD_DATA_VALID[7:6]};   
                     end
                  else if (MAC_TX_CTS_D2 === 1'b 1 )
                     begin

//  flush partial last word
                     MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[5:0], 2'b 00};   
                     end
                  end
               else
                  begin
                  MAC_TX_DATA_VALID <= 8'h 00;   
                  end
               end
            else if (TX_PACKET_TYPE === 3 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1)
                  begin
                  MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[5:0], TX_PAYLOAD_DATA_VALID[7:6]};   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & 
      TX_PAYLOAD_DATA_VALID_PREVIOUS[5] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[5:0], 2'b 00};   
                  end
               else
                  begin
                  MAC_TX_DATA_VALID <= 8'h 00;   
                  end
               end
            else
               begin
               MAC_TX_DATA_VALID <= 8'h 00;   
               end
            end
         else if (IPv6_ENABLED === 1'b 1 )
            begin

//  IPv6
            if (TX_WORD_COUNTER_D <= 8)
               begin
               MAC_TX_DATA_VALID <= 8'h FF;   
               end
            else if (TX_WORD_COUNTER_D === 9 )
               begin
               if (TX_PACKET_TYPE === 1)
                  begin

//  TCP options: MSS, window scaling
                  MAC_TX_DATA_VALID <= 8'h FF;   
                  end
               else if (TX_PACKET_TYPE === 3 & TX_PAYLOAD_WORD_VALID === 1'b 1 )
                  begin
                  MAC_TX_DATA_VALID <= {2'b 11, TX_PAYLOAD_DATA_VALID[7:2]};   

//  (including TX_PACKET_TYPE = 2)
                  end
               else
                  begin
                  MAC_TX_DATA_VALID <= 8'h C0;   
                  end
               end
            else if (TX_WORD_COUNTER_D === 10 & TX_PACKET_TYPE === 1 )
               begin

//  TCP option: window scaling
               MAC_TX_DATA_VALID <= 8'h c0;   
               end
            else if (TX_PACKET_TYPE === 3 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1)
                  begin
                  MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[1:0], TX_PAYLOAD_DATA_VALID[7:2]};   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & 
      TX_PAYLOAD_DATA_VALID_PREVIOUS[1] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_DATA_VALID <= {TX_PAYLOAD_DATA_VALID_PREVIOUS[1:0], 6'b 000000};   
                  end
               else
                  begin
                  MAC_TX_DATA_VALID <= 8'h 00;   
                  end
               end
            else
               begin
               MAC_TX_DATA_VALID <= 8'h 00;   
               end
            end
         end
      else
         begin
         MAC_TX_DATA_VALID <= 8'h 00;   
         end
      end
   end


always @(posedge CLK)
   begin : MAC_TX_EOF_GEN_001
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         MAC_TX_EOF_local <= 1'b 0;   
         end
      else if (MAC_TX_WORD_VALID_E === 1'b 1 )
         begin
         if (TX_IPv4_6n === 1'b 1)
            begin
            if (TX_WORD_COUNTER_D === 6 & (TX_PAYLOAD_DATA_VALID[5] === 1'b 0 & 
      TX_PACKET_TYPE === 3 | TX_PACKET_TYPE === 2))
               begin
               MAC_TX_EOF_local <= 1'b 1;   
               end
            else if (TX_WORD_COUNTER_D === 7 & TX_PACKET_TYPE === 1 )
               begin
               MAC_TX_EOF_local <= 1'b 1;   
               end
            else if (TX_PACKET_TYPE === 3 & TX_WORD_COUNTER_D > 6 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1 & TX_PAYLOAD_DATA_VALID[5] === 1'b 0)
                  begin
                  MAC_TX_EOF_local <= 1'b 1;   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & 
      TX_PAYLOAD_DATA_VALID_PREVIOUS[5] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_EOF_local <= 1'b 1;   
                  end
               else
                  begin
                  MAC_TX_EOF_local <= 1'b 0;   
                  end
               end
            else
               begin
               MAC_TX_EOF_local <= 1'b 0;   
               end
            end
         else if (IPv6_ENABLED === 1'b 1 )
            begin

//  IPv6
            if (TX_WORD_COUNTER_D === 9 & TX_PAYLOAD_DATA_VALID[1] === 1'b 0)
               begin
               MAC_TX_EOF_local <= 1'b 1;   
               end
            else if (TX_WORD_COUNTER_D === 10 & TX_PACKET_TYPE === 1 )
               begin
               MAC_TX_EOF_local <= 1'b 1;   
               end
            else if (TX_PACKET_TYPE === 3 & TX_WORD_COUNTER_D > 9 )
               begin
               if (TX_PAYLOAD_WORD_VALID === 1'b 1 & TX_PAYLOAD_DATA_VALID[1] === 1'b 0)
                  begin
                  MAC_TX_EOF_local <= 1'b 1;   
                  end
               else if (MAC_TX_CTS_D2 === 1'b 1 & TX_PAYLOAD_DATA_EOF_PREVIOUS === 1'b 1 & 
      TX_PAYLOAD_DATA_VALID_PREVIOUS[1] === 1'b 1 )
                  begin

//  flush partial last word
                  MAC_TX_EOF_local <= 1'b 1;   
                  end
               else
                  begin
                  MAC_TX_EOF_local <= 1'b 0;   
                  end
               end
            else
               begin
               MAC_TX_EOF_local <= 1'b 0;   
               end
            end
         else
            begin
            MAC_TX_EOF_local <= 1'b 0;   
            end
         end
      else
         begin
         MAC_TX_EOF_local <= 1'b 0;   
         end
      end
   end

assign MAC_TX_EOF = MAC_TX_EOF_local; 

//  when to ask for next word from TCP tx buffer

always @(posedge CLK)
   begin : TX_PAYLOAD_CTS_FLAG_GEN
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         TX_PAYLOAD_CTS_FLAG0 <= 1'b 0;   
         end
      else if (TX_PACKET_SEQUENCE_START === 1'b 1 )
         begin
         TX_PAYLOAD_CTS_FLAG0 <= 1'b 0;   
         end
      else if (MAC_TX_CTS === 1'b 1 & TX_PACKET_TYPE === 2'b 11 & 
      (TX_IPv4_6n === 1'b 1 & TX_WORD_COUNTER === 4 | 
      IPv6_ENABLED === 1'b 1 & TX_IPv4_6n === 1'b 0 & 
      TX_WORD_COUNTER === 7) )
         begin
         TX_PAYLOAD_CTS_FLAG0 <= 1'b 1;   
         end
      else if (TX_PAYLOAD_DATA_EOF === 1'b 1 )
         begin

//  received the last word in a frame from TCP_TXBUF
         TX_PAYLOAD_CTS_FLAG0 <= 1'b 0;   
         end
      end
   end


always @( TX_PAYLOAD_CTS_FLAG0 or TX_PAYLOAD_DATA_EOF ) 
TX_PAYLOAD_CTS_FLAG = TX_PAYLOAD_CTS_FLAG0 & ~TX_PAYLOAD_DATA_EOF; 

//  clear to send. Ask TCP_TXBUF to send payload data
assign TX_PAYLOAD_CTS = MAC_TX_CTS & TX_PAYLOAD_CTS_FLAG; 

//  2 CLK latency until 1st data byte is available at TX_PAYLOAD_DATA
//  IPv4: first word has to arrive here when TX_WORD_COUNTER_D = 6
//  IPv6: first word has to arrive here when TX_WORD_COUNTER_D = 9

// ------------------------------------------------------
//       COMPONENTS
// ------------------------------------------------------
// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
// //---- FREEZE INPUTS -----------------------

// including file with called functions and tasks


endmodule // module TCP_TX_10G

