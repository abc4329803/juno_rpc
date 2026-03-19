`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 10:25:57
// Design Name: 
// Module Name: network_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module network_top #(
		parameter NTCPSTREAMS = 1, //integer range 0 to 255 := 1;  
			//-- number of concurrent TCP streams handled by this component
		parameter NUDPTX = 1, //integer range 0 to 1:= 1;
		parameter NUDPRX = 1, //integer range 0 to 1:= 1;
			//-- Enable/disable UDP protocol for tx and rx
		parameter MTU = 1500, //integer range 1500 to 9000 := 1500;
			//-- Maximum Transmission Unit: maximum number of payload Bytes.
			//-- Typically 1500 for standard frames, 9000 for jumbo frames.
			//-- A frame will be deemed invalid if its payload size exceeds this MTU value.
			//-- Should match the values in MAC layer)
			//-- For maximum TCP throughput, select MTU = (buffer size/4) + 60 bytes (IP/TCP header)
			//-- for example, when ADDR_WIDTH = 12, best MTU is 8252. It will work at MTU = 9000 but with a 
			//-- small degradation in TCP throughput.
		parameter TCP_TX_WINDOW_SIZE = 15, //integer range 11 to 20 := 15;
		parameter TCP_RX_WINDOW_SIZE = 15, //integer range 11 to 20 := 15;
		
			//-- Window size is expressed as 2**n Bytes. Thus a value of 15 indicates a window size of 32KB.
			//-- this generic parameter determines how much memory is allocated to buffer tcp tx/rx streams. 
			//-- It applies equally to all concurrent streams (no individualization)
			//-- purpose: tradeoff memory utilization vs throughput. 
			//-- Memory size ranges from 2KB (multiple streams/lower individual throughput) to 1MB (single stream/maximum throughput)
		parameter IPv6_ENABLED = 0, //std_logic := '1';
            //-- 0 to minimize size, 1 to allow IPv6 in addition to IPv4 (larger size)
		parameter DHCP_SERVER_EN = 0, //std_logic := '1';
			//-- instantiate ('1') a DHCP server
			//-- One can instantiate both DHCP server and DHCP client at the same time, but not enable them simultaneously
		parameter DHCP_CLIENT_EN = 0, //std_logic := '1';
			//-- '0' for static address (for minimum size), '1' for static/dynamic address (instantiates a DHCP_CLIENT component)
			//-- One can instantiate both DHCP server and DHCP client at the same time, but not enable them simultaneously
		parameter IGMP_EN = 0, //std_logic := '1';
			//-- '1' to enable UDP multicast (which requires IGMP)
		parameter TX_IDLE_TIMEOUT = 50, //integer range 0 to 50:= 50;	
			//-- inactive input timeout, expressed in 4us units. -- 50*4us = 200us 
			//-- Controls the TCP transmit stream segmentation: data in the elastic buffer will be transmitted if
			//-- no input is received within TX_IDLE_TIMEOUT, without waiting for the transmit frame to be filled with MSS data bytes.
		parameter TCP_KEEPALIVE_PERIOD = 60, //integer := 60;
			//-- period in seconds for sending no data keepalive frames. 
			//-- "Typically TCP Keepalives are sent every 45 or 60 seconds on an idle TCP connection, and the connection is 
			//-- dropped after 3 sequential ACKs are missed" 
		parameter CLK_FREQUENCY = 156, //integer := 156;
			//-- CLK frequency in MHz. Needed to compute actual delays.
		parameter SIMULATION = 0  //std_logic := '0'
			//-- 1 during simulation with Wireshark .cap file, '0' otherwise
			//-- Wireshark many not be able to collect offloaded checksum computations.
			//-- when SIMULATION =  '1': (a) IP header checksum is valid if 0000,
			//-- (b) TCP checksum computation is forced to a valid 00001 irrespective of the 16-bit checksum
			//-- captured by Wireshark.
)(

	input         				  sys_rst,
	input         				  clk_100m,
	output        				  coreclk,
	output        				  corerst,
	input                                     trig_in,
								  
	input         				  refclk10g_p,
	input         				  refclk10g_n,
	output        				  txp10g,
	output        				  txn10g,
	input         				  rxp10g,
	input         				  rxn10g,
	output        				  SFF_TX_DIS, 

	//--//-- Application <- UDP rx payload
	output[63:0]               	  UDP_RX_DATA,
	output                        UDP_RX_DATA_VALID,
	output[7:0]                   UDP_RX_DATA_KEEP,
	output                        UDP_RX_SOF,
	output                        UDP_RX_EOF,
	output                        UDP_RX_FRAME_VALID,
		//-- check entire frame validity at UDP_RX_EOF
		//-- 1 CLK pulse indicating that UDP_RX_DATA is the last byte in the UDP payload data field.
		//-- ALWAYS CHECK UDP_RX_FRAME_VALID at the end of packet (UDP_RX_EOF = '1') to confirm
		//-- that the UDP packet is valid. External buffer may have to backtrack to the the last
		//-- valid pointer to discard an invalid UDP packet.
		//-- Reason: we only knows about bad UDP packets at the end.
	input [15:0]                  UDP_RX_DEST_PORT_NO_IN,
	input [15:0]                  UDP_RX_SOURCE_PORT_NO_IN,
	input                         CHECK_UDP_RX_DEST_PORT_NO,
		//-- check the destination port number matches UDP_RX_DEST_PORT_NO (1) or ignore it (0)
		//-- The latter case is useful when this component is shared among multiple UDP ports
	output[15:0]                  UDP_RX_DEST_PORT_NO_OUT,
		//-- Collected destination UDP port in received UDP frame. Read when APP_EOF = '1' 
			
	//--//-- Application -> UDP tx
	input [63:0]                  UDP_TX_DATA,
	input                         UDP_TX_DATA_VALID,
	input [7:0]                   UDP_TX_DATA_KEEP,
	input                         UDP_TX_SOF,
	input                         UDP_TX_EOF,
	output                        UDP_TX_CTS,
	output                        UDP_TX_ACK,
	output                        UDP_TX_NAK,
	input [127:0]                 UDP_TX_DEST_IP_ADDR,
	input                         UDP_TX_DEST_IPv4_6n,
	input [15:0]                  UDP_TX_DEST_PORT_NO,
	input [15:0]                  UDP_TX_SOURCE_PORT_NO,
		//-- the IP and port information is latched in at the UDP_TX_SOF pulse.
		//-- USAGE: wait until the previous UDP tx frame UDP_TX_ACK or UDP_TX_NAK to send the follow-on UDP tx frame
	
	//--//-- Application <- TCP rx
	//-- NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
    //-- Usage: application raises the Clear-To-Send flag for one CLK. If a 64-bit word is available to be read, it is
    //-- placed in RX_APP_DATA with a latency of 2 CLKs. In this case RX_APP_DATA_VALID(I) = x"FF" indicating a data width of 8 bytes.
    //-- The application can also request to 'peek' into the next 8-bytes in memory by raising RX_APP_PEEK_NEXT(I) for one CLK. 
    //-- The data will also be placed in RX_APP_DATA and the width (which can be 1-8 bytes) will  be placed in RX_APP_DATA_VALID.
    //-- Peeking does not advance the read pointer. It is mutually exclusive with a Clear-To-Send request. It has lower priority.
	input [16*NTCPSTREAMS-1 : 0]  TCP_LOCAL_PORTS,
		//-- TCP_SERVER port configuration. Each one of the NTCPSTREAMS streams handled by this
		//-- component must be configured with a distinct port number. 
		//-- This value is used as destination port number to filter incoming packets, 
		//-- and as source port number in outgoing packets.
	output[64*NTCPSTREAMS-1 : 0]  TCP_RX_DATA,
	output[NTCPSTREAMS-1 : 0]     TCP_RX_DATA_VALID,
	output[8*NTCPSTREAMS-1 : 0]   TCP_RX_DATA_KEEP,
	output[NTCPSTREAMS-1 : 0]     TCP_RX_RTS,
	input [NTCPSTREAMS-1 : 0]     TCP_RX_CTS,
		//-- 1 CLK pulse to read the next (partial) word TCP_RX_DATA
		//-- Latency: 2 CLKs to TCP_RX_DATA, but only IF AND ONLY IF the next word has at least one available byte.
	output[NTCPSTREAMS-1 : 0]     TCP_RX_CTS_ACK,
		//-- '1' the TCP_RX_CTS request for new data is accepted:
		//-- indicating that a new (maybe partial) word will be placed on the output TCP_RX_DATA at the next CLK.
	
	//--//-- Application -> TCP tx
	//-- NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
	input [64*NTCPSTREAMS-1 : 0]  TCP_TX_DATA,
	input [NTCPSTREAMS-1 : 0]     TCP_TX_DATA_VALID,
	input [8*NTCPSTREAMS-1 : 0]   TCP_TX_DATA_KEEP,
	input [NTCPSTREAMS-1 : 0]     TCP_TX_DATA_FLUSH,
	output[NTCPSTREAMS-1 : 0]     TCP_TX_CTS
		//-- Clear To Send = transmit flow control. 
		//-- App is responsible for checking the CTS signal before sending APP_DATA
 	    //-- byte order: MSB first (reason: easier to read contents during simulation)
		//-- All input words must include 8 bytes of data (TCP_TX_DATA_VALID = x"FF") except the last word which can 
        //-- be partially filled with 1-8 bytes of data.
            
    );


		
//--//-- CONFIGURATION
//-- usage: use SYNC_RESET after a configuration change
wire [47:0] MAC_ADDR;
wire        DYNAMIC_IPv4;	
	//-- '1' if dynamic IPv4 address using an external DHCP server, '0' if fixed (static) IPv4 address.
	//-- Dynamic IP address requires the generic parameter DHCP_CLIENT_EN = '1' to instantiate a DHCP client within.
	//-- Mutually exclusive with DHCP_SERVER_EN2 (chose DHCP client OR server, but not both)
wire [31:0] REQUESTED_IPv4_ADDR;
	//-- fixed IP address if static, or requested IP address if dynamic (DHCP_CLIENT_EN and DYNAMIC_IP = '1').
	//-- In the case of dynamic IP, this is typically the last IP address, as stored in external non-volatile memory.
	//-- In the case of dynamic IP, use 0.0.0.0 if no previous IP address is available.
	//-- In the case of dynamic IP, this field is read only when SYNC_RESET = '1'
	//-- Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
wire [31:0] IPv4_MULTICAST_ADDR;
    //-- to receive UDP multicast messages. One multicast address only
    //-- 0.0.0.0 to signify that IP multicasting is not supported here.
wire [31:0] IPv4_SUBNET_MASK;
	//-- Ignored when the DHCP client feature is enabled, as the DHCP server provides the gateway information. 
wire [31:0] IPv4_GATEWAY_ADDR;
	//-- Ignored when the DHCP client feature is enabled, as the DHCP server provides the gateway information. 
wire [127:0]IPv6_ADDR;
    //-- local IP address. 16 bytes for IPv6
wire [7:0]  IPv6_SUBNET_PREFIX_LENGTH;
		 //-- 128 - subnet size in bits. Usually expressed as /n. Typical range 64-128
wire [127:0]IPv6_GATEWAY_ADDR;

//--// User-initiated connection reset for stream I
wire [NTCPSTREAMS-1:0]  CONNECTION_RESET;
wire [NTCPSTREAMS-1:0]  TCP_KEEPALIVE_EN;
	//-- enable TCP Keepalive (1) or not (0)

//--//-- DHCP SERVER CONFIGURATION
wire        DHCP_SERVER_EN2;
	//-- enable(1)/disable(0) DHCP server at run-time. Requires DHCP_SERVER to be instantiated through DHCP_SERVER_EN
	//-- Mutually exclusive with DYNAMIC_IP (chose DHCP client OR server, but not both)
wire[7:0]   DHCP_SERVER_IP_MIN_LSB;
wire[7:0]   DHCP_SERVER_NIPs;
	//-- range of IP addresses to be assigned by this DHCP server
	//-- the actual address is in the form IPv4_ADDR for the 3 MSB, and a subnet address between IP_MIN (inclusive)
	//-- and IP_MIN + NIPs -1 (inclusive)
	//-- Maximum 128 entries.
	//-- For example, if IPv4_ADDR = 172.16.1.3, IP_MIN = 10, NIPs = 10, this DHCP server will assign and keep track of 
	//-- IP addresses in the range 172.16.1.10 and 172.16.1.19 (inclusive).
wire[31:0]  DHCP_SERVER_LEASE_TIME;
	//-- DHCP server to provide a lease time in secs to DHCP clients. 
	//-- applicable only when DHCP server is instantiated within and enabled, DHCP_SERVER_EN/DHCP_SERVER_EN2='1'
wire[31:0]  DHCP_ROUTER;
	//-- DHCP server to provide a router IP address to DHCP clients. 
	//-- In a typical configuration, the router address is this device's address.
	//-- However, the network administrator can decide to use point to another router (in effect rendering this router LAN to WAN link inoperative)
wire[31:0]  DHCP_SERVER_DNS;
	//-- DHCP server to provide DNS address to DHCP clients. 
	//-- applicable only when DHCP server is instantiated within and enabled, DHCP_SERVER_EN/DHCP_SERVER_EN2='1'

//--//-- Protocol -> Transmit MAC Interface
//-- 32-bit CRC is automatically appended by the MAC layer. User should not supply it.
(* MARK_DEBUG="true" *)wire[63:0]  MAC_TX_DATA;
	//-- MAC reads the data at the rising edge of CLK when MAC_TX_DATA_VALID = '1'
	//-- Bytes order: LSB was received first
	//-- Bytes are right aligned: first byte in LSB, occasional follow-on fill-in Bytes in the MSB(s)
	//-- The first destination address byte is always a LSB (MAC_TX_DATA(7:0))
(* MARK_DEBUG="true" *)wire[7:0]   MAC_TX_DATA_VALID;
	//-- data valid, for each byte in MAC_TX_DATA
(* MARK_DEBUG="true" *)wire        MAC_TX_SOF;
	//-- start of frame: '1' when sending the first byte. 
	//-- Aligned with MAC_TX_DATA_VALID
(* MARK_DEBUG="true" *)wire        MAC_TX_EOF;
	//-- End of frame: '1' when sending the last byte in a packet to be transmitted. 
	//-- Aligned with MAC_TX_DATA_VALID
(* MARK_DEBUG="true" *)wire        MAC_TX_CTS;
	//-- MAC-generated Clear To Send flow control signal, indicating room in the 
	//-- MAC tx elastic buffer for a complete frame of size MTU 
	//-- The user should check that this signal is high before deciding to send
	//-- sending the next frame. 
(* MARK_DEBUG="true" *)wire        MAC_TX_RTS;
	//-- '1' when at least one of the inner processes is ready to transmit. Will on transmit when CTS goes high.
	//-- useful if there is an external transmission arbiter (for example in the case of multiple clients)

//--//-- Receive MAC -> Protocol
//-- Valid rx packets only: packets with bad CRC or invalid address are discarded in the MAC
//-- The 32-bit CRC is always removed by the MAC layer.
(* MARK_DEBUG="true" *)wire [63:0] MAC_RX_DATA;
	//-- USER reads the data at the rising edge of CLK when MAC_RX_DATA_VALID /= 0
	//-- Bytes order: LSB was received first
	//-- Bytes are right aligned: first byte in LSB, occasional follow-on fill-in Bytes in the MSB(s)
	//-- The first destination address byte is always a LSB (MAC_RX_DATA(7:0))
(* MARK_DEBUG="true" *)wire [7:0]  MAC_RX_DATA_VALID;
	//-- data valid, for each byte in MAC_RX_DATA
(* MARK_DEBUG="true" *)wire        MAC_RX_SOF;
	//-- '1' when sending the first byte in a received packet. 
	//-- Aligned with MAC_RX_DATA_VALID
(* MARK_DEBUG="true" *)wire        MAC_RX_EOF;
	//-- '1' when sending the last byte in a received packet. 
	//-- Aligned with MAC_RX_DATA_VALID
(* MARK_DEBUG="true" *)wire        MAC_RX_FRAME_VALID;
	//-- this component verifies the frame validity (CRC good, length, MAC address) at
	//-- the end of the frame (when MAC_RX_EOF). 
wire [63:0]                  UDP001_RX_DATA;	
        //-- byte order: MSB first (reason: easier to read contents during simulation)
wire [7:0]                   UDP001_RX_DATA_VALID;
        //-- example: 1 byte -> 0x80, 2 bytes -> 0xC0

wire [63:0]                  UDP001_TX_DATA;
		//-- byte order: MSB first (reason: easier to read contents during simulation)
		//-- unused bytes are expected to be zeroed
wire [7:0]                   UDP001_TX_DATA_VALID;   
        //-- example: 1 byte -> 0x80, 2 bytes -> 0xC0

wire [64*NTCPSTREAMS-1 : 0]  TCP001_RX_DATA;
wire [8*NTCPSTREAMS-1 : 0]   TCP001_RX_DATA_VALID;

wire [64*NTCPSTREAMS-1 : 0]  TCP001_TX_DATA;
(* MARK_DEBUG="true" *)wire [8*NTCPSTREAMS-1 : 0]   TCP001_TX_DATA_VALID;

//wire         coreclk;
wire        core_ready;  
wire        core_reset;
(* MARK_DEBUG="true" *)wire        s_axis_tx_tvalid;
(* MARK_DEBUG="true" *)wire        s_axis_tx_tready;   
(* MARK_DEBUG="true" *)wire [63:0] s_axis_tx_tdata;    
(* MARK_DEBUG="true" *)wire [7:0]  s_axis_tx_tkeep;    
(* MARK_DEBUG="true" *)wire        s_axis_tx_tlast;   
(* MARK_DEBUG="true" *)wire        m_axis_rx_tvalid;
wire        m_axis_rx_tready;    
(* MARK_DEBUG="true" *)wire [63:0] m_axis_rx_tdata;    
(* MARK_DEBUG="true" *)wire [7:0]  m_axis_rx_tkeep;    
(* MARK_DEBUG="true" *)wire        m_axis_rx_tlast;

wire [63:0] tx_axis_tdata;
wire [7:0]  tx_axis_tkeep;
wire        tx_axis_tvalid;
wire        tx_axis_tlast;
wire        tx_axis_tready;
wire [63:0] rx_axis_tdata;
wire [7:0]  rx_axis_tkeep;
wire        rx_axis_tvalid;
wire        rx_axis_tlast;
wire        rx_axis_tready;

//--//-- CONFIGURATION
//-- usage: use SYNC_RESET after a configuration change
assign MAC_ADDR = 48'hb0_7b_25_05_e2_2c;
assign DYNAMIC_IPv4 = 1'b0;
	//-- '1' if dynamic IPv4 address using an external DHCP server, '0' if fixed (static) IPv4 address.
	//-- Dynamic IP address requires the generic parameter DHCP_CLIENT_EN = '1' to instantiate a DHCP client within.
assign REQUESTED_IPv4_ADDR = 32'hC0A80A15; // 192.168.10.20
	//-- fixed IP address if static, or requested IP address if dynamic (DHCP_CLIENT_EN and DYNAMIC_IP = '1').
	//-- In the case of dynamic IP, this is typically the last IP address, as stored in external non-volatile memory.
	//-- In the case of dynamic IP, use 0.0.0.0 if no previous IP address is available.
	//-- In the case of dynamic IP, this field is read only when SYNC_RESET = '1'
	//-- Natural order (MSB) 172.16.1.128 (LSB) as transmitted in the IP frame.
assign IPv4_MULTICAST_ADDR = 32'h00000000;
	//-- to receive UDP multicast messages. One multicast address only
	//-- 0.0.0.0 to signify that IP multicasting is not supported here.
assign IPv4_SUBNET_MASK = 32'hFFFFFF00;
assign IPv4_GATEWAY_ADDR = 32'hC0A80A01; // 192.168.10.1
assign IPv6_ADDR = 128'hFE80000000000000E5E8AC24E60A5054;
	//-- local IP address. 16 bytes for IPv6
assign IPv6_SUBNET_PREFIX_LENGTH = 8'h40; // 64
	//-- 128 - subnet size in bits. Usually expressed as /n. Typical range 64-128
assign IPv6_GATEWAY_ADDR = 128'd0; 

//--// User-initiated connection reset for stream I
genvar q;
generate for (q = 0 ; q < NTCPSTREAMS ; q = q + 1)   
begin : User_initiated

assign CONNECTION_RESET[q] = sys_rst;
assign TCP_KEEPALIVE_EN[q] = 1'b1;

end
endgenerate

//--//-- DHCP SERVER CONFIGURATION
assign DHCP_SERVER_EN2 = 1'b0;
assign DHCP_SERVER_IP_MIN_LSB = 8'ha0;
assign DHCP_SERVER_NIPs = 8'h10;
assign DHCP_SERVER_LEASE_TIME = 32'h00000078;
assign DHCP_ROUTER = 32'hC0A80201;
assign DHCP_SERVER_DNS = 32'h08080808;

assign SFF_TX_DIS = 1'b0;
assign corerst = ~core_ready | core_reset;



axi_10g_ethernet_0_example_design axi_10g_ethernet_0_example_design(
    .clk_100                         (clk_100m),   
    .refclk_p                        (refclk10g_p),   
    .refclk_n                        (refclk10g_n),   
    .reset                           (sys_rst), 
    
    .sfp_tx_disable                  (),  
    .coreclk                         (coreclk),   
    .core_ready                      (core_ready),   
    .core_reset                      (core_reset), 

	.areset_datapathclk_out          (),
    .txusrclk_out                    (),
    .txusrclk2_out                   (),
    .gttxreset_out                   (),
    .gtrxreset_out                   (),
    .txuserrdy_out                   (),
    .reset_counter_done_out          (),
    .qplllock_out                    (),
    .qplloutclk_out                  (),
    .qplloutrefclk_out               (),	
                                
    .txp                             (txp10g),  
    .txn                             (txn10g),  
    .rxp                             (rxp10g),  
    .rxn                             (rxn10g),  
                             
    .s_axis_tx_tdata                 (s_axis_tx_tdata),  
    .s_axis_tx_tkeep                 (s_axis_tx_tkeep),  
    .s_axis_tx_tvalid                (s_axis_tx_tvalid),  
    .s_axis_tx_tlast                 (s_axis_tx_tlast),  
    .s_axis_tx_tready                (s_axis_tx_tready),  
    .m_axis_rx_tdata                 (m_axis_rx_tdata),  
    .m_axis_rx_tkeep                 (m_axis_rx_tkeep),  
    .m_axis_rx_tvalid                (m_axis_rx_tvalid),  
    .m_axis_rx_tlast                 (m_axis_rx_tlast),  
    .m_axis_rx_tready                (m_axis_rx_tready)   
);

wire CLK_g;

BUFG BUFG_inst3(.I(coreclk), .O(CLK_g));

  ila_1 ila1(
     .clk(CLK_g),
     .probe0(s_axis_tx_tdata),
     .probe1(s_axis_tx_tkeep),
     .probe2(s_axis_tx_tvalid),
     .probe3(s_axis_tx_tready),
     .probe4(s_axis_tx_tlast),
     .probe5(s_axis_tx_tvalid),
     .probe6(rx_axis_tvalid),
     .probe7(rx_axis_tfirst),
     .probe8(tx_axis_tdata),
     .probe9(tx_axis_tkeep),
     .probe10(tx_axis_tvalid),
     .probe11(tx_axis_tready),
     .probe12(tx_axis_tlast),
     .probe13(m_axis_rx_tvalid),
     .probe14(rx_axis_tvalid),
     .probe15(MAC_RX_DATA),
	 .probe16(MAC_RX_DATA_VALID),
	 .probe17(MAC_RX_SOF),
	 .probe18(MAC_RX_EOF),
	 .probe19(flag_sof),
	 .probe20(rx_axis_tlast),
	 .probe21(TCP001_RX_DATA_VALID),
	 .probe22(TCP001_RX_DATA)                                                                                                                                                                                               
  ); 
axis_data_fifo_1 tx_packet_fifo 
(
  .s_axis_aresetn(~corerst),       
  .s_axis_aclk(coreclk),           
  .s_axis_tvalid(tx_axis_tvalid),  
  .s_axis_tready(tx_axis_tready),  
  .s_axis_tdata(tx_axis_tdata),    
  .s_axis_tkeep(tx_axis_tkeep),    
  .s_axis_tlast(tx_axis_tlast),    
  .s_axis_tuser(1'b0),             
  .m_axis_tvalid(s_axis_tx_tvalid),
  .m_axis_tready(s_axis_tx_tready),
  .m_axis_tdata(s_axis_tx_tdata),  
  .m_axis_tkeep(s_axis_tx_tkeep),  
  .m_axis_tlast(s_axis_tx_tlast),  
  .m_axis_tuser()
//  .prog_empty(),
//  .prog_full()
);	


axis_data_fifo_0 rx_packet_fifo 
(
  .s_axis_aresetn(~corerst),         
  .s_axis_aclk(coreclk),             
  .s_axis_tvalid(m_axis_rx_tvalid),  
  .s_axis_tready(m_axis_rx_tready),  
  .s_axis_tdata(m_axis_rx_tdata),    
  .s_axis_tkeep(m_axis_rx_tkeep),    
  .s_axis_tlast(m_axis_rx_tlast),    
  .s_axis_tuser(1'b0),              
  .m_axis_tvalid(rx_axis_tvalid),    
  .m_axis_tready(rx_axis_tready),    
  .m_axis_tdata(rx_axis_tdata),      
  .m_axis_tkeep(rx_axis_tkeep),      
  .m_axis_tlast(rx_axis_tlast),      
  .m_axis_tuser() 
//  .prog_empty(),
//  .prog_full()  			
);  

wire rx_axis_tfirst;
reg  flag_sof;
always @(posedge coreclk or posedge corerst)
	begin
	if(corerst)begin
		flag_sof <= 1'b0;
	end else if(rx_axis_tvalid & rx_axis_tlast & rx_axis_tready)begin
		flag_sof <= 1'b0;
	end else if(rx_axis_tvalid & rx_axis_tready)begin
		flag_sof <= 1'b1;
	end
	end

assign rx_axis_tfirst = (flag_sof == 1'b0 & rx_axis_tvalid) ? 1'b1 : 1'b0;


//-- Protocol -> Transmit MAC Interface
assign tx_axis_tkeep  = MAC_TX_DATA_VALID;
assign tx_axis_tdata  = MAC_TX_DATA;
assign tx_axis_tlast  = MAC_TX_EOF;
assign tx_axis_tvalid = (MAC_TX_DATA_VALID != 8'h00) ? 1'b1 : 1'b0;
assign MAC_TX_CTS     = tx_axis_tready;

//-- Receive MAC Interface-> Protocol
assign MAC_RX_DATA_VALID = (rx_axis_tready & rx_axis_tvalid) ? rx_axis_tkeep : 8'h00;
assign MAC_RX_DATA = (rx_axis_tready & rx_axis_tvalid) ? rx_axis_tdata : 64'd0; 
assign MAC_RX_SOF = (rx_axis_tready & rx_axis_tvalid) ? rx_axis_tfirst : 1'b0;
assign MAC_RX_EOF = (rx_axis_tready & rx_axis_tvalid) ? rx_axis_tlast : 1'b0;
assign MAC_RX_FRAME_VALID = 1'b1;
assign rx_axis_tready = 1'b1;


    
COM5502_TOP #(
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
)COM5502_TOP(
	//--//-- CLK, RESET
	.CLK(coreclk),
	.SYNC_RESET(corerst),
	
	//--//-- CONFIGURATION
	.MAC_ADDR(MAC_ADDR),
	.DYNAMIC_IPv4(DYNAMIC_IPv4),
	.REQUESTED_IPv4_ADDR(REQUESTED_IPv4_ADDR),
	.IPv4_MULTICAST_ADDR(IPv4_MULTICAST_ADDR),
	.IPv4_SUBNET_MASK(IPv4_SUBNET_MASK),
	.IPv4_GATEWAY_ADDR(IPv4_GATEWAY_ADDR),
	.IPv6_ADDR(IPv6_ADDR),
	.IPv6_SUBNET_PREFIX_LENGTH(IPv6_SUBNET_PREFIX_LENGTH),
	.IPv6_GATEWAY_ADDR(IPv6_GATEWAY_ADDR),
    
	//--// User-initiated connection reset for stream I
	.CONNECTION_RESET(CONNECTION_RESET),
	.TCP_KEEPALIVE_EN(TCP_KEEPALIVE_EN),
    
	//--//-- DHCP SERVER CONFIGURATION
	.DHCP_SERVER_EN2(DHCP_SERVER_EN2),
	.DHCP_SERVER_IP_MIN_LSB(DHCP_SERVER_IP_MIN_LSB),
	.DHCP_SERVER_NIPs(DHCP_SERVER_NIPs),
	.DHCP_SERVER_LEASE_TIME(DHCP_SERVER_LEASE_TIME),
	.DHCP_ROUTER(DHCP_ROUTER),
	.DHCP_SERVER_DNS(DHCP_SERVER_DNS),
    
	//--//-- Protocol -> Transmit MAC Interface
	.MAC_TX_DATA(MAC_TX_DATA),
	.MAC_TX_DATA_VALID(MAC_TX_DATA_VALID),
	.MAC_TX_SOF(MAC_TX_SOF),
	.MAC_TX_EOF(MAC_TX_EOF),
	.MAC_TX_CTS(MAC_TX_CTS),
	.MAC_TX_RTS(MAC_TX_RTS),
	
	//--//-- Receive MAC -> Protocol
	.MAC_RX_DATA(MAC_RX_DATA),
	.MAC_RX_DATA_VALID(MAC_RX_DATA_VALID),
	.MAC_RX_SOF(MAC_RX_SOF),
	.MAC_RX_EOF(MAC_RX_EOF),
	.MAC_RX_FRAME_VALID(MAC_RX_FRAME_VALID),
	//--//-- Application <- UDP rx payload
	.UDP_RX_DATA(UDP001_RX_DATA),
	.UDP_RX_DATA_VALID(UDP001_RX_DATA_VALID),
	.UDP_RX_SOF(UDP_RX_SOF),
	.UDP_RX_EOF(UDP_RX_EOF),
	.UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID),
	.UDP_RX_DEST_PORT_NO_IN(UDP_RX_DEST_PORT_NO_IN),
	.UDP_RX_SOURCE_PORT_NO_IN(UDP_RX_SOURCE_PORT_NO_IN),
	.CHECK_UDP_RX_DEST_PORT_NO(CHECK_UDP_RX_DEST_PORT_NO),
	.UDP_RX_DEST_PORT_NO_OUT(UDP_RX_DEST_PORT_NO_OUT),
	//--//-- Application -> UDP tx
	.UDP_TX_DATA(UDP001_TX_DATA),
	.UDP_TX_DATA_VALID(UDP001_TX_DATA_VALID),
	.UDP_TX_SOF(UDP_TX_SOF),
	.UDP_TX_EOF(UDP_TX_EOF),
	.UDP_TX_CTS(UDP_TX_CTS),	
	.UDP_TX_ACK(UDP_TX_ACK),
	.UDP_TX_NAK(UDP_TX_NAK),
	.UDP_TX_DEST_IP_ADDR(UDP_TX_DEST_IP_ADDR),
	.UDP_TX_DEST_IPv4_6n(UDP_TX_DEST_IPv4_6n),
	.UDP_TX_DEST_PORT_NO(UDP_TX_DEST_PORT_NO),
	.UDP_TX_SOURCE_PORT_NO(UDP_TX_SOURCE_PORT_NO),
	
	//--//-- Application <- TCP rx
	.TCP_LOCAL_PORTS(TCP_LOCAL_PORTS),
	.TCP_RX_DATA(TCP001_RX_DATA),
	.TCP_RX_DATA_VALID(TCP001_RX_DATA_VALID),
	.TCP_RX_RTS(TCP_RX_RTS),
	.TCP_RX_CTS(TCP_RX_CTS),
	.TCP_RX_CTS_ACK(TCP_RX_CTS_ACK),
	
	//--//-- Application -> TCP tx
	.TCP_TX_DATA(TCP001_TX_DATA),
	.TCP_TX_DATA_VALID(TCP001_TX_DATA_VALID),
    .TCP_TX_DATA_FLUSH(TCP_TX_DATA_FLUSH),
	.TCP_TX_CTS(TCP_TX_CTS),
    
	//--//-- TEST POINTS, COMSCOPE TRACES
	.TCP_CONNECTED_FLAG(),
	.CS1(),
	.CS1_CLK(),
	.CS2(),
	.CS2_CLK(),
	.DEBUG1(),
	.DEBUG2(),
	.DEBUG3(),
	.TP()
   
    );    


assign UDP_RX_DATA = {UDP001_RX_DATA[7:0],UDP001_RX_DATA[15:8],UDP001_RX_DATA[23:16],UDP001_RX_DATA[31:24],UDP001_RX_DATA[39:32],UDP001_RX_DATA[47:40],UDP001_RX_DATA[55:48],UDP001_RX_DATA[63:56]};		
assign UDP_RX_DATA_VALID = (UDP001_RX_DATA_VALID != 8'd0) ? 1'b1 : 1'b0;
assign UDP_RX_DATA_KEEP = {UDP001_RX_DATA_VALID[0],UDP001_RX_DATA_VALID[1],UDP001_RX_DATA_VALID[2],UDP001_RX_DATA_VALID[3],UDP001_RX_DATA_VALID[4],UDP001_RX_DATA_VALID[5],UDP001_RX_DATA_VALID[6],UDP001_RX_DATA_VALID[7]};

assign UDP001_TX_DATA = {UDP_TX_DATA[7:0],UDP_TX_DATA[15:8],UDP_TX_DATA[23:16],UDP_TX_DATA[31:24],UDP_TX_DATA[39:32],UDP_TX_DATA[47:40],UDP_TX_DATA[55:48],UDP_TX_DATA[63:56]};
assign UDP001_TX_DATA_VALID = UDP_TX_DATA_VALID ? {UDP_TX_DATA_KEEP[0],UDP_TX_DATA_KEEP[1],UDP_TX_DATA_KEEP[2],UDP_TX_DATA_KEEP[3],UDP_TX_DATA_KEEP[4],UDP_TX_DATA_KEEP[5],UDP_TX_DATA_KEEP[6],UDP_TX_DATA_KEEP[7]} : 8'b0000_0000;


genvar i;
generate for (i = 0 ; i < NTCPSTREAMS ; i = i + 1)   
begin : TCP_DATA

assign TCP_RX_DATA[64*i +: 64] = {TCP001_RX_DATA[64*i+0 +: 8],TCP001_RX_DATA[64*i+8 +: 8],TCP001_RX_DATA[64*i+16 +: 8],TCP001_RX_DATA[64*i+24 +: 8],TCP001_RX_DATA[64*i+32 +: 8],TCP001_RX_DATA[64*i+40 +: 8],TCP001_RX_DATA[64*i+48 +: 8],TCP001_RX_DATA[64*i+56 +: 8]};
assign TCP_RX_DATA_VALID[i] = (TCP001_RX_DATA_VALID[8*i +: 8] != 8'h00) ? 1'b1 : 1'b0;
assign TCP_RX_DATA_KEEP[8*i +: 8] = {TCP001_RX_DATA_VALID[8*i+0],TCP001_RX_DATA_VALID[8*i+1],TCP001_RX_DATA_VALID[8*i+2],TCP001_RX_DATA_VALID[8*i+3],TCP001_RX_DATA_VALID[8*i+4],TCP001_RX_DATA_VALID[8*i+5],TCP001_RX_DATA_VALID[8*i+6],TCP001_RX_DATA_VALID[8*i+7]};

assign TCP001_TX_DATA[64*i +: 64] = {TCP_TX_DATA[64*i+0 +: 8],TCP_TX_DATA[64*i+8 +: 8],TCP_TX_DATA[64*i+16 +: 8],TCP_TX_DATA[64*i+24 +: 8],TCP_TX_DATA[64*i+32 +: 8],TCP_TX_DATA[64*i+40 +: 8],TCP_TX_DATA[64*i+48 +: 8],TCP_TX_DATA[64*i+56 +: 8]};
assign TCP001_TX_DATA_VALID[8*i +: 8] = TCP_TX_DATA_VALID[i] ? {TCP_TX_DATA_KEEP[8*i+0],TCP_TX_DATA_KEEP[8*i+1],TCP_TX_DATA_KEEP[8*i+2],TCP_TX_DATA_KEEP[8*i+3],TCP_TX_DATA_KEEP[8*i+4],TCP_TX_DATA_KEEP[8*i+5],TCP_TX_DATA_KEEP[8*i+6],TCP_TX_DATA_KEEP[8*i+7]} : 8'b0000_0000;

end
endgenerate    
    
    
endmodule
