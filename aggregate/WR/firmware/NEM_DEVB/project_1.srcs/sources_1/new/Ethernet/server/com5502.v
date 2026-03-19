`define false 1'b0
`define FALSE 1'b0
`define true 1'b1
`define TRUE 1'b1

`timescale 1 ns / 1 ns // timescale for following modules


// -----------------------------------------------------------
//  MSS copyright 2021
// 	Filename:  COM5502.VHD
//  Author: Alain Zarembowitch / MSS
// 	Version: 3
// 	Date last modified: 1/19/21
//  Inheritance: 	COM5402.VHD (architecture)
// 
//  description:  10Gbit Internet IP stack: IP/TCP/UDP/ARP/PING.
//  The IP stack relies on the lower layers: MAC (for example COM5501) and PHY (Integrated circuit)
//  Interfaces directly with COM-5501SOFT 10GbE MAC protocol layer and the COM-5401SOFT 1GbE MAC.
// 
//  Rev 1 4/27/19 AZ
//  Added IGMP for multicast addresses
// 
//  Rev 2 6/7/19 AZ
//  Corrected bug about the timeliness of RX_IP_PROTOCOL (cleared to early)
//  Corrected bug on CHECK_UDP_RX_DEST_PORT_NO outside of UDP_RX_10G
// 
//  Rev 3 1/19/21 AZ
//  Added window size to generic parameters
//  Increased RX_FREE_SPACE to 32-bit in preparation for window scaling.
//  Added window scaling option
// 
//  Device utilization (NTCPSTREAMS=1, NUDPRX=1, NUDPRX=1, MTU = 1500, IPv6_ENABLED='1')
//  FF: 7402
//  LUT: 12082
//  DSP48: 0
//  18Kb BRAM: 21
//  BUFG: 1
//  Minimum period: 6.888ns (Maximum Frequency: 145.175MHz)  Artix7-100T -1 speed grade
// -------------------------------------------------------------

module COM5502 #(

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
		output  reg 	[63:0] 		MAC_TX_DATA, 
			// MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID = '1'
			// Bytes order: LSB was received first
			// Bytes are right aligned: first byte in LSB, occasional follow-on fill-in Bytes in the MSB(s)
			// The first destination address byte is always a LSB (MAC_TX_DATA(7:0))
		output  reg     [7:0] 		MAC_TX_DATA_VALID,
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

		output   					MAC_TX_RTS,
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
//`include "COM5502_Behavioral.v"
// 	COMPONENT UDP2SERIAL_10G
// 	GENERIC (
// 		PORT_NO: std_logic_vector(15 downto 0);
// 		CLK_FREQUENCY: integer
// 	);	
// 	PORT(
// 		CLK: in std_logic;
// 		SYNC_RESET: in std_logic;
// 		IP_RX_DATA: in std_logic_vector(7 downto 0);
// 		IP_RX_DATA_VALID: in std_logic;
// 		IP_RX_SOF: in std_logic;
// 		IP_RX_EOF: in std_logic;
// 		IP_HEADER_FLAG: in std_logic;
// 		RX_IP_PROTOCOL: in std_logic_vector(7 downto 0);
// 		RX_IP_PROTOCOL_RDY: in std_logic;
// 		SERIAL_OUT: out std_logic;
// 		TP: out std_logic_vector(10 downto 1)
// 		);
// 	END COMPONENT;
// 

// ------------------------------------------------------
//      SIGNALS
// ------------------------------------------------------
//  NOTATIONS: 
//  _E as one-CLK early sample
//  _D as one-CLK delayed sample
//  _D2 as two-CLKs delayed sample
function integer max;
input L, R; 
	begin
	  // Demonstrates driving external Global Reg
	if(L >= R)
		max = L;
	else max = R;
	end
endfunction
function WS_EN;
input Size; 
	begin
	  // Demonstrates driving external Global Reg
	if(Size >= 16)
		WS_EN = 1'b1;
	else WS_EN = 1'b0;
	end
endfunction
parameter TCP_MAX_WINDOW_SIZE = max(TCP_TX_WINDOW_SIZE, TCP_RX_WINDOW_SIZE); 

//  maximum Window size is expressed as 2**n Bytes. Thus a value of 12 indicates a window size of 32KB.
//  used by TCP_SERVER to negotiate if the TCP window scaling option is warranted.
parameter WINDOW_SCALING_ENABLED = WS_EN(TCP_MAX_WINDOW_SIZE); 

//  enable/disable window scaling option
// //-- RESET -----------------------------
reg     SYNC_RESET_local; 
reg     RESET_CNTR_MSB; 
reg     RESET_CNTR_MSB_D; 
reg     [3:0] RESET_CNTR; 
reg     SYNC_RESET1; 
reg     SYNC_RESET2; 
(* MARK_DEBUG="true" *)reg     SYNC_RESET3; 
reg     SYNC_RESET4; 

// //-- TIMERS -----------------------------
wire     TICK_4US; 
wire     TICK_100MS_rt; 
reg     TICK_100MS; 
reg     [6:0] TICK_CNTR; 
reg     [9:0] TICK_CNTR2; 

// --//-- MAC INTERFACE --------------
reg     [63:0] MAC_TX_DATA_local; 
reg     [7:0] MAC_TX_DATA_VALID_local; 
reg     MAC_TX_EOF_FLAG; 
reg     MAC_TX_EOF_local; 
reg     MAC_TX_WORD_VALID; 
reg     MAC_TX_EOF_FLAGn; 

// //-- FLIP BYTE ORDER IN MAC TX/RX WORD --------------
(* MARK_DEBUG="true" *)reg     [63:0] MAC_RX_DATA_FLIP; 
(* MARK_DEBUG="true" *)reg     [7:0] MAC_RX_DATA_VALID_FLIP; 
(* MARK_DEBUG="true" *)wire     [10:0] MAC_RX_WORD_COUNT; 
(* MARK_DEBUG="true" *)reg     [63:0] MAC_TX_DATA_FLIP; 
(* MARK_DEBUG="true" *)reg     [7:0] MAC_TX_DATA_VALID_FLIP; 

// 
// --//-- PARSE INCOMING PACKET --------------
(* MARK_DEBUG="true" *)wire     [3:0] RX_TYPE; 
(* MARK_DEBUG="true" *)wire     RX_TYPE_RDY; 
wire     RX_IPv4_6n; 
(* MARK_DEBUG="true" *)wire     [7:0] RX_IP_PROTOCOL; 
wire     RX_IP_PROTOCOL_RDY; 
wire     IP_RX_FRAME_VALID; 
wire     IP_RX_FRAME_VALID2; 
(* MARK_DEBUG="true" *)wire     [63:0] IP_RX_DATA; 
(* MARK_DEBUG="true" *)wire     [7:0]  IP_RX_DATA_VALID; 
wire     IP_RX_SOF; 
wire     IP_RX_EOF; 
wire     [10:0] IP_RX_WORD_COUNT; 
(* MARK_DEBUG="true" *)wire     [63:0] IP_PAYLOAD_DATA; 
(* MARK_DEBUG="true" *)wire     [7:0]  IP_PAYLOAD_DATA_VALID; 
(* MARK_DEBUG="true" *)wire     IP_PAYLOAD_SOF; 
(* MARK_DEBUG="true" *)wire     IP_PAYLOAD_EOF; 
wire     [15:0] IP_PAYLOAD_LENGTH; 
(* MARK_DEBUG="true" *)wire     [10:0] IP_PAYLOAD_WORD_COUNT; 
wire     [1:0] IP_HEADER_FLAG; 
wire     VALID_IP_PAYLOAD_CHECKSUM; 
wire     VALID_UDP_CHECKSUM; 
(* MARK_DEBUG="true" *)wire     VALID_TCP_CHECKSUM; 
wire     [10:1] TP_PARSING; 
wire     [47:0] RX_SOURCE_MAC_ADDR; 
wire     [127:0] RX_SOURCE_IP_ADDR; 
wire     [127:0] RX_DEST_IP_ADDR; 
wire     VALID_UNICAST_DEST_IP; 
wire     VALID_MULTICAST_DEST_IP; 
wire     VALID_DEST_IP_RDY; 
wire     IP_HEADER_CHECKSUM_VALID; 
wire     IP_HEADER_CHECKSUM_VALID_RDY; 

// //-- ARP REPLY --------------
(* MARK_DEBUG="true" *)wire     [63:0] ARP_MAC_TX_DATA; 
(* MARK_DEBUG="true" *)wire     [7:0] ARP_MAC_TX_DATA_VALID; 
(* MARK_DEBUG="true" *)wire     ARP_MAC_TX_EOF; 
(* MARK_DEBUG="true" *)reg      ARP_MAC_TX_CTS; 
(* MARK_DEBUG="true" *)wire     ARP_RTS; 
wire     [10:1] TP_ARP; 

// //-- ICMPV6 --------------
reg      [63:0] ICMPV6_MAC_TX_DATA; 
reg      [7:0] ICMPV6_MAC_TX_DATA_VALID; 
reg      ICMPV6_MAC_TX_EOF; 
reg      ICMPV6_MAC_TX_CTS; 
reg      ICMPV6_RTS; 
wire     [10:1] TP_ICMPV6; 

// //-- PING REPLY --------------
(* MARK_DEBUG="true" *)wire     [63:0] PING_MAC_TX_DATA; 
(* MARK_DEBUG="true" *)wire     [7:0] PING_MAC_TX_DATA_VALID; 
(* MARK_DEBUG="true" *)wire     PING_MAC_TX_EOF; 
reg      PING_MAC_TX_CTS; 
wire     PING_RTS; 
wire     [10:1] TP_PING; 

// //-- WHOIS ---------------------------------------------
wire    [127:0] WHOIS_IP_ADDR; 
wire    WHOIS_IPv4_6n; 
wire    WHOIS_START; 
wire    WHOIS_RDY; 
wire    [63:0] WHOIS_MAC_TX_DATA; 
wire    [7:0] WHOIS_MAC_TX_DATA_VALID; 
wire    WHOIS_MAC_TX_EOF; 
reg     WHOIS_MAC_TX_CTS; 
wire    WHOIS_RTS; 
wire    [10:1] TP_WHOIS; 

// //-- ARP CACHE  -----------------------------------------
reg     [127:0] RT_IP_ADDR; 
reg     RT_IPv4_6n; 
reg     RT_REQ_RTS; 
wire    RT_CTS; 
wire    [47:0] RT_MAC_REPLY; 
wire    RT_MAC_RDY; 
wire    RT_NAK; 
wire    [10:1] TP_ARP_CACHE2; 

// //-- DHCP SERVER ------------------------------------
wire    DHCPS_SYNC_RESET; 
reg     [63:0] DHCPS_MAC_TX_DATA; 
reg     [7:0] DHCPS_MAC_TX_DATA_VALID; 
reg     DHCPS_MAC_TX_EOF; 
reg     DHCPS_MAC_TX_CTS; 
reg     DHCPS_RTS; 
reg     [10:1] TP_DHCP_SERVER; 

// //-- DHCP CLIENT (DYNAMIC IP) -----------------------------------------
reg     [31:0] IPv4_ADDR_local; 
reg     [31:0] IPv4_SUBNET_MASK_local; 
reg     [31:0] IPv4_GATEWAY_ADDR_local; 
wire    DHCPC_SYNC_RESET; 
reg     [31:0] DHCPC_IPv4_ADDR; 
reg     [31:0] DHCPC_SUBNET_MASK; 
reg     [31:0] DHCPC_ROUTER; 
reg     [63:0] DHCPC_MAC_TX_DATA; 
reg     [7:0] DHCPC_MAC_TX_DATA_VALID; 
reg     DHCPC_MAC_TX_EOF; 
reg     DHCPC_MAC_TX_CTS; 
reg     DHCPC_RTS; 
wire    [10:1] TP_DHCPC; 

// //-- IGMP (MULTICAST) -----------------------------------------
(* MARK_DEBUG="true" *)wire    			IGMP_REPORT_START; 
(* MARK_DEBUG="true" *)wire    			IGMP_TRIGGER_RESPONSE; 
(* MARK_DEBUG="true" *)reg     			IGMP_TRIGGER_RESPONSE2; 
(* MARK_DEBUG="true" *)reg     			IGMP_TRIGGER_RESPONSE3; 
(* MARK_DEBUG="true" *)wire    [63:0] 	IGMP_MAC_TX_DATA; 
(* MARK_DEBUG="true" *)wire    [7:0] 	IGMP_MAC_TX_DATA_VALID; 
(* MARK_DEBUG="true" *)wire    			IGMP_MAC_TX_EOF; 
(* MARK_DEBUG="true" *)reg     			IGMP_MAC_TX_CTS; 
(* MARK_DEBUG="true" *)wire    			IGMP_RTS; 
(* MARK_DEBUG="true" *)wire    [10:1] 	TP_IGMP_QUERY; 
(* MARK_DEBUG="true" *)wire    [10:1] 	TP_IGMP_REPORT; 

// //-- UDP RX ------------------------------------
wire    [63:0] UDP_RX_DATA_local; 
wire    [7:0] UDP_RX_DATA_VALID_local; 
wire    UDP_RX_SOF_local; 
wire    UDP_RX_EOF_local; 
wire    [15:0] UDP_RX_DEST_PORT_NO_local; 
wire    UDP_RX_FRAME_VALID1; 
reg     UDP_RX_FRAME_VALID2; 
wire    [10:1] TP_UDP_RX; 

// --//-- UDP TX ------------------------------------
wire    UDP001_RT_REQ_RTS; 
reg     UDP001_RT_REQ_CTS; 
wire    [127:0] UDP001_RT_IP_ADDR; 
wire    UDP001_RT_IPv4_6n; 
reg     UDP001_RT_MAC_RDY; 
reg     UDP001_RT_NAK; 
wire    [63:0] UDP001_MAC_TX_DATA; 
wire    [7:0] UDP001_MAC_TX_DATA_VALID; 
wire    UDP001_MAC_TX_EOF; 
reg     UDP001_MAC_TX_CTS; 
wire    UDP001_RTS; 
wire    [10:1] TP_UDP_TX; 
wire    UDP_TX_ACK_local; 
wire    UDP_TX_NAK_local; 

// 
// //-- TCP RX ------------------------------------
//  TCP server 001
// signal TCP_LOCAL_PORTS: std_logic_vector((16 * NTCPSTREAMS - 1) downto 0);
wire    [63:0] TCP001_MAC_TX_DATA; 
wire    [7:0] TCP001_MAC_TX_DATA_VALID; 
wire    TCP001_MAC_TX_EOF; 
reg     TCP001_MAC_TX_CTS; 
wire    TCP001_RTS; 
wire    [63:0] TCP001_RX_DATA; 
(* MARK_DEBUG="true" *)wire    [7:0] TCP001_RX_DATA_VALID; 
wire    TCP001_RX_SOF; 
wire    [NTCPSTREAMS - 1:0] TCP001_RX_TCP_STREAM_SEL; 
wire    TCP001_RX_EOF; 
wire    TCP_001_RX_FRAME_VALID; 
(* MARK_DEBUG="true" *)wire    [32 * NTCPSTREAMS - 1:0] TCP001_RX_FREE_SPACE; 
wire    TCP001_TX_PACKET_SEQUENCE_START; 
wire    [47:0] TCP001_TX_DEST_MAC_ADDR; 
wire    [127:0] TCP001_TX_DEST_IP_ADDR; 
wire    [15:0] TCP001_TX_DEST_PORT_NO; 
wire    [15:0] TCP001_TX_SOURCE_PORT_NO; 
wire    TCP001_TX_IPv4_6n; 
wire    [31:0] TCP001_TX_SEQ_NO; 
wire    [31:0] TCP001_TX_ACK_NO; 
wire    [15:0] TCP001_TX_ACK_WINDOW_LENGTH; 
wire    [7:0] TCP001_TX_FLAGS; 
wire    [3:0] TCP001_TX_WINDOW_SCALE; 
wire    [1:0] TCP001_TX_PACKET_TYPE; 
(* MARK_DEBUG="true" *)wire    [31:0] TCP001_EFF_RX_WINDOW_SIZE_PARTIAL; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_STREAM; 
(* MARK_DEBUG="true" *)wire    TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_VALID; 
//  1 CLK-wide pulse to indicate that the above information is valid
wire    [32 * NTCPSTREAMS - 1:0] TCP001_TX_SEQ_NOxNTCPSTREAMS; 
wire    [NTCPSTREAMS - 1:0] TCP001_TX_SEQ_NO_JUMP; 
wire    [32 * NTCPSTREAMS - 1:0] TCP001_RX_ACK_NOxNTCPSTREAMS; 
(* MARK_DEBUG="true" *)wire    [NTCPSTREAMS - 1:0] TCP001_CONNECTED_FLAG; 
(* MARK_DEBUG="true" *)wire    [63:0] TCP001_TX_PAYLOAD_DATA; 
(* MARK_DEBUG="true" *)wire    [7:0] TCP001_TX_PAYLOAD_DATA_VALID; 
(* MARK_DEBUG="true" *)wire    TCP001_TX_PAYLOAD_WORD_VALID; 
wire    TCP001_TX_PAYLOAD_DATA_EOF; 
wire    TCP001_TX_PAYLOAD_RTS; 
wire    TCP001_TX_PAYLOAD_CTS; 
(* MARK_DEBUG="true" *)wire    [15:0] TCP001_TX_PAYLOAD_SIZE; 
wire    [17:0] TCP001_TX_PAYLOAD_CHECKSUM; 
wire    [NTCPSTREAMS - 1:0] TCP001_TX_STREAM_SEL; 
wire    [NTCPSTREAMS - 1:0] TCP001_TCP_TX_CTS; 
wire    [10:1] TP_TCP_SERVER; 
wire    [10:1] TP_TCP_TXBUF; 
wire    [10:1] TP_TCPRXBUFNDEMUX2; 
// 
//  TCP server 002
//  etc...
// //-- TRANSMISSION ARBITER --------------
reg     [15:0] IP_ID; 
(* MARK_DEBUG="true" *)reg     [3:0] TX_MUX_STATE; 
//  up to N protocol engines. Increase size if more.

// //-- ROUTING TABLE ARBITER --------------
reg     [3:0] RT_MUX_STATE; 

//  1 + number of transmit components vying for access to the routing table. Adjust as needed.
// ----------------------------------------------------
//       IMPLEMENTATION
// ------------------------------------------------------
// //-- RESET -----------------------------
//  Reset is mandatory but just in case one forgets, create a local one at power up.

initial 
   begin : process_181
   IP_ID = 16'h 0000;   
   end



genvar i;
genvar j;











































initial 
   begin : process_143
   TCP001_MAC_TX_CTS = 1'b0;   
   end








initial 
   begin : process_135
   UDP001_MAC_TX_CTS = 1'b0;   
   end


initial 
   begin : process_131
   UDP001_RT_NAK = 1'b0;   
   end

initial 
   begin : process_130
   UDP001_RT_MAC_RDY = 1'b0;   
   end

initial 
   begin : process_127
   UDP001_RT_REQ_CTS = 1'b0;   
   end



initial 
   begin : process_124
   UDP_RX_FRAME_VALID2 = 1'b0;   
   end



initial 
   begin : process_114
   IGMP_MAC_TX_CTS = 1'b0;   
   end



initial 
   begin : process_110
   IGMP_TRIGGER_RESPONSE3 = 1'b0;   
   end

initial 
   begin : process_109
   IGMP_TRIGGER_RESPONSE2 = 1'b0;   
   end

initial 
   begin : process_106
   DHCPC_RTS = 1'b0;   
   end

initial 
   begin : process_105
   DHCPC_MAC_TX_CTS = 1'b0;   
   end

initial 
   begin : process_104
   DHCPC_MAC_TX_EOF = 1'b0;   
   end

initial 
   begin : process_103
   DHCPC_MAC_TX_DATA_VALID = 8'h0;   
   end

initial 
   begin : process_102
   DHCPC_MAC_TX_DATA = {64{1'b0}};   
   end

initial 
   begin : process_101
   DHCPC_ROUTER = {32{1'b0}};   
   end

initial 
   begin : process_100
   DHCPC_SUBNET_MASK = {32{1'b0}};   
   end

initial 
   begin : process_99
   DHCPC_IPv4_ADDR = {32{1'b0}};   
   end

initial 
   begin : process_97
   IPv4_GATEWAY_ADDR_local = {32{1'b0}};   
   end

initial 
   begin : process_96
   IPv4_SUBNET_MASK_local = {32{1'b0}};   
   end

initial 
   begin : process_95
   IPv4_ADDR_local = {32{1'b0}};   
   end

initial 
   begin : process_94
   TP_DHCP_SERVER = {10{1'b0}};   
   end

initial 
   begin : process_93
   DHCPS_RTS = 1'b0;   
   end

initial 
   begin : process_92
   DHCPS_MAC_TX_CTS = 1'b0;   
   end

initial 
   begin : process_91
   DHCPS_MAC_TX_EOF = 1'b0;   
   end

initial 
   begin : process_90
   DHCPS_MAC_TX_DATA_VALID = {8{1'b0}};   
   end

initial 
   begin : process_89
   DHCPS_MAC_TX_DATA = {64{1'b0}};   
   end

initial 
   begin : process_82
   RT_REQ_RTS = 1'b0;   
   end

initial 
   begin : process_81
   RT_IPv4_6n = 1'b0;   
   end

initial 
   begin : process_80
   RT_IP_ADDR = {128{1'b0}};   
   end

initial 
   begin : process_77
   WHOIS_MAC_TX_CTS = 1'b0;   
   end



initial 
   begin : process_68
   PING_MAC_TX_CTS = 1'b0;   
   end






initial 
   begin : process_64
   ICMPV6_RTS = 1'b0;   
   end

initial 
   begin : process_63
   ICMPV6_MAC_TX_CTS = 1'b0;   
   end

initial 
   begin : process_62
   ICMPV6_MAC_TX_EOF = 1'b0;   
   end

initial 
   begin : process_61
   ICMPV6_MAC_TX_DATA_VALID = {8{1'b0}};   
   end

initial 
   begin : process_60
   ICMPV6_MAC_TX_DATA = {64{1'b0}};   
   end


initial 
   begin : process_58
   ARP_MAC_TX_CTS = 1'b0;   
   end




















































initial 
   begin : process_24
   MAC_TX_DATA_VALID_FLIP = {8{1'b0}};   
   end

initial 
   begin : process_23
   MAC_TX_DATA_FLIP = {64{1'b0}};   
   end



initial 
   begin : process_21
   MAC_RX_DATA_VALID_FLIP = {8{1'b0}};   
   end

initial 
   begin : process_20
   MAC_RX_DATA_FLIP = {64{1'b0}};   
   end

initial 
   begin : process_19
   MAC_TX_EOF_FLAGn = 1'b0;   
   end

initial 
   begin : process_18
   MAC_TX_WORD_VALID = 1'b0;   
   end

initial 
   begin : process_17
   MAC_TX_EOF_local = 1'b0;   
   end

initial 
   begin : process_16
   MAC_TX_EOF_FLAG = 1'b0;   
   end

initial 
   begin : process_15
   MAC_TX_DATA_VALID_local = {8{1'b0}};   
   end

initial 
   begin : process_14
   MAC_TX_DATA_local = {64{1'b0}};   
   end

initial 
   begin : process_13
   TICK_CNTR2 = {10{1'b0}};   
   end

initial 
   begin : process_12
   TICK_CNTR = {7{1'b0}};   
   end

initial 
   begin : process_11
   TICK_100MS = 1'b0;   
   end





initial 
   begin : process_8
   SYNC_RESET4 = 1'b0;   
   end

initial 
   begin : process_7
   SYNC_RESET3 = 1'b0;   
   end

initial 
   begin : process_6
   SYNC_RESET2 = 1'b0;   
   end

initial 
   begin : process_5
   SYNC_RESET1 = 1'b0;   
   end

initial 
   begin : process_4
   RESET_CNTR = {4{1'b0}};   
   end

initial 
   begin : process_3
   RESET_CNTR_MSB_D = 1'b0;   
   end

initial 
   begin : process_2
   RESET_CNTR_MSB = 1'b0;   
   end

initial 
   begin : process_1
   SYNC_RESET_local = 1'b0;   
   end


always @(posedge CLK)
   begin : SYNC_RESET_001
   if (CLK == 1'b1)
      begin
      RESET_CNTR_MSB_D <= RESET_CNTR_MSB;   
      if (RESET_CNTR_MSB == 1'b0)
         begin
         RESET_CNTR <= RESET_CNTR + 1;   
         end
      if (RESET_CNTR_MSB_D == 1'b0 & RESET_CNTR_MSB == 1'b1)
         begin
         SYNC_RESET_local <= 1'b1;   
         end
      else
         begin
         SYNC_RESET_local <= SYNC_RESET;   
         end
      end
   end


always @( RESET_CNTR ) 
RESET_CNTR_MSB = RESET_CNTR[3]; 

//  manually reduce fanout for sync reset (there may be other methods, but this one works with Xilinx Vivado,
//  Original SYNC_RESET fanout was over 1200 resulting in excessive routing delay)

always @(posedge CLK)
   begin : SYNC_RESET_002
   if (CLK == 1'b1)
      begin
      SYNC_RESET1 <= SYNC_RESET_local;   
      SYNC_RESET2 <= SYNC_RESET_local;   
      SYNC_RESET3 <= SYNC_RESET_local;   
      SYNC_RESET4 <= SYNC_RESET_local;   
      end
   end

// //-- TIMERS -----------------------------

TIMER_4US #(
    .CLK_FREQUENCY(CLK_FREQUENCY)
)TIMER_4US_001 (
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET1),
          .TICK_4US(TICK_4US),
          .TICK_100MS(TICK_100MS_rt));

always @( TICK_4US or TICK_100MS_rt ) 
TICK_100MS = SIMULATION == 1'b1 ? TICK_4US : TICK_100MS_rt; 
//  to accelerate simulations

// //-- FLIP RX BYTE ORDER IN WORD --------------
//  flipping the MSB <-> LSB makes it easier to read the various fields values in the code or simulator

generate
	for (i = 0; i <= 7; i = i + 1)  begin
		always @(MAC_RX_DATA or MAC_RX_DATA_VALID)
		    begin : FLIP_RX_MAC_BYTES
				MAC_RX_DATA_FLIP[i * 8 + 7:i * 8] <= MAC_RX_DATA[(7 - i) * 8 + 7:(7 - i) * 8];   
				MAC_RX_DATA_VALID_FLIP[i] <= MAC_RX_DATA_VALID[7 - i];   			  
		    end
	end
endgenerate
// //-- PARSE INCOMING PACKET --------------
//  Code is common to all protocols. Extracts key information from incoming packets.

PACKET_PARSING_10G #(
	      .IPv6_ENABLED(IPv6_ENABLED),
	      .SIMULATION(SIMULATION)
) PACKET_PARSING_001 (
		  .CLK(CLK),
		  .SYNC_RESET(SYNC_RESET1),
		  .MAC_RX_DATA(MAC_RX_DATA_FLIP),
		  .MAC_RX_DATA_VALID(MAC_RX_DATA_VALID_FLIP),
		  .MAC_RX_SOF(MAC_RX_SOF),
		  .MAC_RX_EOF(MAC_RX_EOF),
		  .MAC_RX_FRAME_VALID(MAC_RX_FRAME_VALID),
		  .MAC_RX_WORD_COUNT(MAC_RX_WORD_COUNT),
		  .IPv4_ADDR(IPv4_ADDR_local),
		  .IPv6_ADDR(IPv6_ADDR),
		  .IPv4_MULTICAST_ADDR(IPv4_MULTICAST_ADDR),
		  .IP_RX_DATA(IP_RX_DATA),
		  .IP_RX_DATA_VALID(IP_RX_DATA_VALID),
		  .IP_RX_SOF(IP_RX_SOF),
		  .IP_RX_EOF(IP_RX_EOF),
		  .IP_RX_WORD_COUNT(IP_RX_WORD_COUNT),
		  .IP_HEADER_FLAG(IP_HEADER_FLAG),
		  .RX_TYPE(RX_TYPE),
		  .RX_TYPE_RDY(RX_TYPE_RDY),
		  .RX_IPv4_6n(RX_IPv4_6n),
		  .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
		  .RX_IP_PROTOCOL_RDY(RX_IP_PROTOCOL_RDY),
		  .IP_RX_FRAME_VALID(IP_RX_FRAME_VALID),
		  .IP_RX_FRAME_VALID2(IP_RX_FRAME_VALID2),
		  .VALID_UNICAST_DEST_IP(VALID_UNICAST_DEST_IP),
		  .VALID_MULTICAST_DEST_IP(VALID_MULTICAST_DEST_IP),
		  .VALID_DEST_IP_RDY(VALID_DEST_IP_RDY),
		  .IP_HEADER_CHECKSUM_VALID(IP_HEADER_CHECKSUM_VALID),
		  .IP_HEADER_CHECKSUM_VALID_RDY(IP_HEADER_CHECKSUM_VALID_RDY),
		  .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
		  .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR),
		  .RX_DEST_IP_ADDR(RX_DEST_IP_ADDR),
		  .IP_PAYLOAD_DATA(IP_PAYLOAD_DATA),
		  .IP_PAYLOAD_DATA_VALID(IP_PAYLOAD_DATA_VALID),
		  .IP_PAYLOAD_SOF(IP_PAYLOAD_SOF),
		  .IP_PAYLOAD_EOF(IP_PAYLOAD_EOF),
		  .IP_PAYLOAD_LENGTH(IP_PAYLOAD_LENGTH),
		  .IP_PAYLOAD_WORD_COUNT(IP_PAYLOAD_WORD_COUNT),
		  .VALID_IP_PAYLOAD_CHECKSUM(VALID_IP_PAYLOAD_CHECKSUM),
		  .VALID_UDP_CHECKSUM(VALID_UDP_CHECKSUM),
		  .VALID_TCP_CHECKSUM(VALID_TCP_CHECKSUM),
		  .CS1(),
		  .CS1_CLK(),
		  .CS2(),
		  .CS2_CLK(),
		  .TP(TP_PARSING)
);
ARP_10G ARP_001 (	
// 	DEBUG_001: process(CLK)
// 	begin
// 		if rising_edge(CLK) then
// 			if(IP_PAYLOAD_DATA_VALID /= x"00") then
// 				if(unsigned(IP_PAYLOAD_WORD_COUNT) = 1) then
// 					DEBUG1 <= IP_PAYLOAD_DATA;
// 				end if;
// 				if(unsigned(IP_PAYLOAD_WORD_COUNT) = 2) then
// 					DEBUG2 <= IP_PAYLOAD_DATA;
// 				end if;
// 				if(unsigned(IP_PAYLOAD_WORD_COUNT) = 3) then
// 					DEBUG3 <= IP_PAYLOAD_DATA;
// 				end if;
// 			end if;
// 		end if;
// 	end process;
// //-- ARP REPLY --------------
//  Instantiated once per PHY.   IPv4-only. Use NDP for IPv6.
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET2),
          .MAC_RX_DATA(MAC_RX_DATA_FLIP),
          .MAC_RX_DATA_VALID(MAC_RX_DATA_VALID_FLIP),
          .MAC_RX_SOF(MAC_RX_SOF),
          .MAC_RX_EOF(MAC_RX_EOF),
          .MAC_RX_FRAME_VALID(MAC_RX_FRAME_VALID),
          .MAC_RX_WORD_COUNT(MAC_RX_WORD_COUNT),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .RX_TYPE(RX_TYPE),
          .RX_TYPE_RDY(RX_TYPE_RDY),
          .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR[31:0]),
          .MAC_TX_DATA(ARP_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(ARP_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(ARP_MAC_TX_EOF),
          .MAC_TX_CTS(ARP_MAC_TX_CTS),
          .RTS(ARP_RTS),
          .TP(TP_ARP));

PING_10G #(
		  .IPv6_ENABLED (IPv6_ENABLED),
          .MAX_PING_SIZE (8'h 20)
)PING_001 (	
//  32*8-byte words threshold for incoming IP/ICMP frame
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET3),
          .IP_RX_DATA(IP_RX_DATA),
          .IP_RX_DATA_VALID(IP_RX_DATA_VALID),
          .IP_RX_SOF(IP_RX_SOF),
          .IP_RX_EOF(IP_RX_EOF),
          .IP_RX_WORD_COUNT(IP_RX_WORD_COUNT),
          .IP_RX_FRAME_VALID2(IP_RX_FRAME_VALID2),
          .VALID_UNICAST_DEST_IP(VALID_UNICAST_DEST_IP),
          .VALID_DEST_IP_RDY(VALID_DEST_IP_RDY),
          .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .RX_IPv4_6n(RX_IPv4_6n),
          .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
          .RX_IP_PROTOCOL_RDY(RX_IP_PROTOCOL_RDY),
          .MAC_TX_DATA(PING_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(PING_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(PING_MAC_TX_EOF),
          .MAC_TX_CTS(PING_MAC_TX_CTS),
          .RTS(PING_RTS),
          .TP(TP_PING));

 /*  ila_2 ila_2 (
    .clk(CLK), // input wire clk
    .probe0(PING_MAC_TX_DATA), // input wire [0:0]  probe0  
    .probe1(PING_MAC_TX_DATA_VALID), // input wire [0:0]  probe1 
    .probe2(IP_RX_DATA), // input wire [0:0]  probe2 
    .probe3(IP_RX_DATA_VALID), // input wire [0:0]  probe3 
    .probe4(SYNC_RESET3),
    .probe5(TP_PING)
  ); */

generate
if (IPv6_ENABLED==1) begin: ICMPV6_001
	ICMPV6_10G ICMPV6_001 (
		      .CLK(CLK),
	          .SYNC_RESET(SYNC_RESET2),
	          .IP_RX_DATA(IP_RX_DATA),
	          .IP_RX_DATA_VALID(IP_RX_DATA_VALID),
	          .IP_RX_SOF(IP_RX_SOF),
	          .IP_RX_EOF(IP_RX_EOF),
	          .IP_RX_WORD_COUNT(IP_RX_WORD_COUNT),
	          .IP_RX_FRAME_VALID(IP_RX_FRAME_VALID),
	          .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
	          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR),
	          .MAC_ADDR(MAC_ADDR),
	          .IPv6_ADDR(IPv6_ADDR),
	          .RX_IPv4_6n(RX_IPv4_6n),
	          .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
	          .RX_IP_PROTOCOL_RDY(RX_IP_PROTOCOL_RDY),
	          .MAC_TX_DATA(ICMPV6_MAC_TX_DATA),
	          .MAC_TX_DATA_VALID(ICMPV6_MAC_TX_DATA_VALID),
	          .MAC_TX_EOF(ICMPV6_MAC_TX_EOF),
	          .MAC_TX_CTS(ICMPV6_MAC_TX_CTS),
	          .RTS(ICMPV6_RTS),
	          .TP(TP_ICMPV6));
end
endgenerate
generate
if (NUDPTX != 0) begin: WHOIS2_X
WHOIS2_10G #(
		  .IPv6_ENABLED (IPv6_ENABLED)
)WHOIS2_001 (
		  .CLK(CLK),
          .SYNC_RESET(SYNC_RESET3),
          .WHOIS_IP_ADDR(WHOIS_IP_ADDR),
          .WHOIS_IPv4_6n(WHOIS_IPv4_6n),
          .WHOIS_START(WHOIS_START),
          .WHOIS_RDY(WHOIS_RDY),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .MAC_TX_DATA(WHOIS_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(WHOIS_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(WHOIS_MAC_TX_EOF),
          .MAC_TX_CTS(WHOIS_MAC_TX_CTS),
          .RTS(WHOIS_RTS),
          .TP(TP_WHOIS));
end
endgenerate

generate
if (NUDPTX != 0) begin: ARP_CACHE2_X
ARP_CACHE2_10G #(
    .IPv6_ENABLED(IPv6_ENABLED)
)
ARP_CACHE2_001 (
	      .CLK(CLK),
          .SYNC_RESET(SYNC_RESET2),
          .TICK_100MS(TICK_100MS),
          .RT_IP_ADDR(RT_IP_ADDR),
          .RT_IPv4_6n(RT_IPv4_6n),
          .RT_REQ_RTS(RT_REQ_RTS),
          .RT_CTS(RT_CTS),
          .RT_MAC_REPLY(RT_MAC_REPLY),
          .RT_MAC_RDY(RT_MAC_RDY),
          .RT_NAK(RT_NAK),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv4_SUBNET_MASK(IPv4_SUBNET_MASK_local),
          .IPv4_GATEWAY_ADDR(IPv4_GATEWAY_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .IPv6_SUBNET_PREFIX_LENGTH(IPv6_SUBNET_PREFIX_LENGTH),
          .IPv6_GATEWAY_ADDR(IPv6_GATEWAY_ADDR),
          .WHOIS_IP_ADDR(WHOIS_IP_ADDR),
          .WHOIS_IPv4_6n(WHOIS_IPv4_6n),
          .WHOIS_START(WHOIS_START),
          .RX_SOURCE_ADDR_RDY(MAC_RX_EOF),
          .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR),
          .RX_IPv4_6n(RX_IPv4_6n),
          .SREG1(),
          .SREG2(),
          .SREG3(),
          .SREG4(),
          .SREG5(),
          .SREG6(),
          .TP(TP_ARP_CACHE2));
end
endgenerate

generate
if (DHCP_SERVER_EN != 0) begin: DHCP_SERVER_X

assign DHCPS_SYNC_RESET = SYNC_RESET | ~DHCP_SERVER_EN2; 

//-- DHCP SERVER ------------------------------------
DHCP_SERVER_10G DHCP_SERVER_001 (
	      .SYNC_RESET(DHCPS_SYNC_RESET),
          .CLK(CLK),
          .TICK_4US(TICK_4US),
          .TICK_100MS(TICK_100MS),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .HOST_NAME(48'h 414243444546),
          .IP_MIN(DHCP_SERVER_IP_MIN_LSB),
          .NIPs(DHCP_SERVER_NIPs),
          .LEASE_TIME(DHCP_SERVER_LEASE_TIME),
          .SUBNET_MASK(IPv4_SUBNET_MASK_local),
          .ROUTER(DHCP_ROUTER),
          .DNS(DHCP_SERVER_DNS),
          // UDP rx frame
          .UDP_RX_DATA(UDP_RX_DATA_local),
          .UDP_RX_DATA_VALID(UDP_RX_DATA_VALID_local),
          .UDP_RX_SOF(UDP_RX_SOF_local),
          .UDP_RX_EOF(UDP_RX_EOF_local),
          .UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID1),
          .UDP_RX_DEST_PORT_NO(UDP_RX_DEST_PORT_NO_local),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR[31:0]),
          .IP_ID_IN(IP_ID),
          // MAC interface
          .MAC_TX_DATA(DHCPS_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(DHCPS_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(DHCPS_MAC_TX_EOF),
          .MAC_TX_CTS(DHCPS_MAC_TX_CTS),
          .RTS(DHCPS_RTS),
          .TP(TP_DHCP_SERVER));
end
endgenerate

//-- DHCP CLIENT (DYNAMIC IP) -----------------------------------------
generate
if (DHCP_CLIENT_EN == 0) begin: DHCP_CLIENT_000
	always @(posedge CLK) begin
         IPv4_ADDR_local <= REQUESTED_IPv4_ADDR;   
         IPv4_SUBNET_MASK_local <= IPv4_SUBNET_MASK;   
         IPv4_GATEWAY_ADDR_local <= IPv4_GATEWAY_ADDR; 
    end
end
endgenerate

generate
if (DHCP_CLIENT_EN == 1) begin: DHCP_CLIENT_001

	assign DHCPC_SYNC_RESET = ~DYNAMIC_IPv4 | SYNC_RESET; 
	
	always @(posedge CLK) begin : DHCPC_LAST_IPv4_ADDR_GEN
	    if (DYNAMIC_IPv4 == 1'b0) begin
	        IPv4_ADDR_local <= REQUESTED_IPv4_ADDR;   
	        IPv4_SUBNET_MASK_local <= IPv4_SUBNET_MASK;   
	        IPv4_GATEWAY_ADDR_local <= IPv4_GATEWAY_ADDR;   
	    end else begin
	         IPv4_ADDR_local <= DHCPC_IPv4_ADDR;   
	         IPv4_SUBNET_MASK_local <= DHCPC_SUBNET_MASK;   
	         IPv4_GATEWAY_ADDR_local <= DHCPC_ROUTER;   
	    end
	end
	   


DHCP_CLIENT_10G #(
	      .SIMULATION(SIMULATION)
)DHCP_CLIENT_10G_001 (
	      .SYNC_RESET(DHCPC_SYNC_RESET),
          .CLK(CLK),
          .TICK_4US(TICK_4US),
          .TICK_100MS(TICK_100MS),
          .MAC_ADDR(MAC_ADDR),
          .LAST_IPv4_ADDR(REQUESTED_IPv4_ADDR),
          .IPv4_ADDR(DHCPC_IPv4_ADDR),
          .LEASE_TIME(),
          .SUBNET_MASK(DHCPC_SUBNET_MASK),
          .ROUTER(DHCPC_ROUTER),
          .DNS1(),
          .DNS2(),
          .UDP_RX_DATA(UDP_RX_DATA_local),
          .UDP_RX_DATA_VALID(UDP_RX_DATA_VALID_local),
          .UDP_RX_SOF(UDP_RX_SOF_local),
          .UDP_RX_EOF(UDP_RX_EOF_local),
          .UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID1),
          .UDP_RX_DEST_PORT_NO(UDP_RX_DEST_PORT_NO_local),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR[31:0]),
          .IP_ID_IN(IP_ID),
          .MAC_TX_DATA(DHCPC_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(DHCPC_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(DHCPC_MAC_TX_EOF),
          .MAC_TX_CTS(DHCPC_MAC_TX_CTS),
          .RTS(DHCPC_RTS),
          .TP(TP_DHCPC));

end
endgenerate

//IPv4_ADDR_OUT <= IPv4_ADDR_local;	-- report actual IP address
//SUBNET_MASK_OUT <= SUBNET_MASK_local;
//GATEWAY_IP_ADDR_OUT <= GATEWAY_IP_ADDR_local;

////-- IGMP (MULTICAST) -----------------------------------------
// detects an IGMP membership query. Triggers a response
generate
if (IGMP_EN == 1 & NUDPTX != 0) begin: IGMP_QUERY_001x

IGMP_QUERY_10G IGMP_QUERY_001 (
		  .CLK(CLK),
          .SYNC_RESET(SYNC_RESET),
          .MULTICAST_IP_ADDR(IPv4_MULTICAST_ADDR),
          .IP_PAYLOAD_DATA(IP_PAYLOAD_DATA),
          .IP_PAYLOAD_DATA_VALID(IP_PAYLOAD_DATA_VALID),
          .IP_PAYLOAD_SOF(IP_PAYLOAD_SOF),
          .IP_PAYLOAD_EOF(IP_PAYLOAD_EOF),
          .IP_PAYLOAD_WORD_COUNT(IP_PAYLOAD_WORD_COUNT),
          .IP_RX_FRAME_VALID2(IP_RX_FRAME_VALID2),
          .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
          .VALID_MULTICAST_DEST_IP(VALID_MULTICAST_DEST_IP),
          .VALID_IP_PAYLOAD_CHECKSUM(VALID_IP_PAYLOAD_CHECKSUM),
          .RX_DEST_IP_ADDR(RX_DEST_IP_ADDR[31:0]), // IGMP is only for IPv4
          .TRIGGER_RESPONSE(IGMP_TRIGGER_RESPONSE),
          .TP(TP_IGMP_QUERY));
// send an IGMP membership report either in response to a membership query
// or a couple of times at power up/reset
// or once every 102.4 seconds

always @(posedge CLK) begin : IGMP_REPORT_TIMER_GEN
    if (SYNC_RESET == 1'b1) begin
        TICK_CNTR <= {7{1'b0}};   
    end else if (TICK_100MS == 1'b1 & TICK_CNTR[6] == 1'b0 ) begin
      	// counts from 0 to 64 and stay there
        TICK_CNTR <= TICK_CNTR + 1;   
    end
    // modulo 1024 counter
    if (SYNC_RESET == 1'b1) begin
        TICK_CNTR2 <= {10{1'b0}};   
    end else if (TICK_100MS == 1'b1 ) begin
        TICK_CNTR2 <= TICK_CNTR2 + 1;   
    end
    if (TICK_100MS == 1'b1 & TICK_CNTR[6] == 1'b0 & TICK_CNTR[4:0] == 0) begin
    	// generate two pulses at 3.4 and 6.4s after reset
        IGMP_TRIGGER_RESPONSE2 <= 1'b1;   
    end else begin
        IGMP_TRIGGER_RESPONSE2 <= 1'b0;   
    end
    if (TICK_100MS == 1'b1 & TICK_CNTR2 == 1023) begin
    	// generate periodic pulses once every 102.4 seconds
        IGMP_TRIGGER_RESPONSE3 <= 1'b1;   
    end else begin
        IGMP_TRIGGER_RESPONSE3 <= 1'b0;   
    end
end

// 0.0.0.0 to signify that IP multicasting is not supported here.
assign IGMP_REPORT_START = IPv4_MULTICAST_ADDR != 32'h 00000000 ? (IGMP_TRIGGER_RESPONSE | IGMP_TRIGGER_RESPONSE2 | IGMP_TRIGGER_RESPONSE3) : 1'b0; 
IGMP_REPORT_10G IGMP_REPORT_001 (
		  .SYNC_RESET(SYNC_RESET),
          .CLK(CLK),
          .IGMP_START(IGMP_REPORT_START),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IP_ID(IP_ID),
          .MULTICAST_IP_ADDR(IPv4_MULTICAST_ADDR),
          .MAC_TX_CTS(IGMP_MAC_TX_CTS),
          .MAC_TX_DATA(IGMP_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(IGMP_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(IGMP_MAC_TX_EOF),
          .RTS(IGMP_RTS),
          .TP(TP_IGMP_REPORT));
end
endgenerate
//-- UDP RX ------------------------------------
generate
if (DHCP_SERVER_EN == 1 | NUDPTX != 0 | DHCP_CLIENT_EN == 1) begin: UDP_RX_X
	// Note: DHCP server and DHCP client rely on the UDP_RX
UDP_RX_10G UDP_RX_001 (
	      .CLK(CLK),
          .SYNC_RESET(SYNC_RESET1),
          .IP_PAYLOAD_DATA(IP_PAYLOAD_DATA),
          .IP_PAYLOAD_DATA_VALID(IP_PAYLOAD_DATA_VALID),
          .IP_PAYLOAD_SOF(IP_PAYLOAD_SOF),
          .IP_PAYLOAD_EOF(IP_PAYLOAD_EOF),
          .IP_PAYLOAD_WORD_COUNT(IP_PAYLOAD_WORD_COUNT),
          .IP_RX_FRAME_VALID(IP_RX_FRAME_VALID),
          .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
          .VALID_UDP_CHECKSUM(VALID_UDP_CHECKSUM),
          // configuration
          .PORT_NO(16'h 0000),
          .CHECK_UDP_RX_DEST_PORT_NO(1'b0), // destination UDP port check done below instead of within the component
          // Application interface + DHCP server interface
          .UDP_RX_DATA(UDP_RX_DATA_local),
          .UDP_RX_DATA_VALID(UDP_RX_DATA_VALID_local),
          .UDP_RX_SOF(UDP_RX_SOF_local),
          .UDP_RX_EOF(UDP_RX_EOF_local),
          .UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID1),
          .UDP_RX_SRC_PORT(),
          .UDP_RX_DEST_PORT(UDP_RX_DEST_PORT_NO_local),
          .TP(TP_UDP_RX));
// send to application UDP port
assign UDP_RX_DATA = UDP_RX_FRAME_VALID2 == 1'b1 ? UDP_RX_DATA_local : 64'h 0000000000000000; 
assign UDP_RX_DATA_VALID = UDP_RX_FRAME_VALID2 == 1'b1 ? UDP_RX_DATA_VALID_local : 8'h0; 
assign UDP_RX_SOF = UDP_RX_SOF_local & UDP_RX_FRAME_VALID2; 
assign UDP_RX_EOF = UDP_RX_EOF_local & UDP_RX_FRAME_VALID2; 
assign UDP_RX_DEST_PORT_NO_OUT = UDP_RX_DEST_PORT_NO_local; 
// 	-- check UDP destination port for application payload (when requested by the application)
always @(posedge CLK)
   begin : UDP_RX_002
   if (CLK == 1'b1)
      begin
      if (IP_PAYLOAD_SOF == 1'b1)
         begin
         if (CHECK_UDP_RX_DEST_PORT_NO == 1'b1 & (UDP_RX_DEST_PORT_NO_IN != IP_PAYLOAD_DATA[47:32] | 
      UDP_RX_SOURCE_PORT_NO_IN != IP_PAYLOAD_DATA[63:48]))
            begin
            UDP_RX_FRAME_VALID2 <= 1'b0;   
            end
         else
            begin
            UDP_RX_FRAME_VALID2 <= 1'b1;   
            end
         end
      end
   end

assign UDP_RX_FRAME_VALID = UDP_RX_FRAME_VALID1 & UDP_RX_FRAME_VALID2; 
end
endgenerate

//-- UDP TX ------------------------------------
generate
if (NUDPTX != 0) begin: UDP_TX_X
UDP_TX_10G #(
      .ADDR_WIDTH (10),  // elastic buffer size as 72b * 2^ADDR_WIDTH
      .UDP_CKSUM_ENABLED (1'b1),
      .IPv6_ENABLED (IPv6_ENABLED)
)UDP_TX_001 (
		  .CLK(CLK),
          .SYNC_RESET(SYNC_RESET1),
          .TICK_4US(TICK_4US),
          // Application interface
          .APP_DATA(UDP_TX_DATA),
          .APP_DATA_VALID(UDP_TX_DATA_VALID),
          .APP_SOF(UDP_TX_SOF),
          .APP_EOF(UDP_TX_EOF),
          .APP_CTS(UDP_TX_CTS),
          .ACK(UDP_TX_ACK_local),
          .NAK(UDP_TX_NAK_local),
          .DEST_IP_ADDR(UDP_TX_DEST_IP_ADDR),
          .IPv4_6n(UDP_TX_DEST_IPv4_6n),
          .DEST_PORT_NO(UDP_TX_DEST_PORT_NO),
          .SOURCE_PORT_NO(UDP_TX_SOURCE_PORT_NO),
          // Configuration
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .IP_ID(IP_ID),
          // Routing
          .RT_IP_ADDR(UDP001_RT_IP_ADDR),
          .RT_IPv4_6n(UDP001_RT_IPv4_6n),
          .RT_REQ_RTS(UDP001_RT_REQ_RTS),
          .RT_REQ_CTS(UDP001_RT_REQ_CTS),
          .RT_MAC_REPLY(RT_MAC_REPLY),
          .RT_MAC_RDY(UDP001_RT_MAC_RDY),
          .RT_NAK(UDP001_RT_NAK),
          // MAC interface
          .MAC_TX_DATA(UDP001_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(UDP001_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(UDP001_MAC_TX_EOF),
          .MAC_TX_CTS(UDP001_MAC_TX_CTS),
          .RTS(UDP001_RTS),
          .TP(TP_UDP_TX));

end
endgenerate
assign UDP_TX_ACK = UDP_TX_ACK_local; 
assign UDP_TX_NAK = UDP_TX_NAK_local; 

//-- TCP SERVER 001 ------------------------------------
// declare the port number for each TCP stream (NTCPSTREAMS streams, declared in the generic section)
generate
if (NTCPSTREAMS != 0) begin: TCP_SERVER_X
TCP_SERVER_10G #(
      .NTCPSTREAMS (NTCPSTREAMS),
      .MSS (MTU - 60), // 40byte header for IPv4/TCP but 60byte header for IPv6/TCP
      .TCP_MAX_WINDOW_SIZE (TCP_MAX_WINDOW_SIZE),
      .WINDOW_SCALING_ENABLED (WINDOW_SCALING_ENABLED),
      .IPv6_ENABLED (IPv6_ENABLED),
      .TCP_KEEPALIVE_PERIOD (TCP_KEEPALIVE_PERIOD),
      .SIMULATION (SIMULATION)
)TCP_SERVER_001 (
	      .CLK(CLK),
          .SYNC_RESET(SYNC_RESET4),
          .TICK_4US(TICK_4US),
          .TICK_100MS(TICK_100MS),
          .MAC_ADDR(MAC_ADDR),
          .TCP_LOCAL_PORTS(TCP_LOCAL_PORTS),
          .CONNECTION_RESET(CONNECTION_RESET),
          .TCP_KEEPALIVE_EN(TCP_KEEPALIVE_EN),
          .IP_PAYLOAD_DATA(IP_PAYLOAD_DATA),
          .IP_PAYLOAD_DATA_VALID(IP_PAYLOAD_DATA_VALID),
          .IP_PAYLOAD_SOF(IP_PAYLOAD_SOF),
          .IP_PAYLOAD_EOF(IP_PAYLOAD_EOF),
          .IP_PAYLOAD_WORD_COUNT(IP_PAYLOAD_WORD_COUNT),
          .IP_RX_FRAME_VALID(IP_RX_FRAME_VALID),
          .RX_IPv4_6n(RX_IPv4_6n),
          .RX_IP_PROTOCOL(RX_IP_PROTOCOL),
          .RX_IP_PROTOCOL_RDY(RX_IP_PROTOCOL_RDY),
          .RX_SOURCE_MAC_ADDR(RX_SOURCE_MAC_ADDR),
          .RX_SOURCE_IP_ADDR(RX_SOURCE_IP_ADDR),
          .VALID_TCP_CHECKSUM(VALID_TCP_CHECKSUM),
          .RX_DATA(TCP001_RX_DATA),
          .RX_DATA_VALID(TCP001_RX_DATA_VALID),
          .RX_SOF(TCP001_RX_SOF),
          .RX_TCP_STREAM_SEL_OUT(TCP001_RX_TCP_STREAM_SEL),
          .RX_EOF(TCP001_RX_EOF),
          .RX_FRAME_VALID(TCP_001_RX_FRAME_VALID),
          .RX_FREE_SPACE(TCP001_RX_FREE_SPACE),
          .TX_PACKET_SEQUENCE_START_OUT(TCP001_TX_PACKET_SEQUENCE_START),
          .TX_DEST_MAC_ADDR_OUT(TCP001_TX_DEST_MAC_ADDR),
          .TX_DEST_IP_ADDR_OUT(TCP001_TX_DEST_IP_ADDR),
          .TX_DEST_PORT_NO_OUT(TCP001_TX_DEST_PORT_NO),
          .TX_SOURCE_PORT_NO_OUT(TCP001_TX_SOURCE_PORT_NO),
          .TX_IPv4_6n_OUT(TCP001_TX_IPv4_6n),
          .TX_SEQ_NO_OUT(TCP001_TX_SEQ_NO),
          .TX_ACK_NO_OUT(TCP001_TX_ACK_NO),
          .TX_ACK_WINDOW_LENGTH_OUT(TCP001_TX_ACK_WINDOW_LENGTH),
          .TX_FLAGS_OUT(TCP001_TX_FLAGS),
          .TX_PACKET_TYPE_OUT(TCP001_TX_PACKET_TYPE),
          .TX_WINDOW_SCALE_OUT(TCP001_TX_WINDOW_SCALE),
          .MAC_TX_EOF(TCP001_MAC_TX_EOF),
          .RTS(TCP001_RTS),
          .EFF_RX_WINDOW_SIZE_PARTIAL(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL),
          .EFF_RX_WINDOW_SIZE_PARTIAL_STREAM(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_STREAM),
          .EFF_RX_WINDOW_SIZE_PARTIAL_VALID(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_VALID),
          .TX_SEQ_NO(TCP001_TX_SEQ_NOxNTCPSTREAMS),
          .TX_SEQ_NO_JUMP(TCP001_TX_SEQ_NO_JUMP),
          .RX_TCP_ACK_NO_D(TCP001_RX_ACK_NOxNTCPSTREAMS),
          .TX_STREAM_SEL(TCP001_TX_STREAM_SEL),
          .TX_PAYLOAD_RTS(TCP001_TX_PAYLOAD_RTS),
          .TX_PAYLOAD_SIZE(TCP001_TX_PAYLOAD_SIZE),
          .CONNECTED_FLAG(TCP001_CONNECTED_FLAG),
          .TP(TP_TCP_SERVER));
assign TCP_CONNECTED_FLAG = TCP001_CONNECTED_FLAG; 
// assemble tx packet (MAC/IP/TCP)
TCP_TX_10G #(
      .MSSv4 (MTU - 40),  // 40byte header for IPv4/TCP
      .MSSv6 (MTU - 60),  // 60byte header for IPv6/TCP
      .IPv6_ENABLED (IPv6_ENABLED)
)TCP_TX_001 (
		  .CLK(CLK),
          .SYNC_RESET(SYNC_RESET4),
          .MAC_ADDR(MAC_ADDR),
          .IPv4_ADDR(IPv4_ADDR_local),
          .IPv6_ADDR(IPv6_ADDR),
          .TX_PACKET_SEQUENCE_START(TCP001_TX_PACKET_SEQUENCE_START),
          .TX_DEST_MAC_ADDR_IN(TCP001_TX_DEST_MAC_ADDR),
          .TX_DEST_IP_ADDR_IN(TCP001_TX_DEST_IP_ADDR),
          .TX_DEST_PORT_NO_IN(TCP001_TX_DEST_PORT_NO),
          .TX_SOURCE_PORT_NO_IN(TCP001_TX_SOURCE_PORT_NO),
          .TX_IPv4_6n_IN(TCP001_TX_IPv4_6n),
          .TX_SEQ_NO_IN(TCP001_TX_SEQ_NO),
          .TX_ACK_NO_IN(TCP001_TX_ACK_NO),
          .TX_ACK_WINDOW_LENGTH_IN(TCP001_TX_ACK_WINDOW_LENGTH),
          .IP_ID_IN(IP_ID),
          .TX_FLAGS_IN(TCP001_TX_FLAGS),
          .TX_PACKET_TYPE_IN(TCP001_TX_PACKET_TYPE),
          .TX_WINDOW_SCALE_IN(TCP001_TX_WINDOW_SCALE),
          .TX_PAYLOAD_DATA(TCP001_TX_PAYLOAD_DATA),
          .TX_PAYLOAD_DATA_VALID(TCP001_TX_PAYLOAD_DATA_VALID),
          .TX_PAYLOAD_WORD_VALID(TCP001_TX_PAYLOAD_WORD_VALID),
          .TX_PAYLOAD_DATA_EOF(TCP001_TX_PAYLOAD_DATA_EOF),
          .TX_PAYLOAD_RTS(TCP001_TX_PAYLOAD_RTS),
          .TX_PAYLOAD_CTS(TCP001_TX_PAYLOAD_CTS),
          .TX_PAYLOAD_SIZE(TCP001_TX_PAYLOAD_SIZE),
          .TX_PAYLOAD_CHECKSUM(TCP001_TX_PAYLOAD_CHECKSUM),
          .MAC_TX_DATA(TCP001_MAC_TX_DATA),
          .MAC_TX_DATA_VALID(TCP001_MAC_TX_DATA_VALID),
          .MAC_TX_EOF(TCP001_MAC_TX_EOF),
          .MAC_TX_CTS(TCP001_MAC_TX_CTS),
          .TP());

TCP_TXBUF_10G #(
    .NTCPSTREAMS ( NTCPSTREAMS ),
    .MSS ( MTU - 60 ), // 40byte header for IPv4/TCP but 60byte header for IPv6/TCP
    .ADDR_WIDTH ( TCP_TX_WINDOW_SIZE - 3 ), //  elastic buffer size as 64b * 2^ADDR_WIDTH, max value: 12
    .TX_IDLE_TIMEOUT ( TX_IDLE_TIMEOUT ),
    .SIMULATION ( SIMULATION)
) TCP_TXBUF_001 (
          .CLK(CLK),
          .SYNC_RESET(SYNC_RESET4),
          .TICK_4US(TICK_4US),
          // application interface -------
          .APP_DATA(TCP_TX_DATA),
          .APP_DATA_VALID(TCP_TX_DATA_VALID),
          .APP_CTS(TCP001_TCP_TX_CTS),
          .APP_DATA_FLUSH(TCP_TX_DATA_FLUSH),
          // TCP_SERVER interface -------
          .EFF_RX_WINDOW_SIZE_PARTIAL_IN(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL),
          .EFF_RX_WINDOW_SIZE_PARTIAL_STREAM(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_STREAM),
          .EFF_RX_WINDOW_SIZE_PARTIAL_VALID(TCP001_EFF_RX_WINDOW_SIZE_PARTIAL_VALID),
          .TX_SEQ_NO_IN(TCP001_TX_SEQ_NOxNTCPSTREAMS),
          .TX_SEQ_NO_JUMP(TCP001_TX_SEQ_NO_JUMP),
          .RX_TCP_ACK_NO_D(TCP001_RX_ACK_NOxNTCPSTREAMS),
          .CONNECTED_FLAG(TCP001_CONNECTED_FLAG),
          .TX_STREAM_SEL(TCP001_TX_STREAM_SEL),
          // TCP_TX interface -------
          .TX_PAYLOAD_DATA(TCP001_TX_PAYLOAD_DATA),
          .TX_PAYLOAD_DATA_VALID(TCP001_TX_PAYLOAD_DATA_VALID),
          .TX_PAYLOAD_WORD_VALID(TCP001_TX_PAYLOAD_WORD_VALID),
          .TX_PAYLOAD_DATA_EOF(TCP001_TX_PAYLOAD_DATA_EOF),
          .TX_PAYLOAD_RTS(TCP001_TX_PAYLOAD_RTS),
          .TX_PAYLOAD_CTS(TCP001_TX_PAYLOAD_CTS),
          .TX_PAYLOAD_SIZE(TCP001_TX_PAYLOAD_SIZE),
          .TX_PAYLOAD_CHECKSUM(TCP001_TX_PAYLOAD_CHECKSUM),
          .TP(TP_TCP_TXBUF));
assign TCP_TX_CTS = TCP001_TCP_TX_CTS; 


TCP_RXBUFNDEMUX2_10G #(
      .NTCPSTREAMS(NTCPSTREAMS),
      .ADDR_WIDTH(TCP_RX_WINDOW_SIZE - 3)  // elastic buffers size as 64b * 2^ADDR_WIDTH
) TCP_RXBUFNDEMUX2_001 (
          .SYNC_RESET(SYNC_RESET3),
          .CLK(CLK),
          .RX_DATA(TCP001_RX_DATA),
          .RX_DATA_VALID(TCP001_RX_DATA_VALID),
          .RX_SOF(TCP001_RX_SOF),
          .RX_TCP_STREAM_SEL(TCP001_RX_TCP_STREAM_SEL),
          .RX_EOF(TCP001_RX_EOF),
          .RX_FRAME_VALID(TCP_001_RX_FRAME_VALID),
          .RX_FREE_SPACE(TCP001_RX_FREE_SPACE),
          .RX_BUF_CLR('b0), // TODO CLEAR ELASTIC BUFFERS AFTER CLOSING CONNECTION. BY APP???
          .RX_APP_RTS(TCP_RX_RTS),
          .RX_APP_DATA(TCP_RX_DATA),
          .RX_APP_DATA_VALID(TCP_RX_DATA_VALID),
          .RX_APP_CTS(TCP_RX_CTS),
          .RX_APP_CTS_ACK(TCP_RX_CTS_ACK),
          .TP(TP_TCPRXBUFNDEMUX2)
);
end
endgenerate

//-- IP ID generation
// Increment IP ID every time an IP datagram is sent

always @(posedge CLK)
   begin : IP_ID_GEN_001
   if (CLK == 1'b1)
      begin
      if (SYNC_RESET2 == 1'b1)
         begin
         IP_ID <= {16{1'b0}};   
         end
      else if (TCP001_MAC_TX_EOF == 1'b1 | UDP_TX_EOF == 1'b1 | 
      DHCPS_MAC_TX_EOF == 1'b1 | IGMP_MAC_TX_EOF == 1'b1 )
         begin

//  increment every time an IP packet is send (or a commitment to send is made, in the case of UDP)
//  Adjust as needed when other IP/UDP/TCP components are instantiated
         IP_ID <= IP_ID + 1;   
         end
      end
   end

// 	
// //-- TRANSMISSION ARBITER --------------
//  determines the source for the next packet to be transmitted.
//  State machine to prevent overlapping between two packets ready... 
//  For example, one has to wait until a UDP packet has completed transmission 
//  before starting to send a TCP packet.

always @(posedge CLK)
   begin : TX_MUX_001
   if (CLK == 1'b1)
      begin
      if (SYNC_RESET2 == 1'b1)
         begin
         TX_MUX_STATE <= 0;   
//  idle
         end
      else if (TX_MUX_STATE == 0 )
         begin
         if (MAC_TX_CTS == 1'b1)
            begin

//  from idle to ...
            if (ARP_RTS == 1'b1)
               begin
               TX_MUX_STATE <= 1;   
//  enable ARP response
               end
            else if (PING_RTS == 1'b1 )
               begin
               TX_MUX_STATE <= 2;   
//  enable PING response
               end
            else if (TCP001_RTS == 1'b1 & NTCPSTREAMS != 0 )
               begin
               TX_MUX_STATE <= 3;   
//  enable TCP001 transmission 
               end
            else if (WHOIS_RTS == 1'b1 & NUDPTX != 0 )
               begin
               TX_MUX_STATE <= 4;   
//  enable WHOIS transmission
               end
            else if (UDP001_RTS == 1'b1 & NUDPTX != 0 )
               begin
               TX_MUX_STATE <= 5;   
//  enable UDP001 transmission (duplicate as needed)
               end
            else if (IGMP_RTS == 1'b1 & IGMP_EN == 1'b1 & NUDPTX != 0 )
               begin
               TX_MUX_STATE <= 6;   
//  enable IGMP message transmission
               end
            else if (ICMPV6_RTS == 1'b1 & IPv6_ENABLED == 1'b1 )
               begin
               TX_MUX_STATE <= 7;   
//  enable ICMPv6 message transmission--			
               end
            else if (DHCPS_RTS == 1'b1 & DHCP_SERVER_EN == 1'b1 & DHCP_SERVER_EN2 == 1'b1 )
               begin
               TX_MUX_STATE <= 8;   
//  enable DHCP server message transmission--			
               end
            else if (DHCPC_RTS == 1'b1 & DHCP_CLIENT_EN == 1'b1 & DYNAMIC_IPv4 == 1'b1 )
               begin
               TX_MUX_STATE <= 9;   
//  enable DHCP client message transmission--			

//             elsif(TCP002_RTS = '1') and (NTCPSTREAMS /= 0) then
// 				TX_MUX_STATE <= 10;	-- enable TCP002 transmission 
               end
            end

//  Done transmitting. go from ... to idle
         end
      else
         begin
         if (TX_MUX_STATE == 1 & ARP_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 2 & PING_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 3 & TCP001_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 4 & WHOIS_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 5 & UDP001_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 6 & IGMP_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 7 & ICMPV6_MAC_TX_EOF == 1'b1 & IPv6_ENABLED == 1'b1 | TX_MUX_STATE == 8 & DHCPS_MAC_TX_EOF == 1'b1 | TX_MUX_STATE == 9 & DHCPC_MAC_TX_EOF == 1'b1)
            begin

// ((TX_MUX_STATE = 10) and (TCP002_MAC_TX_EOF = '1')  or
            TX_MUX_STATE <= 0;   
//  idle
            end
         end
      end
   end

assign MAC_TX_RTS = ARP_RTS | PING_RTS | TCP001_RTS | WHOIS_RTS | UDP001_RTS | IGMP_RTS | ICMPV6_RTS | DHCPS_RTS; 

always @(posedge CLK)
   begin : TX_MUX_002
   if (CLK == 1'b1)
      begin
      case (TX_MUX_STATE)
      1:
         begin
         MAC_TX_DATA_local <= ARP_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= ARP_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= ARP_MAC_TX_EOF;   
         end
      2:
         begin
         MAC_TX_DATA_local <= PING_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= PING_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= PING_MAC_TX_EOF;   
         end
      3:
         begin
         MAC_TX_DATA_local <= TCP001_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= TCP001_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= TCP001_MAC_TX_EOF;   
         end
      4:
         begin
         MAC_TX_DATA_local <= WHOIS_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= WHOIS_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= WHOIS_MAC_TX_EOF;   
         end
      5:
         begin
         MAC_TX_DATA_local <= UDP001_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= UDP001_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= UDP001_MAC_TX_EOF;   
         end
      6:
         begin
         MAC_TX_DATA_local <= IGMP_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= IGMP_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= IGMP_MAC_TX_EOF;   
         end
      7:
         begin
         MAC_TX_DATA_local <= ICMPV6_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= ICMPV6_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= ICMPV6_MAC_TX_EOF;   
         end
      8:
         begin
         MAC_TX_DATA_local <= DHCPS_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= DHCPS_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= DHCPS_MAC_TX_EOF;   
         end
      9:
         begin
         MAC_TX_DATA_local <= DHCPC_MAC_TX_DATA;   
         MAC_TX_DATA_VALID_local <= DHCPC_MAC_TX_DATA_VALID;   
         MAC_TX_EOF_local <= DHCPC_MAC_TX_EOF;   

// 			when (10) =>
// 				MAC_TX_DATA_local <= TCP002_MAC_TX_DATA;
// 				MAC_TX_DATA_VALID_local <= TCP002_MAC_TX_DATA_VALID;
// 				MAC_TX_EOF_local <= TCP002_MAC_TX_EOF;
         end
      default:
         begin
         MAC_TX_DATA_local <= {64{1'b0}};   
         MAC_TX_DATA_VALID_local <= {8{1'b0}};   
         MAC_TX_EOF_local <= 1'b0;   
         end
      endcase
      end
   end


always @( MAC_TX_DATA_VALID_local ) 
MAC_TX_WORD_VALID = MAC_TX_DATA_VALID_local != 0 ? 1'b1 : 1'b0; 
assign MAC_TX_EOF = MAC_TX_EOF_local; 

// //-- FLIP TX BYTE ORDER IN WORD --------------
//  flipping the MSB <-> LSB makes it easier to read the various fields values in this code or simulator

generate
	for (i = 0; i <= 7; i = i + 1) begin
		always @(MAC_TX_DATA_local or MAC_TX_DATA_VALID_local) begin : FLIP_TX_MAC_BYTES
			MAC_TX_DATA[i * 8 + 7:i * 8] <= MAC_TX_DATA_local[(7 - i) * 8 + 7:(7 - i) * 8];   
			MAC_TX_DATA_VALID[i] <= MAC_TX_DATA_VALID_local[7 - i];   			    
		end
	end
endgenerate
//  reconstruct a SOF pulse for local loopback

always @(posedge CLK)
   begin : SOF_GEN
   if (CLK == 1'b1)
      begin
      if (SYNC_RESET2 == 1'b1)
         begin
         MAC_TX_EOF_FLAGn <= 1'b0;   
         end
      else if (MAC_TX_EOF_local == 1'b1 )
         begin
         MAC_TX_EOF_FLAGn <= 1'b0;   
         end
      else if (MAC_TX_WORD_VALID == 1'b1 )
         begin
         MAC_TX_EOF_FLAGn <= 1'b1;   
         end
      end
   end


always @( MAC_TX_EOF_FLAGn ) 
MAC_TX_EOF_FLAG = ~MAC_TX_EOF_FLAGn; 
assign MAC_TX_SOF = MAC_TX_WORD_VALID == 1'b1 & MAC_TX_EOF_FLAG == 1'b1 ? 1'b1 : 1'b0; 

//  Route "Clear To Send" signal from the MAC to the proper protocol component

always @( TX_MUX_STATE or MAC_TX_CTS ) 
ARP_MAC_TX_CTS = TX_MUX_STATE == 1 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
PING_MAC_TX_CTS = TX_MUX_STATE == 2 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
TCP001_MAC_TX_CTS = TX_MUX_STATE == 3 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
WHOIS_MAC_TX_CTS = TX_MUX_STATE == 4 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
UDP001_MAC_TX_CTS = TX_MUX_STATE == 5 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
IGMP_MAC_TX_CTS = TX_MUX_STATE == 6 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
ICMPV6_MAC_TX_CTS = TX_MUX_STATE == 7 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
DHCPS_MAC_TX_CTS = TX_MUX_STATE == 8 ? MAC_TX_CTS : 1'b0; 

always @( TX_MUX_STATE or MAC_TX_CTS ) 
DHCPC_MAC_TX_CTS = TX_MUX_STATE == 9 ? MAC_TX_CTS : 1'b0; 

// TCP002_MAC_TX_CTS <= MAC_TX_CTS when (TX_MUX_STATE = 10) else '0';
// //-- ROUTING TABLE ARBITER --------------
//  Since several components could send simultaneous routing (RT) requests, one must 
//  determine who can access the routing table next

always @(posedge CLK)
   begin : RT_MUX_001
   if (CLK == 1'b1)
      begin
      if (SYNC_RESET2 == 1'b1)
         begin
         RT_MUX_STATE <= 0;   
//  idle
         end
      else if (RT_MUX_STATE == 0 )
         begin

//  from idle to ...
         if (UDP001_RT_REQ_RTS == 1'b1)
            begin
            RT_MUX_STATE <= 1;   
//  gives UDP001 access to the routing table

// 			elsif(UDP002_RT_REQ_RTS = '1') then
// 				RT_MUX_STATE <= 2;	-- gives UDP002 access to the routing table
// 			elsif(UDP003_RT_REQ_RTS = '1') then
// 				RT_MUX_STATE <= 3;	-- gives UDP003 access to the routing table
            end

//  Routing table transaction complete. go back to idle
         end
      else if (RT_MAC_RDY == 1'b1 | RT_NAK == 1'b1 )
         begin
         RT_MUX_STATE <= 0;   
//  idle
         end
      end
   end


always @(RT_MUX_STATE or UDP001_RT_IP_ADDR or UDP001_RT_IPv4_6n or UDP001_RT_REQ_RTS)
   begin : RT_MUX_002
   case (RT_MUX_STATE)
   1:
      begin
      RT_IP_ADDR <= UDP001_RT_IP_ADDR;   
      RT_IPv4_6n <= UDP001_RT_IPv4_6n;   
      RT_REQ_RTS <= UDP001_RT_REQ_RTS;   

// 		when (2) =>
// 			RT_IP_ADDR <= UDP002_RT_IP_ADDR;
// 		--when (3) =>
// 			RT_IP_ADDR <= UDP003_RT_IP_ADDR;
//  etc...
      end
   default:
      begin
      RT_IP_ADDR <= {128{1'b0}};   
      RT_IPv4_6n <= 1'b0;   
      RT_REQ_RTS <= 1'b0;   
      end
   endcase
   end


always @( RT_MUX_STATE or RT_CTS ) 
UDP001_RT_REQ_CTS = RT_MUX_STATE == 1 ? RT_CTS : 1'b0; 

// UDP002_RT_REQ_CTS <= RT_CTS when (RT_MUX_STATE = 2) else '0';
// UDP003_RT_REQ_CTS <= RT_CTS when (RT_MUX_STATE = 3) else '0';
//  etc...

always @( RT_MUX_STATE or RT_MAC_RDY ) 
UDP001_RT_MAC_RDY = RT_MUX_STATE == 1 ? RT_MAC_RDY : 1'b0; 

// UDP002_RT_MAC_RDY <= RT_MAC_RDY when (RT_MUX_STATE = 2) else '0';
// UDP003_RT_MAC_RDY <= RT_MAC_RDY when (RT_MUX_STATE = 3) else '0';
//  etc...

always @( RT_MUX_STATE or RT_NAK ) 
UDP001_RT_NAK = RT_MUX_STATE == 1 ? RT_NAK : 1'b0; 

// UDP002_RT_NAK <= RT_NAK when (RT_MUX_STATE = 2) else '0';
// UDP003_RT_NAK <= RT_NAK when (RT_MUX_STATE = 3) else '0';
//  etc...
// //-- TEST POINTS
assign TP[10:1] = TP_TCP_SERVER[10:1]; 


endmodule // module COM5502

