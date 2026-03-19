/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_server_10G.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\server\tcp_server_10G.vhd -ncc -ip
-- Date Created: Mon Nov 28 08:42:43 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2018-2021
//  Filename:  TCP_SERVER_10G.VHD
//  Author: Alain Zarembowitch / MSS
//  Version: 0.7
//  Date last modified: 3/5/21
//  Inheritance:  COM-5402SOFT TCP_SERVER.VHD rev13 12/3/16
// 
//  description:  TCP protocol for a server. 10Gbits/s version. Tx and Rx. 
//  Server awaits connection from a client. Once the connection is established, bi-directional
//  data transmission can take place. 
//  One instantiation per port. 
//  This component is mainly a state machine. It avoids storing any packet data to keep size to its minimum.
//  Consequently, the rx data recipient should be able to backtrack and throw out the received packet if
//  proven invalid at the end. 
//  Likewise, the tx data source should be able to rewind and re-transmit previous data if the TCP client 
//  requests is.
//  Since this is a server, we do not know a priori whether the protocol is IPv4 or IPv6 (it depends on the client).
//  So each server is given two IP addresses, one for each IP version.
// 
//  Device utilization (NTCPSTREAMS=1, MSS=1460, IPv6_ENABLED='1')
//  FF: 1134
//  LUT: 1536
//  DSP48: 0
//  18Kb BRAM: 0
//  BUFG: 1
//  Minimum period: 4.096ns (Maximum Frequency: 244.126MHz)  Artix7-100T -1 speed grade
// 
//  Rev 0.1 12/8/18 
//  Harmonizing with COM-5402SOFT/TCP_SERVER.VHD
// 
//  Rev 0.2 4/24/19 AZ
//  Corrected bug with (late) retransmission when a missing or delayed ACK is detected.
//  Increased retransmit timeout value (x2)
// 
//  Rev 0.3 6/10/19 AZ
//  Set a min of 1second for the retransmission timeout as per RFC
// 
//  Rev 0.4 1/20/20 AZ
//  Eliminated instability in the ack/retransmission feedback loop
//  Reduce latency for receiving the first full tx frame to < 90us starting at client connection request (don't wait for the first client ACK)
// 
//  Rev 0.5 12/2/20 AZ
//  Corrected bug: bad TX_ACK_NO/TX_ACK_WINDOW_LENGTH reporting when multiple connections
//  Changes as per DCC for NASA
// 
//  Rev 0.6 1/18/21 AZ
//  Increased RX_FREE_SPACE, TX_SEQ_NO, RX_TCP_ACK_NO_D, EFF_RX_WINDOW_SIZE_PARTIAL to 32-bit in preparation for window scaling.
//  Added window scaling
// 
//  Rev 0.7 3/5/21 AZ
//  Corrected bug affecting window size in ack: TX_ACK_WINDOW_LENGTH
// -------------------------------------------------------------

module TCP_SERVER_10G #(
      parameter NTCPSTREAMS = 1,
         // number of concurrent TCP streams handled by this component
      parameter MSS = 1460,
         // The Maximum Segment Size (MSS) is the largest segment of TCP data that can be transmitted.
         // Fixed as the Ethernet MTU (Maximum Transmission Unit) of 1500-9000 bytes - 40(IPv4) or -60(IPv6) overhead bytes 
      parameter TCP_MAX_WINDOW_SIZE = 15,
         // maximum Window size is expressed as 2**n Bytes. Thus a value of 15 indicates a window size of 32KB.
         // used by TCP_SERVER to negotiate if the TCP window scaling option is warranted.
      parameter WINDOW_SCALING_ENABLED = 1'b0,
         // enable/disable window scaling option
      parameter TCP_KEEPALIVE_PERIOD = 60,
         // period in seconds for sending a keep-alive frame after no data and no ack is received. 
         // "Typically TCP Keepalives are sent every 45 or 60 seconds on an idle TCP connection, and the connection is 
         // dropped after 3 sequential ACKs are missed" 
      parameter IPv6_ENABLED = 1'b0,
         // 0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)
      parameter SIMULATION = 1'b 0
         // 1 during simulation. for example to fix the tx_seq_no so that it matches the Wireshark 
         // captures. 
)(
      // CLK, RESET, TIME
      input   CLK,
         // Must be a global clock. No BUFG instantiation within this component.
      input   SYNC_RESET,

      input   TICK_4US,
      input   TICK_100MS,
         // 1 CLK-wide pulse every 4us and 10ms

      //// Configuration Fields
      input   [47:0] MAC_ADDR,
         // MAC address. Unique for each network interface card.
         // Natural byte order: (MSB) 0x000102030405 (LSB) 
         // as transmitted in the Ethernet packet.
      input   [16 * NTCPSTREAMS - 1:0] TCP_LOCAL_PORTS,
         // TCP_SERVER port configuration. Each one of the NTCPSTREAMS streams handled by this
         // component must be configured with a distinct port number. 
         // This value is used as destination port number to filter incoming packets, 
         // and as source port number in outgoing packets.

      //// User-initiated connection reset for stream I
      input   [NTCPSTREAMS - 1:0] CONNECTION_RESET,
      input   [NTCPSTREAMS - 1:0] TCP_KEEPALIVE_EN,
         // enable TCP Keepalive (1) or not (0)

      //// RECEIVED IP PAYLOAD   ////////////////////////////////////////////
      // Excludes MAC layer header, IP header.
      input   [63:0] IP_PAYLOAD_DATA,
      input   [7:0] IP_PAYLOAD_DATA_VALID,
      input   IP_PAYLOAD_SOF,
      input   IP_PAYLOAD_EOF, 
      input   [10:0] IP_PAYLOAD_WORD_COUNT,

      //// Partial checks (done in PACKET_PARSING common code)
        //// basic IP validity check
      input   IP_RX_FRAME_VALID,
         // As the IP frame validity is checked on-the-fly, the user should always check if 
            // the IP_RX_FRAME_VALID is high AT THE END of the IP payload frame (IP_PAYLOAD_EOF) to confirm that the 
            // ENTIRE IP frame is valid. 
            // IP frame validity checks include: 
            // (a) protocol is IP
            // (b) unicast or multicast destination IP address matches
            // (c) correct IP header checksum (IPv4 only)
            // (d) allowed IPv6
            // (e) Ethernet frame is valid (correct FCS, dest address)
            // Ready at IP_PAYLOAD_EOF 

      //// IP type, already parsed in PACKET_PARSING (shared code)
      input   RX_IPv4_6n,
         // IP version. 4 or 6
      input   [7:0] RX_IP_PROTOCOL,
         // read between RX_IP_PROTOCOL_RDY (inclusive)(i.e. before IP_PAYLOAD_SOF) and IP_PAYLOAD_EOF (inclusive)
         // This component responds to protocol 6 = TCP 
     input   RX_IP_PROTOCOL_RDY,
         // 1 CLK wide pulse. 
         
      //// Packet origin, already parsed in PACKET_PARSING (shared code)
      input   [47:0] RX_SOURCE_MAC_ADDR,
      input   [127:0] RX_SOURCE_IP_ADDR, 

      //// TCP attributes, already parsed in PACKET_PARSING (shared code)
      // BEWARE!!!!!!!! WE ALSO RECEIVE PACKETS NOT DESTINED FOR THIS SESSION (NOT FOR  THIS PORT)
      // IT IS THE IMPLEMENTATION'S RESPONSIBILITY TO DISCARD DATA NOT DESTINED FOR THIS TCP PORT.
     input   VALID_TCP_CHECKSUM,
              // '1' when valid TCP checksum(including pseudo-header). Read at IP_RX_EOF_D2 = IP_PAYLOAD_EOF_D
         
      //// RX TCP PAYLOAD -> EXTERNAL RX BUFFER 
      // Latency: 1 CLK after the received IP payload frame.
      output  reg [63:0] RX_DATA,
         // TCP payload data field. Each byte validity is in RX_DATA_VALID(I)
         // IMPORTANT: always left aligned (MSB first): RX_DATA_VALID is x80,xc0,xe0,xf0,....x01,x00 
      output  [7:0] RX_DATA_VALID,
         // delineates the TCP payload data field
      output   RX_SOF,
         // 1 CLK pulse indicating that RX_DATA is the first byte in the TCP data field.
      output  reg [NTCPSTREAMS - 1:0] RX_TCP_STREAM_SEL_OUT,
         // output port based on the destination TCP port
      output   RX_EOF,
         // 1 CLK pulse indicating that RX_DATA is the last byte in the TCP data field.
         // ALWAYS CHECK RX_FRAME_VALID at the end of packet (RX_EOF = '1') to confirm
         // that the TCP packet is valid. External buffer may have to backtrack to the the last
         // valid pointer to discard an invalid TCP packet.
         // Reason: we only knows about bad TCP packets at the end.
      output   RX_FRAME_VALID,
         // verify the entire frame validity at the end of frame (RX_EOF = '1')
      input   [32 * NTCPSTREAMS - 1:0] RX_FREE_SPACE,
         // External buffer available space, expressed in bytes. 
         // Information is updated upon receiving the EOF of a valid rx frame.
         // The real-time available space is always larger

      //// OUTPUTS to TX PACKET ASSEMBLY (via TCP_TX.vhd component)
      output   TX_PACKET_SEQUENCE_START_OUT,
         // 1 CLK pulse to trigger packet transmission. The decision to transmit is taken by TCP_SERVER.
         // From this trigger pulse to the end of frame, this component assembles and send data bytes
         // like clockwork. 
         // Note that the payload data has to be ready at exactly the right time to be appended.
         
      // These variables are read only at the start of packet, when TX_PACKET_SEQUENCE_START_OUT = '1'
      // They can change from packet to packet (internal code is memoryless).
      output   reg  [47:0] TX_DEST_MAC_ADDR_OUT,
      output   reg  [127:0]TX_DEST_IP_ADDR_OUT, 
      output   reg  [15:0] TX_DEST_PORT_NO_OUT,
      output   reg  [15:0] TX_SOURCE_PORT_NO_OUT, 
      output   reg         TX_IPv4_6n_OUT,
      output   reg  [31:0] TX_SEQ_NO_OUT,
      output   reg  [31:0] TX_ACK_NO_OUT, 
      output        [15:0] TX_ACK_WINDOW_LENGTH_OUT,
      output   reg  [7:0]  TX_FLAGS_OUT,
      output        [1:0]  TX_PACKET_TYPE_OUT,
         // 0 = undefined
         // 1 = SYN, no data, 24-byte header
         // 2 = ACK, no data, 20-byte header
         // 3 = payload data, 20-byte header
      output   reg  [3:0]  TX_WINDOW_SCALE_OUT,
         // client-server negotiated window scaling

//    //// TX TCP layer -> Transmit MAC Interface
      input   MAC_TX_EOF,  // need to know when packet tx is complete   
      output  RTS,
         // '1' when a frame is ready to be sent (tell the COM5402 arbiter)
         // When the MAC starts reading the output buffer, it is expected that it will be
         // read until empty.

      //// EXTERNAL TX BUFFER <-> TX TCP layer
      // upon receiving an ACK from the client, send rx window information to TXBUF for computing 
      // the next packet size, boundaries, etc.
      // Partial computation (rx window size + RX_TCP_ACK_NO).
      output   [31:0] EFF_RX_WINDOW_SIZE_PARTIAL,
         // Explanation: EFF_RX_WINDOW_SIZE_PARTIAL represents the maximum TX_SEQ_NO acceptable for the 
         // TCP client (beyond which the rx buffers would be overflowing)
      output   reg  [NTCPSTREAMS - 1:0] EFF_RX_WINDOW_SIZE_PARTIAL_STREAM,
      output   EFF_RX_WINDOW_SIZE_PARTIAL_VALID, // 1 CLK-wide pulse to indicate that the above information is valid
      // Let the TXBUF know where the next byte to be transmitted is located
      // computing the next frame size, boundaries, etc
      output   [32 * NTCPSTREAMS - 1:0] TX_SEQ_NO,
      output   [NTCPSTREAMS - 1:0] TX_SEQ_NO_JUMP, 
            // TX_SEQ_NO progresses regularly as new bytes are being transmitted, except when TX_SEQ_NO_JUMP(I) = '1'
      output   [32 * NTCPSTREAMS - 1:0] RX_TCP_ACK_NO_D,
         // last acknowledged tx byte location


      output   [NTCPSTREAMS - 1:0] CONNECTED_FLAG,
         // '1' when TCP-IP connection is in the 'connected' state, 0 otherwise
         // Main use: TXBUF should not store tx data until a connection is established

      input   [NTCPSTREAMS - 1:0] TX_STREAM_SEL,
         // valid only when TX_PAYLOAD_RTS = '1', ignore otherwise
      input   TX_PAYLOAD_RTS,
         // '1' when at least one stream has payload data available for transmission.
      input   [15:0] TX_PAYLOAD_SIZE,
      
   
      
      
      // Test Points
      output  reg    [10:1] TP
);

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
//  Suffix _D indicates a one CLK delayed version of the net with the same name
//  Suffix _E indicates a one CLK early version of the net with the same name
//  Suffix _X indicates an extended precision version of the net with the same name
//  Suffix _N indicates an inverted version of the net with the same name
// type std_logic_vector((2 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of std_logic_vector(1 downto 0);
// type std_logic_vector((4 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of std_logic_vector(3 downto 0);
// type std_logic_vector((16 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of std_logic_vector(15 downto 0);
// type std_logic_vector((2 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of unsigned(1 downto 0);
// type std_logic_vector((8 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of unsigned(7 downto 0);
// type std_logic_vector((32 * NTCPSTREAMS - 1) downto 0) is array (integer range 0 to (NTCPSTREAMS-1)) of unsigned(31 downto 0);
// //==== COMMON ============================
reg     [3:0] TICK_CNTR; 
reg     TICK_1S; 

// //==== NON-VOLATILE PORT-SPECIFIC DATA ============
//  (to be saved after a packet ends) 
//  state machine
reg     [31:0] TCP_STATE [31:0]; 
//  (i.e. 4-bits)
reg     [8 * NTCPSTREAMS - 1:0] TIMER1; 
//  timer range 0 - 25.5s
wire    [NTCPSTREAMS - 1:0] CONNECTED_FLAG_local; 

//  keep-alive timer
reg     [8 * NTCPSTREAMS - 1:0] TIMER2; 
//  timer range 0 - 255s
reg     [8 * NTCPSTREAMS - 1:0] TIMER2_D; 
//  timer range 0 - 255s
reg     [2 * NTCPSTREAMS - 1:0] KASTATE; 
//  keep alive state

//  zero-window probe timer
reg     [NTCPSTREAMS - 1:0] ZWS; 
reg     [8 * NTCPSTREAMS - 1:0] TIMER3; 
//  timer range 0 - 25.5s
parameter ZERO_WINDOW_PROBE_PERIOD = 3; 
//  first interval to send zero-window probe (in 100ms units)
reg     [4 * NTCPSTREAMS - 1:0] ZWP_STATE; 
//  zero-window probe state
wire     [NTCPSTREAMS - 1:0] ZWP_TRIGGER; 

//  relevant transmit destination information
reg     [47:0] TX_DEST_MAC_ADDR [47:0]; 
reg     [127:0] TX_DEST_IP_ADDR [127:0]; 
reg     [16 * NTCPSTREAMS - 1:0] TX_DEST_PORT_NO; 

//  tx sequence numbers
reg     [31:0] TX_SEQ_NO_INIT; 
(* MARK_DEBUG="true" *)reg     [32 * NTCPSTREAMS - 1:0] TX_ACK_NO; 
(* MARK_DEBUG="true" *)reg     [31:0] TX_ACK_NO2; 
reg     [32 * NTCPSTREAMS - 1:0] TX_SEQ_NO_local; 
reg     [32 * NTCPSTREAMS - 1:0] TX_SEQ_NO_OUT_local; 
reg     [32 * NTCPSTREAMS - 1:0] FAST_REXMIT_SEQ_NO_START; 
reg     [32 * NTCPSTREAMS - 1:0] FAST_REXMIT_SEQ_NO_END; 

//  received sequence number
reg     [32 * NTCPSTREAMS - 1:0] RX_TCP_ACK_NO_D_local; 
(* MARK_DEBUG="true" *)reg     [32 * NTCPSTREAMS - 1:0] RX_TCP_SEQ_NO_MAX; 
(* MARK_DEBUG="true" *)reg     [32 * NTCPSTREAMS - 1:0] RX_TCP_SEQ_NO_MIN; 
(* MARK_DEBUG="true" *)wire    [31:0] RX_TCP_SEQ_NO_MAX2; 
(* MARK_DEBUG="true" *)wire    [31:0] RX_TCP_SEQ_NO_MIN2; 
reg     [NTCPSTREAMS - 1:0] TX_IPv4_6n; 
reg     [2 * NTCPSTREAMS - 1:0] TX_PACKET_TYPE_QUEUED; 
reg     [1:0] TX_PACKET_TYPE; 
reg     [8 * NTCPSTREAMS - 1:0] TX_FLAGS; 

// //=== VARIABLES WITH A 1 PACKET LIFESPAN ============
(* MARK_DEBUG="true" *)wire    IP_PAYLOAD_WORD_VALID; 

// -- PARSE TCP HEADER     ------------------
reg     [15:0] RX_SOURCE_TCP_PORT_NO; 
reg     [15:0] RX_DEST_TCP_PORT_NO; 
(* MARK_DEBUG="true" *)reg     [31:0] RX_TCP_SEQ_NO; 
reg     [31:0] RX_TCP_ACK_NO; 
(* MARK_DEBUG="true" *)reg     [3:0] RX_TCP_DATA_OFFSET; 
wire    [3:0] RX_TCP_DATA_OFFSET_INC; 
wire    [3:0] RX_TCP_DATA_OFFSET_DIV2_INC; 
reg     [7:0] RX_TCP_FLAGS; 
reg     [15:0] RX_TCP_WINDOW_SIZE_SCALED; 
reg     [31:0] RX_TCP_WINDOW_SIZE; 
wire    TCP_RXOPTIONS_RESET; 
wire    [15:0] TCP_OPTION_MSS; 
wire    [3:0] TCP_OPTION_WINDOW_SCALE; 
wire    TCP_OPTION_WINDOW_SCALE_VALID; 
wire    TCP_OPTION_SACK_PERMITTED; 

// -- TCP stream identification ------------------
wire    [NTCPSTREAMS - 1:0] RX_TCP_STREAM_SEL; 
reg     [NTCPSTREAMS - 1:0] RX_TCP_STREAM_SEL_D; 
reg     IP_PAYLOAD_EOF_D; 
(* MARK_DEBUG="true" *)reg     VALID_RX_TCP0; 
(* MARK_DEBUG="true" *)wire    VALID_RX_TCP_ALL; 

// // COPY RX TCP DATA TO BUFFER 
(* MARK_DEBUG="true" *)wire    TCP_PAYLOAD_FLAG; 
(* MARK_DEBUG="true" *)reg     TCP_SOF_FLAG; 
reg     RX_TCP_NON_ZERO_DATA_LENGTH; 
reg     IP_PAYLOAD_SOF_D; 
reg     IP_PAYLOAD_SOF_D2; 
(* MARK_DEBUG="true" *)reg     [7:0] RX_DATA_VALID_local; 
reg     RX_SOF_local; 
reg     RX_EOF_local; 
reg     RX_EOF_D; 
reg     RX_FRAME_VALID_local; 

// // RX SEQUENCE NUMBER 
wire    [31:0] RX_TCP_SEQ_NO_INC; 
reg     [31:0] RX_TCP_SEQ_NO_TRACK; 
reg     [3:0] RX_TCP_SEQ_NO_INCREMENT; 
(* MARK_DEBUG="true" *)reg     RX_OUTOFBOUND; 
wire    RX_ZERO_WINDOW_PROBE; 
(* MARK_DEBUG="true" *)wire    GAP_IN_RX_SEQ; 
wire    [NTCPSTREAMS - 1:0] RETRANSMIT_FLAG; 
reg     [NTCPSTREAMS - 1:0] TX_SEQ_NO_JUMP_local; 
reg     [24 * NTCPSTREAMS - 1:0] RX_VALID_ACK_TIMOUT; 

// // state machine
wire    [3:0] TCP_STATE_localrx; 
wire    [NTCPSTREAMS - 1:0] EVENTS2; 
wire    [NTCPSTREAMS - 1:0] EVENTS4; 
wire    [NTCPSTREAMS - 1:0] EVENTS4A; 
wire    [NTCPSTREAMS - 1:0] EVENTS4B; 
wire    [NTCPSTREAMS - 1:0] EVENTS4C; 
wire    [NTCPSTREAMS - 1:0] EVENTS5; 
wire    [NTCPSTREAMS - 1:0] EVENTS7; 
wire    [NTCPSTREAMS - 1:0] EVENTS10; 
wire    [NTCPSTREAMS - 1:0] EVENTS11; 
wire    [NTCPSTREAMS - 1:0] EVENTS12; 
wire    EVENT1; 
wire    EVENT2; 
wire    EVENT4; 
wire    EVENT4A; 
wire    EVENT4B; 
wire    EVENT6; 
wire    EVENT8; 

// --// ACK generation
(* MARK_DEBUG="true" *)wire    SEND_ACK_NOW; 
reg     [2 * NTCPSTREAMS - 1:0] DUPLICATE_RX_TCP_ACK_CNTR; 

//  Keep-Alive probe sequence detection
reg     [NTCPSTREAMS - 1:0] KA_PROBE_DET; 

// // relevant transmit destination information
reg     [NTCPSTREAMS - 1:0] ORIGINATOR_IDENTIFIED; 
wire    [NTCPSTREAMS - 1:0] RX_BUF_FULL; 
wire    [NTCPSTREAMS - 1:0] RX_BUF_1MSSFREE; 
(* MARK_DEBUG="true" *)reg     [31:0] TX_ACK_WINDOW_LENGTH; 
reg     [15:0] TX_ACK_WINDOW_LENGTH_SCALED; 
reg     [2 * NTCPSTREAMS - 1:0] RX_WINDOW_RESIZE_STATE; 
reg     [4 * NTCPSTREAMS - 1:0] RX_WINDOW_SCALE; 
reg     [4 * NTCPSTREAMS - 1:0] TX_WINDOW_SCALE; 
reg     [NTCPSTREAMS - 1:0] SEND_RX_WINDOW_RESIZE; 
reg     [2 * NTCPSTREAMS - 1:0] RX_WINDOW_RESIZE2_STATE; 
reg     [NTCPSTREAMS - 1:0] SEND_RX_WINDOW_RESIZE2; 

// // Measure round-trip delay: client -> server -> client
reg     [24 * NTCPSTREAMS - 1:0] TXRX_DELAY_CNTR; 
reg     [24 * NTCPSTREAMS - 1:0] TXRX_DELAY; 
reg     [NTCPSTREAMS - 1:0] TXRX_DELAY_STATE; 

// // transmit packet assembly
reg     [31:0] TCP_ISN; 
reg     [31:0] TCP_ISN_D; 
parameter TX_TCP_RTS = 1'b 0; 
//  temp

//  TCP transmit flow control -------------------
reg     [31:0] EFF_RX_WINDOW_SIZE_PARTIAL_local; 
reg     EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local; 

// //---- TX PACKET ASSEMBLY   
reg     [32 * NTCPSTREAMS - 1:0] TCP_CONGESTION_WINDOW; 
reg     [NTCPSTREAMS - 1:0] TCP_TX_SLOW_START; 
reg     NEXT_TX_TCP_FRAME_QUEUED; 
reg     [NTCPSTREAMS - 1:0] NEXT_TX_TCP_STREAM_SEL; 
reg     [NTCPSTREAMS - 1:0] TX_TCP_STREAM_SEL; 
reg     RTS_local; 
reg     TX_PACKET_SEQUENCE_START; 

// ------------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
reg     [15:0]  TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv; 

wire    [31:0]  DEMUX_001_MAX2; 
wire    [31:0]  DEMUX_001_MIN2; 
reg     [31:0]  TCP_STATEv; 
(* MARK_DEBUG="true" *)reg     [31:0]  TX_ACK_WINDOW_LENGTHv; 
reg     [3:0]   TX_WINDOW_SCALEv; 
reg     [NTCPSTREAMS - 1:0]  NEXT_TCP_TX_STREAM_INDEX_001_TX_STREAM_NO; 
reg     NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED; 
reg     [47:0]  OUTPUT_GEN_TX_DEST_MAC_ADDRv; 
reg     [127:0]  OUTPUT_GEN_TX_DEST_IP_ADDRv; 
reg     [15:0]  OUTPUT_GEN_TX_DEST_PORT_NOv; 
reg     [15:0]  OUTPUT_GEN_TCP_LOCAL_PORTSv; 
reg     OUTPUT_GEN_TX_IPv4_6nv; 
reg     [31:0]  OUTPUT_GEN_TX_SEQ_NO_OUTv; 
reg     [31:0]  OUTPUT_GEN_TX_ACK_NOv; 
reg     [7:0]  OUTPUT_GEN_TX_FLAGSv; 
reg     [3:0]  OUTPUT_GEN_TX_WINDOW_SCALEv; 


genvar  i;
integer j;

initial 
   begin : process_115
   NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED = 1'b 0;   
   end


initial 
   begin : process_114
   TX_PACKET_SEQUENCE_START = 1'b 0;   
   end

initial 
   begin : process_113
   RTS_local = 1'b 0;   
   end

initial 
   begin : process_112
   TX_TCP_STREAM_SEL = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_111
   NEXT_TX_TCP_STREAM_SEL = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_110
   NEXT_TX_TCP_FRAME_QUEUED = 1'b 0;   
   end

initial 
   begin : process_109
   TCP_TX_SLOW_START = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_108
   EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local = 1'b 0;   
   end

initial 
   begin : process_107
   EFF_RX_WINDOW_SIZE_PARTIAL_local = {32{1'b 0}};   
   end

initial 
   begin : process_106
   TCP_ISN_D = 32'h 010ae614;   
   end

initial 
   begin : process_105
   TCP_ISN = 32'h 010ae614;   
   end

initial 
   begin : process_104
   TXRX_DELAY_STATE = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_103
   TXRX_DELAY = {(24 * NTCPSTREAMS - 1 - 0 + 1){{(24 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_102
   TXRX_DELAY_CNTR = {(24 * NTCPSTREAMS - 1 - 0 + 1){{(24 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_101
   SEND_RX_WINDOW_RESIZE2 = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_100
   RX_WINDOW_RESIZE2_STATE = {(2 * NTCPSTREAMS - 1 - 0 + 1){{(2 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_99
   SEND_RX_WINDOW_RESIZE = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_98
   TX_WINDOW_SCALE = {(4 * NTCPSTREAMS - 1 - 0 + 1){{(4 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_97
   RX_WINDOW_SCALE = {(4 * NTCPSTREAMS - 1 - 0 + 1){{(4 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_96
   RX_WINDOW_RESIZE_STATE = {(2 * NTCPSTREAMS - 1 - 0 + 1){{(2 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_95
   TX_ACK_WINDOW_LENGTH_SCALED = {16{1'b 0}};   
   end

initial 
   begin : process_94
   TX_ACK_WINDOW_LENGTH = {32{1'b 0}};   
   end

initial 
   begin : process_91
   ORIGINATOR_IDENTIFIED = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_90
   KA_PROBE_DET = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_89
   DUPLICATE_RX_TCP_ACK_CNTR = {(2 * NTCPSTREAMS - 1 - 0 + 1){{(2 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end



initial 
   begin : process_69
   TX_SEQ_NO_JUMP_local = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_65
   RX_OUTOFBOUND = 1'b 0;   
   end

initial 
   begin : process_64
   RX_TCP_SEQ_NO_INCREMENT = 0;   
   end

initial 
   begin : process_63
   RX_TCP_SEQ_NO_TRACK = {32{1'b 0}};   
   end

initial 
   begin : process_61
   RX_FRAME_VALID_local = 1'b 0;   
   end

initial 
   begin : process_60
   RX_EOF_D = 1'b 0;   
   end

initial 
   begin : process_59
   RX_EOF_local = 1'b 0;   
   end

initial 
   begin : process_58
   RX_SOF_local = 1'b 0;   
   end

initial 
   begin : process_57
   RX_DATA_VALID_local = {8{1'b 0}};   
   end

initial 
   begin : process_56
   IP_PAYLOAD_SOF_D2 = 1'b 0;   
   end

initial 
   begin : process_55
   IP_PAYLOAD_SOF_D = 1'b 0;   
   end

initial 
   begin : process_54
   RX_TCP_NON_ZERO_DATA_LENGTH = 1'b 0;   
   end

initial 
   begin : process_53
   TCP_SOF_FLAG = 1'b 0;   
   end

initial 
   begin : process_50
   VALID_RX_TCP0 = 1'b 0;   
   end

initial 
   begin : process_49
   IP_PAYLOAD_EOF_D = 1'b 0;   
   end

initial 
   begin : process_48
   RX_TCP_STREAM_SEL_D = {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
   end

initial 
   begin : process_41
   RX_TCP_WINDOW_SIZE = {32{1'b 0}};   
   end

initial 
   begin : process_40
   RX_TCP_WINDOW_SIZE_SCALED = {16{1'b 0}};   
   end

initial 
   begin : process_39
   RX_TCP_FLAGS = {8{1'b 0}};   
   end

initial 
   begin : process_36
   RX_TCP_DATA_OFFSET = {4{1'b 0}};   
   end

initial 
   begin : process_35
   RX_TCP_ACK_NO = {32{1'b 0}};   
   end

initial 
   begin : process_34
   RX_TCP_SEQ_NO = {32{1'b 0}};   
   end

initial 
   begin : process_33
   RX_DEST_TCP_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_32
   RX_SOURCE_TCP_PORT_NO = {16{1'b 0}};   
   end

initial 
   begin : process_30
   TX_FLAGS = {(8 * NTCPSTREAMS - 1 - 0 + 1){{(8 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_29
   TX_PACKET_TYPE = 2'b 00;   
   end

initial 
   begin : process_28
   TX_PACKET_TYPE_QUEUED = {(2 * NTCPSTREAMS - 1 - 0 + 1){{(2 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end


initial 
   begin : process_25
   RX_TCP_SEQ_NO_MIN = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_24
   RX_TCP_SEQ_NO_MAX = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_23
   RX_TCP_ACK_NO_D_local = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_22
   FAST_REXMIT_SEQ_NO_END = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_21
   FAST_REXMIT_SEQ_NO_START = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_20
   TX_SEQ_NO_OUT_local = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_19
   TX_SEQ_NO_local = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_18
   TX_ACK_NO2 = {32{1'b 0}};   
   end

initial 
   begin : process_17
   TX_ACK_NO = {(32 * NTCPSTREAMS - 1 - 0 + 1){{(32 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

initial 
   begin : process_16
   TX_SEQ_NO_INIT = {32{1'b 0}};   
   end

initial 
   begin : process_15
   TX_DEST_PORT_NO = {(16 * NTCPSTREAMS - 1 - 0 + 1){{(16 * NTCPSTREAMS - 1 - 0 + 1){1'b 0}}}};   
   end

// initial 
//    begin : process_14
//    TX_DEST_IP_ADDR = 'b0;
//    end

// initial 
//    begin : process_13
//    TX_DEST_MAC_ADDR = 'b0;
//    end

initial 
   begin : process_11
   ZWP_STATE = 'b0;   
   end

initial 
   begin : process_10
   TIMER3 = 'b0;   
   end

initial 
   begin : process_9
   ZWS = 'b0;  
   end

initial 
   begin : process_8
   KASTATE = 'b0;   
   end

initial 
   begin : process_7
   TIMER2_D = 'b0;   
   end

initial 
   begin : process_6
   TIMER2 = 'b0;  
   end

initial 
   begin : process_4
   TIMER1 = 'b0;  
   end

// initial 
//    begin : process_3
//    TCP_STATE = 'b0;
//    end

initial 
   begin : process_2
   TICK_1S = 1'b 0;   
   end

initial 
   begin : process_1
   TICK_CNTR = 4'b 0000;   
   end

////////////////////////////////////////////////////////
//      IMPLEMENTATION
////////////////////////////////////////////////////////
always @(posedge CLK)
   begin : TICK_1S_GEN
   if (CLK == 1'b 1)
      begin
      if (TICK_100MS == 1'b 1)
         begin
         if (TICK_CNTR == 9)
            begin
            TICK_CNTR <= {4{1'b 0}};   
            TICK_1S <= 1'b 1;   
            end
         else
            begin
            TICK_CNTR <= TICK_CNTR + 1;   
            TICK_1S <= 1'b 0;   
            end
         end
      else
         begin
         TICK_1S <= 1'b 0;   
         end
      end
   end

// //////////////////////////////////////////////
// // PARSE TCP HEADER     //////////////////
// //////////////////////////////////////////////


assign IP_PAYLOAD_WORD_VALID = IP_PAYLOAD_DATA_VALID != 0 ? 1'b 1 : 1'b 0; 

//  These fields are read at the first IP payload word
//  Available at IP_PAYLOAD_SOF_D

always @(posedge CLK)
   begin : TCP_DECODE_001
   if (CLK == 1'b 1)
      begin
      if (SYNC_RESET == 1'b 1) begin
      //  TODO reset after end of frame
         RX_SOURCE_TCP_PORT_NO <= {16{1'b 0}};   
         RX_DEST_TCP_PORT_NO <= {16{1'b 0}};   
         RX_TCP_SEQ_NO <= {32{1'b 0}};   
         end
      else if (IP_PAYLOAD_SOF == 1'b 1 )
         begin
         RX_SOURCE_TCP_PORT_NO <= IP_PAYLOAD_DATA[63:48];   
         RX_DEST_TCP_PORT_NO <= IP_PAYLOAD_DATA[47:32];   
         RX_TCP_SEQ_NO <= IP_PAYLOAD_DATA[31:0];   
         end
      end
   end

//  These fields are available at the second IP payload word

always @(posedge CLK) begin : TCP_DECODE_002
      if (SYNC_RESET == 1'b 1) begin
         //  TODO reset after end of frame for cleaner code
         RX_TCP_ACK_NO <= 'b0;   
         RX_TCP_DATA_OFFSET <= 'b0;   
         RX_TCP_FLAGS <= 'b0;   
         RX_TCP_WINDOW_SIZE_SCALED <= 'b0;   
         RX_TCP_WINDOW_SIZE <= 1'b0;   
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & IP_PAYLOAD_WORD_COUNT == 2 ) begin
         RX_TCP_ACK_NO <= IP_PAYLOAD_DATA[63:32];   
         RX_TCP_DATA_OFFSET <= IP_PAYLOAD_DATA[31:28];   
         RX_TCP_FLAGS <= IP_PAYLOAD_DATA[23:16];   
         //  TCP flags (MSb) CWR/ECE/URG/ACK/PSH/RST/SYN/FIN (LSb)
         RX_TCP_WINDOW_SIZE_SCALED <= IP_PAYLOAD_DATA[15:0];   
         TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv = IP_PAYLOAD_DATA[15:0];   
         if (WINDOW_SCALING_ENABLED == 1'b 1) begin
         //  optimized out when window scaling is disabled (i.e. tx/rx buffers <= 64kB)
         //  restore the full 32-bit RX_TCP_WINDOW_SIZE
            for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
               if (RX_TCP_STREAM_SEL[j] == 1'b 1) begin
         //  window scaling (buffer sizes ranging from 256 to 1MB)
                  case (RX_WINDOW_SCALE[(j*4)+:4])  // valid range 0 - 14
                  4'b 0000:
                     begin
                     RX_TCP_WINDOW_SIZE[31:16] <= {16{1'b 0}};  
                     RX_TCP_WINDOW_SIZE[15:0] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 64kB
                     end
                  4'b 0001:
                     begin
                     RX_TCP_WINDOW_SIZE[31:17] <= {15{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[16:1] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 128kB
                     RX_TCP_WINDOW_SIZE[0:0] <= {1{1'b 0}};   
                     end
                  4'b 0010:
                     begin
                     RX_TCP_WINDOW_SIZE[31:18] <= {14{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[17:2] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 256kB
                     RX_TCP_WINDOW_SIZE[1:0] <= {2{1'b 0}};   
                     end
                  4'b 0011:
                     begin
                     RX_TCP_WINDOW_SIZE[31:19] <= {13{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[18:3] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 512kB
                     RX_TCP_WINDOW_SIZE[2:0] <= {3{1'b 0}};   
                     end
                  4'b 0100:
                     begin
                     RX_TCP_WINDOW_SIZE[31:20] <= {12{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[19:4] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 1MB
                     RX_TCP_WINDOW_SIZE[3:0] <= {4{1'b 0}};   
                     end
                  4'b 0101:
                     begin
                     RX_TCP_WINDOW_SIZE[31:21] <= {11{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[20:5] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 2MB
                     RX_TCP_WINDOW_SIZE[4:0] <= {5{1'b 0}};   
                     end
                  4'b 0110:
                     begin
                     RX_TCP_WINDOW_SIZE[31:22] <= {10{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[21:6] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 4MB
                     RX_TCP_WINDOW_SIZE[5:0] <= {6{1'b 0}};   
                     end
                  4'b 0111:
                     begin
                     RX_TCP_WINDOW_SIZE[31:23] <= {9{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[22:7] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 8MB
                     RX_TCP_WINDOW_SIZE[6:0] <= {7{1'b 0}};   
                     end
                  4'b 1000:
                     begin
                     RX_TCP_WINDOW_SIZE[31:24] <= {8{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[23:8] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 16MB
                     RX_TCP_WINDOW_SIZE[7:0] <= {8{1'b 0}};   
                     end
                  4'b 1001:
                     begin
                     RX_TCP_WINDOW_SIZE[31:25] <= {7{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[24:9] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 32MkB
                     RX_TCP_WINDOW_SIZE[8:0] <= {9{1'b 0}};   
                     end
                  4'b 1010:
                     begin
                     RX_TCP_WINDOW_SIZE[31:26] <= {6{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[25:10] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv; //  <= 64MB
                     RX_TCP_WINDOW_SIZE[9:0] <= {10{1'b 0}};   
                     end
                  4'b 1011:
                     begin
                     RX_TCP_WINDOW_SIZE[31:27] <= {5{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[26:11] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 128MB
                     RX_TCP_WINDOW_SIZE[10:0] <= {11{1'b 0}};   
                     end
                  4'b 1100:
                     begin
                     RX_TCP_WINDOW_SIZE[31:28] <= {4{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[27:12] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 256MB
                     RX_TCP_WINDOW_SIZE[11:0] <= {12{1'b 0}};   
                     end
                  4'b 1101:
                     begin
                     RX_TCP_WINDOW_SIZE[31:29] <= {3{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[28:13] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 512MB
                     RX_TCP_WINDOW_SIZE[12:0] <= {13{1'b 0}};   
                     end
                  default:
                     begin
                     RX_TCP_WINDOW_SIZE[31:30] <= {2{1'b 0}};   
                     RX_TCP_WINDOW_SIZE[29:14] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;  //  <= 1GB
                     RX_TCP_WINDOW_SIZE[13:0] <= {14{1'b 0}};   
                     end
                  endcase
                  end
               end
            end
         else begin
               //  window scaling is disabled (i.e. tx/rx buffers <= 64kB)
            RX_TCP_WINDOW_SIZE[31:16] <= {16{1'b 0}};   
            RX_TCP_WINDOW_SIZE[15:0] <= TCP_DECODE_002_RX_TCP_WINDOW_SIZE_SCALEDv;   //  <= 64kB
            end
         end
      end

assign RX_TCP_DATA_OFFSET_INC = RX_TCP_DATA_OFFSET + 1; 

assign RX_TCP_DATA_OFFSET_DIV2_INC = RX_TCP_DATA_OFFSET[3:1] + 1; 
//  decode TCP options
assign TCP_RXOPTIONS_RESET = SYNC_RESET | ~VALID_RX_TCP0 | IP_PAYLOAD_SOF; 

//  only applies to TCP protocol
//  clear decoded options at start of IP payload
//  Read options at EVENT1 (= SYN message, IP_PAYLOAD_EOF_D)
TCP_RXOPTIONS_10G TCP_DECODE_003 (
          .CLK(CLK),
          .SYNC_RESET(TCP_RXOPTIONS_RESET),
          .RX_TCP_DATA_OFFSET(RX_TCP_DATA_OFFSET),
          .IP_PAYLOAD_DATA(IP_PAYLOAD_DATA),
          .IP_PAYLOAD_WORD_VALID(IP_PAYLOAD_WORD_VALID),
          .IP_PAYLOAD_WORD_COUNT(IP_PAYLOAD_WORD_COUNT),
          .TCP_OPTION_MSS(TCP_OPTION_MSS),  //  currently unused
          .TCP_OPTION_MSS_VALID(),
          .TCP_OPTION_WINDOW_SCALE(TCP_OPTION_WINDOW_SCALE), //  window scale requested by client
          .TCP_OPTION_WINDOW_SCALE_VALID(TCP_OPTION_WINDOW_SCALE_VALID),
          .TCP_OPTION_SACK_PERMITTED(TCP_OPTION_SACK_PERMITTED), //  currently unused
          .TCP_OPTION_SACK_PERMITTED_VALID(),
          .TP()
);



// negotiate TCP_OPTION_WINDOW_SCALE for the stream being received
// enable rx window scale if (1) we received the window scale option and 
// (2) we plan to request the window scale option because our rx or/and tx buffers are > 64KB
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TCP_DECODE_004
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         RX_WINDOW_SCALE[(i*4)+:4] <= 4'h 0;   
         TX_WINDOW_SCALE[(i*4)+:4] <= 4'h 0;   
      end else if (RX_TCP_STREAM_SEL_D[i] == 1'b 1 & TCP_STATE[i] == 0 & EVENT1 == 1'b 1 ) begin
         // LISTEN
         // Received valid SYN
         if (WINDOW_SCALING_ENABLED == 1'b 0 | TCP_OPTION_WINDOW_SCALE_VALID == 1'b 0) begin
         // we did not receive a window scale option in the SYN message, or
         // we do not need window scaling because our tx/rx buffers are both < 64KB
            
            RX_WINDOW_SCALE[(i*4)+:4] <= 4'h 0;   
            TX_WINDOW_SCALE[(i*4)+:4] <= 4'h 0;   
         end else begin
            RX_WINDOW_SCALE[(i*4)+:4] <= TCP_OPTION_WINDOW_SCALE;   
            TX_WINDOW_SCALE[(i*4)+:4] <= TCP_MAX_WINDOW_SIZE - 16;   
         end
      end
   end
end
endgenerate
/////////////////////////////////////////////////
//// TCP stream identification //////////////////
/////////////////////////////////////////////////
// Identify the stream based on the destination tcp port for each 
// incoming frame.
// ready at IP_PAYLOAD_SOF_D
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: STREAM_INDEX_001
   assign   RX_TCP_STREAM_SEL[i] = (RX_DEST_TCP_PORT_NO == TCP_LOCAL_PORTS[(i*16)+:16]) ? 1'b1: 1'b0;
end
//  reclock for better timing
//  ready at IP_PAYLOAD_SOF_D2

always @(posedge CLK) begin : STREAM_INDEX_002
   RX_TCP_STREAM_SEL_D <= RX_TCP_STREAM_SEL;   
end

//  Demux key fields based on the current rx stream

reg   [31 : 0]   MAX2;
reg   [31 : 0]   MIN2;

always@(*) begin: DEMUX_001
   MAX2 = 32'h0;
   MIN2 = 32'h0;
   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if(RX_TCP_STREAM_SEL[j] == 1) begin
         MAX2 = RX_TCP_SEQ_NO_MAX[(j*32)+:32];
         MIN2 = RX_TCP_SEQ_NO_MIN[(j*32)+:32];
      end
   end              
end

assign   RX_TCP_SEQ_NO_MAX2 = MAX2;   
assign   RX_TCP_SEQ_NO_MIN2 = MIN2;   


always @(posedge CLK) begin : DEMUX_002
   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if (RX_TCP_STREAM_SEL[j] == 1'b 1) begin //  DCC mod *031720
         TX_ACK_NO2 <= TX_ACK_NO[(j*32)+:32];   
      end
   end
end

////////////////////////////////////////////////-
//// Collect response information //////////////-
////////////////////////////////////////////////-
// save destination IP, destination port and other relevant information
// upon receiving SYN. The information will be kept until the connection is closed.
// valid at IP_PAYLOAD_EOF_D2
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: INFO_X
   always @(posedge CLK) begin
      if (RX_TCP_STREAM_SEL[i] == 1'b 1 & TCP_STATE[i] == 0 & EVENT1 == 1'b 1) begin
            // Received valid SYN while in LISTEN state
            // Save the destination addresses during the connection
         TX_DEST_MAC_ADDR[i] <= RX_SOURCE_MAC_ADDR;   
         TX_DEST_IP_ADDR[i] <= RX_SOURCE_IP_ADDR;   
         TX_DEST_PORT_NO[(i*16)+:16] <= RX_SOURCE_TCP_PORT_NO;   
         TX_IPv4_6n[i] <= RX_IPv4_6n;   
      end
   end
end
endgenerate
// After the initial SYN message where the originator identification characteristics
// are collected (MAC/IP/PORT), the origination of subsequent messages addressed 
// to this IP/Port is verified. (we don't want a third party to crash our connection
// by sending RST or other disrupting messages.
// Information is valid at the end of the TCP header until the next received packet.
// Valid at IP_PAYLOAD_SOF_D2
generate
   for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: ORIGIN_001
      always @(posedge CLK) begin
         if (TX_DEST_MAC_ADDR[i] == RX_SOURCE_MAC_ADDR & TX_DEST_IP_ADDR[i] == RX_SOURCE_IP_ADDR & TX_DEST_PORT_NO[(i*16)+:16] == RX_SOURCE_TCP_PORT_NO) begin
            ORIGINATOR_IDENTIFIED[i] <= 1'b 1;   
         end else begin
            ORIGINATOR_IDENTIFIED[i] <= 1'b 0;   
         end
      end
   end
endgenerate
//////////////////////////////////////////////////-
////// State Machine / Events ////////////////////-
//////////////////////////////////////////////////-
// independent state machine for each server
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TCP_STATE_X
   // EVENTS2(I)
   // End of TCP segment transmission. Exclude the end of data frames. 
   assign EVENTS2[i] = ((TX_TCP_STREAM_SEL[i] == 1'b 1) & (MAC_TX_EOF == 1'b 1) & (TX_PACKET_TYPE == 2'b 10)) ? 1'b 1 : 1'b 0; 
   // EVENTS4(I): received valid ACK flag and ACK number from the connection client. Wait until the end of frame to confirm validity.
   assign EVENTS4[i] = RX_TCP_FLAGS[4] == 1'b 1 ? EVENTS12[i] : 1'b 0; 
   // Events 4A: received valid non-duplicate ACK (a subset of EVENTS4)
   assign EVENTS4A[i] = (RX_TCP_ACK_NO_D_local[(i*32)+:32] != RX_TCP_ACK_NO) ? EVENTS4[i] : 1'b 0; 
   // Events 4B: received valid duplicate ACK (a subset of EVENTS4)
   assign EVENTS4B[i] = (RX_TCP_ACK_NO_D_local[(i*32)+:32] == RX_TCP_ACK_NO) ? EVENTS4[i] : 1'b 0; 
   // Events 4C: received expected ACK number = previous transmit sequence number + 1 or payload length
   // deleted: too narrow a definition, we may already have started transmitting data to client.
   // EVENTS4C(I) <= EVENTS4(I) when (TX_SEQ_NO_local(I)(15 downto 0) = RX_TCP_ACK_NO(15 downto 0)) else '0';

   // EVENTS5(I)
   // Received valid FIN flag from expected server. Wait until the end of frame to confirm validity.
   
   assign EVENTS5[i] = ((EVENTS12[i] == 1'b 1) & (RX_TCP_FLAGS[0] == 1'b 1)) ? 1'b 1 : 1'b 0; 
   // EVENTS7(I)
   // Received valid RST flag from the connection server
   assign EVENTS7[i] = RX_TCP_FLAGS[2] == 1'b 1 ? EVENTS12[i] : 1'b 0; 
   // EVENTS10(I)
   // Window resizing (receive flow control), no segment to transmit. The receive buffer is no 
   // longer empty. Send a single ACK with a non-zero window.
   assign EVENTS10[i] = ((SEND_RX_WINDOW_RESIZE[i] == 1'b 1 | SEND_RX_WINDOW_RESIZE2[i] == 1'b 1) & TX_TCP_RTS == 1'b 0) ? 1'b 1 : 1'b 0; 
   // EVENTS11(I)
   // keep-alive or zero-window check: RFC: "send a probe segment designed to elicit a response from the
   // peer TCP.  Such a segment generally contains SEG.SEQ = SND.NXT-1
   assign EVENTS11[i] = ((TCP_KEEPALIVE_EN[i] == 1'b 1) & (TIMER2_D[(i*8)+:8] != 0) & (TIMER2[(i*8)+:8] == 0) & (TX_TCP_RTS == 1'b 0)) ? 1'b 1 : ZWP_TRIGGER[i]; 
   // EVENTS12(I)
   // Receiving a valid TCP frame or ACK for stream I from expected client
   assign EVENTS12[i] = ((IP_PAYLOAD_EOF_D == 1'b 1) & (RX_TCP_STREAM_SEL_D[i] == 1'b 1) & (VALID_RX_TCP_ALL == 1'b 1) & (ORIGINATOR_IDENTIFIED[i] == 1'b 1)) ? 1'b 1 : 1'b 0; 

   // Note: removed state 2 because in the SYN/SYN ACK/ACK sequence
   // if the ACK and only the ACK is dropped, the connection becomes established. If more things are dropped, there is a reset.
   
   always @(posedge CLK) begin : TCP_STATE_001
      if (SYNC_RESET == 1'b 1) begin
            // reset all connections (abrupt, may cause server side to remain connected, thus preventing any further connection on that port)
         TCP_STATE[i] <= 0;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & CONNECTION_RESET[i] == 1'b 1 ) begin
            // user-initiated selective connection request while connected
         TCP_STATE[i] <= 6;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & TCP_KEEPALIVE_EN[i] == 1'b 1 & KASTATE[(i*2)+:2] == 0 ) begin
            // failed keepalive. Automatic disconnect.
         TCP_STATE[i] <= 6;   // send FIN
         // rx-related events
      end else if (EVENTS7[i] == 1'b 1 ) begin
         // Reset / Abort (true in any state, as long as we verify the originator)
         // received RST
         TCP_STATE[i] <= 0;   
      end else if (RX_TCP_STREAM_SEL_D[i] == 1'b 1 & TCP_STATE[i] == 0 & EVENT1 == 1'b 1 ) begin
         // LISTEN
         // Received valid SYN
         TCP_STATE[i] <= 1;   // SYN_RCVD. Transmitting SYN,ACK in progress
         // else if(TCP_STATE(I) = 2) and (EVENTS4C(I) = '1') then  -- too narrow a definition. We may already have sent data to client. ack number is not just +1
      end else if (TCP_STATE[i] == 2 & EVENTS4[i] == 1'b 1 ) begin
         // CONNECTION ESTABLISHMENT: Await ACK from client
         // received valid ACK and ACK number
         TCP_STATE[i] <= 3;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS5[i] == 1'b 1 ) begin
         // client-initiated connection termination . Send ACK
         TCP_STATE[i] <= 4;   // sending ACK
      end else if (TCP_STATE[i] == 7 & EVENTS5[i] == 1'b 1 ) begin
         // received FIN after FIN. Send final ACK.
         TCP_STATE[i] <= 8;   
      end else if (TCP_STATE[i] == 5 & EVENTS4[i] == 1'b 1 ) begin
         // received final ACK after FIN/ACK+FIN. Connection is properly closed.
         TCP_STATE[i] <= 0;   
         // tx-related events (end of transmission)
      end else if (TCP_STATE[i] == 6 & EVENTS2[i] == 1'b 1 & TX_FLAGS[(i*8)+:1] == 1'b 1 ) begin 
         // sent FIN. Awaiting ACK + FIN
         TCP_STATE[i] <= 7;   
      end else if (TCP_STATE[i] == 8 & EVENTS2[i] == 1'b 1 & TX_FLAGS[(i*8+4)+:1] == 1'b 1 ) begin
         // Sent final ACK. Connection is properly closed
         TCP_STATE[i] <= 0;   
      end else if (TCP_STATE[i] == 4 & EVENTS2[i] == 1'b 1 & TX_FLAGS[(i*8+4)+:1] == 1'b 1 ) begin
         // sent ACK after receiving FIN. send final FIN. Await final ack.
         TCP_STATE[i] <= 5;   
      end else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & TCP_STATE[i] == 1 & EVENT2 == 1'b 1 ) begin
         // Sent SYN/ACK. Awaiting ACK (not essential). 
         TCP_STATE[i] <= 2;   // CONNECTED state
         // elsif(TX_TCP_STREAM_SEL(I) = '1') and (TCP_STATE(I) = 4) and (EVENT2 = '1') then
            // CONNECTION TERMINATION: await end of ACK transmission
            // completed ACK transmission
            // TCP_STATE(I) <= 5;   -- await end of FIN/ACK transmission
            // elsif(TX_TCP_STREAM_SEL(I) = '1') and (TCP_STATE(I) = 5) and (EVENT2 = '1') then
            // CONNECTION TERMINATION: await end of FIN/ACK transmission
            // completed FIN/ACK transmission
            // don't wait for an ACK from client (race condition: next connection SYN could arrive first)
            // TCP_STATE(I) <= 0;   -- LISTEN STATE
            
         // timeouts
      end else if ((TCP_STATE[i] == 6 | TCP_STATE[i] == 7 | TCP_STATE[i] == 8) & TIMER1[(i*8)+:8] == 0 ) begin
         // timeout waiting for normal server-originated connection termination. Abnormal connection termination.
         TCP_STATE[i] <= 0;   
      end else if ((TCP_STATE[i] == 4 | TCP_STATE[i] == 5) & TIMER1[(i*8)+:8] == 0 ) begin
         // timeout waiting for normal client-originated connection termination. Abnormal connection termination.
         TCP_STATE[i] <= 0;   
      end
   end

// TCP-IP connection status
// report TCP-IP connection status to TCP_TXBUF

assign CONNECTED_FLAG_local[i] = ((TCP_STATE[i] == 3) | (TCP_STATE[i] == 2)) ? 1'b 1 : 1'b 0; 
assign CONNECTED_FLAG[i] = CONNECTED_FLAG_local[i]; 

// state machine timer (so that we do not get stuck into a state)
   always @(posedge CLK) begin : TIMER1_GEN_001
      if (SYNC_RESET == 1'b 1) begin
            // reset all connections (abrupt, may cause server side to remain connected, thus preventing any further connection on that port)
            // idle state, clear timer to 'expired' (0)
         TIMER1[(i*8)+:8] <= 'b0;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & CONNECTION_RESET[i] == 1'b 1 ) begin
           //  user-initiated selective connection request while connected
         TIMER1[(i*8)+:8] <= 20;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & TCP_KEEPALIVE_EN[i] == 1'b 1 & KASTATE[(i*2)+:2] == 0 ) begin
           //  failed keepalive. Disconnect.
         TIMER1[(i*8)+:8] <= 20;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS5[i] == 1'b 1 ) begin
           //  client-initiated connection termination .
         TIMER1[(i*8)+:8] <= 20;   
      end else if (TCP_STATE[i] == 0 ) begin
           //  idle state, clear timer to 'expired' (0)
         TIMER1[(i*8)+:8] <= 'b0;   
      end else if (TICK_100MS == 1'b 1 & TIMER1[(i*8)+:8] != 0 ) begin
           //  decrement until timer has expired (0)
         TIMER1[(i*8)+:8] <= TIMER1[(i*8)+:8] - 1;   
      end
   end
end
endgenerate
// contextual TCP_STATE while receiving a frame

always@(*)
begin
   TCP_STATEv <= 'h0;
   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if(RX_TCP_STREAM_SEL[j] == 1)
         TCP_STATEv <= TCP_STATE[j];
   end              
end
assign TCP_STATE_localrx = TCP_STATEv;  

// keep-alive timer
// Send zero-data length keep alive message when TIMER2 = 0
// TIMER2 is expressed in 1s units
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TIMER2_GEN_001
   always @(posedge CLK) begin
      TIMER2_D[(i*8)+:8] <= TIMER2[(i*8)+:8];   
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] != 3 | TCP_KEEPALIVE_EN[i] == 1'b 0)
         begin
         TIMER2[(i*8)+:8] <= TCP_KEEPALIVE_PERIOD;   
         end
      else if (EVENTS12[i] == 1'b 1 )
         begin
         TIMER2[(i*8)+:8] <= TCP_KEEPALIVE_PERIOD;   
         end
      else if (NEXT_TX_TCP_STREAM_SEL[i] == 1'b 1 & NEXT_TX_TCP_FRAME_QUEUED == 1'b 1 & RTS_local == 1'b 0 )
         begin
         TIMER2[(i*8)+:8] <= TCP_KEEPALIVE_PERIOD;   
         end
      else if (TICK_1S == 1'b 1 & TIMER2[(i*8)+:8] != 0 )
         begin
         TIMER2[(i*8)+:8] <= TIMER2[(i*8)+:8] - 1;   
         end
      end
   end
endgenerate

//detect broken connection: keepalive message sent, ack or no ack received
// Algo: set KASTATE to 3 when receiving ACK, decrement every timeout. Broken link when 0
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin:  TIMER2_GEN_002  
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] != 3 | TCP_KEEPALIVE_EN[i] == 1'b 0) begin
            // reset or not connected state or keepalive not enabled
         KASTATE[(i*2)+:2] <= 2'b 11;   
         end
      else if (EVENTS12[i] == 1'b 1 ) begin
         KASTATE[(i*2)+:2] <= 2'b 11;   
      end else if (TICK_1S == 1'b 1 & TIMER2[(i*8)+:8] == 1 ) begin
         if (KASTATE[(i*2)+:2] != 0) begin
            KASTATE[(i*2)+:2] <= KASTATE[(i*2)+:2] - 1;   
         end
      end
   end
end
endgenerate
// connection status in KASTATE(I)(1)
            
//// zero-window probe timer
// Keep track of zero-window sizes (yes/no) reported by the other side of the TCP connection
// Available at IP_PAYLOAD_EOF_D2

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: ZWS_GEN_X
   always @(posedge CLK) begin: ZWS_GEN_001
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] != 3) begin
         ZWS[i] <= 1'b 0;   
      end else if (EVENTS4[i] == 1'b 1 ) begin
         // Valid ACK received for stream RX_TCP_STREAM_SEL_D 
         if (RX_TCP_WINDOW_SIZE_SCALED == 0) begin
            ZWS[i] <= 1'b 1;   
         end else begin
            ZWS[i] <= 1'b 0;   
         end
      end
   end

   // Send zero-window probe message when TIMER3 = 0
   // TIMER3 is expressed in 100ms units
   // ZERO_WINDOW_PROBE_PERIOD = minimum interval to send zero-window probe (in 100ms units)
   
   always @(posedge CLK) begin : TIMER3_GEN_001
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] != 3 | ZWS[i] == 1'b 0) begin
         // reset or not connected state or keepalive not enabled
         TIMER3[(i*8)+:8] <= ZERO_WINDOW_PROBE_PERIOD;   
      end else if (TICK_100MS == 1'b 1 & TIMER3[(i*8)+:8] == 0 & ZWP_STATE[(i*4+3)+:1] == 1'b 0 ) begin
         // timer3 expired (0) => send zero-window probe. 
         // Re-arm timer3. Increase period between successive zero-window probes.
         case (ZWP_STATE[(i*4)+:4])
         4'b 0000: begin
            TIMER3[(i*8)+:8] <= ZERO_WINDOW_PROBE_PERIOD;   // 0.3s
         end
         4'b 0001: begin
            TIMER3[(i*8)+:8] <= 2 * ZERO_WINDOW_PROBE_PERIOD;  // 0.6s 
         end
         4'b 0010: begin
            TIMER3[(i*8)+:8] <= 4 * ZERO_WINDOW_PROBE_PERIOD;   // 1.2s
         end
         4'b 0011: begin
            TIMER3[(i*8)+:8] <= 8 * ZERO_WINDOW_PROBE_PERIOD;   // 2.4s
         end
         default:  begin
            TIMER3[(i*8)+:8] <= 16 * ZERO_WINDOW_PROBE_PERIOD;  // 4.8s
         end
         endcase
      end else if (TICK_100MS == 1'b 1 & TIMER3[(i*8)+:8] != 0 ) begin
         // decrement until timer has expired (0)
         TIMER3[(i*8)+:8] <= TIMER3[(i*8)+:8] - 1;   
      end
   end

// slowly increase time between successive zero window probes
// ZWP_STATE(I) goes from 0 to 8 and stays there until connection is reset or zero-window condition disappears.
   
   always @(posedge CLK) begin : TIMER3_GEN_002
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] != 3 | ZWS[i] == 1'b 0) begin
            // reset or not connected state or keepalive not enabled
         ZWP_STATE[(i*4)+:4] <= 4'b0;   
         end
      else if (TICK_100MS == 1'b 1 & TIMER3[(i*8)+:8] == 0 & ZWP_STATE[(i*4+3)+:1] == 1'b 0 ) begin
            // slowly increase time between successive zero window probes
         ZWP_STATE[(i*4)+:4] <= ZWP_STATE[(i*4)+:4] + 1;   
      end
   end



assign ZWP_TRIGGER[i] = ((TICK_100MS == 1'b 1) & (TIMER3[(i*8)+:8] == 0)) ? 1'b 1 : 1'b 0; 

end
endgenerate
//////////////////////////////////////////////////
////// State Machine EVENTS //////////////////////
//////////////////////////////////////////////////
// Event 1: receive valid SYN flag (from anyone). Wait until the end of frame to confirm validity.
// design note: strengthen validity check w.r.t. previous 1G COM5402 implementation.
assign EVENT1 = ((IP_PAYLOAD_EOF_D == 1'b 1) & (VALID_RX_TCP_ALL == 1'b 1) & (RX_TCP_FLAGS[1] == 1'b 1)) ? 1'b 1 : 1'b 0; 

//  Event 2: completed transmission of TCP segment.

assign EVENT2 = MAC_TX_EOF; 

//  EVENT4: received valid ACK flag and ACK number from the connection client for the TCP stream RX_TCP_STREAM_SEL_D(I) associated with the current rx frame

assign EVENT4 = EVENTS4 != 0 ? 1'b 1 : 1'b 0; 

//  Events 4A: received valid non-duplicate ACK (a subset of EVENTS4)

assign EVENT4A = EVENTS4A != 0 ? 1'b 1 : 1'b 0; 

//  Events 4B: received valid duplicate ACK (a subset of EVENTS4)

assign EVENT4B = EVENTS4B != 0 ? 1'b 1 : 1'b 0; 

//  Event 6
//  received valid segment, no segment to transmit. generate ACK only.

assign EVENT6 = ((SEND_ACK_NOW == 1'b 1) & (TX_TCP_RTS == 1'b 0)) ? 1'b 1 : 1'b 0; 

//  Event 8
//  data is ready to be transmitted over TCP. Send data.  A distinct tx state machine is located 
//  in TCP_TXBUF together with the transmit buffers. 
//  Block sending until we receive a valid ACK from the previous transmission
//  A frame is ready for transmission when 
//  (a) the effective client rx window size is non-zero
//  (b) the tx buffer contains either the effective client rx window size or no new data received in the last TX_IDLE_TIMEOUT
//  (c) TCP is not busy transmitting/assembling another packet
//  implied condition: TCP is in connected state (3) otherwise TX_PAYLOAD_RTS = '0'

assign EVENT8 = ((TX_PAYLOAD_RTS == 1'b 1) & (RTS_local == 1'b 0)) ? 1'b 1 : 1'b 0; 

// -----------------------------------------------
// -- Receive data -------------------------------
// -----------------------------------------------
// // CHECK RX TCP VALIDITY -----------------------------
//  overall TCP validity. Can also be used in the case of zero-length TCP data fields)
//  Partial verification done prior to the TCP payload field, 
//  Final verification is aligned with IP_PAYLOAD_EOF_D

   always @(posedge CLK) begin : VALIDITY_CHECK_001
      IP_PAYLOAD_EOF_D <= IP_PAYLOAD_EOF;   
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1) begin
         if (RX_IP_PROTOCOL != 6) begin
            //  not TCP
            VALID_RX_TCP0 <= 1'b 0;   
            //  valid unless proven otherwise
         end else begin
            VALID_RX_TCP0 <= 1'b 1;   
         end
      end else if (IP_RX_FRAME_VALID == 1'b 0 ) begin
            //  did not pass one of the following validity criteria
            //  (a) protocol is IP
            //  (b) unicast or multicast destination IP address matches
            //  (c) correct IP header checksum (IPv4 only)
            //  (d) allowed IPv6
         VALID_RX_TCP0 <= 1'b 0;   
      end else if (IP_PAYLOAD_SOF_D2 == 1'b 1 & TCP_STATE_localrx == 3 & ORIGINATOR_IDENTIFIED != RX_TCP_STREAM_SEL_D ) begin
            //  (g) TCP connection is established and origin MAC/IP/Port is inconsistent (spoof detection)
         VALID_RX_TCP0 <= 1'b 0;   
      end else if (IP_PAYLOAD_SOF_D2 == 1'b 1 & RX_TCP_STREAM_SEL_D == 0 ) begin
            //  destination port number does not match any of the specified TCP_LOCAL_PORTS
         VALID_RX_TCP0 <= 1'b 0;   
      end else if (IP_PAYLOAD_EOF == 1'b 1 ) begin
            //  additional checks performed exclusively at the end of frame
            //  mostly related to transmission errors (Ethernet FCS/CRC, TCP checksum)
         if (IP_RX_FRAME_VALID == 1'b 0) begin
            //  did not pass one of the following validity criteria
            //  (e) Ethernet frame is valid (correct FCS, dest address)
            VALID_RX_TCP0 <= 1'b 0;   
         end
      end else if (IP_PAYLOAD_EOF_D == 1'b 1 ) begin
         if (VALID_TCP_CHECKSUM == 1'b 0) begin
            VALID_RX_TCP0 <= 1'b 0;   
         end
      end
   end


assign VALID_RX_TCP_ALL = ((IP_PAYLOAD_EOF_D == 1'b 1) & (VALID_TCP_CHECKSUM == 1'b 0)) ? 1'b 0 : VALID_RX_TCP0; 
// to account for the late arrival of VALID_TCP_CHECKSUM (due to timing)

//  to account for the late arrival of VALID_TCP_CHECKSUM (due to timing)
//  Note: additional checks must be performed to forward data to the output data sink (TCP state = connected, 
//  enough space in data sink to accept the data).
// // COPY RX TCP DATA TO BUFFER ---------------------------------------------
//  Algorithm: TCP header length is in RX_TCP_DATA_OFFSET: range 5-15 words of 32-bit
//  sloppy but simple filtering of non-payload words
//  IMPORTANT: always left aligned (MSB first): RX_DATA_VALID is x80,xc0,xe0,xf0,....x01,x00 

   always @(posedge CLK) begin : RX_PAYLOAD_001
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1 | VALID_RX_TCP_ALL == 1'b 0 | GAP_IN_RX_SEQ == 1'b 1 | RX_OUTOFBOUND == 1'b 1) begin
         RX_DATA <= {64{1'b 0}};   
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 ) begin
         if (RX_TCP_DATA_OFFSET[0] == 1'b 0) begin
      //  TCP header length is an exact integer multiple of words
            RX_DATA <= IP_PAYLOAD_DATA;   
      //  offset by 1/2 a word
         end else begin if (TCP_SOF_FLAG == 1'b 1) begin
               if (IP_PAYLOAD_DATA_VALID[3] == 1'b 0) begin
      //  zero length payload
                  RX_DATA <= {64{1'b 0}};   
      //  left-aligned
               end else begin
                  RX_DATA[63:32] <= IP_PAYLOAD_DATA[31:0];   
                  RX_DATA[31:0] <= {32{1'b 0}};   
               end
            end else begin
               RX_DATA <= IP_PAYLOAD_DATA;   
            end
         end
      end
   end

//  IMPORTANT: always left aligned (MSB first): RX_DATA_VALID is x80,xc0,xe0,xf0,....x01,x00 

   always @(posedge CLK) begin : RX_PAYLOAD_002
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1 | VALID_RX_TCP_ALL == 1'b 0 | GAP_IN_RX_SEQ == 1'b 1 | RX_OUTOFBOUND == 1'b 1) begin
         RX_DATA_VALID_local <= {8{1'b 0}};   
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 ) begin
         if (RX_TCP_DATA_OFFSET[0] == 1'b 0) begin
      //  TCP header length is an exact integer multiple of words
            RX_DATA_VALID_local <= IP_PAYLOAD_DATA_VALID;   
      //  offset by 1/2 a word
         end else begin
            if (TCP_SOF_FLAG == 1'b 1) begin
               if (IP_PAYLOAD_DATA_VALID[3] == 1'b 0) begin
      //  zero length payload
                  RX_DATA_VALID_local <= {8{1'b 0}};   
      //  left-aligned
               end else begin
                  RX_DATA_VALID_local[7:4] <= IP_PAYLOAD_DATA_VALID[3:0];   
                  RX_DATA_VALID_local[3:0] <= {4{1'b 0}};   
               end
            end else begin
               RX_DATA_VALID_local <= IP_PAYLOAD_DATA_VALID;   
            end 
         end
      end else begin
         RX_DATA_VALID_local <= {8{1'b 0}};   
      end
   end

assign RX_DATA_VALID = RX_DATA_VALID_local; 

assign TCP_PAYLOAD_FLAG = ((IP_PAYLOAD_WORD_COUNT > 2) & (IP_PAYLOAD_WORD_COUNT > RX_TCP_DATA_OFFSET[3:1])) ? 1'b 1 : 1'b 0; 

//  wait until word#3 to assess possible presence of payload (since RX_TCP_DATA_OFFSET is only read at word #2
//  Note: we don't check byte validity here, so payload could still be empty.
//  Generate RX_SOF (looks like the above TCP_PAYLOAD_FLAG code, but is reset after the first payload word).
//  Also keep track of whether the received packet has zero data length or not. (Needed to 
//  determine whether an ACK should be sent)

   always @(posedge CLK) begin : RX_PAYLOAD_003
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1) begin
         TCP_SOF_FLAG <= 1'b 1;   
      //  Awaiting TCP_SOF word
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 ) begin
      //  reached the word where TCP_SOF is expected (if not empty frame)
         TCP_SOF_FLAG <= 1'b 0;   
      end
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1 | VALID_RX_TCP_ALL == 1'b 0 | GAP_IN_RX_SEQ == 1'b 1 | RX_OUTOFBOUND == 1'b 1) begin
         RX_SOF_local <= 1'b 0;   
         RX_TCP_STREAM_SEL_OUT <= {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   
      //  RX_TCP_NON_ZERO_DATA_LENGTH <= '0';
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 & TCP_SOF_FLAG == 1'b 1 ) begin
      //  generate SOF if non-zero data length in payload
         if (RX_TCP_DATA_OFFSET[0] == 1'b 0 & IP_PAYLOAD_DATA_VALID[7] == 1'b 1) begin
      //  TCP header length is an exact integer multiple of words and first payload word is not empty
            RX_SOF_local <= 1'b 1;   
            RX_TCP_STREAM_SEL_OUT <= RX_TCP_STREAM_SEL_D;   
      //  RX_TCP_NON_ZERO_DATA_LENGTH <= '1';
         end else if (RX_TCP_DATA_OFFSET[0] == 1'b 1 & IP_PAYLOAD_DATA_VALID[3] == 1'b 1 ) begin
            RX_SOF_local <= 1'b 1;   
            RX_TCP_STREAM_SEL_OUT <= RX_TCP_STREAM_SEL_D;   
      //  RX_TCP_NON_ZERO_DATA_LENGTH <= '1';
      //  first payload word but no data
         end else begin
            RX_SOF_local <= 1'b 0;   
            RX_TCP_STREAM_SEL_OUT <= {(NTCPSTREAMS - 1 - 0 + 1){1'b 0}};   

      //  RX_TCP_NON_ZERO_DATA_LENGTH <= '0';
         end
      end else begin
         RX_SOF_local <= 1'b 0;   
      end
   end

assign RX_SOF = RX_SOF_local; 

//  detect non-zero data length: check the presence of the first payload byte

   always @(posedge CLK) begin : RX_PAYLOAD_004
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1) begin
      //  RX_TCP_DATA_OFFSET is read at IP_PAYLOAD_WORD_COUNT = 2
         RX_TCP_NON_ZERO_DATA_LENGTH <= 1'b 0;   
      end else if (IP_PAYLOAD_WORD_VALID == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 & TCP_SOF_FLAG == 1'b 1 ) begin
         if (RX_TCP_DATA_OFFSET[0] == 1'b 0 & IP_PAYLOAD_DATA_VALID[7] == 1'b 1) begin
      //  TCP header length is an exact integer multiple of words and first payload word is not empty
            RX_TCP_NON_ZERO_DATA_LENGTH <= 1'b 1;   
         end else if (RX_TCP_DATA_OFFSET[0] == 1'b 1 & IP_PAYLOAD_DATA_VALID[3] == 1'b 1 ) begin
            RX_TCP_NON_ZERO_DATA_LENGTH <= 1'b 1;   
      //  first payload word but no data
         end else begin
            RX_TCP_NON_ZERO_DATA_LENGTH <= 1'b 0;   
         end
      end
   end


   //  generate RX_EOF

   always @(posedge CLK) begin : RX_PAYLOAD_005
      RX_EOF_D <= RX_EOF_local;   
      if (SYNC_RESET == 1'b 1 | IP_PAYLOAD_SOF == 1'b 1 | VALID_RX_TCP_ALL == 1'b 0 | GAP_IN_RX_SEQ == 1'b 1 | RX_OUTOFBOUND == 1'b 1) begin
         RX_EOF_local <= 1'b 0;   
      end else if (IP_PAYLOAD_EOF == 1'b 1 & TCP_PAYLOAD_FLAG == 1'b 1 ) begin
      //  detect empty frame
         if (TCP_SOF_FLAG == 1'b 1 & RX_TCP_DATA_OFFSET[0] == 1'b 0 & IP_PAYLOAD_DATA_VALID[7] == 1'b 0) begin
      //  even length header, empty frame
            RX_EOF_local <= 1'b 0;   
         end else if (TCP_SOF_FLAG == 1'b 1 & RX_TCP_DATA_OFFSET[0] == 1'b 1 & IP_PAYLOAD_DATA_VALID[3] == 1'b 0 ) begin
      //  odd length header, empty frame
            RX_EOF_local <= 1'b 0;   
      //  end of non-empty frame
         end else begin
            RX_EOF_local <= 1'b 1;   
         end
      end else begin
         RX_EOF_local <= 1'b 0;   
      end
   end

   assign RX_EOF = RX_EOF_local; 

always @( RX_TCP_NON_ZERO_DATA_LENGTH or GAP_IN_RX_SEQ or RX_OUTOFBOUND or VALID_RX_TCP_ALL ) 
RX_FRAME_VALID_local = ((RX_TCP_NON_ZERO_DATA_LENGTH == 1'b 1) & (GAP_IN_RX_SEQ == 1'b 0) & (RX_OUTOFBOUND == 1'b 0)) ? VALID_RX_TCP_ALL : 1'b 0; 
assign RX_FRAME_VALID = RX_FRAME_VALID_local; 

//  always verify the rx tcp frame validity at IP_PAYLOAD_EOF_D = RX_EOF
//  Do not forward data to the rx buffer if there is a gap in rx sequence or if the client 
//  is doing a zero window-length probe (i.e. writing past the declared max)
//  No point in writing non-TCP data to the rx buffer in the first place (those pesky
//  NetBUI packets fill-up pretty fast, even if we rewind the write pointer at the next valid
//  TCP packet
//  Also block data if not connected.

always @(RX_DATA_VALID_local) begin : WPTR_GEN_001
   if (RX_DATA_VALID_local[0] == 1'b 1) begin
      RX_TCP_SEQ_NO_INCREMENT <= 8;   
   end else if (RX_DATA_VALID_local[1] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 7;   
   end else if (RX_DATA_VALID_local[2] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 6;   
   end else if (RX_DATA_VALID_local[3] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 5;   
   end else if (RX_DATA_VALID_local[4] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 4;   
   end else if (RX_DATA_VALID_local[5] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 3;   
   end else if (RX_DATA_VALID_local[6] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 2;   
   end else if (RX_DATA_VALID_local[7] == 1'b 1 ) begin
      RX_TCP_SEQ_NO_INCREMENT <= 1;   
   end else begin
      RX_TCP_SEQ_NO_INCREMENT <= 0;   
   end
end

//  read the TCP client sequence number in the received TCP header. 
//  This is subsequently used as ack when replying or sending data to the TCP client

always @(posedge CLK) begin : RX_PAYLOAD_006

   IP_PAYLOAD_SOF_D <= IP_PAYLOAD_SOF;   
   IP_PAYLOAD_SOF_D2 <= IP_PAYLOAD_SOF_D;   
   if (IP_PAYLOAD_SOF_D == 1'b 1)
      begin
      RX_TCP_SEQ_NO_TRACK <= RX_TCP_SEQ_NO;   
      end
   else if (RX_DATA_VALID_local[7] == 1'b 1 ) begin
      //  at least one byte passed to rx elastic buffer
      RX_TCP_SEQ_NO_TRACK <= RX_TCP_SEQ_NO_TRACK + RX_TCP_SEQ_NO_INCREMENT;   
      end
   end
// // RX SEQUENCE NUMBER ------------------------
assign RX_TCP_SEQ_NO_INC = RX_TCP_SEQ_NO + 1; 

// Manage tx ack number
generate
   for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TX_ACK_GEN_001
      always @(posedge CLK) begin
         if (RX_TCP_STREAM_SEL[i] == 1'b 1) begin
            // rx event
            if (TCP_STATE[i] < 3 & EVENT1 == 1'b 1) begin
               // Received valid SYN while in LISTEN state
               // ACK sequence number is the one received + 1
               // Extend the applicability to the case when we receive multiple SYN messages (could happen
               // when transmission delay is long)  *062716
               TX_ACK_NO[(i*32)+:32] <= RX_TCP_SEQ_NO_INC;   
            end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS5[i] == 1'b 1 ) begin
               // Received valid FIN while in CONNECTED state
               // ACK sequence number depends on whether FIN packets include data or not
               TX_ACK_NO[(i*32)+:32] <= RX_TCP_SEQ_NO_TRACK + 1;   
            end else if (RX_ZERO_WINDOW_PROBE == 1'b 1 ) begin
               // TCP zero-window-length exception. sender may be testing whether the TX_ACK_WINDOW_LENGTH is 
               // still zero by sending a 1-byte data. Treat as a zero-length packet
            end else if (GAP_IN_RX_SEQ == 1'b 1 ) begin
               // Do not update TX_ACK_NO if we have received a valid packet with unexpected RX_TCP_SEQ_NO (gap in sequence)
               // as data was not written to the rx buffer, but we still send an ACK.
            end else if (RX_EOF_D == 1'b 1 & RX_FRAME_VALID_local == 1'b 1 ) begin
               // in CONNECTED state, received and successfully forwarded a rx segment. 
               // TX_ACK_NO is the next expected number
               TX_ACK_NO[(i*32)+:32] <= RX_TCP_SEQ_NO_TRACK;   
            end
         end
      end
   end
endgenerate
////////////////////////////////////////////////
//// TCP receive flow control //////////////////-
////////////////////////////////////////////////-

// Detect when RX_TCP_SEQ_NO is beyond the TCP receive window (it happens, for example during TCP zero-window probes)

always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         RX_OUTOFBOUND <= 1'b 0;   
      //  rx window upper bound (RX_TCP_SEQ_NO_MAX) computed upon sending the last tx frame.
      end else if (RX_TCP_SEQ_NO >= RX_TCP_SEQ_NO_MAX2 & ~(RX_TCP_SEQ_NO[31:30] == 2'b 11 & RX_TCP_SEQ_NO_MAX2[31:30] == 2'b 00) ) begin
      //  a bit complicated because of modulo 2^32 counters.
         RX_OUTOFBOUND <= 1'b 1;   
      end else if (RX_TCP_SEQ_NO < RX_TCP_SEQ_NO_MIN2 & ~(RX_TCP_SEQ_NO[31:30] == 2'b 00 & RX_TCP_SEQ_NO_MIN2[31:30] == 2'b 11) ) begin
         RX_OUTOFBOUND <= 1'b 1;   
      end else begin
         RX_OUTOFBOUND <= 1'b 0;   
      end
   end

//  Send ACK immediately upon receiving a valid data segment while TCP connected.
//  Watch out for infinite loops! cannot send an ACK on an ACK
//  Therefore, inhibit SEND_ACK_NOW if the last packet received has the ACK with zero-length.

assign SEND_ACK_NOW = ((TCP_STATE_localrx == 3) & (RX_TCP_NON_ZERO_DATA_LENGTH == 1'b 1) & (IP_PAYLOAD_EOF_D == 1'b 1)) ? VALID_RX_TCP_ALL : 1'b 0; 
//  *070118

//  Detect when there is a gap in the RX_TCP_SEQ_NO, indicating a previous frame is missing
//  In general, we expect RX_TCP_SEQ_NO to match TX_ACK_NO, the next expected rx sequence number.


assign GAP_IN_RX_SEQ = (RX_TCP_SEQ_NO != TX_ACK_NO2) ? 1'b 1 : 1'b 0; 
//  ready at IP_PAYLOAD_SOF_D2

//  Detect when client tries to send data past the end of the window (for example during 
//  TCP zero-window probing. Sender may be probing whether the TX_ACK_WINDOW_LENGTH is 
//    still zero by sending a 1-byte data past the end of the window. 

assign RX_ZERO_WINDOW_PROBE = TCP_STATE_localrx == 3 ? VALID_RX_TCP_ALL & RX_OUTOFBOUND : 1'b 0; 

generate
   for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin
      // external receive buffer is full 
      assign RX_BUF_FULL[i] = RX_FREE_SPACE[(i*32)+:32] == 0 ? 1'b 1 : 1'b 0; 
      // external receive buffer has space for at least one MSS frame *071416
      assign RX_BUF_1MSSFREE[i] = (RX_FREE_SPACE[(i*32)+:32] > MSS) ? 1'b 1 : 1'b 0; 
   end
endgenerate
// flow control information is sent to the client within the ack 
// using the TX_ACK_WINDOW_LENGTH window size FROZEN during packet transmission

(* MARK_DEBUG="true" *)wire    [31:0] xx;

assign xx = RX_FREE_SPACE[31:0];

   always @(posedge CLK) begin : TX_ACK_WINDOW_LENGTH_GEN_001
      TX_WINDOW_SCALEv = 4'h 0;   
      TX_ACK_WINDOW_LENGTHv = 32'b0;   //  *030521
      if (SYNC_RESET == 1'b 1) begin
         TX_ACK_WINDOW_LENGTHv = MSS;   //  initial available is at least 1 MSS
      end else if (RTS_local == 1'b 0 )  begin
            //  update TX_ACK_WINDOW_LENGTH when triggering a frame transmission 
            //  Two trigger events:
         if (NEXT_TX_TCP_FRAME_QUEUED == 1'b 1) begin
            //  short (no payload data) tx packet for stream NEXT_TX_TCP_STREAM_SEL
            for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
               if (NEXT_TX_TCP_STREAM_SEL[j] == 1'b 1) begin
                  TX_ACK_WINDOW_LENGTHv = RX_FREE_SPACE[(j*32)+:32];   
                  TX_WINDOW_SCALEv = TX_WINDOW_SCALE[(j*4)+:4];   
               end
            end
         end else if (EVENT8 == 1'b 1 ) begin
            //  long (with payload data) tx packet for stream TX_STREAM_SEL
            for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
               if (TX_STREAM_SEL[j] == 1'b 1) begin
                  TX_ACK_WINDOW_LENGTHv = RX_FREE_SPACE[(j*32)+:32];   
                  TX_WINDOW_SCALEv = TX_WINDOW_SCALE[(j*4)+:4];   
               end
            end
         end
      end
            //  new *080818 take a margin of 4 samples = 32 bytes when reporting about the available space in the rx buffer
            //  as we are trying to shorten the time between RX_EOF and ack transmission. 
            //  Reason: RX_FREE_SPACE information is 3 clocks late
      if (TX_ACK_WINDOW_LENGTHv >= 32) begin
         TX_ACK_WINDOW_LENGTHv = TX_ACK_WINDOW_LENGTHv - 32'h 00000020;   
      end else begin
         TX_ACK_WINDOW_LENGTHv = 'b0;   
      end
      if (SYNC_RESET == 1'b 1) begin
         TX_ACK_WINDOW_LENGTH <= {32{1'b 0}};   
         TX_ACK_WINDOW_LENGTH_SCALED <= {16{1'b 0}};   
      end else if (RTS_local == 1'b 0 & (NEXT_TX_TCP_FRAME_QUEUED == 1'b 1 | EVENT8 == 1'b 1) ) begin
         TX_ACK_WINDOW_LENGTH <= TX_ACK_WINDOW_LENGTHv;   
            //  window scaling (buffer sizes ranging from 256 to 1MB)
         case (TX_WINDOW_SCALEv)
         4'b 0000: begin
            TX_ACK_WINDOW_LENGTH_SCALED <= TX_ACK_WINDOW_LENGTHv[15:0];  //  <= 64kB
         end
         4'b 0001: begin
            TX_ACK_WINDOW_LENGTH_SCALED <= TX_ACK_WINDOW_LENGTHv[16:1];   
         end
         4'b 0010: begin
            TX_ACK_WINDOW_LENGTH_SCALED <= TX_ACK_WINDOW_LENGTHv[17:2];   
         end
         4'b 0011: begin
            TX_ACK_WINDOW_LENGTH_SCALED <= TX_ACK_WINDOW_LENGTHv[18:3];   
         end
         default:  begin 
            TX_ACK_WINDOW_LENGTH_SCALED <= TX_ACK_WINDOW_LENGTHv[19:4];   //  1MB
            end
         endcase
      end
   end

assign TX_ACK_WINDOW_LENGTH_OUT = TX_ACK_WINDOW_LENGTH_SCALED; 

// window resizing
// set when transmitting an ACK with TX_ACK_WINDOW_LENGTH = 0 indicating receiver buffer is full,
// clear when the input receive buffer is no longer empty. 
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: RX_WINDOW_RESIZE_STATEx
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         RX_WINDOW_RESIZE_STATE[(i*2)+:2] <= 2'b 00;   
         SEND_RX_WINDOW_RESIZE[i] <= 1'b 0;   
      end else if (TX_PACKET_SEQUENCE_START == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 & RX_BUF_FULL[i] == 1'b 1 ) begin
            // not enough room in rx buffer. Sending ACK with zero-width ACK window to client I.
         RX_WINDOW_RESIZE_STATE[(i*2)+:2] <= 2'b 01;   
      end else if (RX_WINDOW_RESIZE_STATE[(i*2)+:2] == 2'b 01 & MAC_TX_EOF == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 ) begin
            // completed transmission of the ACK with TX_ACK_WINDOW_LENGTH = 0 to client I
         RX_WINDOW_RESIZE_STATE[(i*2)+:2] <= 2'b 10;   
      end else if (RX_WINDOW_RESIZE_STATE[i] == 2'b 10 & RX_BUF_FULL[i] == 1'b 0 ) begin
            // Receive buffer has room for another segment. 
            // time to send unsollicited ACKs to indicate window resizing. The receive window is no
            // longer empty, the clients are on-hold due to the previous ACK with zero-width ack window.
         RX_WINDOW_RESIZE_STATE[(i*2)+:2] <= 2'b 00;   
         SEND_RX_WINDOW_RESIZE[i] <= 1'b 1;   
      end else begin
         SEND_RX_WINDOW_RESIZE[i] <= 1'b 0;   
      end
   end
end
endgenerate
// window resizing2 *071416
// set when the receive buffer available space goes very low and no further data is received (Windows OS waits 5 seconds)
// clear when the input receive buffer has enough room for a full MSS-size frame
// The objective is to avoid waiting a long time (5s) until the Windows OS decides to send data again. 
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: RX_WINDOW_RESIZE2_STATEx
always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         RX_WINDOW_RESIZE2_STATE[(i*2)+:2] <= 2'b 00;   
         SEND_RX_WINDOW_RESIZE2[i] <= 1'b 0;   
      end else if (TX_PACKET_SEQUENCE_START == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 & RX_BUF_1MSSFREE[i] == 1'b 0 ) begin
            // rx buffer is getting full... wait
         RX_WINDOW_RESIZE2_STATE[(i*2)+:2] <= 2'b 01;   
      end else if (RX_WINDOW_RESIZE2_STATE[(i*2)+:2] == 2'b 01 & MAC_TX_EOF == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 ) begin
            // completed transmission of the ACK  to client I
         RX_WINDOW_RESIZE2_STATE[(i*2)+:2] <= 2'b 10;   
      end else if (RX_WINDOW_RESIZE2_STATE[(i*2)+:2] == 2'b 10 & TX_TCP_STREAM_SEL[i] == 1'b 1 & RX_BUF_1MSSFREE[i] == 1'b 1 ) begin
            // receive buffer now has enough space on rx buffer for a full MSS-size frame. Go back to idle
         RX_WINDOW_RESIZE2_STATE[(i*2)+:2] <= 2'b 00;   
         SEND_RX_WINDOW_RESIZE2[i] <= 1'b 1;   
      end else begin
         SEND_RX_WINDOW_RESIZE2[i] <= 1'b 0;   
      end
      end
   end
endgenerate

// remember the receive window upper bound RX_TCP_SEQ_NO_MAX (exclusive)
// to compare with follow-on RX_TCP_SEQ_NO
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: RX_WINDOW_UPPER_BOUNDx
   always @(posedge CLK) begin
         if (SYNC_RESET == 1'b 1) begin
            RX_TCP_SEQ_NO_MAX[(i*32)+:32] <= 32'b0;   
         end else if (TX_PACKET_SEQUENCE_START == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 ) begin
            // compute the receive address ceiling when sending the sequence ack to the client.
            RX_TCP_SEQ_NO_MAX[(i*32)+:32] <= TX_ACK_NO[(i*32)+:32] + TX_ACK_WINDOW_LENGTH;
            // design note: TX_ACK_WINDOW_LENGTH is an aggregate value showing only space in the 
            // common rx buffer (common to all streams). TODO: change when TCP_RXBUFNDEMUX is upgrade
            // with individual buffers for each channel.
         end
   end
end
endgenerate
// RECEIVE CODE ABOVE ^^^^^^^^^^^^^^^^^^^
//==============================================================
//==============================================================
//==============================================================
//==============================================================
// TRANSMIT CODE BELOW  VVVVVVVVVVVVVVVVVV

//////////////////////////////////////////////////
////// Transmit EVENTS ///////////////////////////
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//////// TX SEQUENCER  ///////////////////////////
//////////////////////////////////////////////////
// First, schedule a TX frame based on RX events.
// The decision to transmit is made here and stored in non-volatile TX_PACKET_TYPE_QUEUED() variable until
// the actual frame transmission can take place. This is a kind of queue to avoid conflicts.
// Identify the stream based on the destination tcp port for each 
// incoming frame.

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: SCHEDULE_TX_FRAME_GEN_001
   always @(posedge CLK) begin
         if (SYNC_RESET == 1'b 1) begin
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 00;   // undefined tx packet type
         end else if (NEXT_TX_TCP_STREAM_SEL[i] == 1'b 1 & RTS_local == 1'b 0 & NEXT_TX_TCP_FRAME_QUEUED == 1'b 1 ) begin
            // scheduled for transmission, clear any tx frame queued
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 00;   // undefined tx packet type
         end else if (TCP_STATE[i] == 0 & RX_TCP_STREAM_SEL_D[i] == 1'b 1 & EVENT1 == 1'b 1 ) begin
            // Connection establishment. send SYN/ACK
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 01;   // SYN/ACK, 24 bytes TCP header, no TCP payload
            // send MSS option with the SYN message. TCP header is thus 24 byte long.
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & CONNECTION_RESET[i] == 1'b 1 ) begin
            // user-initiated selective connection request while connected. Send FIN.
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & TCP_KEEPALIVE_EN[i] == 1'b 1 & KASTATE[(i*2)+:2] == 0 ) begin
            // failed keepalive. Automatic disconnect. Send FIN.
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (TCP_STATE[i] == 7 & EVENTS5[i] == 1'b 1 ) begin
            // received FIN after FIN. Send final ACK.
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS5[i] == 1'b 1 ) begin
            // client-initiated connection termination . Send ACK
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (TCP_STATE[i] == 4 & EVENTS2[i] == 1'b 1 & TX_FLAGS[(i*8+4)+:1] == 1'b 1 ) begin
            // sent ACK after receiving FIN. send final FIN
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS11[i] == 1'b 1 ) begin
            // keep-alive or zero-window check: send a probe segment (zero-length, TX_SEQ_NO = RX_TCP_ACK_NO -1)
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (KA_PROBE_DET[i] == 1'b 1 ) begin
            // received a keep-alive probe segment. Send ack
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & RX_TCP_STREAM_SEL_D[i] == 1'b 1 & EVENT6 == 1'b 1 ) begin
            // received valid segment, no segment to transmit. generate ACK only.
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS10[i] == 1'b 1 ) begin
            // Window resizing (receive flow control), no segment to transmit. The receive buffer is no 
            // longer empty. Send a single ACK with a non-zero window.
            TX_PACKET_TYPE_QUEUED[(i*2)+:2] <= 2'b 10;   // 40-byte long ACK, 20 bytes TCP header
         end
   end
end
endgenerate

// Trigger response
// Which stream is next? Check if any non-payload packet is queued (TX_PACKET_TYPE_QUEUED(I) /= 0)

always @(TX_PACKET_TYPE_QUEUED)
   begin : NEXT_TCP_TX_STREAM_INDEX_001
   NEXT_TCP_TX_STREAM_INDEX_001_TX_STREAM_NO = 'b0;   
   NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED = 1'b0;   

   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1)
      begin
      if (NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED == 1'b 0 & TX_PACKET_TYPE_QUEUED[(j*2)+:2] != 2'b 00)
         begin
         NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED = 1'b 1;   
         NEXT_TCP_TX_STREAM_INDEX_001_TX_STREAM_NO[j] = 1'b 1;   //  rephrasing 081918
         end
      end
   NEXT_TX_TCP_STREAM_SEL <= NEXT_TCP_TX_STREAM_INDEX_001_TX_STREAM_NO;   
   NEXT_TX_TCP_FRAME_QUEUED <= NEXT_TCP_TX_STREAM_INDEX_001_TX_FRAME_QUEUED;   
   end

//  decision to transmit a frame (with or without payload) is made here.
//  TX_PACKET_TYPE is valid during transmission from the TX_PACKET_SEQUENCE_START pulse (incl) 
//  to MAC_TX_EOF (incl), undefined otherwise.

always @(posedge CLK) begin : TX_PACKET_SEQUENCE_START_GEN_001
   if (SYNC_RESET == 1'b 1) begin
      RTS_local <= 1'b 0;   
      TX_PACKET_TYPE <= 'b0;   //  undefined
   end else if (RTS_local == 1'b 0 ) begin

      //  Prevent a new packet assembly/transmission until current assembly/transmission is complete.
      if (NEXT_TX_TCP_FRAME_QUEUED == 1'b 1) begin
      //  short (no payload data) tx packet for stream NEXT_TX_TCP_STREAM_SEL
         RTS_local <= 1'b 1;   
         TX_PACKET_SEQUENCE_START <= 1'b 1;   
         TX_TCP_STREAM_SEL <= NEXT_TX_TCP_STREAM_SEL;   
         for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
            if (NEXT_TX_TCP_STREAM_SEL[j] == 1'b 1) begin
               TX_PACKET_TYPE <= TX_PACKET_TYPE_QUEUED[(j*2)+:2];   
            end
         end
      end else if (EVENT8 == 1'b 1 ) begin
         //  long (with payload data) tx packet for stream TX_STREAM_SEL
         RTS_local <= 1'b 1;   
         TX_PACKET_SEQUENCE_START <= 1'b 1;   
         TX_TCP_STREAM_SEL <= TX_STREAM_SEL;   
         TX_PACKET_TYPE <= 2'b 11;   //  tx data packet, 20 bytes TCP header
         end
   end else if (MAC_TX_EOF == 1'b 1 )  begin
         //  transmit is complete.
      RTS_local <= 1'b 0;   
      TX_PACKET_TYPE <= 'b0;   
   end else begin
      TX_PACKET_SEQUENCE_START <= 1'b 0;   //  make it a one-CLK pulse
   end
end

assign RTS = RTS_local; //  tell TCP_TX

//  send all relevant information to TCP_TX so that it can format the transmit frame

always @(*)
   begin : OUTPUT_GEN
   OUTPUT_GEN_TX_DEST_MAC_ADDRv = {48{1'b 0}};   
   OUTPUT_GEN_TX_DEST_IP_ADDRv = {128{1'b 0}};   
   OUTPUT_GEN_TX_DEST_PORT_NOv = {16{1'b 0}};   
   OUTPUT_GEN_TCP_LOCAL_PORTSv = {16{1'b 0}};   
   OUTPUT_GEN_TX_IPv4_6nv = 1'b 0;   
   OUTPUT_GEN_TX_SEQ_NO_OUTv = {32{1'b 0}};   
   OUTPUT_GEN_TX_ACK_NOv = {32{1'b 0}};   
   OUTPUT_GEN_TX_FLAGSv = {8{1'b 0}};   
   OUTPUT_GEN_TX_WINDOW_SCALEv = {4{1'b 0}};   

   for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
      if (TX_TCP_STREAM_SEL[j] == 1'b 1)
         begin
         OUTPUT_GEN_TX_DEST_MAC_ADDRv = TX_DEST_MAC_ADDR[j];   
         OUTPUT_GEN_TX_DEST_IP_ADDRv = TX_DEST_IP_ADDR[j];   
         OUTPUT_GEN_TX_DEST_PORT_NOv = TX_DEST_PORT_NO[(j*16)+:16];   
         OUTPUT_GEN_TCP_LOCAL_PORTSv = TCP_LOCAL_PORTS[(j*16)+:16];   
         OUTPUT_GEN_TX_IPv4_6nv = TX_IPv4_6n[j];   
         OUTPUT_GEN_TX_SEQ_NO_OUTv = TX_SEQ_NO_OUT_local[(j*32)+:32];   
         OUTPUT_GEN_TX_ACK_NOv = TX_ACK_NO[(j*32)+:32];   
         OUTPUT_GEN_TX_FLAGSv = TX_FLAGS[(j*8)+:8];   
         OUTPUT_GEN_TX_WINDOW_SCALEv = TX_WINDOW_SCALE[(j*4)+:4];   
         end
      TX_DEST_MAC_ADDR_OUT <= OUTPUT_GEN_TX_DEST_MAC_ADDRv;   
      TX_DEST_IP_ADDR_OUT <= OUTPUT_GEN_TX_DEST_IP_ADDRv;   
      TX_DEST_PORT_NO_OUT <= OUTPUT_GEN_TX_DEST_PORT_NOv;   
      TX_SOURCE_PORT_NO_OUT <= OUTPUT_GEN_TCP_LOCAL_PORTSv;   
      TX_IPv4_6n_OUT <= OUTPUT_GEN_TX_IPv4_6nv;   
      TX_SEQ_NO_OUT <= OUTPUT_GEN_TX_SEQ_NO_OUTv;   
      TX_ACK_NO_OUT <= OUTPUT_GEN_TX_ACK_NOv;   
      TX_FLAGS_OUT <= OUTPUT_GEN_TX_FLAGSv;   
      TX_WINDOW_SCALE_OUT <= OUTPUT_GEN_TX_WINDOW_SCALEv;   
      end
   end

assign TX_PACKET_SEQUENCE_START_OUT = TX_PACKET_SEQUENCE_START; 
assign TX_PACKET_TYPE_OUT = TX_PACKET_TYPE; 

////////////////////////////////////////////////
//// TCP transmit flow control //////////////////
////////////////////////////////////////////////
// last byte sent : TX_SEQ_NO
// last byte ack'd: RX_TCP_ACK_NO
// advertised rx window: RX_TCP_WINDOW_SIZE
// sent and unacknowledged: TX_SEQ_NO - RX_TCP_ACK_NO

// The next TCP tx frame size is determined by 
// (a) the maximum packet size in the MAC (assumed 9000 payload bytes in TCP_TXBUF) or
// (b) the effective TCP rx window size as reported by the receive side, or

// Effective TCP rx window size = advertised TCP rx window size - unacknowledged but sent data size
// changes at end of tx packet (TX_EOF_D2), and upon receiving a valid ack
// Partial computation upon receiving a valid ACK, complete computation upon frame transmission
// when TX_SEQ_NO is updated.
// The effective TCP rx window size can be temporarily reduced by the TCP congestion window.

// The TCP congestion window starts at 2 segments (see MSS) and doubles at each valid ACK.

always @(posedge CLK) begin
   if (SYNC_RESET == 1'b 1) begin
      EFF_RX_WINDOW_SIZE_PARTIAL_local <= 'b0;   
      EFF_RX_WINDOW_SIZE_PARTIAL_STREAM <= 'b0;   
      EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= 'b0;   
   end else if (TCP_STATE_localrx == 0 & EVENT1 == 1'b 1 ) begin //  *012020
//  Received valid SYN from client. First time we learn about window size
//  Note: window size advertized by client may change at the next ACK from client
//  Waste no time. We can start preparing transmit frames once we send the SYNC ACK to the client. 
//  anticipate RX_TCP_ACK_NO before we receive it. 
      EFF_RX_WINDOW_SIZE_PARTIAL_local <= RX_TCP_WINDOW_SIZE + TX_SEQ_NO_INIT + 1;   

      for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1)
         begin
         if (RX_TCP_STREAM_SEL_D[j] == 1'b 1)
            begin
            TCP_TX_SLOW_START[j] <= 1'b 0;   //  ignore slow-start phase  TEST TEST TEST
            end
         end
      EFF_RX_WINDOW_SIZE_PARTIAL_STREAM <= RX_TCP_STREAM_SEL_D;   
      EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= 1'b 1;   

//       elsif(TCP_STATE_localrx = 2) and (EVENT4 = '1') then
//          -- entering the 'connected' state
//          -- enter slow start phase: TCP congestion window starts with 2 segment. increases after each ACK
//          -- until we reach the effective window size advertized by the receive side.
//          EFF_RX_WINDOW_SIZE_PARTIAL_local <= RX_TCP_ACK_NO + 2*MSS;     
//          EFF_RX_WINDOW_SIZE_PARTIAL_STREAM <= RX_TCP_STREAM_SEL_D;
//          EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= '1';
//          for I in 0 to NTCPSTREAMS-1 loop
//             if(RX_TCP_STREAM_SEL_D(I) = '1') then
//                TCP_CONGESTION_WINDOW(I) <=  to_unsigned(2*MSS,16);    -- remember it for each stream
//                TCP_TX_SLOW_START(I) <= '1';
//             end if;
//          end loop;
      end
   else if (EVENT4A == 1'b 1 & RX_TCP_WINDOW_SIZE_SCALED != 0 ) begin
      //  Valid ACK received for stream RX_TCP_STREAM_SEL_D (not a duplicate ACK)
      for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
         if (RX_TCP_STREAM_SEL_D[j] == 1'b 1) begin
            if (TCP_TX_SLOW_START[j] == 1'b 1 & TCP_CONGESTION_WINDOW[(j * 32)+:31] < RX_TCP_WINDOW_SIZE[31:1]) begin
               //  double the next tx frame size until we reach the effective TCP rx window size
               EFF_RX_WINDOW_SIZE_PARTIAL_local <= {TCP_CONGESTION_WINDOW[(j * 32)+:31], 1'b 0} + RX_TCP_ACK_NO;   
               //  remember it here
               TCP_CONGESTION_WINDOW[(j * 32)+:31] <= {TCP_CONGESTION_WINDOW[(j * 32)+:31], 1'b 0};   
            end else begin
               EFF_RX_WINDOW_SIZE_PARTIAL_local <= RX_TCP_WINDOW_SIZE + RX_TCP_ACK_NO;   
               TCP_TX_SLOW_START[j] <= 1'b 0;   //  end of slow-start phase
            end
         end
      end
      EFF_RX_WINDOW_SIZE_PARTIAL_STREAM <= RX_TCP_STREAM_SEL_D;   
      EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= 1'b 1;   

      //  partial computation of the effective tcp rx window size
   end else if (EVENT4B == 1'b 1 & RX_TCP_WINDOW_SIZE_SCALED != 0 ) begin
      //  Duplicate ACK for stream RX_TCP_STREAM_SEL_D. Even though the RX_TCP_ACK_NO is the same, the
      //  RX_TCP_WINDOW_SIZE may have changed (window resizing)
      EFF_RX_WINDOW_SIZE_PARTIAL_local <= RX_TCP_WINDOW_SIZE + RX_TCP_ACK_NO;   

      for (j = 0; j <= NTCPSTREAMS - 1; j = j + 1) begin
         if (RX_TCP_STREAM_SEL_D[j] == 1'b 1) begin
            TCP_TX_SLOW_START[j] <= 1'b 0;   //  end of slow-start phase
         end
      end
      EFF_RX_WINDOW_SIZE_PARTIAL_STREAM <= RX_TCP_STREAM_SEL_D;   
      EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= 1'b 1;   
   end else begin
      //  ignore duplicate ACKs.
      EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local <= 1'b 0;   
   end
end
assign EFF_RX_WINDOW_SIZE_PARTIAL = EFF_RX_WINDOW_SIZE_PARTIAL_local; 
assign EFF_RX_WINDOW_SIZE_PARTIAL_VALID = EFF_RX_WINDOW_SIZE_PARTIAL_VALID_local;

generate
for(i = 0; i <= NTCPSTREAMS-1; i = i + 1) begin: RX_VALID_ACK_GENx
   // detect duplicate ACKs (an indication that at least one of our tx packet got lost/collided)
   // keep the flag up until (a) the condition disappears, or (b) we rewind and transmit a packet 
   // send duplicate if we have received three ACKs in a row with the same ack no.
   // why 3? because it is normal to receive two acks without lost packet (regular ack + window adjustment for example).

   // tell TCP_TXBUF about the last acknowledged location.
   assign RX_TCP_ACK_NO_D[(i*32)+:32] = RX_TCP_ACK_NO_D_local[(i*32)+:32]; 


   always @(posedge CLK) begin
      if (TCP_STATE[i] == 0 & RX_TCP_STREAM_SEL_D[i] == 1'b 1 & EVENT1 == 1'b 1) begin // *012020
            // Connection establishment. send SYN/ACK
            // tell TCP_TXBUF about the expected acknowledgment to compute the free space
            // (otherwise spurious transmissions may occur randomly after SYNC)
         RX_TCP_ACK_NO_D_local[(i*32)+:32] <= TX_SEQ_NO_INIT + 1;   
      end  else if (EVENTS4[i] == 1'b 1 ) begin
            // rx event:
            // save rx ack number (RX_TCP_ACK_NO is transient)
         RX_TCP_ACK_NO_D_local[(i*32)+:32] <= RX_TCP_ACK_NO;   
      end
   end


   always @(posedge CLK) begin
      if (EVENTS4[i] == 1'b 1) begin
            // rx event:
            // detect duplicates
         if (RX_TCP_ACK_NO_D_local[(i*32)+:32] == RX_TCP_ACK_NO & RX_TCP_ACK_NO != TX_SEQ_NO_local[(i*32)+:32] & RX_TCP_NON_ZERO_DATA_LENGTH == 1'b 0) begin // *120918
               // Ignore duplicates when already matching the expected TX_SEQ_NO_local
               // Ignore duplicates due to multiple received payloads while still transmitting.
            if (DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] != 3) begin
               DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] <= DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] + 1;    // counts from 0 to 3
            end
         end else begin
               // received new or expected ack. condition is gone.
            DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] <= 2'b 00;   
         end
      end   else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & TX_PACKET_SEQUENCE_START == 1'b 1 & TX_PACKET_TYPE == 2'b 11 & TX_SEQ_NO_local[(i*32)+:32] == RX_TCP_ACK_NO_D_local[(i*32)+:32] ) begin
               // tx event:
               // started retransmitting unacknowledged data. clear flag
         DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] <= 2'b 00;   
      end

   end
end
endgenerate


// detect keep-alive probe segment: RX_TCP_SEQ_NO is TX_ACK_NO -1 and no data
generate
for(i = 0; i <= NTCPSTREAMS-1; i = i + 1) begin: KA_PROBE_DET_GENx
   always @(posedge CLK) begin
      if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS12[i] == 1'b 1 & RX_TCP_NON_ZERO_DATA_LENGTH == 1'b 0 & RX_TCP_SEQ_NO_INC[15:0] == TX_ACK_NO[(i*16)+:16]) begin
            KA_PROBE_DET[i] <= 1'b1;   
      end else begin
         KA_PROBE_DET[i] <= 1'b0;   
      end
   end
end
endgenerate

// Retransmission timeout
// Compute timout since we have transmitted a packet and not received any ACK with different RX_TCP_ACK_NO.
// See RFC 2988 Section 5: Managing the RTO timer. 
// At this time, we do not implement the RTO max(60s) nor the backing-off algorithm for 
// repeated timeouts.

generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: RX_VALID_ACK_TIMEOUT_x
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1 | TCP_STATE[i] == 0 | TX_SEQ_NO_JUMP_local[i] == 1'b 1) begin
            // clear at start of connection
            // clear RETRANSMIT_FLAG when the TCP_TXBUF is informed of the pointer rewind -- *042419
         RX_VALID_ACK_TIMOUT[(i*24)+:24] <= 'b0;   
      end else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & TX_PACKET_TYPE == 2'b 11 & TX_PACKET_SEQUENCE_START == 1'b 1 ) begin // *062716
            // tx event: just (re)transmitted 1 frame with payload data. must wait for ACK
            // arm timer
         if (SIMULATION == 1'b 0) begin
            if (TXRX_DELAY[(i*24+7)+:12] < 12'h 03D) begin // timeout min = 1s  *061019              
               RX_VALID_ACK_TIMOUT[(i*24)+:24] <= 24'h 03D000;   
            end else begin
               RX_VALID_ACK_TIMOUT[(i*24)+:24] <= {TXRX_DELAY[(i*24)+:19], 5'b 00000};   // 32* the average round-trip delay -- *042419
            end
         end else begin
               // shorten rexmit during simulation -- *042419
            RX_VALID_ACK_TIMOUT[(i*24)+:24] <= {TXRX_DELAY[(i*24)+:22], 2'b 00};   //  4* the average round-trip delay
         end
      end else if (EVENTS4[i] == 1'b 1 & RX_TCP_ACK_NO[15:0] == TX_SEQ_NO_local[(i*32)+:16] ) begin
            // rx event: received a valid ACK, all outstanding data has been acknowledged
            // turn off the retransmission timer.
         RX_VALID_ACK_TIMOUT[(i*24)+:24] <= 'b0;   
      end else if (EVENTS4A[i] == 1'b 1 & RX_TCP_ACK_NO[15:0] != TX_SEQ_NO_local[(i*32)+:16] ) begin
            // rx event: received a valid ACK, not a duplicate, acknowledging new data
            // re-arm timer
         if (TXRX_DELAY[(i*24 + 7)+: 12] < 12'h 03D) begin
            RX_VALID_ACK_TIMOUT[(i*24)+:24] <= 24'h 03D000;   
         end else begin
            RX_VALID_ACK_TIMOUT[(i*24)+:24] <= {TXRX_DELAY[(i*24)+:20], 4'b 0000};   
         end
      end else if (TICK_4US == 1'b 1 & RX_VALID_ACK_TIMOUT[(i*24)+:24] > 1 ) begin
            // otherwise, decrement until counter reaches 1 (Re-transmit condition)
         RX_VALID_ACK_TIMOUT[(i*24)+:24] <= RX_VALID_ACK_TIMOUT[(i*24)+:24] - 1;   
      end
   end

   assign RETRANSMIT_FLAG[i] = ((RX_VALID_ACK_TIMOUT[(i*24)+:24] == 1) & (TX_SEQ_NO_JUMP_local[i] == 1'b 0)) ? 1'b 1 : 1'b 0; 
end
endgenerate


// Measure round-trip delay: server -> client -> server
// Units: 4us
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TXRX_DELAY_x
always @(posedge CLK)
   begin
      if (SYNC_RESET == 1'b 1) begin
         TXRX_DELAY_STATE[i] <= 1'b 0;   
         TXRX_DELAY_CNTR[(i*24)+:24] <= 24'b0;   
         TXRX_DELAY[(i*24)+:24] <= 24'h 01E848;  // 0.5s worst case default (leave 6 extra MSBs for xX multiplication in timeout)  
      end else if (TCP_STATE[i] == 0 ) begin
            // clear the last RT delay value at the start of connection
         TXRX_DELAY_STATE[i] <= 1'b 0;   
         TXRX_DELAY_CNTR[(i*24)+:24] <= 24'b0;   
         TXRX_DELAY[(i*24)+:24] <= 24'h 01E848;   // 0.5s worst case default (leave 6 extra MSBs for xX multiplication in timeout)
      end else if (TXRX_DELAY_STATE[i] == 1'b 0 & TX_PACKET_SEQUENCE_START == 1'b 1 & TX_TCP_STREAM_SEL[i] == 1'b 1 ) begin
            // regular tx event
         TXRX_DELAY_STATE[i] <= 1'b 1;   
            // start the stop watch
         TXRX_DELAY_CNTR[(i*24)+:24] <= 24'b0;   
      end else if (TXRX_DELAY_STATE[i] == 1'b 1 & EVENTS4[i] == 1'b 1 ) begin
            // received ACK
         TXRX_DELAY_STATE[i] <= 1'b 0;   
            // set a minimum RT delay value (here 32us)
         if (TXRX_DELAY_CNTR[(i*24+3)+:17] == 0) begin
            TXRX_DELAY[(i*24)+:24] <= 24'h 000008;   
         end else begin
            TXRX_DELAY[(i*24)+:24] <= TXRX_DELAY_CNTR[(i*24)+:24];   
         end
      end else if (TXRX_DELAY_STATE[i] == 1'b 1 & TICK_4US == 1'b 1 ) begin
            // increment stop watch up to 0.5s max
         if (TXRX_DELAY_CNTR[(i*24)+:24] < 24'h 01E848) begin
            TXRX_DELAY_CNTR[(i*24)+:24] <= TXRX_DELAY_CNTR[(i*24)+:24] + 1;   
         end else begin
            // reached the max value of 0.5s
            TXRX_DELAY_STATE[i] <= 1'b 0;   
            TXRX_DELAY[(i*24)+:24] <= TXRX_DELAY_CNTR[(i*24)+:24];   
         end
      end
   end
end
endgenerate
//
////////////////////////////////////////////////-
//// Transmit data //////////////////////////////
////////////////////////////////////////////////-
// 32-bit initial sequence number to be used at TCP connection time.
// This is simply a counter incremented every 4 usec.
always @(posedge CLK)
   begin : TCP_ISN_GEN
   if (CLK == 1'b 1)
      begin
      TCP_ISN_D <= TCP_ISN;   
//  pipelining for better timing
      if (TICK_4US == 1'b 1)
         begin
         TCP_ISN <= TCP_ISN + 1;   
         end
      end
   end

//  Manage tx sequence number. Changes based on INDEPENDENT rx and tx events (we may be receiving data about stream#1 
//  while transmitting data about stream#2).
//  To prevent deadlocks, TX_SEQ_NO should only change upon completing a frame transmission or when 
//  no data is waiting for transmission in TCP_TXBUF.
//  We keep two sets: TX_SEQ_NO_local has memory, TX_SEQ_NO_OUT_local is for output only, generally the same as TX_SEQ_NO_local
//  but can vary in special cases like probing (see keep-alive)

always @(TCP_ISN_D) begin : TX_SEQ_NO_INIT_GEN
   if (SIMULATION == 1'b 1) begin
//  During simulations, set the TX_SEQ_NO so that it matches Wireshark captures
//  (sequence number in the SYN/ACK packet)
//       TX_SEQ_NO_INIT <= x"17a872a6";
      TX_SEQ_NO_INIT <= 32'h F0000000;   

//       TX_SEQ_NO_INIT <= x"00000000";
//  use a random number (time)
      end
   else begin
      TX_SEQ_NO_INIT <= TCP_ISN_D;   
   end
end

   // forward information to TXBUF (to compute effective rx window size and reposition the buffer read
   // pointer)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TX_SEQ_NO_GENx
   assign TX_SEQ_NO[(i*32)+:32] = TX_SEQ_NO_local[(i*32)+:32]; //don't need the entire 32-bits
   always @(posedge CLK) begin
      if (RX_TCP_STREAM_SEL[i] == 1'b 1 & TCP_STATE[i] == 0 & EVENT1 == 1'b 1) begin
         // Received valid SYN while in LISTEN state
         // Save the initial sequence number
         TX_SEQ_NO_local[(i*32)+:32] <= TX_SEQ_NO_INIT;   
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= TX_SEQ_NO_INIT;   
         TX_SEQ_NO_JUMP_local[i] <= 1'b 1;   
      end else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & TX_PACKET_TYPE == 2'b 11 & TX_PACKET_SEQUENCE_START == 1'b 1 ) begin
         // regular tx event: 
         // just triggered transmission of a frame with TX_PAYLOAD_SIZE payload bytes.
         TX_SEQ_NO_local[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32] + TX_PAYLOAD_SIZE;   
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32] + TX_PAYLOAD_SIZE;   
         TX_SEQ_NO_JUMP_local[i] <= 1'b 0;   
      end else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & TX_PACKET_SEQUENCE_START == 1'b 1 & (TX_FLAGS[(i*8+1)+:1] == 1'b 1 | TX_FLAGS[(i*8)+:1] == 1'b 1) ) begin
         // tx event: 
         // SYN and FIN flags consumes a sequence number
         // Update sequence number upon tx completion, getting ready for comparison with the RX_TCP_ACK_NO
         TX_SEQ_NO_local[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32] + 1;   
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32] + 1;   
         TX_SEQ_NO_JUMP_local[i] <= 1'b 1;   
      end else if (RETRANSMIT_FLAG[i] == 1'b 1 & CONNECTED_FLAG_local[i] == 1'b 1 ) begin // NEW 11/4/11 AZ. this re-transmission scheme works only during connected state.
         // tx event. timeout awaiting for ACK. Rewind TX_SEQ_NO which will indirectly cause a re-transmission since
         // TCP_TXBUF will declare data ready to send.
         // Rewind tx sequence number to the last acknowledged seq no at the start of retransmission
         TX_SEQ_NO_local[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32];   
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32];   
         TX_SEQ_NO_JUMP_local[i] <= 1'b 1;   
      end else if (EVENTS4B[i] == 1'b 1 & DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] == 2 & RX_TCP_ACK_NO_D_local[(i*32)+:32] != FAST_REXMIT_SEQ_NO_START[(i*32)+:32] & RX_TCP_ACK_NO_D_local[(i*32)+:32] != FAST_REXMIT_SEQ_NO_END[(i*32)+:32] ) begin
         // rx event: received 3 duplicate acks (could be a missed packet). 
         // Do a TCP fast retransmission (while avoiding multiple fast retransmissions starting at the same tx seq no)
         // Rewind tx sequence number to the last acknowledged seq no at the start of retransmission
         // TCP_TXBUF will declare data ready to send.
         TX_SEQ_NO_local[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32];   
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32];   
         TX_SEQ_NO_JUMP_local[i] <= 1'b 1;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS11[i] == 1'b 1 ) begin
         // non-tx related events      
         // keep-alive or zero-window check: send a probe segment (zero-length, TX_SEQ_NO = RX_TCP_ACK_NO -1)
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32] - 1;   
      end else if (TX_TCP_STREAM_SEL[i] == 1'b 1 & MAC_TX_EOF == 1'b 1 ) begin
         // after transmitting a probe segment , restore the normal TX_SEQ_NO 
         TX_SEQ_NO_OUT_local[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32];   
      end else begin
         TX_SEQ_NO_JUMP_local[i] <= 1'b 0;  
      end
   end
end
endgenerate

   // remember the last rewind tx sequence number for TCP fast retransmission
   // This mechanism is to avoid multiple fast retransmission at the same tx sequence number 
   // which would otherwise occur because of propagation delay (tx keep receiving duplicate acks after a fast rexmit)
generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: FAST_REXMIT_001
   always @(posedge CLK) begin
      if (EVENTS4B[i] == 1'b1 & DUPLICATE_RX_TCP_ACK_CNTR[(i*2)+:2] == 2 & RX_TCP_ACK_NO_D_local[(i*32)+:32] != FAST_REXMIT_SEQ_NO_START[(i*32)+:32] & RX_TCP_ACK_NO_D_local[(i*32)+:32] != FAST_REXMIT_SEQ_NO_END[(i*32)+:32]) begin
         // TCP fast retransmit. Rewind address
         FAST_REXMIT_SEQ_NO_START[(i*32)+:32] <= RX_TCP_ACK_NO_D_local[(i*32)+:32];   
         FAST_REXMIT_SEQ_NO_END[(i*32)+:32] <= TX_SEQ_NO_local[(i*32)+:32];   
      end
   end
end
endgenerate

assign TX_SEQ_NO_JUMP = TX_SEQ_NO_JUMP_local; 

// Manage tx TCP flags:  
// (MSb) CWR Congestion Window Reduced (CWR) flag/ECE - ECN-Echo/URG/ACK/PSH/RST/SYN/FIN (LSb)


generate
for (i = 0; i <= NTCPSTREAMS - 1; i = i + 1) begin: TX_FLAGS_GEN_001
   always @(posedge CLK) begin
      if (SYNC_RESET == 1'b 1) begin
         TX_FLAGS[(i*8)+:8] <= 8'b0;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & CONNECTION_RESET[i] == 1'b 1 ) begin
         //user-initiated selective connection request while connected. Send FIN/ACK.
         TX_FLAGS[(i*8)+:8] <= 8'b 00010001;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & TCP_KEEPALIVE_EN[i] == 1'b 1 & KASTATE[(i*2)+:2] == 0 ) begin
         // failed keepalive. Automatic disconnect. Send FIN/ACK.        
         TX_FLAGS[(i*8)+:8] <= 8'b 00010001;   
      end else if (TCP_STATE[i] == 7 & EVENTS5[i] == 1'b 1 ) begin
         //received FIN after FIN. Send final ACK.        
         TX_FLAGS[(i*8)+:8] <= 8'b 00010000;   
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS5[i] == 1'b 1 ) begin
         //client-initiated connection termination . Send ACK         
         TX_FLAGS[(i*8)+:8] <= 8'b 00010000;   
      end else if (TCP_STATE[i] == 4 & EVENTS2[i] == 1'b 1 & TX_FLAGS[(i*8 + 4)+: 1] == 1'b 1 )  begin
         //sent ACK after receiving FIN. send final FIN/ACK      
         TX_FLAGS[(i*8)+:8] <= 8'b 00010001;   
      end else if (TCP_STATE_localrx == 0 & EVENT1 == 1'b 1 ) begin
         //Received valid SYN while in LISTEN state       
         TX_FLAGS[(i*8)+:8] <= 8'b 00010010;   
      end else if (EVENT8 == 1'b 1 ) begin
         //CONNECTED state(implied in EVENT8). send or re-send data. set PUSH flag        
         TX_FLAGS[(i*8)+:8] <= 8'b 00011000;   // flags in response
      end else if (TCP_STATE_localrx == 3 & (EVENTS5[i] == 1'b 1 | EVENT6 == 1'b 1 | EVENTS10[i] == 1'b 1 | EVENTS11[i] == 1'b 1) ) begin
         // CONNECTED state. ACK only. clear PUSH flag
         TX_FLAGS[(i*8)+:8] <= 8'b 00010000;   // flags in response
      end else if (TCP_STATE_localrx == 4 & EVENT2 == 1'b 1 ) begin
         // Connection termination. Send FIN
         TX_FLAGS[(i*8)+:8] <= 8'b 00010001;   // FIN/ACK flag set in response
      end else if (CONNECTED_FLAG_local[i] == 1'b 1 & EVENTS11[i] == 1'b 1 ) begin
            //keep-alive or zero-window check: send a probe segment (zero-length, TX_SEQ_NO = RX_TCP_ACK_NO -1)
         TX_FLAGS[(i*8)+:8] <= 8'b 00000000;   // flags in response
      end else if (KA_PROBE_DET[i] == 1'b 1 ) begin
            // received a keep-alive probe segment. Send ack
         TX_FLAGS[(i*8)+:8] <= 8'b 00010000;   // flags in response
      end
   end
end
endgenerate

//// Test Point
// TP(10 downto 1) <= (others => '0');
// DEBUG
always @(posedge CLK) begin
      if (TCP_MAX_WINDOW_SIZE == 17) begin
         TP[1] <= 1'b 1;   
      end else begin
         TP[1] <= 1'b 0;   
      end
      if (EVENT1 == 1'b 1 & TCP_OPTION_WINDOW_SCALE == 0) begin
         TP[2] <= 1'b 1;   
      end else begin
         TP[2] <= 1'b 0;   
      end
      if (EVENT1 == 1'b 1 & TCP_OPTION_WINDOW_SCALE == 1) begin
         TP[3] <= 1'b 1;   
      end else begin
         TP[3] <= 1'b 0;   
      end
      if (EVENT1 == 1'b 1 & TCP_OPTION_WINDOW_SCALE == 8) begin
         TP[4] <= 1'b 1;   
      end else begin
         TP[4] <= 1'b 0;   
      end
      if (TX_WINDOW_SCALE[0] == 0) begin
         TP[5] <= 1'b 1;   
      end else begin
         TP[5] <= 1'b 0;   
      end
      if (TX_WINDOW_SCALE[0] == 1) begin
         TP[6] <= 1'b 1;   
      end else begin
         TP[6] <= 1'b 0;   
      end
      TP[7] <= 1'b 1;   
      TP[8] <= 1'b 1;   
      if (TCP_STATE_localrx == 0 & EVENT1 == 1'b 1) begin
         TP[9] <= 1'b 1;   
      end else begin
         TP[9] <= 1'b 0;   
      end
end


endmodule // module TCP_SERVER_10G

