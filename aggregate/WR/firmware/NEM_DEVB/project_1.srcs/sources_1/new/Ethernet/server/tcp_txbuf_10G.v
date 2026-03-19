/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_txbuf_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_txbuf_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:35:22 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules

// -----------------------------------------------------------
//  MSS copyright 2019-2021
//  Filename:  TCP_TXBUF_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 4
//  Date last modified: 3/12/21
//  Inheritance: 	COM-5402SOFT TCP_TXBUF.VHD 12/8/15
// 
//  description:  Buffer management for the transmit TCP payload data. 10G version.  
//  Payload data and partial checksum computation has to be ready immediately when requested by the TCP 
//  protocol engine (TCP_SERVER.vhd).
//  This component segments the data stream into packets, raises the Ready-To-Send flag (RTS) and waits
//  for trigger from the TCP protocol engine.
//  The input stream is segmented into data packets. The packet transmission
//  is triggered when one of two events occur:
//  (a) full packet: the number of bytes waiting for transmission is greater than or equal to MSS = MTU-40 = 1460 for ethernet
//  or, if less, the effective rx window as defined in the TCP protocol. 
//  (b) no-new-input timeout: there are a few bytes waiting for transmission but no new input 
//  bytes were received in the last TX_IDLE_TIMEOUT.
//  (c) the user application requested an immediate flush APP_DATA_FLUSH
// 
//  The overall buffer size (which affects overall throughput) is user selected in the generic section (see ADDR_WIDTH).
// 
//  A frame is ready for transmission when 
//  (a) the effective client rx window size is non-zero
//  (b) the tx buffer contains either the effective client rx window size or MSS bytes or no new data received in the last 200us
// 
//  Device utilization (NTCPSTREAMS=1, MSS = 1460, ADDR_WIDTH=11, IPv6_ENABLED='1')
//  FF: 585
//  LUT: 1184
//  DSP48: 0
//  18Kb BRAM: 8
//  BUFG: 1
//  Minimum period: 5.513ns (Maximum Frequency: 181.389MHz) Artix7-100T -1 speed grade
//  
//  Rev 1 12/11/18 AZ
// 
//  Rev1 4/23/19 AZ
//  Corrected sensitivity lists
// 
//  Rev 3 1/15/21 AZ
//  Corrected timing vulnerability (1 CLK vulnerability window when effective window size changes 1 CLK before 
//  transmit decision
//  Increased precision of TX_SEQ_NO_IN, RX_TCP_ACK_NO_D, EFF_RX_WINDOW_SIZE_PARTIAL_IN in preparation for window scaling larger windows
// 
//  Rev 4 3/11/21 AZ
//  Replaced BRAM_DP2 component with slightly more compact BRAM_DP2C
// -------------------------------------------------------------

module TCP_TXBUF_10G #(
		parameter NTCPSTREAMS = 1,
			// number of concurrent TCP streams handled by this component
		parameter MSS = 1460,
			// The Maximum Segment Size (MSS) is the largest segment of TCP data that can be transmitted.
			// Fixed as the Ethernet MTU (Maximum Transmission Unit) of 1500-9000 bytes - 40(IPv4) or -60(IPv6) overhead bytes 
			// IMPORTANT: MAKE SURE MSS is < buffer size 8*2^ADDR_WIDTH
		parameter ADDR_WIDTH = 11,
			// size of the dual-port RAM buffers instantiated within for each stream = 64b * 2^ADDR_WIDTH
			// Trade-off buffer depth and overall TCP throughput.
		parameter TX_IDLE_TIMEOUT = 50,
			// inactive input timeout, expressed in 4us units. // 50*4us = 200us 
			// Controls the transmit stream segmentation: data in the elastic buffer will be transmitted if
			// no input is received within TX_IDLE_TIMEOUT, without waiting for the transmit frame to be filled with MSS data bytes.
		parameter SIMULATION = 1'b0
			// mostly to shorten long timers during simulation
)(

		
		// CLK, RESET
		input   SYNC_RESET,
		input   CLK,		// synchronous clock
			// Must be a global clocks. No BUFG instantiation within this component.
		input   TICK_4US,
			// 1 CLK-wide pulse every 4us

		// APPLICATION INTERFACE -> TX BUFFER
		// NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
		input   [64 * NTCPSTREAMS - 1:0] APP_DATA,
		input   [8 * NTCPSTREAMS - 1:0] APP_DATA_VALID, 
		output  [NTCPSTREAMS - 1:0] APP_CTS,
			// Clear To Send = transmit flow control. 
			// App is responsible for checking the CTS signal before sending APP_DATA
			// Any partial word must be left aligned (MSB first). Therefore, the only allowed valies for APP_DATA_VALID are
			// 0x00, 0x80, 0xc0, xe0, 0xf0,  0xf8, 0xfc, 0xfe, 0xff
		input   [NTCPSTREAMS - 1:0] APP_DATA_FLUSH,
	        // '1' to force the immediate transmission of any byte still in the elastic buffer.
	        // This 1 CLK pulse can happen any time (not tied to APP_DATA_VALID)

		//// TX BUFFER <-> TX TCP protocol layer
		// Part I: control path to/from TCP_SERVER engine
		// (a) TCP_SERVER sends rx window information upon receiving an ACK from the TCP client
		// Partial computation (rx window size + RX_TCP_ACK_NO)
		input   [31:0] EFF_RX_WINDOW_SIZE_PARTIAL_IN,
			// Explanation: EFF_RX_WINDOW_SIZE_PARTIAL_IN represents the maximum TX_SEQ_NO acceptable for the 
			// TCP server (beyond which the rx buffers would be overflowing)
		input   [NTCPSTREAMS - 1:0] EFF_RX_WINDOW_SIZE_PARTIAL_STREAM,
		input   EFF_RX_WINDOW_SIZE_PARTIAL_VALID, // 1 CLK-wide pulse to indicate that the above information is valid
		// (b)  TCP_SERVER sends location of next frame start. Warning: could rewind to an earlier location.
		input   [32 * NTCPSTREAMS - 1:0] TX_SEQ_NO_IN,
		input   [NTCPSTREAMS - 1:0] TX_SEQ_NO_JUMP,
		      // TX_SEQ_NO progresses regularly as new bytes are being transmitted, except when TX_SEQ_NO_JUMP(I) = '1'
		// (c) for tx flow-control purposes, last acknowledged tx byte location
		// Units: bytes
		input   [32 * NTCPSTREAMS - 1:0] RX_TCP_ACK_NO_D,
		// Units: bytes

		// (d) TCP_SERVER reports about TCP connection state. 
		// '1' when TCP-IP connection is in the 'connected' state, 0 otherwise
		// Do not store tx data until a connection is established
		input   [NTCPSTREAMS - 1:0] CONNECTED_FLAG,
		// (e) upon reaching TCP_TX_STATE = 2, tell the TCP protocol engine (TCP_SERVER) 
		// which stream is ready to send data next, i.e. meets the following criteria:
		// (1) MSS bytes, or a lower size that meets the client effective rx window size, ready to send, OR
		// (2) some data to be sent but no additional data received in the last 200us
		output   [NTCPSTREAMS - 1:0] TX_STREAM_SEL,
			// valid only when TX_PAYLOAD_RTS = '1', ignore otherwise
		output   TX_PAYLOAD_RTS,
			// '1' when at least one stream has payload data available for transmission.
		output   reg	[17:0] TX_PAYLOAD_CHECKSUM,
			// partial TCP checksum computation. payload only, no header. bits 17:16 are the carry, add later.
			// valid only when TX_PAYLOAD_RTS = '1', ignore otherwise
		output   reg	[15:0] TX_PAYLOAD_SIZE,
			// payload size in bytes for the next tx frame
			// valid only when TX_PAYLOAD_RTS = '1', ignore otherwise
			// range is 0 - MSS 

		// Part II: data path to TCP_TX for frame formatting
		input   TX_PAYLOAD_CTS,
			// clear to send payload data: go ahead signal for forwarding data from the TX_STREAM_SEL stream
			// to the TCP_TX component responsible for formatting the next transmit packet.
			// 2 CLK latency until 1st data byte is available at TX_PAYLOAD_DATA
			// The last CTS pulse does not trigger a TX_PAYLOAD_DATA_VALID (OBUF=0), thus marking the end of frame.
		output   [63:0] TX_PAYLOAD_DATA,
			// TCP payload data field when TX_PAYLOAD_DATA_VALID = '1'
		output   [7:0] TX_PAYLOAD_DATA_VALID,
		output   TX_PAYLOAD_WORD_VALID,
			// delineates the TCP payload data field
		output   TX_PAYLOAD_DATA_EOF,
			// End Of Frame. 1 CLK-wide pulse aligned with TX_PAYLOAD_DATA_VALID
		output   [10:1] TP
);

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------

//  override the type in com5402pkg as the actual number of NTCPSTREAMS here may be less than NTCPSTREAMS_MAX.
// //-- INPUT IDLE DETECTION ---------------------------
reg     [31:0] TX_IDLE_TIMER [31:0]; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] TX_IDLE; 

// //-- ELASTIC BUFFER ---------------------------
wire    [NTCPSTREAMS - 1:0] APP_WORD_VALID; 
reg     [NTCPSTREAMS - 1:0] APP_WORD_VALID_D; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] APP_DATA_FLUSH_PENDING; 
reg     [NTCPSTREAMS - 1:0] APP_DATA_FLUSH_PENDING_D; 
(* MARK_DEBUG="true" *)reg     [128 * NTCPSTREAMS - 1:0] APP_DATA_SHIFT; 
reg     [16 * NTCPSTREAMS - 1:0] APP_DATA_VALID1; 
(* MARK_DEBUG="true" *)wire    [64 * NTCPSTREAMS - 1:0] DIA; 
(* MARK_DEBUG="true" *)wire    [64 * NTCPSTREAMS - 1:0] DOB; 
(* MARK_DEBUG="true" *)reg     [31:0] WPTR [31:0]; 
reg     [31:0] WPTR_D [31:0]; 
reg     [ADDR_WIDTH + 2:0] RPTR [ADDR_WIDTH + 2:0]; 
reg     [ADDR_WIDTH + 2:0] RPTR_MAX; 
wire    [NTCPSTREAMS - 1:0] RPTR_BEYOND_UPPER_LIMIT; 

//  extend one bit to make signed signals
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 3:0] BUF_SIZE [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 2:0] NEXT_TX_FRAME_SIZE [ADDR_WIDTH + 2:0]; 
reg     [ADDR_WIDTH + 2:0] AVAILABLE_BUF_SPACE [ADDR_WIDTH + 2:0]; 
reg     [NTCPSTREAMS - 1:0] WEA; 
wire    [NTCPSTREAMS - 1:0] APP_CTS_local; 
reg     [NTCPSTREAMS - 1:0] CONNECTED_FLAG_D; 
reg     [NTCPSTREAMS - 1:0] CONNECTED_FLAG_D2; 

// // SEGMENT INPUT DATA INTO PACKETS 
(* MARK_DEBUG="true" *)wire    SAMPLE2_CLK; 
(* MARK_DEBUG="true" *)reg     SAMPLE2_CLK_D; 
(* MARK_DEBUG="true" *)wire    [63:0] DATA2; 
(* MARK_DEBUG="true" *)reg     [127:0] DATA2_SHIFT; 
(* MARK_DEBUG="true" *)reg     [2:0] BYTE_OFFSET2; 
reg     [ADDR_WIDTH + 2:0] FRAME_SIZE2; 
reg     [ADDR_WIDTH - 1:0] WORD_CNTR2; 
(* MARK_DEBUG="true" *)wire    [63:0] DATA3; 
(* MARK_DEBUG="true" *)reg     [7:0] DATA3_VALID; 
(* MARK_DEBUG="true" *)wire    DATA3_WORD_VALID; 
(* MARK_DEBUG="true" *)reg     DATA3_WORD_VALID_D; 

// // TCP_SERVER INTERFACE ------------------------
(* MARK_DEBUG="true" *)reg     [31:0] EFF_RX_WINDOW_SIZE [31:0]; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EFF_RX_WINDOW_SIZE_MSB; 
(* MARK_DEBUG="true" *)reg     [31:0] EFF_RX_WINDOW_SIZE_PARTIAL [31:0]; 
reg     [31:0] TX_SEQ_NO [31:0]; 

// // TCP TX CHECKSUM  ---------------------------
reg     [17:0] CKSUM1; 
reg     [17:0] CKSUM2; 
reg     [17:0] CKSUM3; 
wire    [17:0] CKSUM3PLUS; 
wire    [17:0] TCP_CKSUM; 

// // OUTPUT BUFFER --------------------------------
wire    OB_WEA; 
reg     [ADDR_WIDTH - 1:0] OB_ADDRA; 
reg     [ADDR_WIDTH - 1:0] OB_ADDRB; 
reg     [ADDR_WIDTH - 1:0] WPTR_END; 
(* MARK_DEBUG="true" *)wire    [ADDR_WIDTH - 1:0] OBUF_SIZE; 
reg     OBUF_SIZE_ZERO; 
reg     OB_SAMPLE_CLK_E; 
reg     OB_SAMPLE_CLK; 
wire    [71:0] OB_DIA; 
wire    [71:0] OB_DOB; 
reg     [NTCPSTREAMS - 1:0] TX_STREAM_SEL_local; 
reg     [NTCPSTREAMS - 1:0] TX_STREAM_SEL_local0; 
reg     [17:0] TX_PAYLOAD_CHECKSUM0; 
(* MARK_DEBUG="true" *)reg     [15:0] TX_PAYLOAD_SIZE0; 
wire    OUTPUT_STREAM_CONNECTED; 

// // TCP TX STATE MACHINE ---------------------------
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS0A; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS0B; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS0C; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS0D; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS0E; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS1A; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS1B; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS1; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS2; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS3; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] EVENTS5; 
(* MARK_DEBUG="true" *)wire    EVENT4; 
(* MARK_DEBUG="true" *)wire    EVENT5; 
(* MARK_DEBUG="true" *)reg     [31:0] TCP_TX_STATE [31:0]; 
reg     [31:0] TIMER1 [31:0]; 

// // CHECKSUM STATE MACHINE -------------------------
(* MARK_DEBUG="true" *)reg     [1:0] CKSUM_STATE; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] CKSUM_STREAM_SEL; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] CKSUM_STREAM_SEL2; 
(* MARK_DEBUG="true" *)reg     CKSUM_START_TRIGGER; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// // SEGMENT INPUT DATA INTO PACKETS -----------------
//  Raise a flag when no new Tx data is received in the last 200 us. 
//  Keep track for each stream.
reg     [NTCPSTREAMS - 1:0] S2_CLK; 
reg     [ADDR_WIDTH + 2:0]  FS2; 
reg     [ADDR_WIDTH + 2:0]  TSNO2; 
reg     [63:0]  DATA2v; 
reg     OSC; 

(* MARK_DEBUG="true" *)reg     [4*NTCPSTREAMS - 1:0] WPTR_INCREMENT;

initial 
   begin : process_76
   CKSUM_START_TRIGGER = 1'b 0;   
   end






initial 
   begin : process_75
   CKSUM_STREAM_SEL2 = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_74
   CKSUM_STREAM_SEL = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_73
   CKSUM_STATE = 0;   
   end

initial 
   begin : process_72
   {TIMER1[31], TIMER1[30], TIMER1[29], TIMER1[28], TIMER1[27], TIMER1[26], TIMER1[25], TIMER1[24], TIMER1[23], TIMER1[22], TIMER1[21], TIMER1[20], TIMER1[19], TIMER1[18], TIMER1[17], TIMER1[16], TIMER1[15], TIMER1[14], TIMER1[13], TIMER1[12], TIMER1[11], TIMER1[10], TIMER1[9], TIMER1[8], TIMER1[7], TIMER1[6], TIMER1[5], TIMER1[4], TIMER1[3], TIMER1[2], TIMER1[1], TIMER1[0]} = {32{0}};   
   end

initial 
   begin : process_57
   TX_PAYLOAD_SIZE0 = {16{1'b 0}};   
   end

initial 
   begin : process_56
   TX_PAYLOAD_CHECKSUM0 = {18{1'b 0}};   
   end

initial 
   begin : process_55
   TX_STREAM_SEL_local0 = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_54
   TX_STREAM_SEL_local = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end


initial 
   begin : process_51
   OB_SAMPLE_CLK = 1'b 0;   
   end

initial 
   begin : process_50
   OB_SAMPLE_CLK_E = 1'b 0;   
   end

initial 
   begin : process_49
   OBUF_SIZE_ZERO = 1'b 0;   
   end

initial 
   begin : process_47
   WPTR_END = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_46
   OB_ADDRB = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_45
   OB_ADDRA = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end


initial 
   begin : process_41
   CKSUM3 = {18{1'b 0}};   
   end

initial 
   begin : process_40
   CKSUM2 = {18{1'b 0}};   
   end

initial 
   begin : process_39
   CKSUM1 = {18{1'b 0}};   
   end

initial 
   begin : process_38
   {TX_SEQ_NO[31], TX_SEQ_NO[30], TX_SEQ_NO[29], TX_SEQ_NO[28], TX_SEQ_NO[27], TX_SEQ_NO[26], TX_SEQ_NO[25], TX_SEQ_NO[24], TX_SEQ_NO[23], TX_SEQ_NO[22], TX_SEQ_NO[21], TX_SEQ_NO[20], TX_SEQ_NO[19], TX_SEQ_NO[18], TX_SEQ_NO[17], TX_SEQ_NO[16], TX_SEQ_NO[15], TX_SEQ_NO[14], TX_SEQ_NO[13], TX_SEQ_NO[12], TX_SEQ_NO[11], TX_SEQ_NO[10], TX_SEQ_NO[9], TX_SEQ_NO[8], TX_SEQ_NO[7], TX_SEQ_NO[6], TX_SEQ_NO[5], TX_SEQ_NO[4], TX_SEQ_NO[3], TX_SEQ_NO[2], TX_SEQ_NO[1], TX_SEQ_NO[0]} = {32{{32{1'b 0}}}};   
   end

initial 
   begin : process_37
   {EFF_RX_WINDOW_SIZE_PARTIAL[31], EFF_RX_WINDOW_SIZE_PARTIAL[30], EFF_RX_WINDOW_SIZE_PARTIAL[29], EFF_RX_WINDOW_SIZE_PARTIAL[28], EFF_RX_WINDOW_SIZE_PARTIAL[27], EFF_RX_WINDOW_SIZE_PARTIAL[26], EFF_RX_WINDOW_SIZE_PARTIAL[25], EFF_RX_WINDOW_SIZE_PARTIAL[24], EFF_RX_WINDOW_SIZE_PARTIAL[23], EFF_RX_WINDOW_SIZE_PARTIAL[22], EFF_RX_WINDOW_SIZE_PARTIAL[21], EFF_RX_WINDOW_SIZE_PARTIAL[20], EFF_RX_WINDOW_SIZE_PARTIAL[19], EFF_RX_WINDOW_SIZE_PARTIAL[18], EFF_RX_WINDOW_SIZE_PARTIAL[17], EFF_RX_WINDOW_SIZE_PARTIAL[16], EFF_RX_WINDOW_SIZE_PARTIAL[15], EFF_RX_WINDOW_SIZE_PARTIAL[14], EFF_RX_WINDOW_SIZE_PARTIAL[13], EFF_RX_WINDOW_SIZE_PARTIAL[12], EFF_RX_WINDOW_SIZE_PARTIAL[11], EFF_RX_WINDOW_SIZE_PARTIAL[10], EFF_RX_WINDOW_SIZE_PARTIAL[9], EFF_RX_WINDOW_SIZE_PARTIAL[8], EFF_RX_WINDOW_SIZE_PARTIAL[7], EFF_RX_WINDOW_SIZE_PARTIAL[6], EFF_RX_WINDOW_SIZE_PARTIAL[5], EFF_RX_WINDOW_SIZE_PARTIAL[4], EFF_RX_WINDOW_SIZE_PARTIAL[3], EFF_RX_WINDOW_SIZE_PARTIAL[2], EFF_RX_WINDOW_SIZE_PARTIAL[1], EFF_RX_WINDOW_SIZE_PARTIAL[0]} = {32{{32{1'b 0}}}};   
   end

initial 
   begin : process_35
   {EFF_RX_WINDOW_SIZE[31], EFF_RX_WINDOW_SIZE[30], EFF_RX_WINDOW_SIZE[29], EFF_RX_WINDOW_SIZE[28], EFF_RX_WINDOW_SIZE[27], EFF_RX_WINDOW_SIZE[26], EFF_RX_WINDOW_SIZE[25], EFF_RX_WINDOW_SIZE[24], EFF_RX_WINDOW_SIZE[23], EFF_RX_WINDOW_SIZE[22], EFF_RX_WINDOW_SIZE[21], EFF_RX_WINDOW_SIZE[20], EFF_RX_WINDOW_SIZE[19], EFF_RX_WINDOW_SIZE[18], EFF_RX_WINDOW_SIZE[17], EFF_RX_WINDOW_SIZE[16], EFF_RX_WINDOW_SIZE[15], EFF_RX_WINDOW_SIZE[14], EFF_RX_WINDOW_SIZE[13], EFF_RX_WINDOW_SIZE[12], EFF_RX_WINDOW_SIZE[11], EFF_RX_WINDOW_SIZE[10], EFF_RX_WINDOW_SIZE[9], EFF_RX_WINDOW_SIZE[8], EFF_RX_WINDOW_SIZE[7], EFF_RX_WINDOW_SIZE[6], EFF_RX_WINDOW_SIZE[5], EFF_RX_WINDOW_SIZE[4], EFF_RX_WINDOW_SIZE[3], EFF_RX_WINDOW_SIZE[2], EFF_RX_WINDOW_SIZE[1], EFF_RX_WINDOW_SIZE[0]} = {32{{32{1'b 0}}}};   
   end

initial 
   begin : process_34
   DATA3_WORD_VALID_D = 1'b 0;   
   end

initial 
   begin : process_32
   DATA3_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_30
   WORD_CNTR2 = {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_29
   FRAME_SIZE2 = {(ADDR_WIDTH + 2 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_28
   BYTE_OFFSET2 = {3{1'b 0}};   
   end

initial 
   begin : process_27
   DATA2_SHIFT = {128{1'b 0}};   
   end


initial 
   begin : process_25
   SAMPLE2_CLK_D = 1'b 0;   
   end

// initial 
//    begin : process_24
//    SAMPLE2_CLK = 1'b 0;   
//    end

initial 
   begin : process_23
   CONNECTED_FLAG_D2 = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_22
   CONNECTED_FLAG_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_20
   WEA = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_19
   {AVAILABLE_BUF_SPACE[13], AVAILABLE_BUF_SPACE[12], AVAILABLE_BUF_SPACE[11], AVAILABLE_BUF_SPACE[10], AVAILABLE_BUF_SPACE[9], AVAILABLE_BUF_SPACE[8], AVAILABLE_BUF_SPACE[7], AVAILABLE_BUF_SPACE[6], AVAILABLE_BUF_SPACE[5], AVAILABLE_BUF_SPACE[4], AVAILABLE_BUF_SPACE[3], AVAILABLE_BUF_SPACE[2], AVAILABLE_BUF_SPACE[1], AVAILABLE_BUF_SPACE[0]} = {(ADDR_WIDTH + 2 - 0 + 1){{(ADDR_WIDTH + 2 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_18
   {NEXT_TX_FRAME_SIZE[13], NEXT_TX_FRAME_SIZE[12], NEXT_TX_FRAME_SIZE[11], NEXT_TX_FRAME_SIZE[10], NEXT_TX_FRAME_SIZE[9], NEXT_TX_FRAME_SIZE[8], NEXT_TX_FRAME_SIZE[7], NEXT_TX_FRAME_SIZE[6], NEXT_TX_FRAME_SIZE[5], NEXT_TX_FRAME_SIZE[4], NEXT_TX_FRAME_SIZE[3], NEXT_TX_FRAME_SIZE[2], NEXT_TX_FRAME_SIZE[1], NEXT_TX_FRAME_SIZE[0]} = {(ADDR_WIDTH + 2 - 0 + 1){{(ADDR_WIDTH + 2 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_17
   {BUF_SIZE[14], BUF_SIZE[13], BUF_SIZE[12], BUF_SIZE[11], BUF_SIZE[10], BUF_SIZE[9], BUF_SIZE[8], BUF_SIZE[7], BUF_SIZE[6], BUF_SIZE[5], BUF_SIZE[4], BUF_SIZE[3], BUF_SIZE[2], BUF_SIZE[1], BUF_SIZE[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_15
   RPTR_MAX = {(ADDR_WIDTH + 2 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_14
   {RPTR[13], RPTR[12], RPTR[11], RPTR[10], RPTR[9], RPTR[8], RPTR[7], RPTR[6], RPTR[5], RPTR[4], RPTR[3], RPTR[2], RPTR[1], RPTR[0]} = {(ADDR_WIDTH + 2 - 0 + 1){{(ADDR_WIDTH + 2 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_13
   {WPTR_D[31], WPTR_D[30], WPTR_D[29], WPTR_D[28], WPTR_D[27], WPTR_D[26], WPTR_D[25], WPTR_D[24], WPTR_D[23], WPTR_D[22], WPTR_D[21], WPTR_D[20], WPTR_D[19], WPTR_D[18], WPTR_D[17], WPTR_D[16], WPTR_D[15], WPTR_D[14], WPTR_D[13], WPTR_D[12], WPTR_D[11], WPTR_D[10], WPTR_D[9], WPTR_D[8], WPTR_D[7], WPTR_D[6], WPTR_D[5], WPTR_D[4], WPTR_D[3], WPTR_D[2], WPTR_D[1], WPTR_D[0]} = {32{{32{1'b 0}}}};   
   end

initial 
   begin : process_12
   {WPTR[31], WPTR[30], WPTR[29], WPTR[28], WPTR[27], WPTR[26], WPTR[25], WPTR[24], WPTR[23], WPTR[22], WPTR[21], WPTR[20], WPTR[19], WPTR[18], WPTR[17], WPTR[16], WPTR[15], WPTR[14], WPTR[13], WPTR[12], WPTR[11], WPTR[10], WPTR[9], WPTR[8], WPTR[7], WPTR[6], WPTR[5], WPTR[4], WPTR[3], WPTR[2], WPTR[1], WPTR[0]} = {32{{32{1'b 0}}}};   
   end

initial 
   begin : process_9
   APP_DATA_VALID1 = {(16 * NTCPSTREAMS - 1 - 0 + 1){{(16 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_8
   APP_DATA_SHIFT = {(128 * NTCPSTREAMS - 1 - 0 + 1){{(128 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_7
   APP_DATA_FLUSH_PENDING_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_6
   APP_DATA_FLUSH_PENDING = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_5
   APP_WORD_VALID_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_2
   {TX_IDLE_TIMER[31], TX_IDLE_TIMER[30], TX_IDLE_TIMER[29], TX_IDLE_TIMER[28], TX_IDLE_TIMER[27], TX_IDLE_TIMER[26], TX_IDLE_TIMER[25], TX_IDLE_TIMER[24], TX_IDLE_TIMER[23], TX_IDLE_TIMER[22], TX_IDLE_TIMER[21], TX_IDLE_TIMER[20], TX_IDLE_TIMER[19], TX_IDLE_TIMER[18], TX_IDLE_TIMER[17], TX_IDLE_TIMER[16], TX_IDLE_TIMER[15], TX_IDLE_TIMER[14], TX_IDLE_TIMER[13], TX_IDLE_TIMER[12], TX_IDLE_TIMER[11], TX_IDLE_TIMER[10], TX_IDLE_TIMER[9], TX_IDLE_TIMER[8], TX_IDLE_TIMER[7], TX_IDLE_TIMER[6], TX_IDLE_TIMER[5], TX_IDLE_TIMER[4], TX_IDLE_TIMER[3], TX_IDLE_TIMER[2], TX_IDLE_TIMER[1], TX_IDLE_TIMER[0]} = {32{TX_IDLE_TIMEOUT}};   
   end

genvar i;
integer j;

////////////////////////////////////////////////////////
//      IMPLEMENTATION
////////////////////////////////////////////////////////


//// SEGMENT INPUT DATA INTO PACKETS ////////////////-
// SEGMENT INPUT DATA INTO PACKETS ////////////////-

// Raise a flag when no new Tx data is received in the last 200 us. 
// Keep track for each stream.
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : TX_IDLE_GENx
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1 | CONNECTED_FLAG[i] == 1'b 0) begin
         if (SIMULATION == 1'b 1) begin
            TX_IDLE_TIMER[i] <= 2;   // shortened timeout during simulation
         end else begin
            TX_IDLE_TIMER[i] <= TX_IDLE_TIMEOUT;   
         end
      end else if (APP_DATA_VALID[(i*8)+:8] != 8'h 00 ) begin
         // new transmit data, re-arm timer
         if (SIMULATION == 1'b 1) begin
            TX_IDLE_TIMER[i] <= 2;   // shortened timeout during simulation
         end else begin
            TX_IDLE_TIMER[i] <= TX_IDLE_TIMEOUT;   
         end
      end else if (TICK_4US == 1'b 1 & TX_IDLE_TIMER[i] != 0 ) begin
         // otherwise, decrement until counter reaches 0 (TX_IDLE condition)
         TX_IDLE_TIMER[i] <= TX_IDLE_TIMER[i] - 1;   
      end
   end
   assign TX_IDLE[i] = ((TX_IDLE_TIMER[i] == 0) & (APP_DATA_VALID[(i*8)+:8] == 8'h 00)) ? 1'b 1 : 1'b 0; 
end
endgenerate
//// INPUT ELASTIC BUFFER
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : process_1
   assign APP_WORD_VALID[i] = APP_DATA_VALID[(i*8)+:8] != 8'h 00 ? 1'b 1 : 1'b 0;
end
endgenerate

// shift input word depending on the next write byte address WPTRA(2 downto 0)
// ready at RX_DATA_VALID_D2
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : SHIFT_APP_DATA_IN_00X
   always @(posedge CLK) begin

      APP_WORD_VALID_D[i] <= APP_WORD_VALID[i];   
      if (CONNECTED_FLAG[i] == 1'b 0) begin
         // on hold until WPTR is initialized
         APP_DATA_VALID1[(i*16)+:16] <= 16'b0;   
         WEA[i] <= 1'b 0;   
      end else if (APP_WORD_VALID[i] == 1'b 1 ) begin
         // write shifted input 
         // write a complete or partial word, or re-write (at the same location) if the previous word was incomplete   
         WEA[i] <= 1'b 1;   
         // APP_DATA_VALID1 aligned with WEA and WPTR_D
         case (WPTR[i][2:0])
         3'b 000:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID[(i*8)+:8], 8'b 00000000};   
            end
         3'b 001:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+15)+:1], APP_DATA_VALID[(i*8)+:8], 7'b 0000000};   
            end
         3'b 010:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+14)+:2], APP_DATA_VALID[(i*8)+:8], 6'b 000000};   
            end
         3'b 011:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+13)+:3], APP_DATA_VALID[(i*8)+:8], 5'b 00000};   
            end
         3'b 100:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+12)+:4], APP_DATA_VALID[(i*8)+:8], 4'b 0000};   
            end
         3'b 101:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+11)+:5], APP_DATA_VALID[(i*8)+:8], 3'b 000};   
            end
         3'b 110:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+10)+:6], APP_DATA_VALID[(i*8)+:8], 2'b 00};   
            end
         default:
            begin
            APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16+9)+:7], APP_DATA_VALID[(i*8)+:8], 1'b 0};   
            end
         endcase
         // if(APP_DATA_VALID1(I)(8) = '1') then
         if (WPTR_D[i][3] != WPTR[i][3])
            begin
               // last write to memory was a full 64-bit word. Shift remainder by 8-bytes
               // Algo: this is when WPTR(3) toggles
            case (WPTR[i][2:0])
            3'b 000:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA[(i*64)+:64], 64'h 0000000000000000};   
               end
            3'b 001:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+56)+:8], APP_DATA[(i*64)+:64], 56'h 00000000000000};   
               end
            3'b 010:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+48)+:16], APP_DATA[(i*64)+:64], 48'h 000000000000};   
               end
            3'b 011:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+40)+:24], APP_DATA[(i*64)+:64], 40'h 0000000000};   
               end
            3'b 100:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+32)+:32], APP_DATA[(i*64)+:64], 32'h 00000000};   
               end
            3'b 101:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+24)+:40], APP_DATA[(i*64)+:64], 24'h 000000};   
               end
            3'b 110:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+16)+:48], APP_DATA[(i*64)+:64], 16'h 0000};   
               end
            default:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+8)+:56], APP_DATA[(i*64)+:64], 8'h 00};   
               end
            endcase
            end
         else begin
               // last write to memory was a partial < 8 byte word. Do not shift remainder 
            case (WPTR[i][2:0])
            3'b 000:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA[(i*64)+:64], 64'h 0000000000000000};   
               end
            3'b 001:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+120)+:8], APP_DATA[(i*64)+:64], 56'h 00000000000000};   
               end
            3'b 010:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+112)+:16], APP_DATA[(i*64)+:64], 48'h 000000000000};   
               end
            3'b 011:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+104)+:24], APP_DATA[(i*64)+:64], 40'h 0000000000};   
               end
            3'b 100:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+96)+:32], APP_DATA[(i*64)+:64], 32'h 00000000};   
               end
            3'b 101:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+88)+:40], APP_DATA[(i*64)+:64], 24'h 000000};   
               end
            3'b 110:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+80)+:48], APP_DATA[(i*64)+:64], 16'h 0000};   
               end
            default:
               begin
               APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128+72)+:56], APP_DATA[(i*64)+:64], 8'h 00};   
               end
            endcase
            end
      end else if (APP_WORD_VALID_D[i] == 1'b 1 & APP_DATA_VALID1[(i*16+7)+:1] == 1'b 1 ) begin
         // additional write for left-over bits
         APP_DATA_SHIFT[(i*128)+:128] <= {APP_DATA_SHIFT[(i*128)+:64], 64'h 0000000000000000};   
         APP_DATA_VALID1[(i*16)+:16] <= {APP_DATA_VALID1[(i*16)+:8], 8'h 00};   
         WEA[i] <= 1'b 1;   
      end else begin
         WEA[i] <= 1'b 0;   
      end
   end
   //  remember if a flush is pending
   always @(posedge CLK) begin
      APP_DATA_FLUSH_PENDING_D[i] <= APP_DATA_FLUSH_PENDING[i];  //  need extra clock until BUF_SIZE includes the latest word
      if (APP_DATA_FLUSH[i] == 1'b 1) begin
         APP_DATA_FLUSH_PENDING[i] <= 1'b 1;   
      end else if (EVENTS1[i] == 1'b 1 ) begin
         // decision to transmit is made. clear flush_pending
         APP_DATA_FLUSH_PENDING[i] <= 1'b 0;   
      end
   end
end
endgenerate

// write pointer management. One for each stream.
// Definition: next memory location to be written to.
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : WPTR_GENx
   always @(APP_DATA_VALID)
      if (APP_DATA_VALID[(i*8)+:1] == 1'b 1) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd8;   
      end else if (APP_DATA_VALID[(i*8+1)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd7;   
      end else if (APP_DATA_VALID[(i*8+2)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd6;   
      end else if (APP_DATA_VALID[(i*8+3)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd5;   
      end else if (APP_DATA_VALID[(i*8+4)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd4;   
      end else if (APP_DATA_VALID[(i*8+5)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd3;   
      end else if (APP_DATA_VALID[(i*8+6)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd2;   
      end else if (APP_DATA_VALID[(i*8+7)+:1] == 1'b 1 ) begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd1;   
      end else begin
         WPTR_INCREMENT[(4*i)+:4] = 4'd0;   
      end

   always @(posedge CLK) begin
      WPTR_D[i] <= WPTR[i];   
      if (CONNECTED_FLAG[i] == 1'b 0) begin
         // near and up to the start of connection. TX_SEQ_NO_IN is ready to be read.
         // Pre-position the write and read memory pointers so that the addresses are consistent with the 
         // TCP sequence numbers (which start with a random initial sequence number upon establishing a TCP connection).
         WPTR[i] <= TX_SEQ_NO_IN[(i*32)+:32];   // units: bytes
      end else if (APP_WORD_VALID[i] == 1'b 1 ) begin
         WPTR[i] <= WPTR[i] + WPTR_INCREMENT[(4*i)+:4];   
      end
   end
end
endgenerate

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : BRAM_DP2_X
   assign DIA[(i*64)+:64] = APP_DATA_SHIFT[(i*128+64)+:64]; 
   bram_dp2c #(
             .DATA_WIDTH (64),
             .ADDR_WIDTH (ADDR_WIDTH)
   )BRAM_DP2_001_BRAM_DP2_X_0 (
             .CLK(CLK),
             .CSA(1'b 1),
             .WEA(WEA[i]),
             .ADDRA(WPTR_D[i][ADDR_WIDTH + 2:3]),
             .DIA(DIA[(i*64)+:64]),
             .CSB(1'b 1),
             .ADDRB(RPTR[i][ADDR_WIDTH + 2:3]),
             .DOB(DOB[(i*64)+:64]));
end
endgenerate
// read pointer management
// Rule #1: RPTR = TX_SEQ_NO(I) at start and upon client ack timeout (TX_SEQ_NO_JUMP)
// Rule #2: RPTR points to the next memory location to be read
// Rule #3: Clear all data within the elastic buffer after closing TCP connection
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : RPTR_GENx
   always @(posedge CLK) begin
      if (CONNECTED_FLAG[i]== 1'b 0) begin
            // At the same time as we set the WPTR -> cause the occupied size to be zero.
         RPTR[i]<= TX_SEQ_NO_IN[(i*32)+:(ADDR_WIDTH + 3)];   
      end else begin
         if (TCP_TX_STATE[i]== 0) begin
            RPTR[i]<= TX_SEQ_NO[i][ADDR_WIDTH + 2:0];   
         end else if (TCP_TX_STATE[i]== 2 & CKSUM_STREAM_SEL2[i]== 1'b 1 ) begin
            if (EVENTS3[i]== 1'b 0) begin
               RPTR[i]<= RPTR[i]+ 8;   
            end else begin
               RPTR[i] <= RPTR_MAX;   
            end
         end
      end
   end
   assign RPTR_BEYOND_UPPER_LIMIT[i] = ((RPTR[i][ADDR_WIDTH + 2:3] == RPTR_MAX[ADDR_WIDTH + 2:3]) & (RPTR_MAX[2:0] == 0)) ? 1'b 1 : ((RPTR[i][ADDR_WIDTH + 2:3] == RPTR_MAX[ADDR_WIDTH + 2:3] + 1 )? 1'b 1 : 1'b 0); 
end
endgenerate
// RE-ALIGN BUFFER OUTPUT WORDS ----------------
// Because we start reading the next payload words at an offset TX_SEQ_NO(I)(2 downto 0).

// One checksum computation circuit
// First mux streams into checksum computation
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : MUX2CHECKSUM_001
   always @(posedge CLK) begin
      S2_CLK[i] <= 'b0;   
      if (TCP_TX_STATE[i] == 2 & EVENTS3[i] == 1'b0) begin
         S2_CLK[i] <= 1'b1;   
      end
   end
end
endgenerate
assign SAMPLE2_CLK = |S2_CLK;

always @(posedge CLK) begin : MUX2CHECKSUM_002
      for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
         if (EVENTS2[j] == 1'b 1) begin
            FS2 = NEXT_TX_FRAME_SIZE[j];   
            TSNO2 = TX_SEQ_NO[j][ADDR_WIDTH + 2:0];   
         end
      end
      if (SYNC_RESET == 1'b 1 | CKSUM_STREAM_SEL2 == 0) begin
         //  no checksum to compute
         FRAME_SIZE2 <= 'b0;   
         RPTR_MAX <= 'b0;   
         BYTE_OFFSET2 <= 'b0;   
      end else begin
         FRAME_SIZE2 <= FS2;   
         RPTR_MAX <= FS2 + TSNO2;   
         BYTE_OFFSET2 <= TSNO2[2:0];   
      end
   end


always@(*) begin
   DATA2v <= 'h0;
   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if(CKSUM_STREAM_SEL2[j] == 1)
         DATA2v <= DOB[(j*64)+:64];
   end              
end
assign DATA2 = DATA2v;   


always @(posedge CLK) begin : SHIFT_RX_DATA_IN_001

   if (CKSUM_START_TRIGGER == 1'b 1) begin
      DATA2_SHIFT <= {128{1'b 0}};   
   end else if (SAMPLE2_CLK == 1'b 1 | SAMPLE2_CLK_D == 1'b 1 ) begin //  need one last shift
      case (BYTE_OFFSET2)
      3'b 000: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:0], DATA2};   
      end
      3'b 001: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:8], DATA2, 8'h 00};   
      end
      3'b 010: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:16], DATA2, 16'h 0000};   
      end
      3'b 011: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:24], DATA2, 24'h 000000};   
      end
      3'b 100: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:32], DATA2, 32'h 00000000};   
      end
      3'b 101: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:40], DATA2, 40'h 0000000000};   
      end
      3'b 110: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:48], DATA2, 48'h 000000000000};   
      end
      default: begin
         DATA2_SHIFT <= {DATA2_SHIFT[63:56], DATA2, 56'h 00000000000000};   
      end
      endcase
   end
end

//  zero unused bytes (important before checksum computation)
generate
for (i = 0; i <= 7; i = i + 1)  begin : DATA3_GEN
   assign DATA3[(8 * i)+: 8] = DATA3_VALID[i] == 1'b1 ? DATA2_SHIFT[(8 * i + 64)+:8] : 8'b0;   
end
endgenerate
//  generate the DATA3_VALID

always @(posedge CLK) begin : DATA3_VALID_GEN
   SAMPLE2_CLK_D <= SAMPLE2_CLK;   
   if (CKSUM_START_TRIGGER == 1'b 1) begin
      DATA3_VALID <= 8'h 00;   
      WORD_CNTR2 <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
   end else if (SAMPLE2_CLK_D == 1'b 1 ) begin
      WORD_CNTR2 <= WORD_CNTR2 + 1;   
      if (WORD_CNTR2 < FRAME_SIZE2[ADDR_WIDTH + 2:3]) begin
         DATA3_VALID <= 8'h FF;   
      end else if (WORD_CNTR2 == FRAME_SIZE2[ADDR_WIDTH + 2:3] ) begin
         case (FRAME_SIZE2[2:0])
         3'b 000: begin
            DATA3_VALID <= 8'h 00;   
         end
         3'b 001: begin
            DATA3_VALID <= 8'h 80;   
         end
         3'b 010: begin
            DATA3_VALID <= 8'h c0;   
         end
         3'b 011: begin
            DATA3_VALID <= 8'h e0;   
         end
         3'b 100: begin
            DATA3_VALID <= 8'h f0;   
         end
         3'b 101: begin
            DATA3_VALID <= 8'h f8;   
         end
         3'b 110: begin
            DATA3_VALID <= 8'h fc;   
         end
         default: begin
            DATA3_VALID <= 8'h fe;   
         end
         endcase
      end else begin
         DATA3_VALID <= 8'h 00;   
      end
   end else begin
      DATA3_VALID <= 8'h 00;   
   end
end

assign DATA3_WORD_VALID = DATA3_VALID == 8'h 00 ? 1'b 0 : 1'b 1; 

// // TCP TX CHECKSUM  ---------------------------
//  Compute the TCP payload checksum (excluding headers which are included in the TCP_TX formatting component).
//  for timing reasons, we limit ourselves to summing up to 3 16-bit fields per CLK 

always @(posedge CLK) begin : UDP_CKSUM_001
   DATA3_WORD_VALID_D <= DATA3_WORD_VALID;   
   if (CKSUM_START_TRIGGER == 1'b 1) begin
      CKSUM1 <= {18{1'b 0}};   
      CKSUM2 <= {18{1'b 0}};   
      CKSUM3 <= {18{1'b 0}};   //  carry
   end else if (DATA3_WORD_VALID == 1'b 1 ) begin
      CKSUM3 <= CKSUM3PLUS;   
      CKSUM1 <= CKSUM1[15:0] + DATA3[63:48] + DATA3[47:32];   
      CKSUM2 <= CKSUM2[15:0] + DATA3[31:16] + DATA3[15:0];   
   end
end


assign CKSUM3PLUS = CKSUM3 + CKSUM1[17:16] + CKSUM2[17:16]; 
assign TCP_CKSUM = CKSUM1[15:0] + CKSUM2[15:0] + CKSUM3PLUS; 
// // OUTPUT BUFFER --------------------------------

assign OB_WEA = DATA3_WORD_VALID; 
assign OB_DIA = {DATA3_VALID, DATA3}; 

//  write pointer management

always @(posedge CLK) begin : OB_WPTR_GEN
   if (SYNC_RESET == 1'b 1)
      begin
      OB_ADDRA <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
      end
   else if (EVENT5 == 1'b 1 ) begin  //  *072718
   //  disruption of current stream selected for checksum computation (server size asks to rewind)
      OB_ADDRA <= WPTR_END;   
   //  cancel partial output frame
   end else if (DATA3_WORD_VALID == 1'b 1 & CKSUM_STATE == 1 ) begin
      OB_ADDRA <= OB_ADDRA + 1;   
   end
end

// OB_001: BRAM_DP2 
// GENERIC MAP(
//     DATA_WIDTHA => 72,        
//     ADDR_WIDTHA => ADDR_WIDTH,
//     DATA_WIDTHB => 72,         
//     ADDR_WIDTHB => ADDR_WIDTH
// 
// )
// PORT MAP(
//     CSA => '1',
//     CLKA => CLK,
//     WEA => OB_WEA,      -- Port A Write Enable Input
//     ADDRA =>  std_logic_vector(OB_ADDRA),
//     DIA => OB_DIA,      -- Port A  Data Input
//     OEA => '0',
//     DOA => open,
//     CSB => '1',
//     CLKB => CLK,
//     WEB => '0',
//     ADDRB => std_logic_vector(OB_ADDRB),  -- Port B Address Input
//     DIB => (others => '0'),      -- Port B ata Input
//     OEB => '1',
//     DOB => OB_DOB      -- Port B Data Output
// );    
//  slightly better timing when split into 3 block rams *081818
//  Port A Data Output
bram_dp2c #(
      .DATA_WIDTH (32),
      .ADDR_WIDTH (ADDR_WIDTH)
)OB_001a (
          .CLK(CLK),
          .CSA(1'b 1),
          .WEA(OB_WEA), //  Port A Write Enable Input
          .ADDRA(OB_ADDRA),
          .DIA(OB_DIA[31:0]), //  Port A  Data Input
          .CSB(1'b 1),
          .ADDRB(OB_ADDRB), //  Port B Address Input
          .DOB(OB_DOB[31:0])); //  Port B Data Output

bram_dp2c #(
          .DATA_WIDTH (32),
          .ADDR_WIDTH (ADDR_WIDTH)
)OB_001b (
          .CLK(CLK),
          .CSA(1'b 1),
          .WEA(OB_WEA), //  Port A Write Enable Input
          .ADDRA(OB_ADDRA),
          .DIA(OB_DIA[63:32]), //  Port A  Data Input
          .CSB(1'b 1),
          .ADDRB(OB_ADDRB), //  Port B Address Input
          .DOB(OB_DOB[63:32])); //  Port B Data Output

bram_dp2c #(
          .DATA_WIDTH (8),
          .ADDR_WIDTH (ADDR_WIDTH)
)OB_001c (
          .CLK(CLK),
          .CSA(1'b 1),
          .WEA(OB_WEA), //  Port A Write Enable Input
          .ADDRA(OB_ADDRA),
          .DIA(OB_DIA[71:64]), //  Port A  Data Input
          .CSB(1'b 1),
          .ADDRB(OB_ADDRB), //  Port B Address Input
          .DOB(OB_DOB[71:64])); //  Port B Data Output

assign TX_PAYLOAD_DATA = OB_DOB[63:0]; 
assign TX_PAYLOAD_DATA_VALID = OB_SAMPLE_CLK == 1'b 1 ? OB_DOB[71:64] : {8{1'b 0}}; 
assign TX_PAYLOAD_WORD_VALID = OB_SAMPLE_CLK;  //  '1' when TX_PAYLOAD_DATA_VALID /= 0
assign TX_PAYLOAD_DATA_EOF = OBUF_SIZE_ZERO & OB_SAMPLE_CLK; 
assign OBUF_SIZE = WPTR_END + ~OB_ADDRB; 
//  output buffer read pointer

always @(posedge CLK) begin : OB_RPTR_GEN

   OB_SAMPLE_CLK <= OB_SAMPLE_CLK_E;   
   if (SYNC_RESET == 1'b 1) begin
      OB_ADDRB <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 1}};   
      OB_SAMPLE_CLK_E <= 1'b 0;   
      //         elsif(TX_PAYLOAD_CTS = '1') and (OBUF_SIZE /= 0) and (CKSUM_STATE /= 0) then
      //  test test test
      end
   else if (TX_PAYLOAD_CTS == 1'b 1 & OBUF_SIZE != 0 ) begin
      OB_ADDRB <= OB_ADDRB + 1;   
      OB_SAMPLE_CLK_E <= 1'b 1;   
   end else begin
      OB_SAMPLE_CLK_E <= 1'b 0;   
   end
      //  aligned with OB_SAMPLE_CLK
   if (OBUF_SIZE == 0) begin
      OBUF_SIZE_ZERO <= 1'b 1;   
   end else begin
      OBUF_SIZE_ZERO <= 1'b 0;   
   end
end

// TCP_SERVER INTERFACE ------------------------
// predict the next frame TX_SEQ_NO 
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: FREEZE_TX_SEQ_NO_x
   always @(posedge CLK) begin
      if (TX_SEQ_NO_JUMP[i] == 1'b 1) begin
            // force rewind. Abort any current read/checksum computation         
            // update TCP_TX_NO after the server has reported a discontinuity (at connection time, or when the client
            // asks to retransmit). Update locally upon processing successive frames, unless a 
            // discontinuity is requested.
         TX_SEQ_NO[i] <= TX_SEQ_NO_IN[(i*32)+:32];   
      end else if (EVENTS3[i] == 1'b 1 ) begin
            // completed reading a frame out of the memory to compute payload checksum
            // regular progress at the end of frame
         TX_SEQ_NO[i] <= TX_SEQ_NO[i] + FRAME_SIZE2;   
      end
   end
end
endgenerate

// compute the Effective TCP rx window size = advertised TCP rx window size - unacknowledged but sent data size
// changes at end of tx frame, and upon receiving a valid ack
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: EFF_RX_WINDOW_SIZE_GENx
   always @(posedge CLK) begin
      if (EFF_RX_WINDOW_SIZE_PARTIAL_VALID == 1'b 1 & EFF_RX_WINDOW_SIZE_PARTIAL_STREAM[i] == 1'b 1) begin
         EFF_RX_WINDOW_SIZE_PARTIAL[i] <= EFF_RX_WINDOW_SIZE_PARTIAL_IN;   
      end
   end
end
endgenerate
// effective TCP rx window size is EFF_RX_WINDOW_SIZE_PARTIAL - TX_SEQ_NO 
// This is the maximum number of bytes that the TCP client can accept.
// EFF_RX_WINDOW_SIZE is valid only up to the tx decision time (while TCP_TX_STATE = 0)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: EFF_RX_WINDOW_SIZE_GENy
   always @(posedge CLK) begin
      if (CONNECTED_FLAG[i] == 1'b0) begin
         EFF_RX_WINDOW_SIZE[i] <= 'b0;   
      end else begin
         EFF_RX_WINDOW_SIZE[i] <= EFF_RX_WINDOW_SIZE_PARTIAL[i] - TX_SEQ_NO[i];   
         end
   end
   assign EFF_RX_WINDOW_SIZE_MSB[i] = EFF_RX_WINDOW_SIZE[i][31];   
end
endgenerate
// TX EVENTS -------------------------------------
// has the input been idle for over 200us? see TX_IDLE

// How many bytes are waiting in the tx buffer? 
// BUF_SIZE is valid only up to the tx decision time (while TCP_TX_STATE = 0)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TX_BUFFER_SIZE_GENx
always @(posedge CLK) begin
      BUF_SIZE[i] <= WPTR[i][ADDR_WIDTH + 3:0] - TX_SEQ_NO[i][ADDR_WIDTH + 3:0];   
      end
   end
endgenerate
// Compute the next tx frame size
// two upper bounds for the tx frame size: MSS bytes and EFF_RX_WINDOW_SIZE
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: NEXT_TX_FRAME_SIZE_GENx
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         NEXT_TX_FRAME_SIZE[i] <= 'b0;   
      end else if (CONNECTED_FLAG_D2[i] == 1'b 0 ) begin
         // no TCP-IP connection yet, or pointer information not fully available yet. Nothing to send.
         NEXT_TX_FRAME_SIZE[i] <= 'b0;   
      end else if (TCP_TX_STATE[i] == 0 ) begin
         // update frame size up to the tx decision time
         // Once the decision to transmit is taken, freeze NEXT_TX_FRAME_SIZE into FRAME_SIZE2 until the frame transmission is complete.
         if (EVENTS0D[i] == 1'b 0) begin
            // no space at receiving end
            NEXT_TX_FRAME_SIZE[i] <= 'b 0;   
         end else if (EVENTS0B[i] == 1'b 0 & EVENTS0C[i] == 1'b 0 & BUF_SIZE[i][ADDR_WIDTH + 3] == 1'b 0 ) begin
            // BUF_SIZE is positive, does not exceed MSS or the available space at the receiving end
            NEXT_TX_FRAME_SIZE[i] <= BUF_SIZE[i][ADDR_WIDTH + 2:0];   
         end else if (EVENTS0B[i] == 1'b 1 & EVENTS0C[i] == 1'b 0 ) begin
               // effective rx window size not the most stringent constraint.
               // maximum payload size is constrained by MSS byte ceiling
               // KEY ASSUMPTION: MSS is smaller than the instantiated buffer(s) address range. 
            NEXT_TX_FRAME_SIZE[i] <= MSS;   
         end  else if (EVENTS0B[i] == 1'b 0 & EVENTS0C[i] == 1'b 1 )  begin
            // effective rx window size is the most stringent constraint.
            NEXT_TX_FRAME_SIZE[i] <= EFF_RX_WINDOW_SIZE[i][ADDR_WIDTH + 2:0];   
         end else if (EVENTS0E[i] == 1'b 1 ) begin
            // effective rx window size limit
            NEXT_TX_FRAME_SIZE[i] <= EFF_RX_WINDOW_SIZE[i][ADDR_WIDTH + 2:0];   
         end else begin
            // MSS limit
            NEXT_TX_FRAME_SIZE[i] <= MSS;   
         end
      end
   end
end
endgenerate
//// TX STATE MACHINE ////////////////////////////////////
// Decision to send a packet is made here based on
// (a) input has been idle for more than 200 us, or
// (b) the packet size collected so far has reached its threshold of MSS bytes, or less if the effective 
// rx window is smaller. 
// (c) immediate flush request
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TCP_TX_STATE_GENx
	// for timing purposes, reclock these trigger events
	
	// no delay (buf_size, eff_rx_window_size could be changing) *011321

	// data in buffer
   assign EVENTS0A[i] = BUF_SIZE[i] > 0 ? 1'b 1 : 1'b 0;   
    // buffer size greater than MSS
   assign EVENTS0B[i] = BUF_SIZE[i] >= MSS ? 1'b 1 : 1'b 0; 
	// buffer size greater than EFF_RX_WINDOW_SIZE(I)
	// and EFF_RX_WINDOW_SIZE(I) is not negative (meaning zero space available at rx end)
   assign EVENTS0C[i] = ((BUF_SIZE[i] >= EFF_RX_WINDOW_SIZE[i][ADDR_WIDTH + 3:0]) & EFF_RX_WINDOW_SIZE[i][31:ADDR_WIDTH + 4] == 0) ? 1'b1 : 1'b0;
   	// receiving end has space for more data
   assign EVENTS0D[i] = ((EFF_RX_WINDOW_SIZE[i] > 0) & (EFF_RX_WINDOW_SIZE_MSB[i] == 1'b 0)) ? 1'b1 : 1'b0;
 	// MSS greater than EFF_RX_WINDOW_SIZE(I)
   assign EVENTS0E[i] = ((EFF_RX_WINDOW_SIZE[i] < MSS) | (EFF_RX_WINDOW_SIZE_MSB[i] == 1'b 1)) ? 1'b1 : 1'b0;

//	EVENTS0_I_GEN_002: process(CLK)
//	begin
//		if rising_edge(CLK) then
//			// data in buffer
//			if(BUF_SIZE(I) > 0) then
//				EVENTS0A(I) <= '1';
//			else
//				EVENTS0A(I) <= '0';
//			end if;
//
//			// buffer size greater than MSS
//			if(BUF_SIZE(I) >= MSS) then
//				EVENTS0B(I) <= '1';
//			else
//				EVENTS0B(I) <= '0';
//			end if;
//
//			// buffer size greater than EFF_RX_WINDOW_SIZE(I)
//			// and EFF_RX_WINDOW_SIZE(I) is not negative (meaning zero space available at rx end)
//			if(BUF_SIZE(I) >= EFF_RX_WINDOW_SIZE(I)(ADDR_WIDTH+3 downto 0)) and (EFF_RX_WINDOW_SIZE_MSB(I) = '0') then
//				EVENTS0C(I) <= '1';
//			else
//				EVENTS0C(I) <= '0';
//			end if;
//
//			// receiving end has space for more data
//			if(EFF_RX_WINDOW_SIZE(I) > 0) and (EFF_RX_WINDOW_SIZE_MSB(I) = '0')  then
//				EVENTS0D(I) <= '1';
//			else
//				EVENTS0D(I) <= '0';
//			end if;
//
//			// MSS greater than EFF_RX_WINDOW_SIZE(I)
//			if(EFF_RX_WINDOW_SIZE(I) < MSS) or (EFF_RX_WINDOW_SIZE_MSB(I) = '1') then
//				EVENTS0E(I) <= '1';
//			else
//				EVENTS0E(I) <= '0';
//			end if;
//			
//		end if;
//	end process;


   assign EVENTS1A[i] = ((CONNECTED_FLAG[i] == 1'b 1) & (TCP_TX_STATE[i] == 0) & (EVENTS0A[i] == 1'b 1) & (EVENTS0D[i] == 1'b 1) & (TX_IDLE[i] == 1'b 1 | APP_DATA_FLUSH_PENDING_D[i] == 1'b 1)) ? 1'b 1 : 1'b 0; 
	// immediate flush request or no new data in 200us while data is waiting to be transmitted and rx end can accept new data. 
	// Initiate transmission

   assign EVENTS1B[i] = ((CONNECTED_FLAG[i] == 1'b 1) & (TCP_TX_STATE[i] == 0) & (EVENTS0A[i] == 1'b 1) & (EVENTS0D[i] == 1'b 1) & (EVENTS0B[i] == 1'b 1 | EVENTS0C[i] == 1'b 1)) ? 1'b 1 : 1'b 0; 
	//enough data for a full tx frame or enough to fill the receiving end. don't wait. 
		  // Initiate transmission.
	// old. seems uncessary
	//    EVENTS1C(I) <= '1' when (CONNECTED_FLAG(I) = '1') and (TCP_TX_STATE(I) = 0) and (EVENTS0A(I) = '1') and 
	//			(EVENTS0D(I) = '1') and (APP_CTS_local(I) = '0') and (EVENTS0C(I) = '1') else '0';
	//			-- Elastic buffer is full and enough to fill the receiving end. don't wait. 
	//			-- Initiate transmission.

   assign EVENTS1[i] = EVENTS1A[i] | EVENTS1B[i]; 

   // transmit decision time
   assign EVENTS2[i] = ((CONNECTED_FLAG[i] == 1'b 1) & (TCP_TX_STATE[i] == 1) & (CKSUM_STREAM_SEL2[i] == 1'b 1) & (CKSUM_START_TRIGGER == 1'b 1)) ? 1'b 1 : 1'b 0; 

   // start checksum computation
   assign EVENTS3[i] = ((CONNECTED_FLAG[i] == 1'b 1) & (TCP_TX_STATE[i] == 2) & (CKSUM_STREAM_SEL2[i] == 1'b 1) & (RPTR_BEYOND_UPPER_LIMIT[i] == 1'b 1)) ? 1'b 1 : 1'b 0; 
   // completed reading a frame to the checksum computation circuit and output buffer

   assign EVENTS5[i] = ((TX_SEQ_NO_JUMP[i] == 1'b 1) & (CKSUM_STREAM_SEL2[i] == 1'b 1)) ? 1'b 1 : 1'b 0; 
   // disruption of current stream selected for checksum computation (server size asks to rewind)

   always @(posedge CLK) begin : TCP_TX_STATE_GEN_001
         if (SYNC_RESET == 1'b 1 | CONNECTED_FLAG[i] == 1'b 0) begin
            // lost or no connection. Reset tx state machine, irrespective of the current state
            TCP_TX_STATE[i] <= 0;   // back to idle
            TIMER1[i] <= 0;   
         end else if (TX_SEQ_NO_JUMP[i] == 1'b 1 ) begin // *072718
            // force rewind. Abort any current read/checksum computation
            TCP_TX_STATE[i] <= 0;   // back to idle
            TIMER1[i] <= 2;   // need one extra clock to compute BUF_SIZE
            // transmit decision time
         end else if (EVENTS1[i] == 1'b 1 & TIMER1[i] == 0 ) begin
            // immediate flush request or no new data in 200us while data is waiting to be transmitted. Initiate transmission
            // or enough data for a full tx frame. don't wait. Initiate transmission.
            TCP_TX_STATE[i] <= 1;   // awaiting checksum circuit trigger
         end else if (EVENTS2[i] == 1'b 1 ) begin
            // start checksum computation
            TCP_TX_STATE[i] <= 2;   // reading data from the elastic buffer, computing checksum
         end else if (EVENTS3[i] == 1'b 1 ) begin
            // completed reading a frame out of the memory to compute payload checksum
            TCP_TX_STATE[i] <= 3;   // delay until the next tx size is computed
            TIMER1[i] <= 1;   // need one extra clock until key events are ready
         end else if (TCP_TX_STATE[i] == 3 & TIMER1[i] == 0 ) begin
            TCP_TX_STATE[i] <= 0;   // timer expired. back to idle
         end else if (TIMER1[i] > 0 ) begin
            TIMER1[i] <= TIMER1[i] - 1;   
         end
      end

   end
endgenerate

assign EVENT4 = ((DATA3_WORD_VALID_D == 1'b 1) & (DATA3_WORD_VALID == 1'b 0)) ? 1'b 1 : 1'b 0; 

//  end of checksum computation

assign EVENT5 = EVENTS5 != 0 ? 1'b 1 : 1'b 0; 

//  checksum computation disruption. Rewind.
//  disruption of current stream selected for checksum computation (server size asks to rewind)
// // CHECKSUM STATE MACHINE -------------------------
//  all streams out of the elastic buffers are multiplexed into a single checksum computation circuit based on 
//  CKSUM_STREAM_SEL. The checksum circuit state machine is below:

always @(posedge CLK) begin : CKSUM_STATE_GEN
      if (SYNC_RESET == 1'b 1) begin
         CKSUM_STATE <= 0;   
         CKSUM_START_TRIGGER <= 1'b 0;   
      end else if (EVENT5 == 1'b 1 ) begin //  *072718
         //  disruption of current stream selected for checksum computation (server size asks to rewind)
         CKSUM_STATE <= 0;   
      end else if (CKSUM_STATE == 0 ) begin
         //  checksum circuit idle 
         //  is any stream awaiting checksum circuit trigger? If so, start computing checksum
         for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
            if (CKSUM_STREAM_SEL[j] == 1'b 1 & TCP_TX_STATE[j] == 1 & CONNECTED_FLAG[j] == 1'b 1) begin
         //  freeze the ONE stream selected for checksum computation
               CKSUM_STATE <= 1;   
               CKSUM_START_TRIGGER <= 1'b 1;   
               CKSUM_STREAM_SEL2 <= CKSUM_STREAM_SEL;   
            end
         end
      end else if (CKSUM_STATE == 1 & EVENT4 == 1'b 1 ) begin
         //  end of checksum computation 
         CKSUM_START_TRIGGER <= 1'b 0;   
         if (OBUF_SIZE != 0) begin
         //  we are not yet done reading the previous frame. wait
            CKSUM_STATE <= 2;   
         //  done with both checksum computation and previous frame out
         //  we can trigger the next frame output processing
         end else begin
            CKSUM_STATE <= 0;   
            WPTR_END <= OB_ADDRA;   
         //  upper limit for next frame to be forwarded to TCP_TX
         end
      end else if (CKSUM_STATE == 2 & OBUF_SIZE == 0 ) begin
         //  done with both checksum computation and previous frame out
         //  Wait for one more word request (with no response from us) to mark the end of frame in TCP_TX_10G.vhd.
         CKSUM_STATE <= 3;   
      end else if (CKSUM_STATE == 3 ) begin
         //  we can trigger the next frame output processing
         CKSUM_STATE <= 0;   
         WPTR_END <= OB_ADDRA;   
         //  upper limit for next frame to be forwarded to TCP_TX
      end else begin
         CKSUM_START_TRIGGER <= 1'b 0;   
         //  also detect disconnection
         for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
            if (CKSUM_STREAM_SEL2[j] == 1'b 1 & CONNECTED_FLAG[j] == 1'b 0) begin
               CKSUM_STATE <= 0;   
               WPTR_END <= {(ADDR_WIDTH - 1 - 0 + 1){1'b 0}};   
               CKSUM_STREAM_SEL2[j] <= 1'b 0;   
            end
         end
      end
   end

//  select the stream for the next checksum computation
//  scan all possible streams until we reach TCP_TX_STATE(I) = 1 (awaiting checksum circuit trigger) 
//  THERE CAN BE ONLY ONE SINGLE STREAM SELECTED FOR THE CHECKSUM AND OUTPUT BUFFER

   always @(posedge CLK)  begin : NEXT_STREAM_SELECT_GEN

      if (SYNC_RESET == 1'b 1) begin
         CKSUM_STREAM_SEL <= 'b1;     
      end else if (NTCPSTREAMS > 1 )  begin
         for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
            if (CKSUM_STREAM_SEL[j] == 1'b 1 & (TCP_TX_STATE[j] != 1 | CONNECTED_FLAG[j] == 1'b 0)) begin
               //  this stream is not awaiting checksum circuit trigger. move on.
               //  or this stream just completed a checksum computation, back to the end of the line
               //  circular rotation
               CKSUM_STREAM_SEL[NTCPSTREAMS - 1:1] <= CKSUM_STREAM_SEL[NTCPSTREAMS - 2:0];   
               CKSUM_STREAM_SEL[0] <= CKSUM_STREAM_SEL[NTCPSTREAMS - 1];   
            end
         end
      end
   end

//  tell the TCP_SERVER about the stream selected for the next tx frame, the partial checksum, the number of payload bytes.
//  The information is valid when TX_PAYLOAD_RTS = '1'.

   always @(posedge CLK) begin : TCP_SERVER_INFO_GEN
      if (SYNC_RESET == 1'b 1) begin
         TX_PAYLOAD_CHECKSUM <= 'b0;   
         TX_PAYLOAD_SIZE <= 'b0;   
         TX_STREAM_SEL_local <= 'b0;   
      end else if (CKSUM_STATE == 1 & EVENT4 == 1'b 1 ) begin
         if (OBUF_SIZE != 0) begin
            //  we are not yet done reading the previous frame. wait
            //  freeze info regarding the next tx frame until we are about to start next tx frame
            TX_PAYLOAD_CHECKSUM0 <= TCP_CKSUM;  //  up to 2 bits of carry
            TX_PAYLOAD_SIZE0 <= FRAME_SIZE2;   //  payload size in bytes
            TX_STREAM_SEL_local0 <= CKSUM_STREAM_SEL2;   
            //  done with checksum computation. Previous frame is either being read out or completely read.
            //  next tx frame is about to start
         end else begin
            TX_PAYLOAD_CHECKSUM <= TCP_CKSUM;   //  up to 2 bits of carry
            TX_PAYLOAD_SIZE <= FRAME_SIZE2;   //  payload size in bytes
            TX_STREAM_SEL_local <= CKSUM_STREAM_SEL2;   
         end
      end else if (CKSUM_STATE == 3 ) begin
            //  next tx frame is about to start
         TX_PAYLOAD_CHECKSUM <= TX_PAYLOAD_CHECKSUM0;   
         TX_PAYLOAD_SIZE <= TX_PAYLOAD_SIZE0;   
         TX_STREAM_SEL_local <= TX_STREAM_SEL_local0;   
      end
   end

   assign TX_STREAM_SEL = TX_STREAM_SEL_local; 


//  is the output stream still connected?
always @(*) begin : OUTPUT_STREAM_CONNECTED_GEN
   OSC <= 1'b0;
   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if(TX_STREAM_SEL_local[j] == 1'b 1 & CONNECTED_FLAG[j] == 1'b 1)
         OSC <= 1'b1;
   end
end
   assign OUTPUT_STREAM_CONNECTED = OSC;  
   assign TX_PAYLOAD_RTS = OBUF_SIZE != 0 ? OUTPUT_STREAM_CONNECTED : 1'b 0; 

// payload data is available for transmission AND TCP connection is still on.

//// TCP TX FLOW CONTROL  ---------------------------
// The basic tx flow control rule is that the buffer WPTR must never pass the last acknowledged tx byte location.

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: AVAILABLE_BUF_SPACE_GENx
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         AVAILABLE_BUF_SPACE[i] <= 'b0;   
         CONNECTED_FLAG_D[i] <= 1'b0;   
         CONNECTED_FLAG_D2[i] <= 1'b0;   
      end else begin
         CONNECTED_FLAG_D[i] <= CONNECTED_FLAG[i];   
         CONNECTED_FLAG_D2[i] <= CONNECTED_FLAG_D[i];   
         AVAILABLE_BUF_SPACE[i] <= RX_TCP_ACK_NO_D[(i*32)+: (ADDR_WIDTH + 3)] + ~WPTR[i][ADDR_WIDTH + 2:0];   
      end
   end
   // input flow control
   // no point in asking for data when there is no TCP connection and data is being discarded.  
   // allow more tx data in if there is room for at least 512 bytes/64 words
   assign APP_CTS_local[i] = CONNECTED_FLAG[i] == 1'b 0 ? 1'b 0 : ((AVAILABLE_BUF_SPACE[i][ADDR_WIDTH + 2:9] != 0) ? 1'b 1 : 1'b 0); 
end
endgenerate

assign APP_CTS = APP_CTS_local; 

//  allow more tx data in if there is room for at least 128 bytes


// // TCP TX FLOW CONTROL  ---------------------------
//  The basic tx flow control rule is that the buffer WPTR must never pass the last acknowledged tx byte location.

// --// TEST POINTS --------------------------------
// TP(1) <= WPTR(0)(0);
// TP(2) <= RPTR(0)(0);
// TP(3) <= CONNECTED_FLAG(0);
// TP(4) <= '1' when (TCP_TX_STATE(0) = 0) else '0';
// TP(5) <= '1' when (RX_TCP_ACK_NO_D(0(ADDR_WIDTH-1 downto 0) = TX_SEQ_NO(0)(ADDR_WIDTH-1 downto 0)) else '0';
// TP(6) <= '1' when (RX_TCP_ACK_NO_D(I)(ADDR_WIDTH-1 downto 0) = TX_SEQ_NO_IN(0)(ADDR_WIDTH-1 downto 0)) else '0';
// TP(7) <= TX_SEQ_NO(0)(0);
// TP(8) <= RX_TCP_ACK_NO_D(0)(0);
// TP(9) <= SAMPLE3_CLK(0);
// TP(10) <= TX_SEQ_NO_IN(0)(0);
assign TP[1] = WEA[0]; 
assign TP[2] = TCP_TX_STATE[0] == 1 ? 1'b 1 : 1'b 0; 
assign TP[3] = TCP_TX_STATE[0] == 3 ? 1'b 1 : 1'b 0; 
assign TP[10:4] = {7{1'b 0}}; 

endmodule // module TCP_TXBUF_10G

