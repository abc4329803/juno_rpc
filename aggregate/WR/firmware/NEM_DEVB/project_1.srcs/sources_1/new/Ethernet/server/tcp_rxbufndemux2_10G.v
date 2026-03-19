/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_rxbufndemux2_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_rxbufndemux2_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:33:00 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules



// -----------------------------------------------------------
//  MSS copyright 2019-2021
//  Filename:  TCP_RXBUFNDEMUX2_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 3b
//  Date last modified: 3/13/21 AZ
//  Inheritance: COM-5402SOFT TCP_RXBUFNDEMUX2.VHD rev2 12/8/15
// 
//  description:  This component has two objectives:
//  (1) tentatively hold a received TCP frame on the fly until its validity is confirmed at the end of frame.
//  Discard if invalid or further process if valid.
//  (2) demultiplex multiple TCP streams, based on the destination port number
//  10G version. Portable.
// 
//  Because of the TCP protocol, data can only be validated at the end of a packet.
//  So the buffer management has to be able to backtrack, discard previous data and 
//  reposition pointer. 
// 
//  The overall buffer size (which affects overall throughput) is user selected in the generic section.
//  This component is written of a single TCP stream.
// 
//  This component is written for NTCPSTREAMS TCP tx streams. Adjust as needed in the com5402pkg package.
//  
//  Note: This component should work in all application case, at the expense of many block RAM. 
//  Use the more efficient TCP_RXBUFNDEMUX only when the application is reading data faster than the data source
//  and when RAMBs are at a premium.
// 
//  Rev1 4/25/19 AZ
//  Corrected bug regarding RX_APP_DATA_VALID
//  Corrected sensitivity lists
//  Corrected bug regarding BUF_SIZE. 
// 
//  Rev2 12/13/20 AZ
//  Corrected issue about word alignment
// 
//  Rev3 1/15/21 AZ
//  Increased RX_FREE_SPACE to 32-bit in preparation for window scaling.
// 
//  Rev 3b 3/13/21 AZ
//  Improved resilience to bad CRC frame
// 
//  Minimum period: 4.537ns (Maximum Frequency: 220.410MHz)
//  FF: 386
//  LUT: 583
//  BRAM: 4
// -------------------------------------------------------------

module TCP_RXBUFNDEMUX2_10G #(
		parameter NTCPSTREAMS = 1, 
			// number of concurrent TCP streams handled by this component
		parameter ADDR_WIDTH = 11
			// size of the dual-port RAM buffers instantiated within for each stream = 64b * 2^ADDR_WIDTH
			// Trade-off buffer depth and overall TCP throughput.
			// Recommended value for 10GbE: at least 11 
)(

		// CLK, RESET
		input   SYNC_RESET,
		input   CLK,	// synchronous clock	
			// Must be global clocks. No BUFG instantiation within this component.

		// TCP RX protocol -> RX BUFFER 
		input   [63:0] RX_DATA,
			// TCP payload data field. Each byte validity is in RX_DATA_VALID(I)
			// IMPORTANT: always left aligned (MSB first): RX_DATA_VALID is x80,xc0,xe0,xf0,....x01,x00 
		input   [7:0] RX_DATA_VALID,
			// delineates the TCP payload data field
		input   RX_SOF,
			// 1st word of RX_DATA
			// Read ancillary information at this time:
			// (a) destination RX_STREAM_NO (based on the destination TCP port)
		input   [NTCPSTREAMS - 1:0] RX_TCP_STREAM_SEL,
			// stream number based on the destination TCP port
		input   RX_EOF,
			// 1 CLK pulse indicating that RX_DATA is the last byte in the TCP data field.
			// ALWAYS CHECK RX_FRAME_VALID at the end of packet (RX_EOF = '1') to confirm
			// that the TCP packet is valid. 
			// Note: All packet information stored is tentative until
			// the entire frame is confirmed (RX_EOF = '1') and (RX_FRAME_VALID = '1').
			// MSbs are dropped.
			// If the frame is invalid, the data and ancillary information just received is discarded.
			// Reason: we only knows about bad TCP packets at the end.
		input   RX_FRAME_VALID,
			// verify the entire frame validity at the end of frame (RX_EOF = '1')
		output   reg	[32 * NTCPSTREAMS - 1:0] RX_FREE_SPACE,
			// buffer available space, expressed in bytes. 
			// Beware of delay (as data may be in transit and information is slightly old).
		input   [NTCPSTREAMS - 1:0] RX_BUF_CLR,
			// '1' to clear the elastic buffer (for example after closing the connection)
		
		//// RX BUFFER -> APPLICATION INTERFACE
		// NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
		// Usage: RX_APP_RTS goes high when at least one byte is in the output queue (i.e. not yet visible at the
		// output RX_APP_DATA). The application should then raise RX_APP_CTS for one clock to fetch the next word 2 CLKs later.
		// Note that the next word may be partial (<8 bytes) or full.
		// RX_APP_DATA and RX_APP_DATA_VALID are updated automatically without the application intervention as the 
		// 8-byte output is being filled.
		// Thus, the application may have to check periodically RX_APP_DATA_VALID while waiting for the complete 8 bytes.
		// RX_APP_CTS pulse will cause a move to the next word IF AND ONLY IF the next word has at least one available byte.
		output   reg	[64 * NTCPSTREAMS - 1:0] RX_APP_DATA,
		output   reg	[8 * NTCPSTREAMS - 1:0] RX_APP_DATA_VALID,
		output   [NTCPSTREAMS - 1:0] RX_APP_RTS,
		input    [NTCPSTREAMS - 1:0] RX_APP_CTS,
			// 1 CLK pulse to read the next (partial) word RX_APP_DATA
			// Latency: 2 CLKs to RX_APP_DATA, but only IF AND ONLY IF the next word has at least one available byte.
		output   [NTCPSTREAMS - 1:0] RX_APP_CTS_ACK,
			// '1' the RX_APP_CTS request for new data is accepted:
			// indicating that a new (maybe partial) word will be placed on the output RX_APP_DATA at the next CLK.


		output   reg  [10:1] TP


);

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
(* MARK_DEBUG="true" *)reg     RESETn; 
(* MARK_DEBUG="true" *)reg     [2:0] RESET_CNTR; 

//  freeze ancilliary input data at the SOF
reg     [NTCPSTREAMS - 1:0] RX_TCP_STREAM_SEL_D; 

// //-- ELASTIC BUFFER ---------------------------
reg     [127:0] RX_DATA_SHIFT; 
(* MARK_DEBUG="true" *)reg     [15:0] RX_DATA_VALID1; 
reg     [63:0] RX_DATA_REMAIN; 
reg     [7:0] RX_DATA_REMAIN_VALID; 

// signal FLUSH_RX_DATA_REMAIN: std_logic := '0';
reg     [63:0] RX_DATA_D; 
reg     [7:0] RX_DATA_VALID_D; 
reg     RX_SOF_D; 
reg     RX_EOF_D; 
reg     RX_EOF_D2; 
reg     RX_EOF_D3; 
reg     RX_WORD_VALID_D; 
reg     RX_WORD_VALID_D2; 
reg     RX_FRAME_VALID_D; 
reg     RX_FRAME_VALID_D2; 
reg     [3:0] WPTR_INCREMENT; 
reg     [ADDR_WIDTH + 3:0] WPTRA_E; 
reg     [ADDR_WIDTH + 3:0] WPTRA; 
reg     WPTRAb3_D; 
wire    [ADDR_WIDTH + 3:0] RPTRA; 
(* MARK_DEBUG="true" *)wire    [ADDR_WIDTH - 1:0] ADDRA; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] WEA; 
wire    [63:0] DIA; 
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 3:0] WPTR0 [ADDR_WIDTH + 3:0]; 
reg     [ADDR_WIDTH + 3:0] WPTR_CONFIRMED [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 3:0] WPTR_CONFIRMED_1 [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 3:0] RPTR [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)wire    [ADDR_WIDTH + 3:0] RPTR_MIN [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)wire    [ADDR_WIDTH + 3:0] BUF_SIZE [ADDR_WIDTH + 3:0]; 
(* MARK_DEBUG="true" *)reg     [ADDR_WIDTH + 3:0] BUF_SIZE_D [ADDR_WIDTH + 3:0]; 
wire    [63:0] DOA [63:0]; 
wire    [63:0] DOB [63:0]; 
reg     [NTCPSTREAMS - 1:0] FIRST_APP_DATA; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] RX_APP_RTS_local; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] RX_APP_CTS_ACK_local; 
(* MARK_DEBUG="true" *)reg     [NTCPSTREAMS - 1:0] RX_APP_CTS_ACK_D; 


// attribute MARK_DEBUG : string;
// attribute MARK_DEBUG of TX_MUX_STATE: signal is "TRUE";
// attribute MARK_DEBUG of TX_MUX_STATE: signal is "TRUE";
// attribute MARK_DEBUG of TX_MUX_STATE: signal is "TRUE";
// attribute MARK_DEBUG of TX_MUX_STATE: signal is "TRUE";
// attribute MARK_DEBUG of TX_MUX_STATE: signal is "TRUE";
// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
//  create a local reset (because we want RPTR to be initialized to all '1's among other things
wire    [10:1] TP_wire; 
genvar  i;
integer j;

//  for each received frame, position the write pointer as per the last confirmed pointer position


initial 
   begin : process_39
   RX_APP_CTS_ACK_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_38
   RX_APP_CTS_ACK_local = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_36
   FIRST_APP_DATA = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_33
   {BUF_SIZE_D[14], BUF_SIZE_D[13], BUF_SIZE_D[12], BUF_SIZE_D[11], BUF_SIZE_D[10], BUF_SIZE_D[9], BUF_SIZE_D[8], BUF_SIZE_D[7], BUF_SIZE_D[6], BUF_SIZE_D[5], BUF_SIZE_D[4], BUF_SIZE_D[3], BUF_SIZE_D[2], BUF_SIZE_D[1], BUF_SIZE_D[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

// initial 
//    begin : process_31
//    {RPTR_MIN[14], RPTR_MIN[13], RPTR_MIN[12], RPTR_MIN[11], RPTR_MIN[10], RPTR_MIN[9], RPTR_MIN[8], RPTR_MIN[7], RPTR_MIN[6], RPTR_MIN[5], RPTR_MIN[4], RPTR_MIN[3], RPTR_MIN[2], RPTR_MIN[1], RPTR_MIN[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
//    end

initial 
   begin : process_30
   {RPTR[14], RPTR[13], RPTR[12], RPTR[11], RPTR[10], RPTR[9], RPTR[8], RPTR[7], RPTR[6], RPTR[5], RPTR[4], RPTR[3], RPTR[2], RPTR[1], RPTR[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_29
   {WPTR_CONFIRMED_1[14], WPTR_CONFIRMED_1[13], WPTR_CONFIRMED_1[12], WPTR_CONFIRMED_1[11], WPTR_CONFIRMED_1[10], WPTR_CONFIRMED_1[9], WPTR_CONFIRMED_1[8], WPTR_CONFIRMED_1[7], WPTR_CONFIRMED_1[6], WPTR_CONFIRMED_1[5], WPTR_CONFIRMED_1[4], WPTR_CONFIRMED_1[3], WPTR_CONFIRMED_1[2], WPTR_CONFIRMED_1[1], WPTR_CONFIRMED_1[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_28
   {WPTR_CONFIRMED[14], WPTR_CONFIRMED[13], WPTR_CONFIRMED[12], WPTR_CONFIRMED[11], WPTR_CONFIRMED[10], WPTR_CONFIRMED[9], WPTR_CONFIRMED[8], WPTR_CONFIRMED[7], WPTR_CONFIRMED[6], WPTR_CONFIRMED[5], WPTR_CONFIRMED[4], WPTR_CONFIRMED[3], WPTR_CONFIRMED[2], WPTR_CONFIRMED[1], WPTR_CONFIRMED[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_27
   {WPTR0[14], WPTR0[13], WPTR0[12], WPTR0[11], WPTR0[10], WPTR0[9], WPTR0[8], WPTR0[7], WPTR0[6], WPTR0[5], WPTR0[4], WPTR0[3], WPTR0[2], WPTR0[1], WPTR0[0]} = {(ADDR_WIDTH + 3 - 0 + 1){{(ADDR_WIDTH + 3 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_25
   WEA = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_22
   WPTRAb3_D = 1'b 0;   
   end

initial 
   begin : process_21
   WPTRA = {(ADDR_WIDTH + 3 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_20
   WPTRA_E = {(ADDR_WIDTH + 3 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_19
   WPTR_INCREMENT = 0;   
   end

initial 
   begin : process_18
   RX_FRAME_VALID_D2 = 1'b 0;   
   end

initial 
   begin : process_17
   RX_FRAME_VALID_D = 1'b 0;   
   end

initial 
   begin : process_16
   RX_WORD_VALID_D2 = 1'b 0;   
   end

initial 
   begin : process_15
   RX_WORD_VALID_D = 1'b 0;   
   end

initial 
   begin : process_14
   RX_EOF_D3 = 1'b 0;   
   end

initial 
   begin : process_13
   RX_EOF_D2 = 1'b 0;   
   end

initial 
   begin : process_12
   RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_11
   RX_SOF_D = 1'b 0;   
   end

initial 
   begin : process_10
   RX_DATA_VALID_D = {8{1'b 0}};   
   end

initial 
   begin : process_9
   RX_DATA_D = {64{1'b 0}};   
   end

initial 
   begin : process_8
   RX_DATA_REMAIN_VALID = {8{1'b 0}};   
   end

initial 
   begin : process_7
   RX_DATA_REMAIN = {64{1'b 0}};   
   end

initial 
   begin : process_6
   RX_DATA_VALID1 = {16{1'b 0}};   
   end

initial 
   begin : process_5
   RX_DATA_SHIFT = {128{1'b 0}};   
   end

initial 
   begin : process_4
   RX_TCP_STREAM_SEL_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_3
   RESET_CNTR = {3{1'b 0}};   
   end

initial 
   begin : process_2
   RESETn = 1'b 0;   
   end
////////////////////////////////////////////////////////
//      IMPLEMENTATION
////////////////////////////////////////////////////////
// create a local reset (because we want RPTR to be initialized to all '1's among other things

always @(posedge CLK)
   begin : RESETN_GEN_001
   if (CLK === 1'b 1)
      begin
      if (RESET_CNTR[2] === 1'b 0)
         begin
         RESET_CNTR <= RESET_CNTR + 1;   
         end
      end
   end


always @( RESET_CNTR ) 
RESETn = RESET_CNTR[2]; 

//  freeze ancilliary data at the SOF

always @(posedge CLK) begin : FREEZE_INPUT
   if (RX_SOF === 1'b 1) begin
      RX_TCP_STREAM_SEL_D <= RX_TCP_STREAM_SEL;   
   end
end

//  clean unused input bytes (because of follow-on ORing)
//  Justification: TCP_SERVER_10G does a sloppy job filtering out unnecessary bytes

always @(posedge CLK) begin
      begin
          RX_DATA_VALID_D <= RX_DATA_VALID;   
          RX_SOF_D <= RX_SOF;   
          RX_EOF_D <= RX_EOF;   
          RX_EOF_D2 <= RX_EOF_D;   
          RX_EOF_D3 <= RX_EOF_D2;   
          RX_FRAME_VALID_D <= RX_FRAME_VALID;   
          RX_FRAME_VALID_D2 <= RX_FRAME_VALID_D;   
          RX_WORD_VALID_D <= RX_DATA_VALID[7];   
          RX_WORD_VALID_D2 <= RX_WORD_VALID_D;   
      end
end


for (i = 0; i <= 7; i = i + 1) begin : CLEAN_INPUT
  always @(posedge CLK) begin
     if (RX_DATA_VALID[i] === 1'b 1)
        begin
            RX_DATA_D[8 * i + 7:8 * i] <= RX_DATA[8 * i + 7:8 * i];   
        end
     else
        begin
            RX_DATA_D[8 * i + 7:8 * i] <= 8'h 00;   
        end
   end
end
// //// ELASTIC BUFFER //////////////////////////
//  write pointer management. 

always @(posedge CLK) begin : WPTR_GEN_001
      if (RX_DATA_VALID[0] === 1'b 1) begin
         WPTR_INCREMENT <= 8;   
      end else if (RX_DATA_VALID[1] === 1'b 1 ) begin
         WPTR_INCREMENT <= 7;   
      end else if (RX_DATA_VALID[2] === 1'b 1 ) begin
         WPTR_INCREMENT <= 6;   
      end else if (RX_DATA_VALID[3] === 1'b 1 ) begin
         WPTR_INCREMENT <= 5;   
      end else if (RX_DATA_VALID[4] === 1'b 1 ) begin
         WPTR_INCREMENT <= 4;   
      end else if (RX_DATA_VALID[5] === 1'b 1 ) begin
         WPTR_INCREMENT <= 3;   
      end else if (RX_DATA_VALID[6] === 1'b 1 ) begin
         WPTR_INCREMENT <= 2;   
      end else if (RX_DATA_VALID[7] === 1'b 1 ) begin
         WPTR_INCREMENT <= 1;   
      end else begin
         WPTR_INCREMENT <= 0;   
      end
   end
//  

always @(posedge CLK) begin : WPTR_GEN_002a
      WPTRAb3_D <= WPTRA[3];   
      if (SYNC_RESET === 1'b 1 | RX_EOF_D3 === 1'b 1) begin
         WPTRA_E <= 'b 0;   
         WPTRA <= 'b 0;   
      end else if (RX_SOF === 1'b 1 ) begin
//  for each received frame, position the write pointer as per the last confirmed pointer position
         for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
            if (RX_TCP_STREAM_SEL[j] === 1'b 1) begin
               WPTRA_E <= WPTR_CONFIRMED[j];   
            end
         end
      end else if (RX_WORD_VALID_D === 1'b 1 ) begin
//  about to write at least one payload byte
//  prepare the next address
         WPTRA_E <= WPTRA_E + WPTR_INCREMENT;   
         WPTRA <= WPTRA_E;   
      end else begin
         WPTRA <= WPTRA_E;   
      end
   end

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : WPTR_GEN_X
   always @(posedge CLK) begin
      if (SYNC_RESET === 1'b 1) begin
         WPTR_CONFIRMED[i] <= 'b0;   
         WPTR_CONFIRMED_1[i] <= 'b0;   
      end else if (RX_TCP_STREAM_SEL_D[i] === 1'b 1 ) begin
         if (RX_BUF_CLR[i] === 1'b 1) begin
            WPTR_CONFIRMED[i] <= 'b 0;   
            WPTR_CONFIRMED_1[i] <= 'b 0;   
         end else if (RX_EOF_D2 === 1'b 1 & RX_FRAME_VALID_D2 === 1'b 1 ) begin
               // last frame confirmed valid. Remember the writer position (next location to write to)
            if (WPTRA_E[2:0] !== 3'b 000) begin
               WPTR_CONFIRMED[i] <= {(WPTRA_E[ADDR_WIDTH + 3:3] + 1), 3'b 000};   
            end else begin
               WPTR_CONFIRMED[i] <= WPTRA_E;   
            end
            WPTR_CONFIRMED_1[i] <= WPTRA_E;   
         end
      end
      // keep track if this is the first output data for this session/stream
      // Any output data before that is meaningless.
      if (SYNC_RESET === 1'b 1 | RX_BUF_CLR[i] === 1'b 1) begin
         FIRST_APP_DATA[i] <= 1'b 0;   
      end else if (RX_APP_CTS_ACK_local[i] === 1'b 1 ) begin
         // first output data will appear at the next clock
         FIRST_APP_DATA[i] <= 1'b 1;   
      end
   end
end
endgenerate

// remember the wptr for each stream (we need it to compute free space)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : WPTR_GEN_003
always @(posedge CLK) begin
      if (SYNC_RESET === 1'b 1 | RX_BUF_CLR[i] === 1'b 1)
         begin
         WPTR0[i] <= 'b0;   
         end
      else if (RX_TCP_STREAM_SEL_D[i] === 1'b 1 & RX_WORD_VALID_D === 1'b 1 )
         begin
         WPTR0[i] <= WPTRA_E + WPTR_INCREMENT;   
         end
      end
   end
endgenerate

always @(posedge CLK) begin : SHIFT_RX_DATA_IN_001
      if (RX_SOF === 1'b 1 | RX_EOF_D2 === 1'b 1) begin
         RX_DATA_VALID1 <= {16{1'b 0}};   
         RX_DATA_SHIFT <= {128{1'b 0}};   
      end else if (RX_WORD_VALID_D === 1'b 1 ) begin
      //  at RX_WORD_VALID_D
         case (WPTRA_E[2:0])
         3'b 000:
            begin
            RX_DATA_SHIFT <= {RX_DATA_D, 64'h 0000000000000000};   
            RX_DATA_VALID1 <= {RX_DATA_VALID_D, 8'b 00000000};   
            end
         3'b 001:
            begin
            RX_DATA_SHIFT <= {8'h 00, RX_DATA_D, 56'h 00000000000000};   
            RX_DATA_VALID1 <= {1'b 0, RX_DATA_VALID_D, 7'b 0000000};   
            end
         3'b 010:
            begin
            RX_DATA_SHIFT <= {16'h 0000, RX_DATA_D, 48'h 000000000000};   
            RX_DATA_VALID1 <= {2'b 00, RX_DATA_VALID_D, 6'b 000000};   
            end
         3'b 011:
            begin
            RX_DATA_SHIFT <= {24'h 000000, RX_DATA_D, 40'h 0000000000};   
            RX_DATA_VALID1 <= {3'b 000, RX_DATA_VALID_D, 5'b 00000};   
            end
         3'b 100:
            begin
            RX_DATA_SHIFT <= {32'h 00000000, RX_DATA_D, 32'h 00000000};   
            RX_DATA_VALID1 <= {4'b 0000, RX_DATA_VALID_D, 4'b 0000};   
            end
         3'b 101:
            begin
            RX_DATA_SHIFT <= {40'h 0000000000, RX_DATA_D, 24'h 000000};   
            RX_DATA_VALID1 <= {5'b 00000, RX_DATA_VALID_D, 3'b 000};   
            end
         3'b 110:
            begin
            RX_DATA_SHIFT <= {48'h 000000000000, RX_DATA_D, 16'h 0000};   
            RX_DATA_VALID1 <= {6'b 000000, RX_DATA_VALID_D, 2'b 00};   
            end
         default:
            begin
            RX_DATA_SHIFT <= {56'h 00000000000000, RX_DATA_D, 8'h 00};   
            RX_DATA_VALID1 <= {7'b 0000000, RX_DATA_VALID_D, 1'b 0};   
            end
         endcase
         end
//  At the start of frame, we need to re-initialize RX_DATA_REMAIN as two successive frames
//  may target different streams
//  This is to avoid storing RX_DATA_REMAIN for each stream
      if (RX_EOF_D3 === 1'b 1) begin
//  cleaner
         RX_DATA_REMAIN <= {64{1'b 0}};   
      end else if (RX_SOF_D === 1'b 1 ) begin
//  *121320, *031321
         if (WPTRA_E[2:0] !== 3'b 000) begin
//  read previous remainder if it exists
            for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
               if (RX_TCP_STREAM_SEL_D[j] === 1'b 1) begin
                  RX_DATA_REMAIN <= DOA[j];   
               end
            end
//  reset RX_DATA_REMAIN as it may have been not have been if previous frame was corrupted (bad CRC for instance). G.M. email 031121
         end else begin
            RX_DATA_REMAIN <= {64{1'b 0}};   
         end
      end else if (RX_WORD_VALID_D2 === 1'b 1 & RX_DATA_VALID1[8] === 1'b 1 ) begin
//  writing complete word to memory. shift remaining bytes to the left
         RX_DATA_REMAIN <= RX_DATA_SHIFT[63:0];   
         RX_DATA_REMAIN_VALID <= RX_DATA_VALID1[7:0];   
      end else if (RX_WORD_VALID_D2 === 1'b 1 & RX_DATA_VALID1[8] === 1'b 0 ) begin
//  not enough new bytes to fill a 8-byte word and write to memory. No shift
         RX_DATA_REMAIN <= DIA[63:0];   
         RX_DATA_REMAIN_VALID <= RX_DATA_VALID1[15:8];   
      end else begin
         RX_DATA_REMAIN_VALID <= {8{1'b 0}};   
      end
   end

//  create new hybrid word to write to memory

assign DIA = RX_DATA_REMAIN | RX_DATA_SHIFT[127:64]; 

//  Need to flush the last few bytes in RX_DATA_REMAIN 
// FLUSH_001: process(CLK)
// begin
//     if rising_edge(CLK) then
//          if(RX_EOF_D2 = '1') and (RX_DATA_VALID1(15) = '1') then
//             FLUSH_RX_DATA_REMAIN <= '1';
//          else
//             FLUSH_RX_DATA_REMAIN <= '0';
//          end if;
//    end if;
// end process;

//  select which RAMBlock to write to.
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : WEA_GENx
   always @(RX_TCP_STREAM_SEL_D or RX_EOF_D3 or RX_DATA_REMAIN_VALID or WPTRA or WPTRAb3_D or RX_WORD_VALID_D2) begin

      if (RX_TCP_STREAM_SEL_D[i] === 1'b 1) begin
         if (RX_EOF_D3 === 1'b 1 & RX_DATA_REMAIN_VALID !== 8'h 00 & WPTRA[3] !== WPTRAb3_D) begin
      //  Write flush remainder at RX_EOF_D3, when remainder is not empty and spills over the next 64-bit word
            WEA[i] <= 1'b 1;   
         end else if (RX_WORD_VALID_D2 === 1'b 1 ) begin
      //  Write partial or full word. 
            WEA[i] <= 1'b 1;   
         end else begin
            WEA[i] <= 1'b 0;   
         end
      end else begin
         WEA[i] <= 1'b 0;   
      end
   end
end
endgenerate

//  read the last (partial) word at the SOF, before writing the frame first (partial) word.
reg   [ADDR_WIDTH+3 : 0]   RPTRAv;

always@(*)
begin
  RPTRAv <= 'h0;
  for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1)
  begin
      if(RX_TCP_STREAM_SEL[j] == 1)
         RPTRAv <= WPTR_CONFIRMED[j];
  end              
end
   assign RPTRA = RPTRAv;
   assign ADDRA = RX_SOF ? RPTRA[ADDR_WIDTH + 2:3] : WPTRA[ADDR_WIDTH + 2:3]; 

// Latency 1 CLK from ADDRx to DOx
generate
for(i = 0; i <= NTCPSTREAMS-1; i = i + 1) begin: BRAM_DP2_X
    bram_dp2 #(
              .DATA_WIDTHA (64),
              .ADDR_WIDTHA (ADDR_WIDTH),
              .DATA_WIDTHB (64),
              .ADDR_WIDTHB (ADDR_WIDTH)
    ) BRAM_DP2_X_0 (
              .CSA(1'b 1),
              .CLKA(CLK),
              .WEA(WEA[i]),  // Port A Write Enable Input
              .OEA(1'b 1),
              .ADDRA(ADDRA), // Port A  Address Input
              .DIA(DIA),     // Port A Data Input
              .DOA(DOA[i]),
              .CSB(1'b 1),
              .CLKB(CLK),
              .WEB(1'b 0),
              .OEB(1'b 1),
              .ADDRB(RPTR[i][ADDR_WIDTH + 2:3]), // Port B Address Input
              .DIB('b0),    // Port B Data Input
              .DOB(DOB[i]));     // Port B Data Output
end
endgenerate

// How many bytes are waiting to be read? 
// BUF_SIZE can be slightly negative when waiting for a few more bytes to complete a word
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : RX_BUFFER_SIZE_GENx
   assign BUF_SIZE[i] = WPTR_CONFIRMED_1[i] + ~RPTR[i];  // WPTR_CONFIRMED(I) + (not RPTR(I));
   // tell the application when data is available to read
   assign RX_APP_RTS_local[i] = ((BUF_SIZE[i] === 0) | (BUF_SIZE[i][ADDR_WIDTH + 3] === 1'b 1) | (RESETn === 1'b 0)) ? 1'b 0 : 1'b 1; 
end
endgenerate
assign RX_APP_RTS = RX_APP_RTS_local; 

// read pointer management
// Rule #1: RPTR points to the next memory location to be read (Units: words)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : RPTR_GENx
   always @(posedge CLK) begin
      BUF_SIZE_D[i] <= BUF_SIZE[i];   
      RX_APP_CTS_ACK_D[i] <= RX_APP_CTS_ACK_local[i];   
      if (SYNC_RESET === 1'b 1 | RESETn === 1'b 0 | RX_BUF_CLR[i] === 1'b 1) begin
         RPTR[i] <= {(ADDR_WIDTH + 3 - 0 + 1){1'b 1}};   
         RX_APP_CTS_ACK_local[i] <= 1'b 0;   
      end else if (RX_APP_RTS_local[i] === 1'b 0 ) begin
         // current output word DOB is not full (when BUF_SIZE is slightly negative). Do not increment the read pointer.
         RX_APP_CTS_ACK_local[i] <= 1'b 0;   
      end else if (BUF_SIZE[i] !== 0 & RX_APP_CTS[i] === 1'b 1 ) begin
         // At least one byte is available to read in memory
         // and the application is ready to accept it. Read one (full or partial) word.            
         RPTR[i] <= RPTR[i] + 8;   
         RX_APP_CTS_ACK_local[i] <= 1'b 1;   
      end else begin
         RX_APP_CTS_ACK_local[i] <= 1'b 0;   
      end
   end
   // design note: RPTR(I) is always ending in 111. As we do not know exactly how many bytes are
   // read by the application, RPTR(I) should be considered as a range spanning 8 bytes. 
   // For example 3FFF really means 3FF8-3FFF.
   // This is an important consideration in computing the available free space.
      assign RPTR_MIN[i] = {RPTR[i][ADDR_WIDTH + 3:3], 3'b 000}; 
   end
endgenerate

assign RX_APP_CTS_ACK = RX_APP_CTS_ACK_local; 

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : OUTPUT_GEN
   always @(*) begin
   
      RX_APP_DATA[(i*64)+:64] <= DOB[i];   
      if (FIRST_APP_DATA[i] === 1'b 0) begin
      //  nothing to read
         RX_APP_DATA_VALID[(i*8)+:8] <= 8'h 00;   
      end else if (BUF_SIZE_D[i][ADDR_WIDTH + 3] === 1'b 1 & BUF_SIZE[i][ADDR_WIDTH + 3] === 1'b 0 ) begin
      //  previously partial word is now filled
         RX_APP_DATA_VALID[(i*8)+:8] <= 8'h 00;   
      end else if (BUF_SIZE_D[i][ADDR_WIDTH + 3] === 1'b 0 & RX_APP_CTS_ACK_D[i] === 1'b 1 ) begin
      //  new full word
         RX_APP_DATA_VALID[(i*8)+:8] <= 8'h FF;   
      end else if (BUF_SIZE_D[i][ADDR_WIDTH + 3] === 1'b 1 & RX_APP_CTS_ACK_D[i] === 1'b 1 ) begin
      //  reading last word in buffer, 1-8 bytes
         case (BUF_SIZE_D[i][2:0])
         3'b 001:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h 80;   
            end
         3'b 010:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h C0;   
            end
         3'b 011:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h E0;   
            end
         3'b 100:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h F0;   
            end
         3'b 101:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h F8;   
            end
         3'b 110:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h FC;   
            end
         3'b 111:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h FE;   
            end
         default:
            begin
            RX_APP_DATA_VALID[(i*8)+:8] <= 8'h 00;   
            end
         endcase
      end else begin
         RX_APP_DATA_VALID[(i*8)+:8] <= 8'h 00;   
      end
   end
end
endgenerate

//  report the worst case available space to the TCP engine (including space currently occupied by invalid frames)

generate
for ( i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin : FREE_SPACE_GEN_001
   always @(posedge CLK) begin
         RX_FREE_SPACE[(i*32)+:ADDR_WIDTH + 3] <= RPTR_MIN[i][ADDR_WIDTH + 2:0] - WPTR0[i][ADDR_WIDTH + 2:0];   
   end
end
endgenerate

// test points
always @(posedge CLK)
   begin : TPs
   if (CLK === 1'b 1)
      begin
      TP[1] <= WEA[0];   
      if (WEA[0] === 1'b 1)
         begin
         if (DIA === 64'h 7bd4008003000001)
            begin
            TP[2] <= 1'b 1;   
            end
         else
            begin
            TP[2] <= 1'b 0;   
            end
         if (DIA === 64'h 0203040506070809)
            begin
            TP[3] <= 1'b 1;   
            end
         else
            begin
            TP[3] <= 1'b 0;   
            end
         if (DIA === 64'h 0a0b0c0d0e0f0000)
            begin
            TP[4] <= 1'b 1;   
            end
         else
            begin
            TP[4] <= 1'b 0;   
            end
         end
      if (WPTRA[2:0] === 3'b 000)
         begin
         TP[5] <= 1'b 1;   
         end
      else
         begin
         TP[5] <= 1'b 0;   
         end
      if (RPTR[0][2:0] === 3'b 111)
         begin
         TP[6] <= 1'b 1;   
         end
      else
         begin
         TP[6] <= 1'b 0;   
         end
      end
   end

assign TP_wire[10:7] = {4{1'b 0}}; 

always @(TP_wire[10:7])
   begin : process_1
   TP[10:7] <= TP_wire[10:7];   
   end

endmodule // module TCP_RXBUFNDEMUX2_10G

