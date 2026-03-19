set_property PACKAGE_PIN L8 [get_ports refclk10g_p]
#set_property PACKAGE_PIN F5 [get_ports rxn10g]
#set_property PACKAGE_PIN F6 [get_ports rxp10g]
#set_property PACKAGE_PIN F1 [get_ports txn10g]
#set_property PACKAGE_PIN F2 [get_ports txp10g]

## SFP
set_property PACKAGE_PIN G3 [get_ports rxn10g]
set_property PACKAGE_PIN G4 [get_ports rxp10g]
set_property PACKAGE_PIN H1 [get_ports txn10g]
set_property PACKAGE_PIN H2 [get_ports txp10g]


set_property PACKAGE_PIN T28 [get_ports SFF_TX_DIS]
set_property IOSTANDARD LVCMOS33 [get_ports SFF_TX_DIS]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

############## clock define##################
create_clock -period 5.000 [get_ports sys_clk_p]
#set_property PACKAGE_PIN AE10 [get_ports sys_clk_p]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]

set_property -dict {PACKAGE_PIN AD12 IOSTANDARD LVDS} [get_ports sys_clk_p]
set_property DIFF_TERM FALSE [get_ports sys_clk_p]
set_property DIFF_TERM FALSE [get_ports sys_clk_n]


############## key define##################
set_property PACKAGE_PIN AG27 [get_ports rst_n]
set_property IOSTANDARD LVCMOS25 [get_ports rst_n]

##############LED define##################
set_property PACKAGE_PIN A22 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]

set_property PACKAGE_PIN C19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]

set_property PACKAGE_PIN B19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[2]}]

set_property PACKAGE_PIN E18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[3]}]


set_property -dict {PACKAGE_PIN AE20 IOSTANDARD LVCMOS18} [get_ports Si5326_RSTn]

set_property PACKAGE_PIN K21 [get_ports si5338_scl]
set_property IOSTANDARD LVCMOS25 [get_ports si5338_scl]

set_property PACKAGE_PIN L21 [get_ports si5338_sda]
set_property IOSTANDARD LVCMOS25 [get_ports si5338_sda]

##############IO define##################
set_property -dict {PACKAGE_PIN Y23 IOSTANDARD LVCMOS18} [get_ports user_sma_gpio_p]
set_property PULLDOWN true [get_ports user_sma_gpio_p]
set_property -dict {PACKAGE_PIN Y24 IOSTANDARD LVCMOS18} [get_ports user_sma_gpio_n]
set_property PULLDOWN true [get_ports user_sma_gpio_n]

connect_debug_port u_ila_0/clk [get_nets [list network_top/axi_10g_ethernet_0_example_design/ethernet_core_0/inst/xpcs/inst/ten_gig_eth_pcs_pma_shared_clock_reset_block/coreclk_out]]
connect_debug_port u_ila_0/probe0 [get_nets [list {network_top/s_axis_tx_tdata[0]} {network_top/s_axis_tx_tdata[1]} {network_top/s_axis_tx_tdata[2]} {network_top/s_axis_tx_tdata[3]} {network_top/s_axis_tx_tdata[4]} {network_top/s_axis_tx_tdata[5]} {network_top/s_axis_tx_tdata[6]} {network_top/s_axis_tx_tdata[7]} {network_top/s_axis_tx_tdata[8]} {network_top/s_axis_tx_tdata[9]} {network_top/s_axis_tx_tdata[10]} {network_top/s_axis_tx_tdata[11]} {network_top/s_axis_tx_tdata[12]} {network_top/s_axis_tx_tdata[13]} {network_top/s_axis_tx_tdata[14]} {network_top/s_axis_tx_tdata[15]} {network_top/s_axis_tx_tdata[16]} {network_top/s_axis_tx_tdata[17]} {network_top/s_axis_tx_tdata[18]} {network_top/s_axis_tx_tdata[19]} {network_top/s_axis_tx_tdata[20]} {network_top/s_axis_tx_tdata[21]} {network_top/s_axis_tx_tdata[22]} {network_top/s_axis_tx_tdata[23]} {network_top/s_axis_tx_tdata[24]} {network_top/s_axis_tx_tdata[25]} {network_top/s_axis_tx_tdata[26]} {network_top/s_axis_tx_tdata[27]} {network_top/s_axis_tx_tdata[28]} {network_top/s_axis_tx_tdata[29]} {network_top/s_axis_tx_tdata[30]} {network_top/s_axis_tx_tdata[31]} {network_top/s_axis_tx_tdata[32]} {network_top/s_axis_tx_tdata[33]} {network_top/s_axis_tx_tdata[34]} {network_top/s_axis_tx_tdata[35]} {network_top/s_axis_tx_tdata[36]} {network_top/s_axis_tx_tdata[37]} {network_top/s_axis_tx_tdata[38]} {network_top/s_axis_tx_tdata[39]} {network_top/s_axis_tx_tdata[40]} {network_top/s_axis_tx_tdata[41]} {network_top/s_axis_tx_tdata[42]} {network_top/s_axis_tx_tdata[43]} {network_top/s_axis_tx_tdata[44]} {network_top/s_axis_tx_tdata[45]} {network_top/s_axis_tx_tdata[46]} {network_top/s_axis_tx_tdata[47]} {network_top/s_axis_tx_tdata[48]} {network_top/s_axis_tx_tdata[49]} {network_top/s_axis_tx_tdata[50]} {network_top/s_axis_tx_tdata[51]} {network_top/s_axis_tx_tdata[52]} {network_top/s_axis_tx_tdata[53]} {network_top/s_axis_tx_tdata[54]} {network_top/s_axis_tx_tdata[55]} {network_top/s_axis_tx_tdata[56]} {network_top/s_axis_tx_tdata[57]} {network_top/s_axis_tx_tdata[58]} {network_top/s_axis_tx_tdata[59]} {network_top/s_axis_tx_tdata[60]} {network_top/s_axis_tx_tdata[61]} {network_top/s_axis_tx_tdata[62]} {network_top/s_axis_tx_tdata[63]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {network_top/m_axis_rx_tkeep[0]} {network_top/m_axis_rx_tkeep[1]} {network_top/m_axis_rx_tkeep[2]} {network_top/m_axis_rx_tkeep[3]} {network_top/m_axis_rx_tkeep[4]} {network_top/m_axis_rx_tkeep[5]} {network_top/m_axis_rx_tkeep[6]} {network_top/m_axis_rx_tkeep[7]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {network_top/s_axis_tx_tkeep[0]} {network_top/s_axis_tx_tkeep[1]} {network_top/s_axis_tx_tkeep[2]} {network_top/s_axis_tx_tkeep[3]} {network_top/s_axis_tx_tkeep[4]} {network_top/s_axis_tx_tkeep[5]} {network_top/s_axis_tx_tkeep[6]} {network_top/s_axis_tx_tkeep[7]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {network_top/m_axis_rx_tdata[0]} {network_top/m_axis_rx_tdata[1]} {network_top/m_axis_rx_tdata[2]} {network_top/m_axis_rx_tdata[3]} {network_top/m_axis_rx_tdata[4]} {network_top/m_axis_rx_tdata[5]} {network_top/m_axis_rx_tdata[6]} {network_top/m_axis_rx_tdata[7]} {network_top/m_axis_rx_tdata[8]} {network_top/m_axis_rx_tdata[9]} {network_top/m_axis_rx_tdata[10]} {network_top/m_axis_rx_tdata[11]} {network_top/m_axis_rx_tdata[12]} {network_top/m_axis_rx_tdata[13]} {network_top/m_axis_rx_tdata[14]} {network_top/m_axis_rx_tdata[15]} {network_top/m_axis_rx_tdata[16]} {network_top/m_axis_rx_tdata[17]} {network_top/m_axis_rx_tdata[18]} {network_top/m_axis_rx_tdata[19]} {network_top/m_axis_rx_tdata[20]} {network_top/m_axis_rx_tdata[21]} {network_top/m_axis_rx_tdata[22]} {network_top/m_axis_rx_tdata[23]} {network_top/m_axis_rx_tdata[24]} {network_top/m_axis_rx_tdata[25]} {network_top/m_axis_rx_tdata[26]} {network_top/m_axis_rx_tdata[27]} {network_top/m_axis_rx_tdata[28]} {network_top/m_axis_rx_tdata[29]} {network_top/m_axis_rx_tdata[30]} {network_top/m_axis_rx_tdata[31]} {network_top/m_axis_rx_tdata[32]} {network_top/m_axis_rx_tdata[33]} {network_top/m_axis_rx_tdata[34]} {network_top/m_axis_rx_tdata[35]} {network_top/m_axis_rx_tdata[36]} {network_top/m_axis_rx_tdata[37]} {network_top/m_axis_rx_tdata[38]} {network_top/m_axis_rx_tdata[39]} {network_top/m_axis_rx_tdata[40]} {network_top/m_axis_rx_tdata[41]} {network_top/m_axis_rx_tdata[42]} {network_top/m_axis_rx_tdata[43]} {network_top/m_axis_rx_tdata[44]} {network_top/m_axis_rx_tdata[45]} {network_top/m_axis_rx_tdata[46]} {network_top/m_axis_rx_tdata[47]} {network_top/m_axis_rx_tdata[48]} {network_top/m_axis_rx_tdata[49]} {network_top/m_axis_rx_tdata[50]} {network_top/m_axis_rx_tdata[51]} {network_top/m_axis_rx_tdata[52]} {network_top/m_axis_rx_tdata[53]} {network_top/m_axis_rx_tdata[54]} {network_top/m_axis_rx_tdata[55]} {network_top/m_axis_rx_tdata[56]} {network_top/m_axis_rx_tdata[57]} {network_top/m_axis_rx_tdata[58]} {network_top/m_axis_rx_tdata[59]} {network_top/m_axis_rx_tdata[60]} {network_top/m_axis_rx_tdata[61]} {network_top/m_axis_rx_tdata[62]} {network_top/m_axis_rx_tdata[63]}]]
connect_debug_port u_ila_0/probe18 [get_nets [list network_top/m_axis_rx_tlast]]
connect_debug_port u_ila_0/probe19 [get_nets [list network_top/m_axis_rx_tvalid]]
connect_debug_port u_ila_0/probe20 [get_nets [list network_top/s_axis_tx_tlast]]
connect_debug_port u_ila_0/probe21 [get_nets [list network_top/s_axis_tx_tready]]
connect_debug_port u_ila_0/probe22 [get_nets [list network_top/s_axis_tx_tvalid]]






connect_debug_port u_ila_0/probe4 [get_nets [list {network_top/axi_10g_ethernet_0_example_design/pcspma_status[0]} {network_top/axi_10g_ethernet_0_example_design/pcspma_status[1]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {network_top/MAC_RX_DATA[0]} {network_top/MAC_RX_DATA[1]} {network_top/MAC_RX_DATA[2]} {network_top/MAC_RX_DATA[3]} {network_top/MAC_RX_DATA[4]} {network_top/MAC_RX_DATA[5]} {network_top/MAC_RX_DATA[6]} {network_top/MAC_RX_DATA[7]} {network_top/MAC_RX_DATA[8]} {network_top/MAC_RX_DATA[9]} {network_top/MAC_RX_DATA[10]} {network_top/MAC_RX_DATA[11]} {network_top/MAC_RX_DATA[12]} {network_top/MAC_RX_DATA[13]} {network_top/MAC_RX_DATA[14]} {network_top/MAC_RX_DATA[15]} {network_top/MAC_RX_DATA[16]} {network_top/MAC_RX_DATA[17]} {network_top/MAC_RX_DATA[18]} {network_top/MAC_RX_DATA[19]} {network_top/MAC_RX_DATA[20]} {network_top/MAC_RX_DATA[21]} {network_top/MAC_RX_DATA[22]} {network_top/MAC_RX_DATA[23]} {network_top/MAC_RX_DATA[24]} {network_top/MAC_RX_DATA[25]} {network_top/MAC_RX_DATA[26]} {network_top/MAC_RX_DATA[27]} {network_top/MAC_RX_DATA[28]} {network_top/MAC_RX_DATA[29]} {network_top/MAC_RX_DATA[30]} {network_top/MAC_RX_DATA[31]} {network_top/MAC_RX_DATA[32]} {network_top/MAC_RX_DATA[33]} {network_top/MAC_RX_DATA[34]} {network_top/MAC_RX_DATA[35]} {network_top/MAC_RX_DATA[36]} {network_top/MAC_RX_DATA[37]} {network_top/MAC_RX_DATA[38]} {network_top/MAC_RX_DATA[39]} {network_top/MAC_RX_DATA[40]} {network_top/MAC_RX_DATA[41]} {network_top/MAC_RX_DATA[42]} {network_top/MAC_RX_DATA[43]} {network_top/MAC_RX_DATA[44]} {network_top/MAC_RX_DATA[45]} {network_top/MAC_RX_DATA[46]} {network_top/MAC_RX_DATA[47]} {network_top/MAC_RX_DATA[48]} {network_top/MAC_RX_DATA[49]} {network_top/MAC_RX_DATA[50]} {network_top/MAC_RX_DATA[51]} {network_top/MAC_RX_DATA[52]} {network_top/MAC_RX_DATA[53]} {network_top/MAC_RX_DATA[54]} {network_top/MAC_RX_DATA[55]} {network_top/MAC_RX_DATA[56]} {network_top/MAC_RX_DATA[57]} {network_top/MAC_RX_DATA[58]} {network_top/MAC_RX_DATA[59]} {network_top/MAC_RX_DATA[60]} {network_top/MAC_RX_DATA[61]} {network_top/MAC_RX_DATA[62]} {network_top/MAC_RX_DATA[63]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {network_top/MAC_RX_DATA_VALID[0]} {network_top/MAC_RX_DATA_VALID[1]} {network_top/MAC_RX_DATA_VALID[2]} {network_top/MAC_RX_DATA_VALID[3]} {network_top/MAC_RX_DATA_VALID[4]} {network_top/MAC_RX_DATA_VALID[5]} {network_top/MAC_RX_DATA_VALID[6]} {network_top/MAC_RX_DATA_VALID[7]}]]
connect_debug_port u_ila_0/probe23 [get_nets [list network_top/areset_datapathclk_out]]
connect_debug_port u_ila_0/probe27 [get_nets [list network_top/gtrxreset_out]]
connect_debug_port u_ila_0/probe30 [get_nets [list network_top/qplllock_out]]
connect_debug_port u_ila_0/probe31 [get_nets [list network_top/reset_counter_done_out]]
connect_debug_port u_ila_0/probe36 [get_nets [list network_top/txuserrdy_out]]
connect_debug_port u_ila_0/probe37 [get_nets [list network_top/txusrclk2_out]]
connect_debug_port u_ila_0/probe47 [get_nets [list network_top/MAC_RX_EOF]]
connect_debug_port u_ila_0/probe48 [get_nets [list network_top/MAC_RX_FRAME_VALID]]
connect_debug_port u_ila_0/probe49 [get_nets [list network_top/MAC_RX_SOF]]
connect_debug_port u_ila_0/probe51 [get_nets [list network_top/MAC_TX_RTS]]
connect_debug_port u_ila_0/probe52 [get_nets [list network_top/MAC_TX_SOF]]



connect_debug_port u_ila_0/probe24 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[7]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[8]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[9]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[10]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[11]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[12]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[13]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[14]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE[0]_15[15]}]]
connect_debug_port u_ila_0/probe25 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[7]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[8]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[9]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[10]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[11]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[12]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[13]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[14]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/BUF_SIZE_D[0]_18[15]}]]






connect_debug_port u_ila_0/probe11 [get_nets [list {TCP_TX_CTS[0]} {TCP_TX_CTS[1]}]]
connect_debug_port u_ila_0/probe12 [get_nets [list {TCP_TX_DATA_VALID[0]} {TCP_TX_DATA_VALID[1]}]]
connect_debug_port u_ila_0/probe13 [get_nets [list {TCP_RX_RTS[0]} {TCP_RX_RTS[1]}]]
connect_debug_port u_ila_0/probe14 [get_nets [list {TCP_RX_CTS_ACK[0]} {TCP_RX_CTS_ACK[1]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {TCP_RX_CTS[0]} {TCP_RX_CTS[1]}]]
connect_debug_port u_ila_0/probe19 [get_nets [list {TCP_RX_DATA_VALID[0]} {TCP_RX_DATA_VALID[1]}]]
connect_debug_port u_ila_0/probe27 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_APP_CTS_ACK_local[1]}]]
connect_debug_port u_ila_0/probe28 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/WEA[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/WEA[1]}]]
connect_debug_port u_ila_0/probe29 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_APP_RTS_local[1]}]]
connect_debug_port u_ila_0/probe30 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_APP_CTS_ACK_D[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_APP_CTS_ACK_D[1]}]]


















set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[0]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[6]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[7]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[8]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[14]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[30]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[2]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[3]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[11]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[13]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[4]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[5]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[9]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[10]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[12]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_FREE_SPACE[1]}]
set_property MARK_DEBUG true [get_nets {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_RXBUFNDEMUX2_001/RX_TCP_STREAM_SEL[0]}]











create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list network_top/axi_10g_ethernet_0_example_design/ethernet_core_0/inst/xpcs/inst/ten_gig_eth_pcs_pma_shared_clock_reset_block/coreclk_out]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {TCP_TX_DATA_KEEP[0]} {TCP_TX_DATA_KEEP[1]} {TCP_TX_DATA_KEEP[2]} {TCP_TX_DATA_KEEP[3]} {TCP_TX_DATA_KEEP[4]} {TCP_TX_DATA_KEEP[5]} {TCP_TX_DATA_KEEP[6]} {TCP_TX_DATA_KEEP[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {TCP_TX_DATA[0]} {TCP_TX_DATA[1]} {TCP_TX_DATA[2]} {TCP_TX_DATA[3]} {TCP_TX_DATA[4]} {TCP_TX_DATA[5]} {TCP_TX_DATA[6]} {TCP_TX_DATA[7]} {TCP_TX_DATA[8]} {TCP_TX_DATA[9]} {TCP_TX_DATA[10]} {TCP_TX_DATA[11]} {TCP_TX_DATA[12]} {TCP_TX_DATA[13]} {TCP_TX_DATA[14]} {TCP_TX_DATA[15]} {TCP_TX_DATA[16]} {TCP_TX_DATA[17]} {TCP_TX_DATA[18]} {TCP_TX_DATA[19]} {TCP_TX_DATA[20]} {TCP_TX_DATA[21]} {TCP_TX_DATA[22]} {TCP_TX_DATA[23]} {TCP_TX_DATA[24]} {TCP_TX_DATA[25]} {TCP_TX_DATA[26]} {TCP_TX_DATA[27]} {TCP_TX_DATA[28]} {TCP_TX_DATA[29]} {TCP_TX_DATA[30]} {TCP_TX_DATA[31]} {TCP_TX_DATA[32]} {TCP_TX_DATA[33]} {TCP_TX_DATA[34]} {TCP_TX_DATA[35]} {TCP_TX_DATA[36]} {TCP_TX_DATA[37]} {TCP_TX_DATA[38]} {TCP_TX_DATA[39]} {TCP_TX_DATA[40]} {TCP_TX_DATA[41]} {TCP_TX_DATA[42]} {TCP_TX_DATA[43]} {TCP_TX_DATA[44]} {TCP_TX_DATA[45]} {TCP_TX_DATA[46]} {TCP_TX_DATA[47]} {TCP_TX_DATA[48]} {TCP_TX_DATA[49]} {TCP_TX_DATA[50]} {TCP_TX_DATA[51]} {TCP_TX_DATA[52]} {TCP_TX_DATA[53]} {TCP_TX_DATA[54]} {TCP_TX_DATA[55]} {TCP_TX_DATA[56]} {TCP_TX_DATA[57]} {TCP_TX_DATA[58]} {TCP_TX_DATA[59]} {TCP_TX_DATA[60]} {TCP_TX_DATA[61]} {TCP_TX_DATA[62]} {TCP_TX_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/RX_TYPE[0]} {network_top/COM5502_TOP/IPSTACK_001/RX_TYPE[1]} {network_top/COM5502_TOP/IPSTACK_001/RX_TYPE[2]} {network_top/COM5502_TOP/IPSTACK_001/RX_TYPE[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA_VALID[0]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA_VALID[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[0]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[1]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[2]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[3]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[4]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[5]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[6]} {network_top/COM5502_TOP/IPSTACK_001/RX_IP_PROTOCOL[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 64 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[0]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[1]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[2]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[3]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[4]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[5]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[6]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[7]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[8]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[9]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[10]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[11]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[12]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[13]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[14]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[15]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[16]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[17]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[18]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[19]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[20]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[21]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[22]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[23]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[24]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[25]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[26]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[27]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[28]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[29]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[30]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[31]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[32]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[33]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[34]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[35]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[36]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[37]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[38]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[39]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[40]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[41]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[42]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[43]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[44]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[45]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[46]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[47]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[48]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[49]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[50]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[51]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[52]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[53]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[54]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[55]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[56]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[57]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[58]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[59]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[60]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[61]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[62]} {network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 64 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[7]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[8]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[9]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[10]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[11]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[12]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[13]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[14]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[15]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[16]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[17]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[18]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[19]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[20]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[21]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[22]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[23]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[24]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[25]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[26]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[27]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[28]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[29]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[30]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[31]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[32]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[33]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[34]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[35]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[36]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[37]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[38]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[39]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[40]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[41]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[42]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[43]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[44]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[45]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[46]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[47]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[48]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[49]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[50]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[51]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[52]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[53]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[54]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[55]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[56]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[57]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[58]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[59]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[60]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[61]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[62]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 64 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[7]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[8]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[9]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[10]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[11]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[12]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[13]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[14]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[15]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[16]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[17]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[18]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[19]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[20]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[21]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[22]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[23]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[24]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[25]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[26]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[27]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[28]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[29]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[30]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[31]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[32]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[33]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[34]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[35]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[36]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[37]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[38]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[39]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[40]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[41]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[42]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[43]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[44]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[45]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[46]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[47]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[48]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[49]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[50]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[51]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[52]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[53]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[54]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[55]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[56]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[57]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[58]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[59]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[60]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[61]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[62]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PAYLOAD_DATA_VALID[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[1]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[2]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[3]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[4]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[5]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[6]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_MAC_TX_DATA_VALID[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PACKET_TYPE[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP001_TX_PACKET_TYPE[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 64 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {network_top/MAC_RX_DATA[0]} {network_top/MAC_RX_DATA[1]} {network_top/MAC_RX_DATA[2]} {network_top/MAC_RX_DATA[3]} {network_top/MAC_RX_DATA[4]} {network_top/MAC_RX_DATA[5]} {network_top/MAC_RX_DATA[6]} {network_top/MAC_RX_DATA[7]} {network_top/MAC_RX_DATA[8]} {network_top/MAC_RX_DATA[9]} {network_top/MAC_RX_DATA[10]} {network_top/MAC_RX_DATA[11]} {network_top/MAC_RX_DATA[12]} {network_top/MAC_RX_DATA[13]} {network_top/MAC_RX_DATA[14]} {network_top/MAC_RX_DATA[15]} {network_top/MAC_RX_DATA[16]} {network_top/MAC_RX_DATA[17]} {network_top/MAC_RX_DATA[18]} {network_top/MAC_RX_DATA[19]} {network_top/MAC_RX_DATA[20]} {network_top/MAC_RX_DATA[21]} {network_top/MAC_RX_DATA[22]} {network_top/MAC_RX_DATA[23]} {network_top/MAC_RX_DATA[24]} {network_top/MAC_RX_DATA[25]} {network_top/MAC_RX_DATA[26]} {network_top/MAC_RX_DATA[27]} {network_top/MAC_RX_DATA[28]} {network_top/MAC_RX_DATA[29]} {network_top/MAC_RX_DATA[30]} {network_top/MAC_RX_DATA[31]} {network_top/MAC_RX_DATA[32]} {network_top/MAC_RX_DATA[33]} {network_top/MAC_RX_DATA[34]} {network_top/MAC_RX_DATA[35]} {network_top/MAC_RX_DATA[36]} {network_top/MAC_RX_DATA[37]} {network_top/MAC_RX_DATA[38]} {network_top/MAC_RX_DATA[39]} {network_top/MAC_RX_DATA[40]} {network_top/MAC_RX_DATA[41]} {network_top/MAC_RX_DATA[42]} {network_top/MAC_RX_DATA[43]} {network_top/MAC_RX_DATA[44]} {network_top/MAC_RX_DATA[45]} {network_top/MAC_RX_DATA[46]} {network_top/MAC_RX_DATA[47]} {network_top/MAC_RX_DATA[48]} {network_top/MAC_RX_DATA[49]} {network_top/MAC_RX_DATA[50]} {network_top/MAC_RX_DATA[51]} {network_top/MAC_RX_DATA[52]} {network_top/MAC_RX_DATA[53]} {network_top/MAC_RX_DATA[54]} {network_top/MAC_RX_DATA[55]} {network_top/MAC_RX_DATA[56]} {network_top/MAC_RX_DATA[57]} {network_top/MAC_RX_DATA[58]} {network_top/MAC_RX_DATA[59]} {network_top/MAC_RX_DATA[60]} {network_top/MAC_RX_DATA[61]} {network_top/MAC_RX_DATA[62]} {network_top/MAC_RX_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {network_top/MAC_TX_DATA_VALID[0]} {network_top/MAC_TX_DATA_VALID[1]} {network_top/MAC_TX_DATA_VALID[2]} {network_top/MAC_TX_DATA_VALID[3]} {network_top/MAC_TX_DATA_VALID[4]} {network_top/MAC_TX_DATA_VALID[5]} {network_top/MAC_TX_DATA_VALID[6]} {network_top/MAC_TX_DATA_VALID[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {network_top/MAC_RX_DATA_VALID[0]} {network_top/MAC_RX_DATA_VALID[1]} {network_top/MAC_RX_DATA_VALID[2]} {network_top/MAC_RX_DATA_VALID[3]} {network_top/MAC_RX_DATA_VALID[4]} {network_top/MAC_RX_DATA_VALID[5]} {network_top/MAC_RX_DATA_VALID[6]} {network_top/MAC_RX_DATA_VALID[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 64 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {network_top/MAC_TX_DATA[0]} {network_top/MAC_TX_DATA[1]} {network_top/MAC_TX_DATA[2]} {network_top/MAC_TX_DATA[3]} {network_top/MAC_TX_DATA[4]} {network_top/MAC_TX_DATA[5]} {network_top/MAC_TX_DATA[6]} {network_top/MAC_TX_DATA[7]} {network_top/MAC_TX_DATA[8]} {network_top/MAC_TX_DATA[9]} {network_top/MAC_TX_DATA[10]} {network_top/MAC_TX_DATA[11]} {network_top/MAC_TX_DATA[12]} {network_top/MAC_TX_DATA[13]} {network_top/MAC_TX_DATA[14]} {network_top/MAC_TX_DATA[15]} {network_top/MAC_TX_DATA[16]} {network_top/MAC_TX_DATA[17]} {network_top/MAC_TX_DATA[18]} {network_top/MAC_TX_DATA[19]} {network_top/MAC_TX_DATA[20]} {network_top/MAC_TX_DATA[21]} {network_top/MAC_TX_DATA[22]} {network_top/MAC_TX_DATA[23]} {network_top/MAC_TX_DATA[24]} {network_top/MAC_TX_DATA[25]} {network_top/MAC_TX_DATA[26]} {network_top/MAC_TX_DATA[27]} {network_top/MAC_TX_DATA[28]} {network_top/MAC_TX_DATA[29]} {network_top/MAC_TX_DATA[30]} {network_top/MAC_TX_DATA[31]} {network_top/MAC_TX_DATA[32]} {network_top/MAC_TX_DATA[33]} {network_top/MAC_TX_DATA[34]} {network_top/MAC_TX_DATA[35]} {network_top/MAC_TX_DATA[36]} {network_top/MAC_TX_DATA[37]} {network_top/MAC_TX_DATA[38]} {network_top/MAC_TX_DATA[39]} {network_top/MAC_TX_DATA[40]} {network_top/MAC_TX_DATA[41]} {network_top/MAC_TX_DATA[42]} {network_top/MAC_TX_DATA[43]} {network_top/MAC_TX_DATA[44]} {network_top/MAC_TX_DATA[45]} {network_top/MAC_TX_DATA[46]} {network_top/MAC_TX_DATA[47]} {network_top/MAC_TX_DATA[48]} {network_top/MAC_TX_DATA[49]} {network_top/MAC_TX_DATA[50]} {network_top/MAC_TX_DATA[51]} {network_top/MAC_TX_DATA[52]} {network_top/MAC_TX_DATA[53]} {network_top/MAC_TX_DATA[54]} {network_top/MAC_TX_DATA[55]} {network_top/MAC_TX_DATA[56]} {network_top/MAC_TX_DATA[57]} {network_top/MAC_TX_DATA[58]} {network_top/MAC_TX_DATA[59]} {network_top/MAC_TX_DATA[60]} {network_top/MAC_TX_DATA[61]} {network_top/MAC_TX_DATA[62]} {network_top/MAC_TX_DATA[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_TX_001/TX_PACKET_TYPE[0]} {network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_TX_001/TX_PACKET_TYPE[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list network_top/COM5502_TOP/IPSTACK_001/ARP_MAC_TX_EOF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list network_top/COM5502_TOP/IPSTACK_001/TCP_SERVER_X.TCP_SERVER_001/SEND_ACK_NOW]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list TCP_TX_DATA_FLUSH]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list TCP_TX_DATA_VALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list TCP_TX_CTS]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list corerst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list start]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets coreclk]
