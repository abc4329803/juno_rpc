/*******************************************************************************

-- File Type:    Verilog HDL 
-- Tool Version: VHDL2verilog 20.50
-- Input file was: ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\COM5502_TOP.vhd
-- Command line was: F:\SynaptiCAD\bin\win32\vhdl2verilog.exe ..\..\..\Ethernet\10G_TCP\server\top\top.srcs\sources_1\new\COM5502_TOP.vhd -ncc
-- Date Created: Sun Nov 27 13:17:05 2022

*******************************************************************************/

`define false 1'b 0
`define FALSE 1'b 0
`define true 1'b 1
`define TRUE 1'b 1

`timescale 1 ns / 1 ns // timescale for following modules


// --------------------------------------------------------------------------------
//  Company: 
//  Engineer: 
//  
//  Create Date: 2021/10/08 10:26:23
//  Design Name: 
//  Module Name: COM5502_TOP - Behavioral
//  Project Name: 
//  Target Devices: 
//  Tool Versions: 
//  Description: 
//  
//  Dependencies: 
//  
//  Revision:
//  Revision 0.01 - File Created
//  Additional Comments:
//  
// --------------------------------------------------------------------------------

module COM5502_TOP #(
		parameter	[7:0]			NTCPSTREAMS = 2,
			// number of concurrent TCP streams handled by this component
		parameter					NUDPTX = 1,		
		parameter					NUDPRX = 1,
			// Enable/disable UDP protocol for tx and rx
		parameter 	[13:0]			MTU = 1500,
			// Maximum Transmission Unit: maximum number of payload Bytes.
			// Typically 1500 for standard frames, 9000 for jumbo frames.
			// A frame will be deemed invalid if its payload size exceeds this MTU value.
			// Should match the values in MAC layer)
			// For maximum TCP throughput, select MTU = (buffer size/4) + 60 bytes (IP/TCP header)
			// for example, when ADDR_WIDTH = 12, best MTU is 8252. It will work at MTU = 9000 but with a 
			// small degradation in TCP throughput.
		parameter 	[4:0]			TCP_TX_WINDOW_SIZE = 15,
		parameter 	[4:0]			TCP_RX_WINDOW_SIZE = 15,		
			// Window size is expressed as 2**n Bytes. Thus a value of 15 indicates a window size of 32KB.
			// this generic parameter determines how much memory is allocated to buffer tcp tx/rx streams. 
			// It applies equally to all concurrent streams (no individualization)
			// purpose: tradeoff memory utilization vs throughput. 
			// Memory size ranges from 2KB (multiple streams/lower individual throughput) to 1MB (single stream/maximum throughput)
		parameter 					IPv6_ENABLED = 1'b0,
            // 0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)
		parameter 					DHCP_SERVER_EN = 1'b0,
			// instantiate ('1') a DHCP server
			// One can instantiate both DHCP server and DHCP client at the same time, but not enable them simultaneously
		parameter 					DHCP_CLIENT_EN = 1'b0,
			// '0' for static address (for minimum size), '1' for static/dynamic address (instantiates a DHCP_CLIENT component)
			// One can instantiate both DHCP server and DHCP client at the same time, but not enable them simultaneously
		parameter 					IGMP_EN = 1'b0,
			// '1' to enable UDP multicast (which requires IGMP)
		parameter 	[5:0]			TX_IDLE_TIMEOUT = 50,
			// inactive input timeout, expressed in 4us units. -- 50*4us = 200us 
			// Controls the TCP transmit stream segmentation: data in the elastic buffer will be transmitted if
			// no input is received within TX_IDLE_TIMEOUT, without waiting for the transmit frame to be filled with MSS data bytes.
		parameter 	[5:0]			TCP_KEEPALIVE_PERIOD = 60,
			// period in seconds for sending no data keepalive frames. 
			// "Typically TCP Keepalives are sent every 45 or 60 seconds on an idle TCP connection, and the connection is 
			// dropped after 3 sequential ACKs are missed" 
		parameter 	[7:0]			CLK_FREQUENCY = 156,
			// CLK frequency in MHz. Needed to compute actual delays.
		parameter 					SIMULATION = 1'b0
			// 1 during simulation with Wireshark .cap file, '0' otherwise
			// Wireshark many not be able to collect offloaded checksum computations.
			// when SIMULATION =  '1': (a) IP header checksum is valid if 0000,
			// (b) TCP checksum computation is forced to a valid 00001 irrespective of the 16-bit checksum
			// captured by Wireshark.

)(

		//-- CLK, RESET
		input  						CLK,
			// 10G: PHY/MAC clock at 156.25 MHz
			// 1G: User clock. Must be 125 MHz or above for 1G, 25 MHz or above for 100Mbps
			// GLOBAL clock
		input   					SYNC_RESET,
			// CLK-synchronous reset. MANDATORY after all configuration fields are defined.
		
		//-- CONFIGURATION
		// usage: use SYNC_RESET after a configuration change
		input   [47:0] 				MAC_ADDR,
		input   					DYNAMIC_IPv4,
			// '1' if dynamic IPv4 address using an external DHCP server, '0' if fixed (static) IPv4 address.
			// Dynamic IP address requires the generic parameter DHCP_CLIENT_EN = '1' to instantiate a DHCP client within.
			// Mutually exclusive with DHCP_SERVER_EN2 (chose DHCP client OR server, but not both)
		input   [31:0] 				REQUESTED_IPv4_ADDR,
			// fixed IP address if static, or requested IP address if dynamic (DHCP_CLIENT_EN and DYNAMIC_IP = '1').
			// In the case of dynamic IP, this is typically the last IP address, as stored in external non-volatile memory.
			// In the case of dynamic IP, use 0.0.0.0 if no previous IP address is available.
			// In the case of dynamic IP, this field is read only when SYNC_RESET = '1'
			// Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
		input   [31:0] 				IPv4_MULTICAST_ADDR, 
            // to receive UDP multicast messages. One multicast address only
            // 0.0.0.0 to signify that IP multicasting is not supported here.
		input   [31:0] 				IPv4_SUBNET_MASK,
			// Ignored when the DHCP client feature is enabled, as the DHCP server provides the gateway information. 
		input   [31:0] 				IPv4_GATEWAY_ADDR,
			// Ignored when the DHCP client feature is enabled, as the DHCP server provides the gateway information. 
		input   [127:0] 			IPv6_ADDR,
            // local IP address. 16 bytes for IPv6
		input   [7:0] 				IPv6_SUBNET_PREFIX_LENGTH,
				 // 128 - subnet size in bits. Usually expressed as /n. Typical range 64-128
		input   [127:0] 			IPv6_GATEWAY_ADDR,

		// User-initiated connection reset for stream I
		input   [NTCPSTREAMS - 1:0] CONNECTION_RESET,
		input   [NTCPSTREAMS - 1:0] TCP_KEEPALIVE_EN,
			// enable TCP Keepalive (1) or not (0)

		//-- DHCP SERVER CONFIGURATION
		input						DHCP_SERVER_EN2,
			// enable(1)/disable(0) DHCP server at run-time. Requires DHCP_SERVER to be instantiated through DHCP_SERVER_EN
			// Mutually exclusive with DYNAMIC_IP (chose DHCP client OR server, but not both)
		input   [7:0] 				DHCP_SERVER_IP_MIN_LSB,
		input   [7:0] 				DHCP_SERVER_NIPs,

			// range of IP addresses to be assigned by this DHCP server
			// the actual address is in the form IPv4_ADDR for the 3 MSB, and a subnet address between IP_MIN (inclusive)
			// and IP_MIN + NIPs -1 (inclusive)
			// Maximum 128 entries.
			// For example, if IPv4_ADDR = 172.16.1.3, IP_MIN = 10, NIPs = 10, this DHCP server will assign and keep track of 
			// IP addresses in the range 172.16.1.10 and 172.16.1.19 (inclusive).
		input   [31:0] 				DHCP_SERVER_LEASE_TIME,
			// DHCP server to provide a lease time in secs to DHCP clients. 
			// applicable only when DHCP server is instantiated within and enabled, DHCP_SERVER_EN/DHCP_SERVER_EN2='1'
		input   [31:0] 				DHCP_ROUTER,
			// DHCP server to provide a router IP address to DHCP clients. 
			// In a typical configuration, the router address is this device's address.
			// However, the network administrator can decide to use point to another router (in effect rendering this router LAN to WAN link inoperative)
		input   [31:0] 				DHCP_SERVER_DNS,
			// DHCP server to provide DNS address to DHCP clients. 
			// applicable only when DHCP server is instantiated within and enabled, DHCP_SERVER_EN/DHCP_SERVER_EN2='1'

		//-- Protocol -> Transmit MAC Interface
		  //32-bit CRC is automatically appended by the MAC layer. User should not supply it.
		output   [63:0] 			MAC_TX_DATA, 
			// MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID = '1'
			// Bytes order: LSB was received first
			// Bytes are right aligned: first byte in LSB, occasional follow-on fill-in Bytes in the MSB(s)
			// The first destination address byte is always a LSB (MAC_TX_DATA(7:0))
		output   [7:0] 				MAC_TX_DATA_VALID,
			// data valid, for each byte in MAC_TX_DATA
		output 						MAC_TX_SOF,
			// start of frame: '1' when sending the first byte. 
			// Aligned with MAC_TX_DATA_VALID
		output						MAC_TX_EOF,
			// End of frame: '1' when sending the last byte in a packet to be transmitted. 
			// Aligned with MAC_TX_DATA_VALID
		input						MAC_TX_CTS,
			// MAC-generated Clear To Send flow control signal, indicating room in the 
			// MAC tx elastic buffer for a complete frame of size MTU 
			// The user should check that this signal is high before deciding to send
			// sending the next frame. 

		output   MAC_TX_RTS,
			// '1' when at least one of the inner processes is ready to transmit. Will on transmit when CTS goes high.
			// useful if there is an external transmission arbiter (for example in the case of multiple clients)

		//-- Receive MAC -> Protocol
		// Valid rx packets only: packets with bad CRC or invalid address are discarded in the MAC
		// The 32-bit CRC is always removed by the MAC layer.
		input   [63:0] 				MAC_RX_DATA,
			// USER reads the data at the rising edge of CLK when MAC_RX_DATA_VALID /= 0
			// Bytes order: LSB was received first
			// Bytes are right aligned: first byte in LSB, occasional follow-on fill-in Bytes in the MSB(s)
			// The first destination address byte is always a LSB (MAC_RX_DATA(7:0))
		input   [7:0] 				MAC_RX_DATA_VALID,
			// data valid, for each byte in MAC_RX_DATA
		input						MAC_RX_SOF,
			// '1' when sending the first byte in a received packet. 
			// Aligned with MAC_RX_DATA_VALID
		input						MAC_RX_EOF,
			// '1' when sending the last byte in a received packet. 
			// Aligned with MAC_RX_DATA_VALID
		input						MAC_RX_FRAME_VALID,
			// this component verifies the frame validity (CRC good, length, MAC address) at
			// the end of the frame (when MAC_RX_EOF). 

		//-- Application <- UDP rx payload
		output   [63:0] 			UDP_RX_DATA,
 		    // byte order: MSB first (reason: easier to read contents during simulation)
		output   [7:0] 				UDP_RX_DATA_VALID,
		    // example: 1 byte -> 0x80, 2 bytes -> 0xC0
		output   					UDP_RX_SOF,	   // start of UDP payload data field
		output   					UDP_RX_EOF,	   // end of UDP frame
		output   					UDP_RX_FRAME_VALID,
			// check entire frame validity at UDP_RX_EOF
			// 1 CLK pulse indicating that UDP_RX_DATA is the last byte in the UDP payload data field.
			// ALWAYS CHECK UDP_RX_FRAME_VALID at the end of packet (UDP_RX_EOF = '1') to confirm
			// that the UDP packet is valid. External buffer may have to backtrack to the the last
			// valid pointer to discard an invalid UDP packet.
			// Reason: we only knows about bad UDP packets at the end.
		input   [15:0] 				UDP_RX_DEST_PORT_NO_IN,
		input   [15:0] 				UDP_RX_SOURCE_PORT_NO_IN,
		input   					CHECK_UDP_RX_DEST_PORT_NO,
			// check the destination port number matches UDP_RX_DEST_PORT_NO (1) or ignore it (0)
			// The latter case is useful when this component is shared among multiple UDP ports
		output   [15:0] 			UDP_RX_DEST_PORT_NO_OUT,
			// Collected destination UDP port in received UDP frame. Read when APP_EOF = '1' 
				
		//-- Application -> UDP tx
		input   [63:0] 				UDP_TX_DATA,
			// byte order: MSB first (reason: easier to read contents during simulation)
			// unused bytes are expected to be zeroed
		input   [7:0] 				UDP_TX_DATA_VALID,
		    // example: 1 byte -> 0x80, 2 bytes -> 0xC0
		input						UDP_TX_SOF,	// 1 CLK-wide pulse to mark the first byte in the tx UDP frame
		input						UDP_TX_EOF,	// 1 CLK-wide pulse to mark the last byte in the tx UDP frame
		output						UDP_TX_CTS,	
		output						UDP_TX_ACK,	// 1 CLK-wide pulse indicating that the previous UDP frame is being sent
		output						UDP_TX_NAK,	// 1 CLK-wide pulse indicating that the previous UDP frame could not be sent
		input   [127:0] 			UDP_TX_DEST_IP_ADDR,
		input   					UDP_TX_DEST_IPv4_6n,
		input   [15:0] 				UDP_TX_DEST_PORT_NO,
		input   [15:0] 				UDP_TX_SOURCE_PORT_NO,
			// the IP and port information is latched in at the UDP_TX_SOF pulse.
			// USAGE: wait until the previous UDP tx frame UDP_TX_ACK or UDP_TX_NAK to send the follow-on UDP tx frame
		
		//-- Application <- TCP rx
		// NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
        // Usage: application raises the Clear-To-Send flag for one CLK. If a 64-bit word is available to be read, it is
        // placed in RX_APP_DATA with a latency of 2 CLKs. In this case RX_APP_DATA_VALID(I) = x"FF" indicating a data width of 8 bytes.
        // The application can also request to 'peek' into the next 8-bytes in memory by raising RX_APP_PEEK_NEXT(I) for one CLK. 
        // The data will also be placed in RX_APP_DATA and the width (which can be 1-8 bytes) will  be placed in RX_APP_DATA_VALID.
        // Peeking does not advance the read pointer. It is mutually exclusive with a Clear-To-Send request. It has lower priority.
		input   [16 * NTCPSTREAMS - 1:0] 	TCP_LOCAL_PORTS,
			// TCP_SERVER port configuration. Each one of the NTCPSTREAMS streams handled by this
			// component must be configured with a distinct port number. 
			// This value is used as destination port number to filter incoming packets, 
			// and as source port number in outgoing packets.
		output   [64 * NTCPSTREAMS - 1:0] 	TCP_RX_DATA,
		output   [8 * NTCPSTREAMS - 1:0] 	TCP_RX_DATA_VALID,
		output   [NTCPSTREAMS - 1:0] 		TCP_RX_RTS,
		input    [NTCPSTREAMS - 1:0] 		TCP_RX_CTS,
			// 1 CLK pulse to read the next (partial) word TCP_RX_DATA
			// Latency: 2 CLKs to TCP_RX_DATA, but only IF AND ONLY IF the next word has at least one available byte.
		output   [NTCPSTREAMS - 1:0] 		TCP_RX_CTS_ACK,
			// '1' the TCP_RX_CTS request for new data is accepted:
			// indicating that a new (maybe partial) word will be placed on the output TCP_RX_DATA at the next CLK.
		
		//-- Application -> TCP tx
		// NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
		input   [64 * NTCPSTREAMS - 1:0] 	TCP_TX_DATA,
		input   [8 * NTCPSTREAMS - 1:0] 	TCP_TX_DATA_VALID,
		input   [NTCPSTREAMS - 1:0] 		TCP_TX_DATA_FLUSH,
		output   [NTCPSTREAMS - 1:0] 		TCP_TX_CTS,
			// Clear To Send = transmit flow control. 
			// App is responsible for checking the CTS signal before sending APP_DATA
 		    // byte order: MSB first (reason: easier to read contents during simulation)
			// All input words must include 8 bytes of data (TCP_TX_DATA_VALID = x"FF") except the last word which can 
            // be partially filled with 1-8 bytes of data.

		//-- TEST POINTS, COMSCOPE TRACES
		output   [NTCPSTREAMS - 1:0] 		TCP_CONNECTED_FLAG,
		output   [7:0] 						CS1,
		output   							CS1_CLK, 
		output   [7:0] 						CS2,
		output   							CS2_CLK, 
		output   [63:0] 					DEBUG1, 
		output   [63:0] 					DEBUG2, 
		output   [63:0] 					DEBUG3,
		output   [10:1] 					TP
   
   );
 
/*
wire    [NTCPSTREAMS - 1:0] CONNECTION_RESET_s; 
wire    [NTCPSTREAMS - 1:0] TCP_KEEPALIVE_EN_s; 
wire    [15:0] TCP_LOCAL_PORTS_s [15:0]; 
wire    [63:0] TCP_RX_DATA_s [63:0]; 
wire    [7:0] TCP_RX_DATA_VALID_s [7:0]; 
wire    [NTCPSTREAMS - 1:0] TCP_RX_RTS_s; //  Ready To Send
wire    [NTCPSTREAMS - 1:0] TCP_RX_CTS_s; 
wire    [NTCPSTREAMS - 1:0] TCP_RX_CTS_ACK_s; 
wire    [63:0] TCP_TX_DATA_s [63:0]; 
wire    [7:0] TCP_TX_DATA_VALID_s [7:0]; 
wire    [NTCPSTREAMS - 1:0] TCP_TX_DATA_FLUSH_s; 
wire    [NTCPSTREAMS - 1:0] TCP_TX_CTS_s; 
*/

COM5502  #(
      .NTCPSTREAMS(NTCPSTREAMS),
      .NUDPTX(NUDPTX),
      .NUDPRX(NUDPRX),
      .MTU(MTU),
      .TCP_TX_WINDOW_SIZE(TCP_TX_WINDOW_SIZE),
      .TCP_RX_WINDOW_SIZE(TCP_RX_WINDOW_SIZE),
      .IPv6_ENABLED(IPv6_ENABLED),
      .DHCP_SERVER_EN(DHCP_SERVER_EN),
      .DHCP_CLIENT_EN(DHCP_CLIENT_EN),
      .IGMP_EN(IGMP_EN),
      .TX_IDLE_TIMEOUT(TX_IDLE_TIMEOUT),
      .TCP_KEEPALIVE_PERIOD(TCP_KEEPALIVE_PERIOD),
      .CLK_FREQUENCY(CLK_FREQUENCY),
      .SIMULATION(SIMULATION)
)IPSTACK_001
(	
// //-- CLK, RESET
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET),
          
// //-- CONFIGURATION
          .MAC_ADDR(MAC_ADDR),
          .DYNAMIC_IPv4(DYNAMIC_IPv4),
          .REQUESTED_IPv4_ADDR(REQUESTED_IPv4_ADDR),
          .IPv4_MULTICAST_ADDR(IPv4_MULTICAST_ADDR),
          .IPv4_SUBNET_MASK(IPv4_SUBNET_MASK),
          .IPv4_GATEWAY_ADDR(IPv4_GATEWAY_ADDR),
          .IPv6_ADDR(IPv6_ADDR),
          .IPv6_SUBNET_PREFIX_LENGTH(IPv6_SUBNET_PREFIX_LENGTH),
          .IPv6_GATEWAY_ADDR(IPv6_GATEWAY_ADDR),
          
// // User-initiated connection reset for stream I
          .CONNECTION_RESET(CONNECTION_RESET),
          .TCP_KEEPALIVE_EN(TCP_KEEPALIVE_EN),
          
// //-- DHCP SERVER CONFIGURATION
          .DHCP_SERVER_EN2(DHCP_SERVER_EN2),
          .DHCP_SERVER_IP_MIN_LSB(DHCP_SERVER_IP_MIN_LSB),
          .DHCP_SERVER_NIPs(DHCP_SERVER_NIPs),
          .DHCP_SERVER_LEASE_TIME(DHCP_SERVER_LEASE_TIME),
          .DHCP_ROUTER(DHCP_ROUTER),
          .DHCP_SERVER_DNS(DHCP_SERVER_DNS),
          
// //-- Protocol -> Transmit MAC Interface
          .MAC_TX_DATA(MAC_TX_DATA),
          .MAC_TX_DATA_VALID(MAC_TX_DATA_VALID),
          .MAC_TX_SOF(MAC_TX_SOF),
          .MAC_TX_EOF(MAC_TX_EOF),
          .MAC_TX_CTS(MAC_TX_CTS),
          .MAC_TX_RTS(MAC_TX_RTS),
          
// //-- Receive MAC -> Protocol
          .MAC_RX_DATA(MAC_RX_DATA),
          .MAC_RX_DATA_VALID(MAC_RX_DATA_VALID),
          .MAC_RX_SOF(MAC_RX_SOF),
          .MAC_RX_EOF(MAC_RX_EOF),
          .MAC_RX_FRAME_VALID(MAC_RX_FRAME_VALID),
          
// //-- Application <- UDP rx payload
          .UDP_RX_DATA(UDP_RX_DATA),
          .UDP_RX_DATA_VALID(UDP_RX_DATA_VALID),
          .UDP_RX_SOF(UDP_RX_SOF),
          .UDP_RX_EOF(UDP_RX_EOF),
          .UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID),
          .UDP_RX_DEST_PORT_NO_IN(UDP_RX_DEST_PORT_NO_IN),
          .UDP_RX_SOURCE_PORT_NO_IN(UDP_RX_SOURCE_PORT_NO_IN),
          .CHECK_UDP_RX_DEST_PORT_NO(CHECK_UDP_RX_DEST_PORT_NO),
          .UDP_RX_DEST_PORT_NO_OUT(UDP_RX_DEST_PORT_NO_OUT),
          
// //-- Application -> UDP tx
          .UDP_TX_DATA(UDP_TX_DATA),
          .UDP_TX_DATA_VALID(UDP_TX_DATA_VALID),
          .UDP_TX_SOF(UDP_TX_SOF),
          .UDP_TX_EOF(UDP_TX_EOF),
          .UDP_TX_CTS(UDP_TX_CTS),
          .UDP_TX_ACK(UDP_TX_ACK),
          .UDP_TX_NAK(UDP_TX_NAK),
          .UDP_TX_DEST_IP_ADDR(UDP_TX_DEST_IP_ADDR),
          .UDP_TX_DEST_IPv4_6n(UDP_TX_DEST_IPv4_6n),
          .UDP_TX_DEST_PORT_NO(UDP_TX_DEST_PORT_NO),
          .UDP_TX_SOURCE_PORT_NO(UDP_TX_SOURCE_PORT_NO),
          
// //-- Application <- TCP rx
          // .TCP_LOCAL_PORTS(TCP_LOCAL_PORTS_s),
          // .TCP_RX_DATA(TCP_RX_DATA_s),
          // .TCP_RX_DATA_VALID(TCP_RX_DATA_VALID_s),
          // .TCP_RX_RTS(TCP_RX_RTS_s),
          // .TCP_RX_CTS(TCP_RX_CTS_s),
          // .TCP_RX_CTS_ACK(TCP_RX_CTS_ACK_s),

          .TCP_LOCAL_PORTS(TCP_LOCAL_PORTS),
          .TCP_RX_DATA(TCP_RX_DATA),
          .TCP_RX_DATA_VALID(TCP_RX_DATA_VALID),
          .TCP_RX_RTS(TCP_RX_RTS),
          .TCP_RX_CTS(TCP_RX_CTS),
          .TCP_RX_CTS_ACK(TCP_RX_CTS_ACK),
          
// //-- Application -> TCP tx
          // .TCP_TX_DATA(TCP_TX_DATA_s),
          // .TCP_TX_DATA_VALID(TCP_TX_DATA_VALID_s),
          // .TCP_TX_DATA_FLUSH(TCP_TX_DATA_FLUSH_s),
          // .TCP_TX_CTS(TCP_TX_CTS_s),
          .TCP_TX_DATA(TCP_TX_DATA),
          .TCP_TX_DATA_VALID(TCP_TX_DATA_VALID),
          .TCP_TX_DATA_FLUSH(TCP_TX_DATA_FLUSH),
          .TCP_TX_CTS(TCP_TX_CTS),          
// //-- TEST POINTS, COMSCOPE TRACES
          .TCP_CONNECTED_FLAG(TCP_CONNECTED_FLAG),
          .CS1(CS1),
          .CS1_CLK(CS1_CLK),
          .CS2(CS2),
          .CS2_CLK(CS2_CLK),
          .DEBUG1(DEBUG1),
          .DEBUG2(DEBUG2),
          .DEBUG3(DEBUG3),
          .TP(TP)
);
/*
genvar i;
		  
generate
	for(i = 0; i < NTCPSTREAMS - 1; i = i + 1) begin
		assign CONNECTION_RESET_s[i] = CONNECTION_RESET[i];
		assign TCP_KEEPALIVE_EN_s[i] = TCP_KEEPALIVE_EN[i];
		
		assign TCP_LOCAL_PORTS_s[i] = TCP_LOCAL_PORTS[16*(i+1)-1 : 16*i];
		assign TCP_RX_DATA[64*(i+1)-1 : 64*i] = TCP_RX_DATA_s[i];
		assign TCP_RX_DATA_VALID[8*(i+1)-1 : 8*i] = TCP_RX_DATA_VALID_s[i];
		assign TCP_RX_RTS[i] = TCP_RX_RTS_s[i]; // Ready To Send
		assign TCP_RX_CTS_s[i] = TCP_RX_CTS[i];
		assign TCP_RX_CTS_ACK[i] = TCP_RX_CTS_ACK_s[i];
		assign TCP_TX_DATA_s[i] = TCP_TX_DATA[64*(i+1)-1 : 64*i];
		assign TCP_TX_DATA_VALID_s[i] = TCP_TX_DATA_VALID[8*(i+1)-1 : 8*i];
		assign TCP_TX_DATA_FLUSH_s[i] = TCP_TX_DATA_FLUSH[i];
		assign TCP_TX_CTS[i] = TCP_TX_CTS_s[i];
	end

endgenerate;	
*/	  
/*
assign CONNECTION_RESET_s[0] = CONNECTION_RESET[0]; 
assign TCP_KEEPALIVE_EN_s[0] = TCP_KEEPALIVE_EN[0]; 

always @( TCP_LOCAL_PORTS ) 
TCP_LOCAL_PORTS_s[0] = TCP_LOCAL_PORTS[16 * (0 + 1) - 1:16 * 0]; 
assign TCP_RX_DATA[64 * (0 + 1) - 1:64 * 0] = TCP_RX_DATA_s[0]; 
assign TCP_RX_DATA_VALID[8 * (0 + 1) - 1:8 * 0] = TCP_RX_DATA_VALID_s[0]; 
assign TCP_RX_RTS[0] = TCP_RX_RTS_s[0]; 
assign TCP_RX_CTS_s[0] = TCP_RX_CTS[0]; 
assign TCP_RX_CTS_ACK[0] = TCP_RX_CTS_ACK_s[0]; 

always @( TCP_TX_DATA ) 
TCP_TX_DATA_s[0] = TCP_TX_DATA[64 * (0 + 1) - 1:64 * 0]; 

always @( TCP_TX_DATA_VALID ) 
TCP_TX_DATA_VALID_s[0] = TCP_TX_DATA_VALID[8 * (0 + 1) - 1:8 * 0]; 
assign TCP_TX_DATA_FLUSH_s[0] = TCP_TX_DATA_FLUSH[0]; 
assign TCP_TX_CTS[0] = TCP_TX_CTS_s[0]; 
assign CONNECTION_RESET_s[1] = CONNECTION_RESET[1]; 
assign TCP_KEEPALIVE_EN_s[1] = TCP_KEEPALIVE_EN[1]; 

always @( TCP_LOCAL_PORTS ) 
TCP_LOCAL_PORTS_s[1] = TCP_LOCAL_PORTS[16 * (1 + 1) - 1:16 * 1]; 
assign TCP_RX_DATA[64 * (1 + 1) - 1:64 * 1] = TCP_RX_DATA_s[1]; 
assign TCP_RX_DATA_VALID[8 * (1 + 1) - 1:8 * 1] = TCP_RX_DATA_VALID_s[1]; 
assign TCP_RX_RTS[1] = TCP_RX_RTS_s[1]; 
assign TCP_RX_CTS_s[1] = TCP_RX_CTS[1]; 
assign TCP_RX_CTS_ACK[1] = TCP_RX_CTS_ACK_s[1]; 

always @( TCP_TX_DATA ) 
TCP_TX_DATA_s[1] = TCP_TX_DATA[64 * (1 + 1) - 1:64 * 1]; 

always @( TCP_TX_DATA_VALID ) 
TCP_TX_DATA_VALID_s[1] = TCP_TX_DATA_VALID[8 * (1 + 1) - 1:8 * 1]; 
assign TCP_TX_DATA_FLUSH_s[1] = TCP_TX_DATA_FLUSH[1]; 
assign TCP_TX_CTS[1] = TCP_TX_CTS_s[1]; 
*/
endmodule // module COM5502_TOP

