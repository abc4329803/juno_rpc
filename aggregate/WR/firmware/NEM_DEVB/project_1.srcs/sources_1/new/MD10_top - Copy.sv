`timescale 1ns / 1ps
// ----------------------------------------------------------------------------------
// Company: 
// Engineer: 
//
// Create Date: 2023/09/12 15:53:05
// Design Name: 
// Module Name: MD10_top - Behavioral
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
// ----------------------------------------------------------------------------------

// library IEEE;
// use IEEE.STD_LOGIC_1164.ALL;
// // Uncomment the following library declaration if using
// // arithmetic functions with Signed or Unsigned values
// //use IEEE.NUMERIC_STD.ALL;
// library UNISIM;
// use UNISIM.VComponents.all;

module MD10_top #(
    parameter SPARTAN6_NUM = 'd12,
    parameter GOLDEN = 0,
    parameter [31:0]  BASE_IP_ADDR  = 32'hC0A8_0A22,  //192.168.10.35
    parameter [4 :0]  PHY_ADDRESS   = 5'b0,
    parameter         IP_16_nodes   = 1'h1,
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
  //------------------------------------------

  input        RST,
  input  [127:0] SYS_DIN,
  input        DIN_VALID,
  output       DIN_READY,
  // WR-NEM 
  
  input  [2:0] WRNEM_VER,
  inout        ONE_WIRE,
  input        CLK_62M5_DMTD,

  output       DAC_LDAC_N,
  output       DAC_SCLK,
  output       DAC_SYNC_N,
  output       DAC_SDI,
  input        DAC_SDO,

  output       DAC_DMTD_LDAC_N,
  output       DAC_DMTD_SCLK,
  output       DAC_DMTD_SYNC_N,
  output       DAC_DMTD_SDI,
  input        DAC_DMTD_SDO,

  output       DELAY_EN,
  output       DELAY_SCLK,
  output       DELAY_SLOAD,
  output       DELAY_SDIN,
  // AD9516 SPI
  output       PLL_CS,
  output       PLL_REFSEL,
  output       PLL_RESET,
  output       PLL_SCLK,
  output       PLL_SDO,
  output       PLL_SYNC,
  input        PLL_LOCK,
  input        PLL_SDI,
  input        PLL_STAT,
  //-----------------------------------------
  // SFP
  output [0:0] SFP_DISABLE_O,
  output [0:0] SFP_O_N,
  output [0:0] SFP_O_P,
  input  [0:0] SFP_I_N,
  input  [0:0] SFP_I_P,
  input  [0:0] SFP_FAULT_I,
  input  [0:0] SFP_LOS_I,
  input  [0:0] SFP_MOD_DEF0_I,
  // inout  [0:0] SFP_MOD_DEF1_IO,
  // inout  [0:0] SFP_MOD_DEF2_IO,

  input        MGTREFCLK0_P,
  input        MGTREFCLK0_N,
  // input        MGTREFCLK1_P,
  // input        MGTREFCLK1_N,

  input        FPGA_CLK_P,
  input        FPGA_CLK_N,
  input        BAK_CLK_P,
  input        BAK_CLK_N,
  input        BAK2_CLK_P,
  input        BAK2_CLK_N,

/*   output       AUX0_P,
  output       AUX0_N, */
  output       testaux0,
  output       testsysclk,
  output       testgtrefclk, 
  output       testfpgaclk,
  output [7:0] board_id,

 

  output       QSPI_CS,
  output       QSPI_DQ0,
  input        QSPI_DQ1,
  // input     QSPI_DQ2
  // input     QSPI_DQ3

  input        qspi_sck,
  input        qspi_arb,

  output       UART_TX,
  input        UART_RX,

  output [1:0] LED,
  // PPS
  output       pps,
  output [39:0]tm_tai,
  output [27:0]tm_cycles,
  output       tm_time_valid,

  // Local CLK

  //input        EXT_CLK,

  // RS232

  output wire [ 7:0]           SP6_CONFIG_VALUE[SPARTAN6_NUM:1],
  output wire [SPARTAN6_NUM:1] SP6_CONFIG_VALID,
  output wire                  SOFT_RST,
  output wire                  JTAG_SWITCH,
  output wire [2:0]            is_multiboot,
  output wire [SPARTAN6_NUM:1] middle_ILA_use,

  output wire        FLASH_ERASE_EN,
  input  wire        FLASH_WRITE_READY,
  output wire [ 7:0] FLASH_WRITE_DATA,
  output wire        FLASH_WRITE_VALID,
  output wire        FLASH_WRITE_FIFO_READEN,
  input  wire [ 7:0] FLASH_READ_DATA,
  input  wire        FLASH_READ_VALID,
  output wire        FLASH_READ_EN,
  output wire [ 7:0] FLASH_READ_CMD,
  output wire [31:0] FLASH_READ_ADDRESS
  
);


  // ============================================================================
  // Signals (VHDL "signal" -> Verilog nets/wires)
  // ============================================================================
  wire        clk_sys;
  wire        mgtrefclk;
  wire        mgtrefclk_bufg;
  //wire        pps;
  wire        ppsd1;          // kept for commented logic
  //wire        tm_time_valid;
  //wire [39:0] tm_tai;
  //wire [27:0] tm_cycles;
  wire        link_ok;
  wire        link_act;
  wire        mac_clk;        // kept for commented MAC section
  wire        rst_mac_clk;    // kept for commented MAC section
  wire [7:0]  mac_tx_data;    // kept for commented MAC section
  wire [7:0]  mac_rx_data;    // kept for commented MAC section
  wire        mac_tx_valid;   // kept for commented MAC section
  wire        mac_tx_last;    // kept for commented MAC section
  wire        mac_tx_ready;   // kept for commented MAC section
  wire        mac_tx_error;   // kept for commented MAC section
  wire        mac_rx_error;   // kept for commented MAC section
  wire        mac_rx_last;    // kept for commented MAC section
  wire        mac_rx_valid;   // kept for commented MAC section
  wire [47:0] my_mac_addr;
  wire [31:0] my_ip_addr;
  wire        gmii_clk_o;
  wire        rst_gmii_o;
  wire [7:0]  gmii_txd;
  wire [7:0]  gmii_rxd;
  wire        gmii_tx_en;
  wire        gmii_tx_er;
  wire        gmii_rx_dv;
  wire        gmii_rx_er;
  wire        fpga_clk;
  wire gtrefclk_div2_i,gtrefclk_i;

  

  assign board_id = my_ip_addr[7:0];

  wire [3 : 0] MAC_SELECT;
  wire [3 : 0] IP_SELECT;
  wire         locked;

  assign MAC_SELECT = 0;
  assign IP_SELECT = 0;

  wire [47:0] tcp_server_mac;
  wire [31:0] tcp_server_addr;
  wire [15:0] tcp_server_port;

  wire        tcp_open_error;
  wire        tcp_tx_ow_error;
  assign      TCP_ERROR = tcp_open_error | tcp_tx_ow_error;

  wire        TCP_OPEN;
  wire        TCP_RST;
  wire        TCP_CLOSE;

  // wire        UART_TX;
  // wire        UART_RX;

  // ============================================================================
  // Instantiation of wr_nem_core_k7 (translated from VHDL port map)
  // ============================================================================
  IBUFDS_GTE2 gtclkbuf(
    .I (MGTREFCLK0_P),
    .IB (MGTREFCLK0_N),
    .O (gtrefclk_i),
    .ODIV2 (gtrefclk_div2_i),
    .CEB (1'b0)
  );
  // BUFG gtclkbufg(
  //   .I (gtrefclk_i),
  //   .O (mgtrefclk_bufg)
  // );
  wr_nem_core_k7 Inst_wr_nem (
    .WRNEM_VER          (WRNEM_VER),
    .ONE_WIRE           (ONE_WIRE),
    .CLK_62M5_DMTD      (CLK_62M5_DMTD),

    .DAC_LDAC_N         (DAC_LDAC_N),
    .DAC_SCLK           (DAC_SCLK),
    .DAC_SYNC_N         (DAC_SYNC_N),
    .DAC_SDI            (DAC_SDI),
    .DAC_SDO            (DAC_SDO),

    .DAC_DMTD_LDAC_N    (DAC_DMTD_LDAC_N),
    .DAC_DMTD_SCLK      (DAC_DMTD_SCLK),
    .DAC_DMTD_SYNC_N    (DAC_DMTD_SYNC_N),
    .DAC_DMTD_SDI       (DAC_DMTD_SDI),
    .DAC_DMTD_SDO       (DAC_DMTD_SDO),

    .DELAY_EN           (DELAY_EN),
    .DELAY_SCLK         (DELAY_SCLK),
    .DELAY_SLOAD        (DELAY_SLOAD),
    .DELAY_SDIN         (DELAY_SDIN),

    // AD9516 SPI
    .PLL_CS             (PLL_CS),
    .PLL_REFSEL         (PLL_REFSEL),
    .PLL_RESET          (PLL_RESET),
    .PLL_SCLK           (PLL_SCLK),
    .PLL_SDO            (PLL_SDO),
    .PLL_SYNC           (PLL_SYNC),
    .PLL_LOCK           (PLL_LOCK),
    .PLL_SDI            (PLL_SDI),
    .PLL_STAT           (PLL_STAT),

    //-----------------------------------------
    // SFP  （你原文件中上下两段SFP端口映射一致；此处保留最终有效连接）
    .SFP_DISABLE_O      (SFP_DISABLE_O),
    .SFP_O_N            (SFP_O_N),
    .SFP_O_P            (SFP_O_P),
    .SFP_I_N            (SFP_I_N),
    .SFP_I_P            (SFP_I_P),
    .SFP_FAULT_I        (SFP_FAULT_I),
    .SFP_LOS_I          (SFP_LOS_I),
    .SFP_MOD_DEF0_I     (SFP_MOD_DEF0_I),
    // .SFP_MOD_DEF1_IO    (SFP_MOD_DEF1_IO),
    // .SFP_MOD_DEF2_IO    (SFP_MOD_DEF2_IO),
    .sfp_scl_o          (),
    .sfp_sda_o          (),
    .sfp_scl_i          (1'b1),
    .sfp_sda_i          (1'b1),

    // .MGTREFCLK0_P       (MGTREFCLK0_P),
    // .MGTREFCLK0_N       (MGTREFCLK0_N),
    .gtrefclk_i (gtrefclk_i),
    .gtrefclk_div2_i (gtrefclk_div2_i),

    .QSPI_CS            (QSPI_CS),
    .QSPI_DQ0           (QSPI_DQ0),
    .QSPI_DQ1           (QSPI_DQ1),
    // .QSPI_DQ2        (), // in VHDL commented
    // .QSPI_DQ3        (), // in VHDL commented

    .UART_TX            (UART_TX),
    .UART_RX            (UART_RX),

    // ---- signals
    // .mgtrefclk_o        (mgtrefclk),
    // .mgtrefclk_bufg_o   (mgtrefclk_bufg),

    // wr signals
    .clk_sys_o          (clk_sys),
    .pps_o              (pps),
    .tm_tai_o           (tm_tai),
    .tm_cycles_o        (tm_cycles),
    .tm_time_valid_o    (tm_time_valid),
    .link_ok_o          (link_ok),
    .link_act_o         (link_act),

    .qspi_sck_i         (qspi_sck),
    .qspi_arb_i         (qspi_arb),
    .rst_n_i            (1'b1),

    // MAC interface (kept commented in VHDL; below is the active GMII mapping)
/*     .mac_clk_o        (mac_clk),
    .rst_mac_clk_o    (rst_mac_clk),
    .mac_tx_data      (8'h00),
    .mac_rx_data      (mac_rx_data),
    .mac_tx_valid     (1'b0),
    .mac_tx_last      (1'b0),
    .mac_tx_error     (1'b0),
    .mac_tx_ready     (mac_tx_ready),
    .mac_rx_valid     (mac_rx_valid),
    .mac_rx_last      (mac_rx_last),
    .mac_rx_error     (mac_rx_error),
    .my_mac_addr_o    (my_mac_addr),
    .my_ip_addr_o     (my_ip_addr) */

    .gmii_clk_o         (gmii_clk_o),
    .rst_gmii_o         (rst_gmii_o),
    .gmii_txd           (gmii_txd),       // 注意：原VHDL也是 txd <= rxd 的连法
    .gmii_tx_en         (gmii_tx_en),
    .gmii_tx_er         (gmii_tx_er),
    .gmii_rxd           (gmii_rxd),
    .gmii_rx_dv         (gmii_rx_dv),
    .gmii_rx_er         (1'b0),

    .my_mac_addr_o      (my_mac_addr),
    .my_ip_addr_o       (my_ip_addr)
  );

  wire            TIM_1US;    // out  : 1 us interval
  wire            TIM_1MS;    // out  : 1 ms interval
  wire            TIM_1S;     // out  : 1 s interval
  wire            TIM_1M;     // out  : 1 m interval

  TIMER #(
    .CLK_FREQ(8'd125)
  )TIMER(
  // System
    .CLK(testgtrefclk),            // in: System clock
    .RST(RST),            // in: System reset
  // Intrrupts
    .TIM_1US(TIM_1US),    // out: 1 us interval
    .TIM_1MS(TIM_1MS),    // out: 1 ms interval
    .TIM_1S(TIM_1S),      // out: 1 s interval
    .TIM_1M(TIM_1M)       // out: 1 min interval
  );
wire  GMII_RSTn;
assign GMII_RSTn = ~rst_gmii_o; 
wire  [31: 0] RBCP_ADDR;
wire          RBCP_WE;
wire  [7 : 0] RBCP_WD;
wire          RBCP_RE;
wire          RBCP_ACT;
wire          RBCP_ACK;
wire  [7 : 0] RBCP_RD;
wire [31:0] real_ip;
//assign real_ip[31:0]  = BASE_IP_ADDR[31:0]+{IP_SELECT[3],8'b0}+IP_SELECT[2:0];
assign real_ip[31:0]  = BASE_IP_ADDR[31:0]+IP_SELECT[3:0];

    wire        tcp_fifo_128to16_valid;
    wire        tcp_fifo_128to16_full;
    wire        tcp_fifo_128to16_empty;
    wire        tcp_fifo_128to16_rd_en;
    wire [15:0] tcp_fifo_128to16_dout;
    wire        sitcp_fifo_empty, sitcp_fifo_rden, sitcp_fifo_error_full;
    wire [127:0] sitcp_fifo_din;
    wire        sitcp_fifo_wren;
    wire        sitcp_fifo_full_2;

    wire        TCP_RX_WR;
    wire [ 7:0] TCP_RX_DATA;
    wire [15:0] TCP_RX_WC;

    wire        TCP_TX_WR;
    wire [ 7:0] TCP_TX_DATA;
    wire        TCP_TX_FULL;

    assign sitcp_fifo_din   = SYS_DIN;
    assign sitcp_fifo_wren  = ~sitcp_fifo_error_full & DIN_VALID;
    assign TCP_RX_WC[15:14] = 2'b11;
    assign sitcp_fifo_rden  = ~TCP_TX_FULL & ~sitcp_fifo_empty;
    assign DIN_READY = ~sitcp_fifo_full;

    tcp_fifo_128to16 tcp_fifo_128to16 (
        .rst      (RST),                                       // input wire rst
        .wr_clk   (testsysclk),  // input wire wr_clk
        .rd_clk   (testgtrefclk),  // input wire rd_clk
        //.clk      (testsysclk),                                    // input wire rd_clk
        .din      (sitcp_fifo_din),                                // input wire [127 : 0] din
        .wr_en    (sitcp_fifo_wren),                               // input wire wr_en
        .rd_en    (!tcp_fifo_128to16_empty & !sitcp_fifo_full_2),  // input wire rd_en
        .dout     (tcp_fifo_128to16_dout),                         // output wire [15 : 0] dout
        .full     (tcp_fifo_128to16_full),                         // output wire full
        .prog_full(sitcp_fifo_full),
        .empty    (tcp_fifo_128to16_empty),                        // output wire empty
        .valid    (tcp_fifo_128to16_valid)                         // output wire valid
    );

    tcp_fifo_16to8 tcp_fifo_16to8 (
        .rst(RST),  // | ~tcp_open), // input rst
        //.wr_clk(clk125_sys), // input wr_clk
        //.rd_clk(clk125_eth), // input rd_clk
        .clk(testgtrefclk),
        .din(tcp_fifo_128to16_dout),  // input [15 : 0] din
        .wr_en(tcp_fifo_128to16_valid),  // input wr_en
        .rd_en(sitcp_fifo_rden),  // input rd_en
        .dout(TCP_TX_DATA),  // output [7 : 0] dout
        .full(sitcp_fifo_error_full),  // output full
        .prog_full(sitcp_fifo_full_2),
        .empty(sitcp_fifo_empty),  // output empty
        .valid(TCP_TX_WR),  // output valid
        .rd_data_count(TCP_RX_WC[13:0])  // output [13 : 0] rd_data_count
    );




  SiTCP_XC7K_32K_BBT_V110 SiTCP_XC7K_32K_BBT_V110(
    .CLK(testgtrefclk),                                      // in: System clock
    .RST(RST),                                      // in: System reset
    .TIM_1US(TIM_1US),                              // in: 1 us interval
    .TIM_1MS(TIM_1MS),                              // in: 1 ms interval
    .TIM_1S(TIM_1S),                                // in: 1 s interval
    .TIM_1M(TIM_1M),                                // in: 1 min interval
  // Configuration parameters
  //  .FORCE_DEFAULTn(1'b0),                          // in: Load default values
    .MODE_GMII(1'b1),                               // in: PHY I/F mode (0:MII, 1:GMII)
    .MIN_RX_IPG(4'd4),                              // in: Min. IPG byte[3:0] range of 3 to 15
    .IP_ADDR_IN(my_ip_addr), // in: My IP address[31:0]
    .IP_ADDR_DEFAULT(),                             // out: Default value for my IP address[31:0]
    .TCP_MAIN_PORT_IN(16'd24),                      // in: My TCP main-port #[15:0]
    .TCP_MAIN_PORT_DEFAULT(),                       // out: Default value for my TCP main-port #[15:0]
    .TCP_SUB_PORT_IN(16'b0),                        // in: My TCP sub-port #[15:0]
    .TCP_SUB_PORT_DEFAULT(),                        // out: Default value for my TCP sub-port #[15:0]
    .TCP_SERVER_MAC_IN(tcp_server_mac[47:0]),       // in: Client mode, Server MAC address[47:0]
    .TCP_SERVER_MAC_DEFAULT(tcp_server_mac[47:0]),  // out: Default value for the server's MAC address
    .TCP_SERVER_ADDR_IN(tcp_server_addr[31:0]),     // in: Client mode, Server IP address[31:0]
    .TCP_SERVER_ADDR_DEFAULT(tcp_server_addr[31:0]),// out: Default value for the server's IP address
    .TCP_SERVER_PORT_IN(tcp_server_port[15:0]),     // in: Client mode, Server wating port#[15:0]
    .TCP_SERVER_PORT_DEFAULT(tcp_server_port[15:0]),// out: Default value for the server port #[15:0] RBCP_PORT_IN    , // in: My UDP RBCP-port #[15:0]
    .RBCP_PORT_IN(16'd4660),                        // in: My UDP RBCP-port #[15:0]
    .RBCP_PORT_DEFAULT(),                           // out: Default value for my UDP RBCP-port #[15:0]
    .PHY_ADDR(PHY_ADDRESS[4:0]),                    // in: PHY-device MIF address[4:0]
  // EEPROM
  //  .EEPROM_CS(),
  //  .EEPROM_SK(),
  //  .EEPROM_DI(),
  //  .EEPROM_DO(1'b0),
  // User data
  //  .USR_REG_X3C(),
  //  .USR_REG_X3D(),
  //  .USR_REG_X3E(),
  //  .USR_REG_X3F(),
  // MII interface
    .GMII_1000M(1'b1),                              // in: GMII mode (0:MII, 1:GMII)
    .GMII_RSTn(GMII_RSTn),                           // out:PHY reset
    // TX
    .GMII_TX_CLK(gmii_clk_o),                       // in: Tx clock(2.5 or 25MHz or 125MHz)
    .GMII_TX_EN(gmii_rx_dv),                         // out: Tx enable
    .GMII_TXD(gmii_rxd[7:0]),                       // out: Tx data[7:0]
    .GMII_TX_ER(gmii_rx_er),                         // out: TX error
    // RX
    .GMII_RX_CLK(gmii_clk_o),                       // in: Rx clock(2.5 or 25MHz or 125MHz)
    .GMII_RX_DV(gmii_tx_en),                         // in: Rx data valid
    .GMII_RXD(gmii_txd[7:0]),                       // in: Rx data[7:0]
    .GMII_RX_ER(gmii_tx_er),                         // in: Rx error
    .GMII_CRS(1'b0),                             // in: Carrier sense
    .GMII_COL(1'b0),                             // in: Collision detected
    // Management IF
    .GMII_MDC(),                             // out: Clock for MDIO
    .GMII_MDIO_IN(1'b1),                      // in: Data
    .GMII_MDIO_OUT(),                     // out: Data, when GMII_MDIO_OE = 0, GMII_MDIO_OUT = 0. must be pullup
    .GMII_MDIO_OE(),                   // out: MDIO output enable
  // User I/F
    .SiTCP_RST(TCP_RST),                            // out: Reset for SiTCP and related circuits
    // TCP connection control
    .OPEN_REQ(1'b0),                                // in: Request to connect connection
    .MAIN_OPEN_ACK(TCP_OPEN),                       // out: Acknowledge for open (=Socket busy)
    .SUB_OPEN_ACK(),                                // out: Acknowledge for the alternative port    .TCP_OPEN_ERROR     (TCP_OPEN_ERROR   ),  // out: TCP client mode / TCP connection error ---- V2.4 -----
    .TCP_OPEN_ERROR(tcp_open_error),                // out: TCP client mode / TCP connection error ---- V2.4 -----
    .TCP_TX_OW_ERROR(tcp_tx_ow_error),              // out: TCP TX buffer, over write error ---- V2.4 -----
    .CLOSE_REQ(TCP_CLOSE),                          // out: Connection close
    .CLOSE_ACK(TCP_CLOSE),                          // in: Acknowledge for close
    // FIFO I/F
    .RX_FILL(TCP_RX_WC[15:0]),                      // in: Fill level[15:0]
    .RX_WR(TCP_RX_WR),                              // out: Write enable
    .RX_DATA(TCP_RX_DATA[7:0]),                     // out: Write data[7:0]
    .TX_FULL(TCP_TX_FULL),                          // out: Almost full flag
    .TX_FILL(),                                     // out: Fill level[15:0]
    .TX_WR(TCP_TX_WR),                              // in: Write enable
    .TX_DATA(TCP_TX_DATA[7:0]),                     // in: Write data[7:0]
    // RBCP
    .LOC_ACT(RBCP_ACT),                             // out: RBCP active
    .LOC_ADDR(RBCP_ADDR[31:0]),                     // out: Address[31:0]
    .LOC_WD(RBCP_WD[7:0]),                          // out: Data[7:0]
    .LOC_WE(RBCP_WE),                               // out: Write enable
    .LOC_RE(RBCP_RE),                               // out: Read enable
    .LOC_ACK(RBCP_ACK),                             // in: Access acknowledge
    .LOC_RD(RBCP_RD[7:0]),                          // in: Read data[7:0]
    .MAC_SELECT(MAC_SELECT[3:0])                    // in: User can select MAC Adrress
  );

/*
  wire         DYNAMIC_IPv4;
  wire[31:0]   IPv4_MULTICAST_ADDR;
  wire[31:0]   IPv4_SUBNET_MASK;
  wire[31:0]   IPv4_GATEWAY_ADDR;
  wire[127:0]  IPv6_ADDR;
  wire[39:0]   IPv6_SUBNET_PREFIX_LENGTH;
  wire[127:0]  IPv6_GATEWAY_ADDR;

  wire[16*NTCPSTREAMS-1 : 0]   TCP_LOCAL_PORTS;
  wire[64*NTCPSTREAMS-1 : 0]   TCP_RX_DATA;
  wire[NTCPSTREAMS-1 : 0]      TCP_RX_DATA_VALID;
  wire[8*NTCPSTREAMS-1 : 0]    TCP_RX_DATA_KEEP;
  wire[NTCPSTREAMS-1 : 0]      TCP_RX_RTS; //-- Ready To Send
  wire[NTCPSTREAMS-1 : 0]      TCP_RX_CTS;
  wire[NTCPSTREAMS-1 : 0]      TCP_RX_CTS_ACK;

  wire[64*NTCPSTREAMS-1 : 0]   TCP001_RX_DATA;
  wire[8*NTCPSTREAMS-1 : 0]    TCP001_RX_DATA_VALID;

  reg[64*NTCPSTREAMS-1 : 0]    TCP_TX_DATA;
  reg[NTCPSTREAMS-1 : 0]       TCP_TX_DATA_VALID;
  reg[8*NTCPSTREAMS-1 : 0]     TCP_TX_DATA_KEEP;
  wire[NTCPSTREAMS-1 : 0]      TCP_TX_DATA_FLUSH;
  wire[NTCPSTREAMS-1 : 0]      TCP_TX_CTS;




  assign TCP_LOCAL_PORTS[15:0] = 16'd4660;

  assign DYNAMIC_IPv4 = 1'b0;
  assign IPv4_MULTICAST_ADDR = 32'h00000000;
  assign IPv4_SUBNET_MASK = 32'hFFFFFF00;
  assign IPv4_GATEWAY_ADDR = 32'hC0A80A01; // 192.168.10.1
  assign IPv6_ADDR = 128'hFE80000000000000E5E8AC24E60A5054;
  assign IPv6_SUBNET_PREFIX_LENGTH = 8'h40; // 64
  assign IPv6_GATEWAY_ADDR = 128'd0; 

  //--//-- DHCP SERVER CONFIGURATION
  wire        DHCP_SERVER_EN2;
  wire[7:0]   DHCP_SERVER_IP_MIN_LSB;
  wire[7:0]   DHCP_SERVER_NIPs;
  wire[31:0]  DHCP_SERVER_LEASE_TIME;
  wire[31:0]  DHCP_ROUTER;
  wire[31:0]  DHCP_SERVER_DNS;

  assign DHCP_SERVER_EN2 = 1'b0;
  assign DHCP_SERVER_IP_MIN_LSB = 8'ha0;
  assign DHCP_SERVER_NIPs = 8'h10;
  assign DHCP_SERVER_LEASE_TIME = 32'h00000078;
  assign DHCP_ROUTER = 32'hC0A80201;
  assign DHCP_SERVER_DNS = 32'h08080808;

  assign SFF_TX_DIS = 1'b0;

  wire      rx_axis_tvalid;
  wire      rx_axis_tready;
  wire[7:0] rx_axis_tdata;
  wire      s_axis_tready;
  reg       m_rx_axis_tvalid;
  wire      m_rx_axis_tready;
  reg[63:0] m_rx_axis_tdata;
  reg[7:0]  m_rx_axis_tkeep;
  reg       m_rx_axis_tlast;

  wire      m_rx_axis_tvalid_64;
  wire      m_rx_axis_tready_64;
  wire[63:0] m_rx_axis_tdata_64;
  wire[7:0] m_rx_axis_tkeep_64;
  wire      m_rx_axis_tlast_64;

  wire [63:0] MAC_RX_DATA;
  wire [7:0]  MAC_RX_DATA_VALID;
  wire        MAC_RX_SOF;

  wire        MAC_RX_EOF;
  wire        rx_axis_tfirst;
  reg         flag_sof;

  wire      tx_axis_tvalid;
  wire      tx_axis_tready;
  wire[7:0] tx_axis_tdata;
  wire      m_tx_axis_tvalid;
  wire      m_tx_axis_tready;
  wire[63:0] m_tx_axis_tdata;
  wire[7:0] m_tx_axis_tkeep;
  wire      m_tx_axis_tlast;

  wire      m_tx_axis_tvalid_64;
  wire      m_tx_axis_tready_64;
  wire[63:0] m_tx_axis_tdata_64;
  wire[7:0] m_tx_axis_tkeep_64;
  wire      m_tx_axis_tlast_64;

  wire[63:0]  MAC_TX_DATA;
  wire[7:0]   MAC_TX_DATA_VALID;
  wire        MAC_TX_SOF;
  wire        MAC_TX_EOF;
  wire        MAC_TX_CTS;
  wire        MAC_TX_RTS;

  always @(posedge gmii_clk_o)
    begin
    if(RST)begin
      flag_sof <= 1'b0;
    end else if(m_rx_axis_tvalid_64 & m_rx_axis_tlast_64 & m_rx_axis_tready_64)begin
      flag_sof <= 1'b0;
    end else if(m_rx_axis_tvalid_64 & m_rx_axis_tready_64)begin
      flag_sof <= 1'b1;
    end
    end

  assign rx_axis_tfirst = (flag_sof == 1'b0 & m_rx_axis_tvalid_64) ? 1'b1 : 1'b0;
  assign MAC_RX_DATA_VALID = (m_rx_axis_tready_64 & m_rx_axis_tvalid_64) ? m_rx_axis_tkeep_64 : 8'h00;
  assign MAC_RX_DATA = (m_rx_axis_tready_64 & m_rx_axis_tvalid_64) ? m_rx_axis_tdata_64 : 64'd0; 
  assign MAC_RX_SOF = (m_rx_axis_tready_64 & m_rx_axis_tvalid_64) ? rx_axis_tfirst : 1'b0;
  assign MAC_RX_EOF = (m_rx_axis_tready_64 & m_rx_axis_tvalid_64) ? m_rx_axis_tlast_64 : 1'b0;
  assign m_rx_axis_tready_64 = 1'b1;

  ///  convert 1 byte data to 8 byte data based on AXI data stream 

  reg  FCS_remove;
  reg  [2:0] m_rx_axis_tdata_cnt;
  reg        gmii_tx_en_1;
  reg  [7:0] gmii_txd_1;
    always @(posedge gmii_clk_o) begin
      if(RST)begin
        m_rx_axis_tdata_cnt <= 3'b0;
        m_rx_axis_tkeep <= 8'b0;
        m_rx_axis_tvalid <= 1'b0;
        m_rx_axis_tlast <= 1'b0;
        m_rx_axis_tdata_cnt <= 0;
        FCS_remove <= 0;
      end else begin
        gmii_tx_en_1 <= gmii_tx_en;
        gmii_txd_1 <= gmii_txd;
        m_rx_axis_tkeep <= 8'b0;
        m_rx_axis_tvalid <= 1'b0;
        m_rx_axis_tlast <= 1'b0;
        m_rx_axis_tdata_cnt <= 3'b0;
        if(gmii_tx_en_1)begin
          m_rx_axis_tdata_cnt <= m_rx_axis_tdata_cnt + 1;
          m_rx_axis_tkeep <= 8'b0;
          m_rx_axis_tvalid <= 1'b0;
          case(m_rx_axis_tdata_cnt)
              0: m_rx_axis_tdata[7:0] <= gmii_txd_1;
              1: m_rx_axis_tdata[15:8] <= gmii_txd_1;
              2: m_rx_axis_tdata[23:16] <= gmii_txd_1;
              3: m_rx_axis_tdata[31:24] <= gmii_txd_1;
              4: m_rx_axis_tdata[39:32] <= gmii_txd_1;
              5: m_rx_axis_tdata[47:40] <= gmii_txd_1;
              6: m_rx_axis_tdata[55:48] <= gmii_txd_1;
              7: m_rx_axis_tdata[63:56] <= gmii_txd_1;
          endcase
          if(m_rx_axis_tdata_cnt == 3'd7) begin
              ///// WR have FCS which should be removed
              if(FCS_remove == 1) begin
                  m_rx_axis_tkeep <= 8'hFF;
                  m_rx_axis_tvalid <= 1'b1;
              end else begin
                FCS_remove <= 1;
              end
             // m_rx_axis_tdata_cnt <= 3'h0;
          end
          // WR have CRC which should be removed
          if(gmii_tx_en_1 & ~gmii_tx_en) begin
              m_rx_axis_tlast <= 1'b1;
              m_rx_axis_tvalid <= 1'b1;
              m_rx_axis_tdata_cnt <= 3'b0;
              case(m_rx_axis_tdata_cnt)
                  7: m_rx_axis_tkeep <= 8'hF;
                  0: m_rx_axis_tkeep <= 8'h0;
                  1: m_rx_axis_tkeep <= 8'h0;
                  2: m_rx_axis_tkeep <= 8'h0;
                  3: m_rx_axis_tkeep <= 8'h0;
                  4: m_rx_axis_tkeep <= 8'h1;
                  5: m_rx_axis_tkeep <= 8'h3;
                  6: m_rx_axis_tkeep <= 8'h7;
              endcase   
          end
        end else begin
          FCS_remove <= 0;
        end
      end
    end



  axis_data_fifo_64 rx_packet_fifo_64 
  (
    .s_axis_aresetn(~RST),         
    .s_axis_aclk(gmii_clk_o),             
    .s_axis_tvalid(m_rx_axis_tvalid),  
    .s_axis_tready(m_rx_axis_tready),  
    .s_axis_tdata(m_rx_axis_tdata),    
    .s_axis_tkeep(m_rx_axis_tkeep),    
    .s_axis_tlast(m_rx_axis_tlast),    
    .m_axis_tvalid(m_rx_axis_tvalid_64),    
    .m_axis_tready(m_rx_axis_tready_64),    
    .m_axis_tdata(m_rx_axis_tdata_64),      
    .m_axis_tkeep(m_rx_axis_tkeep_64),      
    .m_axis_tlast(m_rx_axis_tlast_64)
  //  .prog_full()  			
  );  

  //-- Protocol -> Transmit MAC Interface
  assign m_tx_axis_tkeep_64  = MAC_TX_DATA_VALID;
  assign m_tx_axis_tdata_64  = MAC_TX_DATA;
  assign m_tx_axis_tlast_64  = MAC_TX_EOF;
  assign m_tx_axis_tvalid_64 = (MAC_TX_DATA_VALID != 8'h00) ? 1'b1 : 1'b0;
  assign MAC_TX_CTS     = m_tx_axis_tready_64;


  axis_data_fifo_64 tx_packet_fifo_64 
  (
    .s_axis_aresetn(~RST),         
    .s_axis_aclk(gmii_clk_o),             
    .s_axis_tvalid(m_tx_axis_tvalid_64),  
    .s_axis_tready(m_tx_axis_tready_64),  
    .s_axis_tdata(m_tx_axis_tdata_64),    
    .s_axis_tkeep(m_tx_axis_tkeep_64),    
    .s_axis_tlast(m_tx_axis_tlast_64),    
    .m_axis_tvalid(m_tx_axis_tvalid),    
    .m_axis_tready(m_tx_axis_tready),    
    .m_axis_tdata(m_tx_axis_tdata),      
    .m_axis_tkeep(m_tx_axis_tkeep),      
    .m_axis_tlast(m_tx_axis_tlast)
  //  .prog_full()  			
  );  

  axis_dwidth_converter_64to8 axis_dwidth_converter_64to8 (
        .aclk(gmii_clk_o),                    // input wire aclk
        .aresetn(~RST),              // input wire aresetn
        .s_axis_tvalid(m_tx_axis_tvalid),  // input wire s_axis_tvalid
        .s_axis_tready(m_tx_axis_tready),  // output wire s_axis_tready
        .s_axis_tdata(m_tx_axis_tdata),    // input wire [7 : 0] s_axis_tdata
        .s_axis_tkeep(m_tx_axis_tkeep), 
        .s_axis_tlast(m_tx_axis_tlast),   
        .m_axis_tvalid(tx_axis_tvalid),  // output wire m_axis_tvalid
        .m_axis_tready(tx_axis_tready),  // input wire m_axis_tready
        .m_axis_tdata(tx_axis_tdata),    // output wire [63 : 0] m_axis_tdata
        .m_axis_tkeep(tx_axis_tkeep),      
        .m_axis_tlast(tx_axis_tlast)   
  );

  axis_data_fifo_8 tx_packet_fifo_8 
  (
    .s_axis_aresetn(~RST),         
    .s_axis_aclk(gmii_clk_o),             
    .s_axis_tvalid(tx_axis_tvalid),  
    .s_axis_tready(tx_axis_tready),  
    .s_axis_tdata(tx_axis_tdata),    
    .m_axis_tvalid(gmii_rx_dv),    
    .m_axis_tready(1'b1),    
    .m_axis_tdata(gmii_rxd)  
  //  .prog_empty(),
  //  .prog_full()  			
  );  

  TCP #(
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
  )TCP(
    //--//-- CLK, RESET
    .CLK(testgtrefclk),
    .SYNC_RESET(RST),
    
    //--//-- CONFIGURATION
    .MAC_ADDR(my_mac_addr),
    .DYNAMIC_IPv4(DYNAMIC_IPv4),
    .REQUESTED_IPv4_ADDR(my_ip_addr),
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
    .MAC_RX_FRAME_VALID(1'b1),
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
*/

    RBCP_REG #(
        // .TDC_NUM(TDC_NUM),
        // .DAC_NUM(DAC_NUM),
        // .DAC_CHANNEL_NUM(DAC_CHANNEL_NUM),
        .SPARTAN6_NUM(SPARTAN6_NUM),
        .GOLDEN(GOLDEN)
    ) RBCP_REG (
        // System
        .CLK                (testgtrefclk),           // in : System clock
        .RST                (RST),             // in : System reset
        .DIP_SW             (IP_SELECT),                   // in : DIP_SW[3:0]
        .i2c_clk            (i2c_clk),
        // RBCP I/F
        .RBCP_ACT           (RBCP_ACT),             // in : Active
        .RBCP_ADDR          (RBCP_ADDR),            // in : Address[31:0]
        .RBCP_WE            (RBCP_WE),              // in : Write enable
        .RBCP_WD            (RBCP_WD),              // in : Write data[7:0]
        .RBCP_RE            (RBCP_RE),              // in : Read enable
        .RBCP_RD            (RBCP_RD),              // out  : Read data[7:0]
        .RBCP_ACK           (RBCP_ACK),             // out  : Acknowledge
        //.DELAY_VALUE        (DELAY_VALUE),
        .EXTERNAL_CALIB_ENABLE     (EXTERNAL_CALIB_ENABLE),
        .LED_ON             (LED_ON),
        .MSB_abnormal       (MSB_abnormal),
        .MSB_check          (MSB_check),
        .DAC_RD             (FPGADATA_REN),
        .DAC_EMPTY          (FPGADATA_EMPTY),
        .DAC_DATA           (FPGA_DATA),
        .DAC_VALID          (FPGADATA_VALID),
        .FLASH_ERASE_EN(FLASH_ERASE_EN),
        .FLASH_WRITE_READY  (FLASH_WRITE_READY),
        .FLASH_WRITE_DATA   (FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID  (FLASH_WRITE_VALID),
        .FLASH_WRITE_FIFO_READEN(FLASH_WRITE_FIFO_READEN),
        .FLASH_READ_DATA    (FLASH_READ_DATA),
        .FLASH_READ_VALID   (FLASH_READ_VALID),
        .FLASH_READ_EN      (FLASH_READ_EN),
        .FLASH_READ_CMD     (FLASH_READ_CMD),
        .FLASH_READ_ADDRESS (FLASH_READ_ADDRESS),
        .XVC_LENGTH         (XVC_LENGTH),
        .TMS_VECTOR         (TMS_VECTOR),
        .TDI_VECTOR         (TDI_VECTOR),
        .TDO_VECTOR         (TDO_VECTOR),
        .TDO_VECTOR_VALID   (TDO_VECTOR_VALID),
        .TDO_VECTOR_LENGTH  (TDO_VECTOR_LENGTH),
        .TDO_VECTOR_READ_EN (TDO_VECTOR_READ_EN),
        .XVC_ENABLE         (XVC_ENABLE),
        .XVC_LENGTH_READY   (XVC_LENGTH_READY),
        .TMS_VECTOR_READY   (TMS_VECTOR_READY),
        .TDI_VECTOR_READY   (TDI_VECTOR_READY),
        .SP6_CONFIG_ADDR    (SP6_CONFIG_ADDR),
        .SP6_CONFIG_VALUE   (SP6_CONFIG_VALUE),
        .SP6_CONFIG_VALID   (SP6_CONFIG_VALID),
        .OFFSET_SWITCH      (OFFSET_SWITCH),
        .JTAG_SWITCH        (JTAG_SWITCH),
        .TDC_RST_SELECT     (TDC_RST_SELECT),
        .SOFT_RST           (SOFT_RST),
        .middle_ILA_use     (middle_ILA_use),
        .state              (state),
        .fifo_level1_pointer(fifo_level1_pointer),
        .clk_locked_sitcp   (locked),
        .clk_locked_tdc     (clk_locked_tdc),
        .is_multiboot       (is_multiboot)
    );

/*
  // ============================================================================
  // OBUFDS (VHDL: SYNC_DATA_0_OBUF : OBUFDS)
  // ============================================================================
  OBUFDS SYNC_DATA_0_OBUF (
    .O  (AUX0_P),
    .OB (AUX0_N),
    .I  (tm_time_valid)
  );
  */

  // ============================================================================
  // Simple assigns (VHDL concurrent assignments)
  // ============================================================================
  assign LED[0]   = link_ok;
  assign LED[1]   = link_act;

  assign testaux0    = testgtrefclk; //pps; 
  // assign testaux0 = ppsd1; // VHDL alternative commented

  // ============================================================================
  // IBUFGDS (VHDL: Inst_bufg: IBUFGDS generic map(DIFF_TERM => false) ...)
  // ============================================================================
/*   IBUFGDS #(
    .DIFF_TERM("FALSE")
  ) Inst_bufg (
    .I  (FPGA_CLK_P),
    .IB (FPGA_CLK_N),
    .O  (fpga_clk)
  ); */


  // BUFG BUFG_inst (
  //   .O(fpga_clk), // 1-bit output: Clock output
  //   .I(FPGA_CLK_P)  // 1-bit input: Clock input
  // );


   
/*     local_clk local_clk
   (
    // Clock out ports
    .clk_out1(fpga_clk),     // output clk_out1
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(CLK_62M5_DMTD)      // input clk_in1
);  */

  // // VHDL commented process -> Verilog commented always block:
  // // p_dff: process(clk_sys)
  // // begin
  // //   if rising_edge(clk_sys) then
  // //     ppsd1 <= pps;
  // //   end if;
  // // end process;
  //
  // // Verilog equivalent (commented as in VHDL)
  // always @(posedge clk_sys) begin
  //   ppsd1 <= pps;
  // end

  assign testsysclk   = clk_sys;
  assign testgtrefclk = gmii_clk_o;
  assign testfpgaclk  = 1'b0;

  // // VHDL commented ODDR -> Verilog commented ODDR2/ODDR (device dependent)
  // //  ODDR_sysclk : ODDR
  // //  generic map(
  // //     DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
  // //     INIT => '0',   -- Initial value for Q port ('1' or '0')
  // //     SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
  // //  port map (
  // //     Q => testsysclk,   -- 1-bit DDR output
  // //     C => clk_sys,      -- 1-bit clock input
  // //     CE => '1',         -- 1-bit clock enable input
  // //     D1 => '0',         -- 1-bit data input (positive edge)
  // //     D2 => '1',         -- 1-bit data input (negative edge)
  // //     R => '0',          -- 1-bit reset input
  // //     S => '0'           -- 1-bit set input
  // //  );
  //
  // // Verilog equivalent (commented). For Spartan-6 you likely use ODDR2:
  // // ODDR2 #(
  // //   .DDR_ALIGNMENT("NONE"), // "NONE", "C0", "C1"
  // //   .INIT(1'b0),
  // //   .SRTYPE("SYNC")
  // // ) ODDR_sysclk (
  // //   .Q (testsysclk),
  // //   .C0(clk_sys),
  // //   .C1(~clk_sys),
  // //   .CE(1'b1),
  // //   .D0(1'b0),
  // //   .D1(1'b1),
  // //   .R (1'b0),
  // //   .S (1'b0)
  // // );


reg [7:0] pi_data;
//wire       tx_valid;

wire uart_tx1;
wire uart_tx_done1;
wire uart_tx_dir1;
wire uart_tx_ready1;
wire uart_tx_ena1;

wire [7:0] po_data;
wire po_flag;
reg tx_valid;
wire tx_valid0;
reg tx_valid1;
reg tx_valid2;

wire [7:0] po_data2;
wire po_flag2;

wire [7 : 0] probe_out0;
//wire rst;
/* vio_0 vio_0 (
  .clk(gmii_clk_o),                // input wire clk
  .probe_out0(probe_out0),  // output wire [7 : 0] probe_out0
  .probe_out1(tx_valid0),  // output wire [0 : 0] probe_out1
  .probe_out2(rst)
); */

reg [3:0] counter = 0;
/*
always @(posedge testfpgaclk) begin
  tx_valid1 <= tx_valid0;
  tx_valid2 <= tx_valid1;
  if(tx_valid1 & ~tx_valid2) begin
      tx_valid <= 1;
  end else begin
      tx_valid <= 0;
  end
  if(rst) begin
    counter <= 0;
  end else if(po_flag)
    counter <= counter + 1;
  case(counter)
    0: pi_data <= 8'h69;
    1: pi_data <= 8'h70;
    default: pi_data <= 8'h89;
  endcase

end

UART_TX UART_TX1(
    .clk(testfpgaclk),					//系统时钟
    .rst_n(1'b1),					//系统复位，低电平有效
    .valid(tx_valid),					//数据有效信号
    .pi_data(pi_data),				//输入的并行数据
 
    .tx(UART_RX),						//并转串的输出数据
    .tx_done(uart_tx_done1), 				//并转串的输出数据发送完成标志信号
    .dir(uart_tx_dir1),					//控制max3485的dir使能信号
    .ready(uart_tx_ready1),					//tx模块可以接收数据信号
    .ena(uart_tx_ena1) 					//使能信号
);

UART_RX UART_RX1(
	.clk(testfpgaclk),						//接收到的数据
	.rst_n(1'b1),					//复位信号，低电平有效
	.rx(UART_RX),						//输入的串行数据		
	.po_data(po_data),					//输出的并行数据
	.po_flag(po_flag)					//并行数据输出的同步标志信号
	);	
UART_RX UART_RX2(
	.clk(testfpgaclk),						//接收到的数据
	.rst_n(1'b1),					//复位信号，低电平有效
	.rx(UART_TX),						//输入的串行数据		
	.po_data(po_data2),					//输出的并行数据
	.po_flag(po_flag2)					//并行数据输出的同步标志信号
	);		
*/
/*   ila_1 ila_1 (
    .clk(gmii_clk_o), // input wire clk
    .probe0(gmii_tx_en), // input wire [0:0]  probe0  
    .probe1(gmii_rxd), // input wire [0:0]  probe1 
    .probe2(gmii_txd), // input wire [0:0]  probe2 
    .probe3(m_rx_axis_tdata), // input wire [0:0]  probe3
    .probe4(gmii_rx_dv), // input wire [0:0]  probe4
    .probe5(gmii_rx_er),
    .probe6(MAC_TX_DATA_VALID), // input wire [0:0]  probe3
    .probe7(rx_axis_tvalid),  // input wire [0:0]  probe4
    .probe8(m_rx_axis_tlast),
    .probe9(rx_axis_tdata),
    .probe10(MAC_RX_DATA),
    .probe11(m_rx_axis_tvalid),
    .probe12(TCP001_RX_DATA),
    .probe13(TCP001_RX_DATA_VALID),
    .probe14(rx_axis_tready),
    .probe15(MAC_RX_DATA_VALID),
    .probe16(s_axis_tready),
    .probe17(m_rx_axis_tready),
    .probe18(m_rx_axis_tdata_cnt),
    .probe19(m_rx_axis_tkeep),
    .probe20(MAC_RX_SOF),
    .probe21(MAC_RX_EOF),
    .probe22(m_tx_axis_tdata_64),
    .probe23(m_tx_axis_tvalid_64),
    .probe24(m_tx_axis_tready_64),
    .probe25(m_tx_axis_tkeep_64),
    .probe26(m_tx_axis_tlast_64),
    .probe27(MAC_TX_DATA)
  ); */


endmodule

