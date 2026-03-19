SiTCP_XC7K_32K_BBT_V110 SiTCP_XC7K_32K_BBT_V110(
  .CLK(CLK),                                      // in: System clock
  .RST(RST),                                      // in: System reset
  .TIM_1US(TIM_1US),                              // in: 1 us interval
  .TIM_1MS(TIM_1MS),                              // in: 1 ms interval
  .TIM_1S(TIM_1S),                                // in: 1 s interval
  .TIM_1M(TIM_1M),                                // in: 1 min interval
// Configuration parameters
//  .FORCE_DEFAULTn(1'b0),                          // in: Load default values
  .MODE_GMII(1'b1),                               // in: PHY I/F mode (0:MII, 1:GMII)
  .MIN_RX_IPG(4'd4),                              // in: Min. IPG byte[3:0] range of 3 to 15
  .IP_ADDR_IN(real_ip), // in: My IP address[31:0]
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
  .GMII_RSTn(eth_rstn),                           // out:PHY reset
  // TX
  .GMII_TX_CLK(eth_tx_clk),                       // in: Tx clock(2.5 or 25MHz or 125MHz)
  .GMII_TX_EN(eth_tx_en),                         // out: Tx enable
  .GMII_TXD(eth_tx_d[7:0]),                       // out: Tx data[7:0]
  .GMII_TX_ER(eth_tx_er),                         // out: TX error
  // RX
  .GMII_RX_CLK(eth_rx_clk),                       // in: Rx clock(2.5 or 25MHz or 125MHz)
  .GMII_RX_DV(eth_rx_dv),                         // in: Rx data valid
  .GMII_RXD(eth_rx_d[7:0]),                       // in: Rx data[7:0]
  .GMII_RX_ER(eth_rx_er),                         // in: Rx error
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
