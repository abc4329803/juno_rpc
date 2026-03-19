/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\udp_tx_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\udp_tx_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:27:51 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2018
//  Filename:  UDP_TX_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 0
// 	Date last modified: 8/21/18
//  Inheritance: 	COM5402 UDP_TX.VHD 5/10/17 rev7
// 
//  description:  
//  The flexible UDP_TX.vhd component encapsulates a data packet into a UDP frame 
//  addressed from any port to any port/IP destination. 
//  10Gbits/s.
//  Supports IPv4 and IPv6. 
//  Portable VHDL
// 
//  As we can't be sure that the destination is reachable or even in the routing table, 
//  input packet acceptance is signified by an ACK or NAK.
//  Three cases:
//  (a) destination IP address is a WAN address: the UDP frame is sent immediately to the gateway
//  (b) destination IP address is a LAN address stored in the routing table. The UDP frame is sent between 0.1 and 
//  1.33us after receiving the last byte. 
//  (c) destination IP address is not in the routing table. The routing table will send an ARP request (takes time).
//  This component sends a NAK back to the application. It is up to the application to discard or retry later.
//  
//  The application (layer above) is responsible for UDP frame segmentation. 
//  The maximum size is determined by the number of block RAMs instantiated within. 
//  
//  This component holds AT MOST TWO PACKETS at any given time in an elastic buffer. One packet being transferred in,
//  another packet being transferred out.
// 
//  The application must check the flow control flag APP_CTS before and while sending data to this component.
//  The application should not send another UDP frame until receiving either an ACK or NAK regarding the previous
//  UDP frame. For speed reason, the app can transfer in the next UDP frame while the previous one is being 
//  transferred out to the MAC layer. The component behaves as an A/B buffer. 
// 
//  The maximum overall throughput is reached when all packets have about the same size.
// 
//  Device utilization (ADDR_WIDTH = 10, UDP_CKSUM_ENABLED='1',IPv6_ENABLED='1')
//  FF: 639
//  LUT: 1626
//  DSP48: 0
//  18Kb BRAM: 2
//  BUFG: 1
//  Minimum period: 5.688ns (Maximum Frequency: 175.824MHz) Artix7-100T -1 speed grade
// -------------------------------------------------------------

module UDP_TX_10G #(
      parameter ADDR_WIDTH = 10,
         // allocates buffer space: 73 bits * 2^ADDR_WIDTH words
      parameter UDP_CKSUM_ENABLED = 1'b1,
         // IPv4 checksum computation is optional. 0 to save space, 1 to enable.
      parameter IPv6_ENABLED = 1'b1
         // 0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)
 )(

      input   CLK,
          // CLK must be a global clock 156.25 MHz or faster to match the 10Gbps MAC speed.
      input   SYNC_RESET,
         // CLK-synchronous reset. MANDATORY!
      input   TICK_4US,

      //// APPLICATION INTERFACE -> TX BUFFER
      // The application interface is synchronous with the application clock CLK
      input   [63:0] APP_DATA,
          // byte order: MSB first (reason: easier to read contents during simulation)
          // unused bytes are expected to be zeroed
      input   [7:0] APP_DATA_VALID,
          // example: 1 byte -> 0x80, 2 bytes -> 0xC0
      input   APP_SOF,  // also resets internal state machine      
      input   APP_EOF,
         // IMPORTANT: always send an EOF to close the transaction.
      output  APP_CTS,
         // Clear To Send = transmit flow control. 
         // App is responsible for checking the CTS signal before sending APP_DATA
         // APP_SOF and APP_EOF are one CLK wide pulses indicating the first and last byte in the UDP frame.
         // Special case: Zero-length UDP frame: APP_SOF = '1', APP_EOF = '1' and APP_DATA_VALID = x"00"
         // Special case: 1 byte UDP frame: APP_SOF = '1', APP_EOF = '1', APP_DATA_VALID = x"80"
      output   ACK,
         // previous UDP frame is accepted for transmission. Always after APP_SOF, but could happen before or
      output   reg   NAK,
         // no routing information available for the selected LAN destination IP. Try later.  
         // ACK/NAK is sent anytime after APP_SOF, even before the input packet is fully transferred in  
   
      //// CONTROLS
      input   [127:0] DEST_IP_ADDR,
      input   [15:0] DEST_PORT_NO,
      input   [15:0] SOURCE_PORT_NO,
      input   IPv4_6n,
         // routing information. Read at start of UDP frame (APP_SOF = '1')
         // It can at any other time. 
         // Note: changing destination IP address may involve a timing penalty as this component
         // has to ask the routing table for routing information and possibly send an ARP request to
         // the target IP and wait for the ARP response.
      input   [15:0] IP_ID,
                // 16-bit IP ID, unique for each datagram. Incremented every time
                // an IP datagram is sent (not just for this socket).

      //// CONFIGURATION
      input   [47:0] MAC_ADDR,
      input   [31:0] IPv4_ADDR, 
      input   [127:0] IPv6_ADDR,
         // fixed (i.e. not changing from UDP frame to frame)

      //// ROUTING INFO (interface with ARP_CACHE2)
      // (a) Query
      output  reg  [127:0] RT_IP_ADDR,
         // user query: destination IP address to resolve (could be local or remote). read when RT_REQ_RTS = '1'
      output  reg          RT_IPv4_6n,
          // qualifier for RT_IP_ADDR: IPv4 (1) or IPv6 (0) address?
      output   RT_REQ_RTS,
         // routing query ready to start
      input   RT_REQ_CTS,
         // the top-level arbitration circuit passed the request to the routing table
          // (b) Reply
      input   [47:0] RT_MAC_REPLY,
         // Destination MAC address associated with the destination IP address RT_IP_ADDR. 
         // Could be the Gateway MAC address if the destination IP address is outside the local area network.
      input   RT_MAC_RDY,
         // 1 CLK pulse to read the MAC reply
         // If the routing table is idle, the worst case latency from the RT_REQ_RTS request is 0.85us
         // If there is no match in the table, no response will be provided. Calling routine should
         // therefore have a timeout timer to detect lack of response.
      input   RT_NAK,
         // 1 CLK pulse indicating that no record matching the RT_IP_ADDR was found in the table.


      //// OUTPUT: TX UDP layer -> Transmit MAC Interface
      // 32-bit CRC is automatically appended by MAC. Not supplied here.
      output  reg    [63:0] MAC_TX_DATA,
         // MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID = '1'
      output  reg    [7:0] MAC_TX_DATA_VALID,
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
// //-- INPUT STATE MACHINE -------------------------------------
reg     [2:0] STATE_A; 
reg     [127:0] LAST_IP; 
reg     LAST_IPv4_6n; 
reg     [47:0] LAST_MAC; 
reg     APP_EOF_FLAG0; 
wire    APP_EOF_FLAG; 
reg     [3:0] TIMER_A; 
//  integer multiple of 4us 
reg     RT_REQ_RTS_local; 
wire    RT_REQ_RTS_TRIGGER; 
wire    TX_PACKET_SEQUENCE_START; 
reg     RTS_local; 
wire    EVENT_TO_STATE_A4; 

// //-- UDP TX CHECKSUM  ---------------------------
reg     [6:0] TX_PACKET_SEQUENCE_START_SHIFT; 
reg     [18:0] CKSUM_PART1; 
reg     [2:0] CKSUM_SEQ_CNTR; 
reg     [17:0] CKSUM1; 
reg     [17:0] CKSUM1A; 
reg     [17:0] CKSUM1B; 
reg     [17:0] CKSUM2; 
reg     [17:0] CKSUM3; 
reg     [17:0] CKSUM4; 
reg     [17:0] CKSUM5; 
reg     [17:0] CKSUM6; 
wire    [17:0] CKSUM3PLUS; 
wire    [17:0] CKSUM6PLUS; 
wire    [15:0] UDP_CHECKSUM; 
reg     [15:0] PAYLOAD_SIZE; 
//  in bytes
wire    [15:0] PAYLOAD_SIZE_PLUS8; 
//  in bytes
wire    [15:0] PAYLOAD_SIZE0; 
//  in bytes
reg     [15:0] PAYLOAD_SIZE_D; 
//  in bytes

// //-- ELASTIC BUFFER -----------------
reg     [ADDR_WIDTH - 1:0] WPTR; 
reg     [ADDR_WIDTH - 1:0] WPTR_SOF; 
reg     [ADDR_WIDTH - 1:0] WPTR0; 
wire    WEA; 
reg     WEA_D; 
reg     APP_SOF_D; 
reg     [ADDR_WIDTH - 1:0] RPTR; 
wire    [ADDR_WIDTH - 1:0] BUF_SIZE; 
wire    [71:0] DIA; 
wire    [71:0] DOB; 
reg     [71:0] DOB_PREVIOUS; 
reg     DOB_SAMPLE_CLK_E; 
reg     DOB_SAMPLE_CLK; 
wire    [63:0] TX_PAYLOAD_DATA; 

// //-- FREEZE INPUTS -----------------------
reg     [47:0] TX_DEST_MAC_ADDR; 
reg     IPv4_6n_D; 
reg     [127:0] DEST_IP_ADDR_D; 
reg     [15:0] DEST_PORT_NO_D; 
reg     [15:0] SOURCE_PORT_NO_D; 
reg     [127:0] TX_DEST_IP_ADDR; 
reg     [15:0] IP_ID_D; 
reg     TX_IPv4_6n; 
reg     [15:0] TX_DEST_PORT_NO; 
reg     [127:0] TX_SOURCE_IP_ADDR; 
reg     [15:0] TX_SOURCE_PORT_NO; 
reg     [15:0] TX_IP_ID; 
reg     [15:0] IPv4_TOTAL_LENGTH; 
reg     [15:0] IPv6_PAYLOAD_LENGTH; 
reg     [15:0] UDP_LENGTH; 

// //-- TX PACKET ASSEMBLY   ----------------------
reg     TX_ACTIVE0; 
wire    TX_ACTIVE; 
reg     [10:0] TX_WORD_COUNTER; 
reg     [10:0] TX_WORD_COUNTER_D; 
reg     MAC_TX_WORD_VALID_E2; 
reg     MAC_TX_WORD_VALID_E; 
reg     MAC_TX_WORD_VALID; 
wire    TX_UDP_PAYLOAD; 
reg     MAC_TX_WORD_FLUSH_E2; 
reg     TX_UDP_PAYLOAD_D; 
reg     MAC_TX_EOF_local; 
reg     UDP_LAST_HEADER_BYTE; 

// // TX IP HEADER CHECKSUM ---------------------------------------------
reg     [17:0] IP_HEADER_CHECKSUM; 
reg     [17:0] IP_HEADER_CHECKSUM0; 
wire    [17:0] IP_HEADER_CHECKSUM_PLUS; 
wire    [15:0] IP_HEADER_CHECKSUM_FINAL; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// //-- INPUT STATE MACHINE -------------------------------------
//  A-side of the dual-port block RAM


initial 
   begin : process_71
   IP_HEADER_CHECKSUM0 = {18{1'b 0}};   
   end

initial 
   begin : process_70
   IP_HEADER_CHECKSUM = {18{1'b 0}};   
   end

initial 
   begin : process_69
   UDP_LAST_HEADER_BYTE = 1'b 0;   
   end

initial 
   begin : process_68
   MAC_TX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_67
   TX_UDP_PAYLOAD_D = 1'b 0;   
   end

initial 
   begin : process_66
   MAC_TX_WORD_FLUSH_E2 = 1'b 0;   
   end

initial 
   begin : process_64
   MAC_TX_WORD_VALID = 1'b 0;   
   end

initial 
   begin : process_63
   MAC_TX_WORD_VALID_E = 1'b 0;   
   end

initial 
   begin : process_62
   MAC_TX_WORD_VALID_E2 = 1'b 0;   
   end

initial 
   begin : process_61
   TX_WORD_COUNTER_D = {11{1'b 0}};   
   end

initial 
   begin : process_60
   TX_WORD_COUNTER = {11{1'b 0}};   
   end

initial 
   begin : process_58
   TX_ACTIVE0 = 1'b 0;   
   end

initial 
   begin : process_57
   UDP_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_56
   IPv6_PAYLOAD_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_55
   IPv4_TOTAL_LENGTH = {16{1'b 0}};   
   end

initial 
   begin : process_54
   TX_SOURCE_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_53
   TX_SOURCE_IP_ADDR = {128{1'b 0}};   
   end

initial 
   begin : process_52
   TX_DEST_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_51
   TX_IPv4_6n = 1'b 0;   
   end

initial 
   begin : process_50
   TX_DEST_IP_ADDR = {128{1'b 0}};   
   end

initial 
   begin : process_49
   SOURCE_PORT_NO_D = {16{1'b 0}};   
   end

initial 
   begin : process_48
   DEST_PORT_NO_D = {16{1'b 0}};   
   end

initial 
   begin : process_47
   DEST_IP_ADDR_D = {128{1'b 0}};   
   end

initial 
   begin : process_46
   IPv4_6n_D = 1'b 0;   
   end

initial 
   begin : process_45
   TX_DEST_MAC_ADDR = {48{1'b 0}};   
   end

initial 
   begin : process_43
   DOB_SAMPLE_CLK = 1'b 0;   
   end

initial 
   begin : process_42
   DOB_SAMPLE_CLK_E = 1'b 0;   
   end

initial 
   begin : process_41
   DOB_PREVIOUS = {72{1'b 0}};   
   end

initial 
   begin : process_37
   RPTR = {(ADDR_WIDTH - 1 - 0 + 1){1'b 1}};   
   end

initial 
   begin : process_36
   APP_SOF_D = 1'b 0;   
   end

initial 
   begin : process_35
   WEA_D = 1'b 0;   
   end

initial 
   begin : process_33
   WPTR0 = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_32
   WPTR_SOF = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_31
   WPTR = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_30
   PAYLOAD_SIZE_D = {16{1'b 0}};   
   end


initial 
   begin : process_27
   PAYLOAD_SIZE = {16{1'b 0}};   
   end

initial 
   begin : process_23
   CKSUM6 = {18{1'b 0}};   
   end

initial 
   begin : process_22
   CKSUM5 = {18{1'b 0}};   
   end

initial 
   begin : process_21
   CKSUM4 = {18{1'b 0}};   
   end

initial 
   begin : process_20
   CKSUM3 = {18{1'b 0}};   
   end

initial 
   begin : process_19
   CKSUM2 = {18{1'b 0}};   
   end

initial 
   begin : process_18
   CKSUM1B = {18{1'b 0}};   
   end

initial 
   begin : process_17
   CKSUM1A = {18{1'b 0}};   
   end

initial 
   begin : process_16
   CKSUM1 = {18{1'b 0}};   
   end

initial 
   begin : process_15
   CKSUM_SEQ_CNTR = {3{1'b 0}};   
   end

initial 
   begin : process_14
   CKSUM_PART1 = {19{1'b 0}};   
   end

initial 
   begin : process_13
   TX_PACKET_SEQUENCE_START_SHIFT = {7{1'b 0}};   
   end

initial 
   begin : process_11
   RTS_local = 1'b 0;   
   end

initial 
   begin : process_8
   RT_REQ_RTS_local = 1'b 0;   
   end

initial 
   begin : process_7
   TIMER_A = 0;   
   end

initial 
   begin : process_5
   APP_EOF_FLAG0 = 1'b 0;   
   end

initial 
   begin : process_4
   LAST_MAC = {48{1'b 0}};   
   end

initial 
   begin : process_3
   LAST_IPv4_6n = 1'b 0;   
   end

initial 
   begin : process_2
   LAST_IP = {128{1'b 0}};   
   end

initial 
   begin : process_1
   STATE_A = 0;   
   end


always @(posedge CLK) begin : STATE_A_GEN_001
      if (SYNC_RESET === 1'b 1) begin
         STATE_A <= 0;   
         TIMER_A <= 0;   
         NAK <= 1'b 0;   
      end else if (APP_SOF === 1'b 1 ) begin
      //  App starts transferring a new UDP frame. Resets the state machine.
      //  Do we already know the destination MAC address here (in this component?)
         if (DEST_IP_ADDR === LAST_IP & IPv4_6n === LAST_IPv4_6n) begin
      //  same destination as the previous frame. No need to ask the ARP cache (use LAST_MAC).
            if (APP_EOF_FLAG === 1'b 1) begin
      //  input UDP frame is complete. 
               STATE_A <= 3;   
      //  await complete MAC transmission of previous frame.
            end else begin
               STATE_A <= 2;   
      //  awaiting complete input UDP frame
            end
      //  request the destination MAC address from the routing table (ARP_CACHE2) 				
      //  Set timer to avoid being stuck waiting for a missing event.
            end
         else begin
            TIMER_A <= 10;   
            STATE_A <= 1;   
      //  awaiting routing info
         end
      end else if (STATE_A === 0 ) begin
         NAK <= 1'b 0;   
      end else if (STATE_A === 1 & RT_MAC_RDY === 1'b 1 ) begin
      //  received destination MAC address for the specified destination IP address
         if (APP_EOF_FLAG === 1'b 1) begin
      //  input UDP frame is complete. 
            STATE_A <= 3;   
      //  await complete MAC transmission of previous frame.
         end else begin
            STATE_A <= 2;   
      //  awaiting complete input UDP frame
         end
      end else if (STATE_A === 1 & RT_NAK === 1'b 1 ) begin
      //  no entry in the routing table. Tell application (please try again later)
         STATE_A <= 5;   
      //  await EOF
         NAK <= 1'b 1;   
      end else if (STATE_A === 1 & TIMER_A === 0 ) begin
      //  timeout waiting for a response from routing table (traffic congestion?) 
      //  tell application (please try again later)
         STATE_A <= 5;   
      //  Await EOF
         NAK <= 1'b 1;   
      end else if (STATE_A === 2 & APP_EOF_FLAG === 1'b 1 ) begin
      //  input UDP frame is complete. 
         if (RTS_local === 1'b 0 | MAC_TX_EOF_local === 1'b 1) begin
      //  input UDP frame is complete & previous frame transmission is complete.
            STATE_A <= 4;   
         end else begin
            STATE_A <= 3;   
      //  await complete MAC transmission of previous frame.
         end
      end else if (STATE_A === 3 & (RTS_local === 1'b 0 | MAC_TX_EOF_local === 1'b 1) ) begin
      //  input UDP frame is complete & previous frame transmission is complete.
      //  Ask MAC to send this new frame (raise RTS) and await MAC_TX_CTS.
         STATE_A <= 4;   
      end else if (STATE_A === 4 & MAC_TX_CTS === 1'b 1 ) begin
      //  starting transmission to MAC layer (TX_PACKET_SEQUENCE_START). Ready for another input UDP frame.
         STATE_A <= 0;   
      end else if (STATE_A === 5 ) begin
      //  Received NAK. Awaiting EOF.
         NAK <= 1'b 0;   
         if (APP_EOF_FLAG === 1'b 1) begin
      //  discard previous frame. back to idle
            STATE_A <= 0;   
         end
      end else if (TICK_4US === 1'b 1 & TIMER_A !== 0 ) begin
         TIMER_A <= TIMER_A - 1;   
      end
   end 


assign EVENT_TO_STATE_A4 = ((STATE_A === 2) & (APP_EOF_FLAG === 1'b 1) & (RTS_local === 1'b 0 | MAC_TX_EOF_local === 1'b 1)) ? 1'b 1 : (((STATE_A === 3) & (RTS_local === 1'b 0 | MAC_TX_EOF_local === 1'b 1)) ? 1'b 1 : 1'b 0); 

//  flow control: stop input flow immediately upon receiving the last packet byte. Resume when 
assign APP_CTS = (TX_PACKET_SEQUENCE_START === 1'b 1) ? 1'b 1 : ((APP_EOF === 1'b 1 | APP_EOF_FLAG === 1'b 1 | STATE_A === 3) ? 1'b 0 : 1'b 1); 
assign ACK = TX_PACKET_SEQUENCE_START; 
//  send ACK to the App (same as start of UDP packet assembly).

//  Ask for MAC transmit resources as soon as a complete UDP frame is stored in the elastic buffer
//  and the previous frame was completely transferred to the MAC 
//  and routing information is available.

   always @(posedge CLK) begin : RTS_GEN_001
      if (SYNC_RESET === 1'b 1) begin
         RTS_local <= 1'b 0;   
      end else if (EVENT_TO_STATE_A4 === 1'b 1 ) begin
      //  complete UDP frame waiting for tx in elastic buffer and previous frame transmission is complete
         RTS_local <= 1'b 1;   
      end else if (MAC_TX_EOF_local === 1'b 1 ) begin
      //  no complete UDP frame waiting for tx
         RTS_local <= 1'b 0;   
      end
   end
   
assign RTS = RTS_local | EVENT_TO_STATE_A4; 

// //-- ROUTING -------------------------------------
//  send routing request

assign RT_REQ_RTS_TRIGGER = ((STATE_A === 0) & (APP_SOF === 1'b 1) & (DEST_IP_ADDR !== LAST_IP | IPv4_6n !== LAST_IPv4_6n)) ? 1'b 1 : 1'b 0; 

always @(posedge CLK) begin : RT_001
      if (SYNC_RESET === 1'b 1) begin
         RT_REQ_RTS_local <= 1'b 0;   
      end else if (RT_REQ_RTS_TRIGGER === 1'b 1 ) begin
      //  new UDP tx packet, different destination. 
      //  request the destination MAC address from the routing table (ARP_CACHE2) 				
         RT_REQ_RTS_local <= 1'b 1;   
      end else if (RT_REQ_CTS === 1'b 1 ) begin
      //  routing request in progress.
         RT_REQ_RTS_local <= 1'b 0;   
      end
   end

assign RT_REQ_RTS = RT_REQ_RTS_local | RT_REQ_RTS_TRIGGER; 

always @(posedge CLK)
   begin : RT_002
   if (CLK === 1'b 1)
      begin
      if (SYNC_RESET === 1'b 1)
         begin
         RT_IP_ADDR <= {128{1'b 0}};   
         end
      else if (RT_REQ_RTS_TRIGGER === 1'b 1 )
         begin

//  new UDP tx packet, different destination. 
//  request the destination MAC address from the routing table (ARP_CACHE2) 				
         RT_IP_ADDR <= DEST_IP_ADDR;   
         RT_IPv4_6n <= IPv4_6n;   
         end
      end
   end

//  DOUBT ABOUT TIMING... HOW TO MATCH RT_MAC_REPLY WITH DEST_IP_ADDR??????
//  Remember the last set of destination IP/MAC addresses to minimize traffic at the cache memory

   always @(posedge CLK) begin : RT_003
      if (SYNC_RESET === 1'b 1) begin
         LAST_IP <= {128{1'b 0}};   
         LAST_IPv4_6n <= 1'b 0;   
         LAST_MAC <= {48{1'b 0}};   
      end else if (STATE_A === 1 & RT_MAC_RDY === 1'b 1 ) begin
         //  received destination MAC address for the specified destination IP address
         LAST_IP <= DEST_IP_ADDR;   
         LAST_IPv4_6n <= IPv4_6n;   
         LAST_MAC <= RT_MAC_REPLY;   
      end
   end

//  Is the UDP frame completely in?
//  This process works even in the special case of zero-length UDP frame

   always @(posedge CLK) begin : APP_EOF_FLAG_GEN
      if (SYNC_RESET === 1'b 1) begin
         APP_EOF_FLAG0 <= 1'b 0;   
      //  the events order is important here.
      end else if (STATE_A === 5 & APP_EOF_FLAG === 1'b 1 ) begin
      //  NAK. Discard frame 		
         APP_EOF_FLAG0 <= 1'b 0;   
      end else if (APP_EOF === 1'b 1 ) begin
         APP_EOF_FLAG0 <= 1'b 1;   
      end else if (TX_PACKET_SEQUENCE_START === 1'b 1 ) begin
      //  idle
         APP_EOF_FLAG0 <= 1'b 0;   
      end
   end



assign APP_EOF_FLAG = APP_EOF_FLAG0 | APP_EOF; 

// //-- UDP TX CHECKSUM  ---------------------------





generate
 if (UDP_CKSUM_ENABLED==1) begin: UDP_CKSUM_ENABLED1

   always @(posedge CLK) begin : UDP_CKSUM_001
      CKSUM1A <= APP_DATA[63:48] + APP_DATA[47:32];   
      CKSUM1B <= APP_DATA[31:16] + APP_DATA[15:0];   
      if (APP_SOF_D === 1'b 1)
         begin
         CKSUM1 <= CKSUM1A;   
         CKSUM2 <= CKSUM1B;   
         CKSUM3 <= {2'b 00, 16'h 00_11};   
         end
      else if (WEA_D === 1'b 1 )
         begin
         CKSUM1 <= CKSUM1[15:0] + CKSUM1A;
         CKSUM2 <= CKSUM2[15:0] + CKSUM1B;   
         CKSUM3 <= CKSUM3PLUS;   
         end
   end

assign CKSUM3PLUS = CKSUM3 + CKSUM1[17:16] + CKSUM2[17:16];

// for IPv6, pre-compute the IPv6 address checksum. Only once at reset.
   always @(posedge CLK) begin : UDP_CKSUM_002
      if (SYNC_RESET === 1'b 1)
         begin
         CKSUM_SEQ_CNTR <= 3'b 110;   
         end
      else if (CKSUM_SEQ_CNTR > 0 )
         begin
         CKSUM_SEQ_CNTR <= CKSUM_SEQ_CNTR - 1;   
         end
   end


always @(posedge CLK) begin : UDP_CKSUM_003
      // fixed part of the checksum is initialized at reset
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

   // Different pseudo-headers are used for IPv4 and IPv6
   // Checksum computation must be complete by the time TX_WORD_COUNTER reaches 5(IPv4) or 7 (IPv6). So we only have 5 iterations maximum to sum the pseudo header.
always @(posedge CLK) begin : UDP_CKSUM_004
      TX_PACKET_SEQUENCE_START_SHIFT[6:0] <= {TX_PACKET_SEQUENCE_START_SHIFT[5:0], TX_PACKET_SEQUENCE_START};   
      if (TX_PACKET_SEQUENCE_START === 1'b 1) begin
         CKSUM4 <= SOURCE_PORT_NO_D + DEST_PORT_NO_D;   
         CKSUM6 <= {18{1'b 0}};   
         if (IPv4_6n_D === 1'b 1) begin // -- IPv4
            
            CKSUM5 <= IPv4_ADDR[31:16] + IPv4_ADDR[15:0] + {PAYLOAD_SIZE_PLUS8, 1'b 0};   // src IP address + 2*UDP length
         end else if (IPv6_ENABLED === 1'b 1 ) begin // IPv6
            CKSUM5 <= CKSUM_PART1[15:0] + CKSUM_PART1[18:16] + {PAYLOAD_SIZE_PLUS8, 1'b 0}; //  src IP address + 2*UDP length
         end
      end else begin
         if (TX_IPv4_6n === 1'b 1) begin // -- IPv4
            if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1) begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM1[15:0];   
               CKSUM5 <= CKSUM5[15:0] + CKSUM2[15:0];   
               CKSUM6 <= CKSUM6PLUS + CKSUM3PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 ) begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[15:0];   // dst IP address
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[31:16];   
               CKSUM6 <= CKSUM6PLUS;   
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 ) begin
               CKSUM6 <= CKSUM4[15:0] + CKSUM5[15:0] + CKSUM6PLUS;   
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 ) begin
               CKSUM6 <= CKSUM6[15:0] + CKSUM6[17:16];   
            end
         end else if (IPv6_ENABLED === 1'b 1 ) begin // IPv6
            if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1) begin
               CKSUM4 <= CKSUM4[15:0] + CKSUM1[15:0];   
               CKSUM5 <= CKSUM5[15:0] + CKSUM2[15:0];   
               CKSUM6 <= CKSUM6PLUS + CKSUM3PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 ) begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[127:112]; // dest IP address 
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[95:80];   // dest IP address
               CKSUM6 <= CKSUM6PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 ) begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[111:96];  // dest IP address
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[79:64];   // dest IP address
               CKSUM6 <= CKSUM6PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 ) begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[63:48];   // dest IP address
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[31:16];   // dest IP address
               CKSUM6 <= CKSUM6PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[4] === 1'b 1 ) begin
               CKSUM4 <= CKSUM4[15:0] + TX_DEST_IP_ADDR[47:32];  // dest IP address 
               CKSUM5 <= CKSUM5[15:0] + TX_DEST_IP_ADDR[15:0];   // dest IP address
               CKSUM6 <= CKSUM6PLUS;   // carry
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[5] === 1'b 1 ) begin
               CKSUM6 <= CKSUM4[15:0] + CKSUM5[15:0] + CKSUM6PLUS;   
            end else if (TX_PACKET_SEQUENCE_START_SHIFT[6] === 1'b 1 ) begin
               CKSUM6 <= CKSUM6[15:0] + CKSUM6[17:16];   
            end
         end
      end
   end


assign CKSUM6PLUS = CKSUM6 + CKSUM4[17:16] + CKSUM5[17:16]; 

assign UDP_CHECKSUM = ~CKSUM6[15:0]; 
end
endgenerate
generate
 if (UDP_CKSUM_ENABLED==0) begin: UDP_CKSUM_ENABLED2
   assign UDP_CHECKSUM = 'b0; 
end
endgenerate
   always @(posedge CLK) begin : PAYLOAD_SIZE_GEN
      if (WEA === 1'b 1) begin
      //  new word
         if (APP_DATA_VALID[0] === 1'b 1)
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 8;   
            end
         else if (APP_DATA_VALID[1] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 7;   
            end
         else if (APP_DATA_VALID[2] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 6;   
            end
         else if (APP_DATA_VALID[3] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 5;   
            end
         else if (APP_DATA_VALID[4] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 4;   
            end
         else if (APP_DATA_VALID[5] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 3;   
            end
         else if (APP_DATA_VALID[6] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 2;   
            end
         else if (APP_DATA_VALID[7] === 1'b 1 )
            begin
            PAYLOAD_SIZE <= PAYLOAD_SIZE0 + 1;   

//             else
//                -- illegal
//                 PAYLOAD_SIZE <= PAYLOAD_SIZE0;
            end
      end
   end

assign PAYLOAD_SIZE_PLUS8 = PAYLOAD_SIZE + 8; 

assign PAYLOAD_SIZE0 = APP_SOF === 1'b 0 ? PAYLOAD_SIZE : {16{1'b 0}}; 

// //-- ELASTIC BUFFER ----------------------------

   always @(posedge CLK) begin : WPTR_GEN_001
      WEA_D <= WEA;   
      APP_SOF_D <= APP_SOF;   
      if (SYNC_RESET === 1'b 1)
         begin
         WPTR <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
         end
      else if (WEA === 1'b 1 )
         begin
         WPTR <= WPTR + 1;   
         end
      end

//  remember SOF location

   always @(posedge CLK) begin : WPTR_SOF_GEN_001
      if (SYNC_RESET === 1'b 1)
         begin
         WPTR_SOF <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
         end
      else if (APP_SOF === 1'b 1 )
         begin
         WPTR_SOF <= WPTR;   
         end
      end


assign WEA = APP_DATA_VALID !== 0 ? 1'b 1 : 1'b 0; 

assign DIA = {APP_DATA_VALID, APP_DATA}; 

bram_dp2 #(
          .DATA_WIDTHA (72),
          .ADDR_WIDTHA (ADDR_WIDTH),
          .DATA_WIDTHB (72),
          .ADDR_WIDTHB (ADDR_WIDTH)
)BRAM_DP2_001 (
          .CSA(1'b 1),
          .CLKA(CLK),
          .WEA(WEA), //  Port A Write Enable Input
          .ADDRA(WPTR), //  Port A Address Input
          .DIA(DIA), //  Port A Data Input
          .OEA(1'b 0),
          .DOA(),
          .CSB(1'b 1),
          .CLKB(CLK),
          .WEB(1'b 0),
          .ADDRB(RPTR), //  Port B Address Input
          .DIB({72{1'b 0}}), //  Port B Data Input
          .OEB(1'b 1),
          .DOB(DOB) // Port B Data Output
          );

assign TX_PAYLOAD_DATA = DOB[63:0]; 
//  Port B Data Output

assign BUF_SIZE = WPTR0 + ~RPTR; 

//  read pointer management

   always @(posedge CLK) begin : RPTR_GEN
      if (SYNC_RESET === 1'b 1) begin
         RPTR <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 1}};   
         DOB_SAMPLE_CLK_E <= 1'b 0;   
      end else begin
         TX_UDP_PAYLOAD_D <= TX_UDP_PAYLOAD;   
         DOB_SAMPLE_CLK <= DOB_SAMPLE_CLK_E;   
         if (TX_PACKET_SEQUENCE_START === 1'b 1) begin
            RPTR <= WPTR_SOF - 1;   //  points to one address before the start of UDP payload
            DOB_SAMPLE_CLK_E <= 1'b 0;   
         end else if (TX_ACTIVE === 1'b 1 & MAC_TX_CTS === 1'b 1 & TX_UDP_PAYLOAD === 1'b 1 ) begin
            RPTR <= RPTR + 1;      //  read follow-on UDP payload bytes
            DOB_SAMPLE_CLK_E <= 1'b 1;   
         end else begin
            DOB_SAMPLE_CLK_E <= 1'b 0;   
         end
      end
   end

//  remember previous word

   always @(posedge CLK) begin : DOB_PREVIOUS_GEN_001
      if (DOB_SAMPLE_CLK === 1'b 1)
         begin
         DOB_PREVIOUS <= DOB;   
         end
      end


// //-- FREEZE INPUTS -----------------------
//  Latch in all key fields at the start trigger, or at the latest during the Ethernet header.
//  1st latch info at the input start from app

   always @(posedge CLK) begin : INFO_011
      if (APP_SOF === 1'b 1)
         begin
         DEST_IP_ADDR_D <= DEST_IP_ADDR;   
         DEST_PORT_NO_D <= DEST_PORT_NO;   
         SOURCE_PORT_NO_D <= SOURCE_PORT_NO;   
         IPv4_6n_D <= IPv4_6n;   
         IP_ID_D <= IP_ID;   
         end
      end



//  latch a second time upon start of output frame to MAC

   always @(posedge CLK) begin : INFO_012
      if (TX_PACKET_SEQUENCE_START === 1'b 1) begin
         //  Freeze parameters which can change on the A-side of the block ram 
         //  while we are sending the UDP packet to the MAC layer
         PAYLOAD_SIZE_D <= PAYLOAD_SIZE;        //  latch in payload size
         TX_DEST_MAC_ADDR <= LAST_MAC;   
         TX_DEST_IP_ADDR <= DEST_IP_ADDR_D;   
         TX_IPv4_6n <= IPv4_6n_D;   
         TX_DEST_PORT_NO <= DEST_PORT_NO_D;   
         TX_SOURCE_PORT_NO <= SOURCE_PORT_NO_D;   
         TX_IP_ID <= IP_ID_D;   
         IPv6_PAYLOAD_LENGTH <= PAYLOAD_SIZE_PLUS8;   //  same as UDP length
         IPv4_TOTAL_LENGTH <= PAYLOAD_SIZE + 28;   
         WPTR0 <= WPTR;   //  remember memory location for the last byte
      end
   end

// // IP HEADER CHECKSUM ----------------------
//  Transmit IP packet header checksum. Only applies to IPv4 (no header checksum in IPv6)
//  We must start the checksum early as the checksum field is not the last word in the header.
//  perform 1's complement sum of all 16-bit words within the header.
//  the checksum must be ready when TX_WORD_COUNTER_D=3

   always @(posedge CLK)  begin : IP_HEADER_CHECKSUM_001
      IP_HEADER_CHECKSUM0 <= {2'b 01, 16'h 8411} + IPv4_ADDR[31:16] + IPv4_ADDR[15:0];   //  x"4500" + +x"4000" + x"FF11"
      if (TX_PACKET_SEQUENCE_START === 1'b 1 & IPv4_6n_D === 1'b 0) begin
      //  the IP header checksum applies only to IPv4
         IP_HEADER_CHECKSUM <= {18{1'b 0}};   
      end else if (TX_PACKET_SEQUENCE_START === 1'b 1 & IPv4_6n_D === 1'b 1 ) begin
         IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM0[15:0] + IP_HEADER_CHECKSUM0[17:16] + IP_ID_D;   
      end else if (TX_IPv4_6n === 1'b 1 ) begin
         if (TX_PACKET_SEQUENCE_START_SHIFT[0] === 1'b 1) begin
            IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + IPv4_TOTAL_LENGTH;   
         end else if (TX_PACKET_SEQUENCE_START_SHIFT[1] === 1'b 1 ) begin
            IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + TX_DEST_IP_ADDR[15:0];   
         end else if (TX_PACKET_SEQUENCE_START_SHIFT[2] === 1'b 1 ) begin
            IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS + TX_DEST_IP_ADDR[31:16];   
         end else if (TX_PACKET_SEQUENCE_START_SHIFT[3] === 1'b 1 ) begin
            IP_HEADER_CHECKSUM <= IP_HEADER_CHECKSUM_PLUS;   
         end
      end
   end

assign IP_HEADER_CHECKSUM_PLUS = IP_HEADER_CHECKSUM[15:0] + IP_HEADER_CHECKSUM[17:16]; 

assign IP_HEADER_CHECKSUM_FINAL = ((IP_HEADER_CHECKSUM[16] === 1'b 1) & (IP_HEADER_CHECKSUM[0] === 1'b 0)) ? 16'h FFFF : ((IP_HEADER_CHECKSUM[16] === 1'b 1 & IP_HEADER_CHECKSUM[0] === 1'b 1) ? 16'h FFFE : ~IP_HEADER_CHECKSUM[15:0]); 


// //-- TX PACKET ASSEMBLY   ----------------------
//  Transmit packet is assembled on the fly, consistent with our design goal
//  of minimizing storage in each UDP_TX component.
//  The packet includes the lower layers, i.e. IP layer and Ethernet layer.
//  
//  First, we tell the outsider arbitration that we are ready to send by raising RTS high.
//  When the transmit path becomes available, the arbiter tells us to go ahead with the transmission MAC_TX_CTS = '1'

   assign TX_PACKET_SEQUENCE_START = ((STATE_A === 4) & (MAC_TX_CTS === 1'b 1)) ? 1'b 1 : 1'b 0; 

//  Starting sending the Ethernet/IP/UDP packet to the MAC layer.

   always @(posedge CLK) begin : STATE_MACHINE_001
      if (SYNC_RESET === 1'b 1) begin
         TX_ACTIVE0 <= 1'b 0;   
      end else if (TX_PACKET_SEQUENCE_START === 1'b 1 ) begin
         TX_ACTIVE0 <= 1'b 1;   
      end else if (MAC_TX_EOF_local === 1'b 1 ) begin
         TX_ACTIVE0 <= 1'b 0;   
      end
   end

   assign TX_ACTIVE = TX_ACTIVE0 & ~MAC_TX_EOF_local; 

   always @(posedge CLK) begin : TX_SCHEDULER_001
      if (SYNC_RESET === 1'b 1) begin
         TX_WORD_COUNTER <= {11{1'b 0}};   
         TX_WORD_COUNTER_D <= {11{1'b 0}};   
         MAC_TX_WORD_VALID_E2 <= 1'b 0;   
         MAC_TX_WORD_VALID_E <= 1'b 0;   
         MAC_TX_WORD_FLUSH_E2 <= 1'b 0;   
      end else begin
         MAC_TX_WORD_VALID_E <= MAC_TX_WORD_VALID_E2;   
         TX_WORD_COUNTER_D <= TX_WORD_COUNTER;   //  must keep the alignment with RPTR/DOB
//          if(MAC_TX_EOF_E = '1') then
//             -- end of UDP frame transmission
//             -- For clarity, wait 1 CLK after the end of the previous packet to do anything.
//             TX_WORD_COUNTER <= (others => '0');
//             MAC_TX_WORD_VALID_E2 <= '0';
         if (TX_PACKET_SEQUENCE_START === 1'b 1) begin
         //  UDP frame ready to send in the elastic buffer 
         //  initiating tx request. Reset counters. 
            TX_WORD_COUNTER <= {11{1'b 0}};   
            MAC_TX_WORD_VALID_E2 <= 1'b 1;   
            MAC_TX_WORD_FLUSH_E2 <= 1'b 0;   
         end else if (TX_ACTIVE === 1'b 1 & MAC_TX_CTS === 1'b 1 & BUF_SIZE !== 0 ) begin
         //  one packet is ready to send and MAC requests another byte
            MAC_TX_WORD_VALID_E2 <= 1'b 1;       //  enable path to MAC
            TX_WORD_COUNTER <= TX_WORD_COUNTER + 1;   
         end else if (TX_ACTIVE === 1'b 1 & MAC_TX_CTS === 1'b 1 & BUF_SIZE === 0 & MAC_TX_WORD_FLUSH_E2 === 1'b 0 ) begin
         //  possible last word (to be confirmed later)
            TX_WORD_COUNTER <= TX_WORD_COUNTER + 1;   
            MAC_TX_WORD_FLUSH_E2 <= 1'b 1;   
            MAC_TX_WORD_VALID_E2 <= 1'b 1;       //  enable path to MAC (to be confirmed later
         end else begin
            MAC_TX_WORD_VALID_E2 <= 1'b 0;   
         end
      end
   end

   assign TX_UDP_PAYLOAD = (BUF_SIZE === 0) ? 1'b 0 : (((TX_IPv4_6n === 1'b 1) & (TX_WORD_COUNTER >= 11'b 00000000100)) ? 1'b 1 : (((IPv6_ENABLED === 1'b 1) & (TX_IPv4_6n === 1'b 0) & (TX_WORD_COUNTER >= 11'b 00000000110)) ? 1'b 1 : 1'b 0)); 

   always @(posedge CLK) begin : MAC_TX_DATA_GEN_001
      if (TX_IPv4_6n === 1'b 1) begin //  IPv4
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
            MAC_TX_DATA[63:48] <= IPv4_TOTAL_LENGTH;   
            MAC_TX_DATA[47:32] <= TX_IP_ID;   
            MAC_TX_DATA[31:0] <= 32'h 4000FF11;   //  don't fragment, 255 hop limit, UDP
            end
         11'b 00000000011:
            begin
            MAC_TX_DATA[63:48] <= IP_HEADER_CHECKSUM_FINAL;  //  IP header checksum   
            MAC_TX_DATA[47:16] <= IPv4_ADDR;        //  source IP address   
            MAC_TX_DATA[15:0] <= TX_DEST_IP_ADDR[31:16];       //  destination IP address   
            end
         11'b 00000000100:
            begin
            MAC_TX_DATA[63:48] <= TX_DEST_IP_ADDR[15:0];       //  destination IP address  
            MAC_TX_DATA[47:32] <= TX_SOURCE_PORT_NO;   
            MAC_TX_DATA[31:16] <= TX_DEST_PORT_NO;   
            MAC_TX_DATA[15:0] <= IPv6_PAYLOAD_LENGTH;         //  = UDP frame length
            end
         11'b 00000000101:
            begin
            MAC_TX_DATA[63:48] <= UDP_CHECKSUM;   
            MAC_TX_DATA[47:0] <= DOB[63:16];   
            end
         default:
            begin
               if (DOB_SAMPLE_CLK === 1'b 1) begin
                  MAC_TX_DATA[63:48] <= DOB_PREVIOUS[15:0];   
                  MAC_TX_DATA[47:0] <= DOB[63:16];   
            //  flush partial last word
               end else begin
                  MAC_TX_DATA[63:48] <= DOB[15:0];   
                  MAC_TX_DATA[47:0] <= {48{1'b 0}};   
               end
            end
         endcase
      end else if (IPv6_ENABLED === 1'b 1 ) begin //  IPv6
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
            MAC_TX_DATA[47:32] <= IPv6_PAYLOAD_LENGTH;   //  payload length
            MAC_TX_DATA[31:16] <= 16'h 11FF;   //  UDP, 255 hop limit
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
            MAC_TX_DATA[47:32] <= IPv6_PAYLOAD_LENGTH;   
            MAC_TX_DATA[31:16] <= UDP_CHECKSUM;   
            MAC_TX_DATA[15:0] <= DOB[63:48];   
            end
         default:
            begin
            if (DOB_SAMPLE_CLK === 1'b 1)
               begin
               MAC_TX_DATA[63:16] <= DOB_PREVIOUS[47:0];   
               MAC_TX_DATA[15:0] <= DOB[63:48];   //  flush partial last word
               end
            else
               begin
               MAC_TX_DATA[63:16] <= DOB[47:0];   
               MAC_TX_DATA[15:0] <= {16{1'b 0}};   
               end
            end
         endcase
      end
   end


   always @(posedge CLK) begin : MAC_TX_DATA_VALID_GEN_001

      MAC_TX_WORD_VALID <= MAC_TX_WORD_VALID_E;   
      if (MAC_TX_WORD_VALID_E === 1'b 1) begin
         if (TX_IPv4_6n === 1'b 1) begin //  IPv4
            if (TX_WORD_COUNTER_D <= 4) begin
               MAC_TX_DATA_VALID <= 8'h FF;   
            end else if (TX_WORD_COUNTER_D === 5 ) begin
               MAC_TX_DATA_VALID <= {2'b 11, DOB[71:66]};   
            end else if (DOB_SAMPLE_CLK === 1'b 1 ) begin
               MAC_TX_DATA_VALID <= {DOB_PREVIOUS[65:64], DOB[71:66]};   
         //  flush partial last word
            end else begin
               MAC_TX_DATA_VALID <= {DOB[65:64], 6'b 000000};   
            end 
         end else if (IPv6_ENABLED === 1'b 1 ) begin //  IPv6
            if (TX_WORD_COUNTER_D <= 6) begin
               MAC_TX_DATA_VALID <= 8'h FF;   
            end else if (TX_WORD_COUNTER_D === 7 ) begin
               MAC_TX_DATA_VALID <= {6'b 111111, DOB[71:70]};   
            end else if (DOB_SAMPLE_CLK === 1'b 1 ) begin
               MAC_TX_DATA_VALID <= {DOB_PREVIOUS[69:64], DOB[71:70]};   
         //  flush partial last word
            end else begin
               MAC_TX_DATA_VALID <= {DOB[69:64], 2'b 00};   
            end
         end
      end else begin
         MAC_TX_DATA_VALID <= 8'h 00;   
      end
   end

   always @(posedge CLK) begin : MAC_TX_EOF_GEN_001
      if (SYNC_RESET === 1'b 1) begin
         MAC_TX_EOF_local <= 1'b 0;   
      end else if (MAC_TX_WORD_VALID_E === 1'b 1 ) begin
         if (TX_IPv4_6n === 1'b 1) begin
            if (TX_WORD_COUNTER_D === 5 & DOB[65] === 1'b 0) begin
               MAC_TX_EOF_local <= 1'b 1;   
            end else if (TX_WORD_COUNTER_D > 5 & DOB_SAMPLE_CLK === 1'b 1 & DOB[65] === 1'b 0 ) begin
               MAC_TX_EOF_local <= 1'b 1;   
            end else if (TX_WORD_COUNTER_D > 5 & DOB_SAMPLE_CLK === 1'b 0 & DOB_PREVIOUS[65] === 1'b 1 ) begin
            //  flush partial last word
               MAC_TX_EOF_local <= 1'b 1;   
            end else begin
               MAC_TX_EOF_local <= 1'b 0;   
            end
         end else if (IPv6_ENABLED === 1'b 1 ) begin
            //  IPv6
            if (TX_WORD_COUNTER_D === 7 & DOB[69] === 1'b 0) begin
               MAC_TX_EOF_local <= 1'b 1;   
            end else if (TX_WORD_COUNTER_D > 7 & DOB_SAMPLE_CLK === 1'b 1 & DOB[69] === 1'b 0 ) begin
               MAC_TX_EOF_local <= 1'b 1;   
            end else if (TX_WORD_COUNTER_D > 7 & DOB_SAMPLE_CLK === 1'b 0 & DOB_PREVIOUS[69] === 1'b 0 ) begin
            //  flush partial last word
               MAC_TX_EOF_local <= 1'b 1;   
            end else begin
               MAC_TX_EOF_local <= 1'b 0;   
            end 
         end else begin
            MAC_TX_EOF_local <= 1'b 0;   
         end
      end else begin
         MAC_TX_EOF_local <= 1'b 0;   
      end 
   end

assign MAC_TX_EOF = MAC_TX_EOF_local; 

// //-- TEST POINTS ---------------------------------
assign TP[1] = STATE_A === 0 ? 1'b 1 : 1'b 0; 
assign TP[2] = STATE_A === 3 ? 1'b 1 : 1'b 0; 
assign TP[3] = RTS_local; 
assign TP[4] = MAC_TX_EOF_local; 
assign TP[5] = MAC_TX_CTS; 
assign TP[7] = RT_MAC_RDY; 
assign TP[8] = RT_NAK; 
assign TP[9] = TX_PACKET_SEQUENCE_START; 
assign TP[10] = TX_ACTIVE; 

endmodule // module UDP_TX_10G

