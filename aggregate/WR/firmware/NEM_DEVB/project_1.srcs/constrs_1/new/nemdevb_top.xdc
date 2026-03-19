#####################################################
#################### Version ########################
#####################################################
set_property PACKAGE_PIN A15 [get_ports {WRNEM_VER[0]}]
set_property PACKAGE_PIN B15 [get_ports {WRNEM_VER[1]}]
set_property PACKAGE_PIN B14 [get_ports {WRNEM_VER[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {WRNEM_VER[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {WRNEM_VER[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {WRNEM_VER[0]}]

#####################################################
#################### Temp Sensor#####################
#####################################################
set_property PACKAGE_PIN G12 [get_ports ONE_WIRE]
set_property IOSTANDARD LVCMOS33 [get_ports ONE_WIRE]

#####################################################
#################### AUX#####################
#####################################################

#  NOT CONNECTED
set_property PACKAGE_PIN K19 [get_ports AUX0_P]
set_property PACKAGE_PIN K20 [get_ports AUX0_N]
set_property IOSTANDARD LVDS_25 [get_ports AUX0_P]
set_property IOSTANDARD LVDS_25 [get_ports AUX0_N]

set_property PACKAGE_PIN L11 [get_ports testaux0]
set_property IOSTANDARD LVCMOS33 [get_ports testaux0]
set_property PACKAGE_PIN J12 [get_ports testsysclk]
set_property IOSTANDARD LVCMOS33 [get_ports testsysclk]
set_property PACKAGE_PIN AC1 [get_ports testgtrefclk]
set_property IOSTANDARD LVCMOS18 [get_ports testgtrefclk]

set_property PACKAGE_PIN AD1 [get_ports testfpgaclk]
set_property IOSTANDARD LVCMOS18 [get_ports testfpgaclk]

# set_property PACKAGE_PIN AK8 [get_ports EXT_CLK]
# set_property IOSTANDARD LVCMOS18 [get_ports EXT_CLK]
# create_clock -period 8.000 -name EXT_CLK [get_ports EXT_CLK]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets EXT_CLK_IBUF] 

#set_property PACKAGE_PIN J12  [get_ports B13]
set_property PACKAGE_PIN L11  [get_ports B14]
set_property IOSTANDARD LVCMOS33 [get_ports B13]
set_property IOSTANDARD LVCMOS33 [get_ports B14]

#####################################################
################ Clock Signals  (LVDS) ##############
#####################################################
set_property PACKAGE_PIN G14 [get_ports CLK_62M5_DMTD]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_62M5_DMTD]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_62M5_DMTD_IBUF]

#  NOT CONNECTED
# set_property PACKAGE_PIN G13 [get_ports FPGA_CLK_P]
# set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CLK_P]
# create_clock -period 8.000 -name FPGA_CLK [get_ports FPGA_CLK_P]

#set_property IOSTANDARD LVDS_25 [get_ports FPGA_CLK_P]


#set_property PACKAGE_PIN AF22 [get_ports BAK_CLK_P]
#set_property IOSTANDARD LVDS_25 [get_ports BAK_CLK_P]
#set_property PACKAGE_PIN AD23 [get_ports BAK2_CLK_P]
#set_property IOSTANDARD LVDS_25 [get_ports BAK2_CLK_P]

#set_property PACKAGE_PIN B6 [get_ports MGTREFCLK1_P]
#set_property PACKAGE_PIN B5 [get_ports MGTREFCLK1_N]
#set_property PACKAGE_PIN F14 [get_ports OE_125M]
#set_property IOSTANDARD LVCMOS25 [get_ports OE_125M]

set_property PACKAGE_PIN U8 [get_ports MGTREFCLK0_P]
set_property PACKAGE_PIN U7 [get_ports MGTREFCLK0_N]

#####################################################
#################### DAC Signals ####################
#####################################################
set_property PACKAGE_PIN F11 [get_ports DAC_LDAC_N]
set_property PACKAGE_PIN E13 [get_ports DAC_SCLK]
set_property PACKAGE_PIN E11 [get_ports DAC_SDO]
set_property PACKAGE_PIN E14 [get_ports DAC_SYNC_N]
set_property PACKAGE_PIN F12 [get_ports DAC_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_LDAC_N]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_SDO]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_SYNC_N]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_SDI]

set_property PACKAGE_PIN A11 [get_ports DAC_DMTD_LDAC_N]
set_property PACKAGE_PIN B13 [get_ports DAC_DMTD_SCLK]
set_property PACKAGE_PIN B12 [get_ports DAC_DMTD_SDO]
set_property PACKAGE_PIN A13 [get_ports DAC_DMTD_SYNC_N]
set_property PACKAGE_PIN A12 [get_ports DAC_DMTD_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_DMTD_LDAC_N]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_DMTD_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_DMTD_SDO]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_DMTD_SYNC_N]
set_property IOSTANDARD LVCMOS33 [get_ports DAC_DMTD_SDI]

#####################################################
#################### GTP Signals#####################
#####################################################
set_property PACKAGE_PIN H15 [get_ports {SFP_DISABLE_O[0]}]
set_property PACKAGE_PIN H16 [get_ports {SFP_FAULT_I[0]}]
set_property PACKAGE_PIN G15 [get_ports {SFP_LOS_I[0]}]
set_property PACKAGE_PIN C15 [get_ports {SFP_MOD_DEF0_I[0]}]
set_property PACKAGE_PIN J16 [get_ports {SFP_MOD_DEF1_IO[0]}]
set_property PACKAGE_PIN F15 [get_ports {SFP_MOD_DEF2_IO[0]}]

#SFP1
# set_property PACKAGE_PIN W3 [get_ports {SFP_I_N[0]}]
# set_property PACKAGE_PIN W4 [get_ports {SFP_I_P[0]}]
# set_property PACKAGE_PIN U1 [get_ports {SFP_O_N[0]}]
# set_property PACKAGE_PIN U2 [get_ports {SFP_O_P[0]}]

#SFP2
set_property PACKAGE_PIN AA3 [get_ports {SFP_I_N[0]}]
set_property PACKAGE_PIN AA4 [get_ports {SFP_I_P[0]}]
set_property PACKAGE_PIN Y1 [get_ports {SFP_O_N[0]}]
set_property PACKAGE_PIN Y2 [get_ports {SFP_O_P[0]}]

#set_property PACKAGE_PIN N16 [get_ports { SFP_RATE_SELECT[0] } ]
# set_property PACKAGE_PIN M15 [get_ports {SFP_DISABLE_O[1]}]
# set_property PACKAGE_PIN L14 [get_ports {SFP_FAULT_I[1]}]
# set_property PACKAGE_PIN P15 [get_ports {SFP_LOS_I[1]}]
# set_property PACKAGE_PIN T12 [get_ports {SFP_MOD_DEF0_I[1]}]
# set_property PACKAGE_PIN N14 [get_ports {SFP_MOD_DEF1_IO[1]}]
# set_property PACKAGE_PIN M14 [get_ports {SFP_MOD_DEF2_IO[1]}]
# set_property PACKAGE_PIN G3 [get_ports {SFP_I_N[1]}]
# set_property PACKAGE_PIN G4 [get_ports {SFP_I_P[1]}]
# set_property PACKAGE_PIN B1 [get_ports {SFP_O_N[1]}]
# set_property PACKAGE_PIN B2 [get_ports {SFP_O_P[1]}]
#set_property PACKAGE_PIN R13 [get_ports { SFP_RATE_SELECT[1] } ]

set_property IOSTANDARD LVCMOS33 [get_ports {SFP_DISABLE_O[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SFP_FAULT_I[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SFP_LOS_I[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF0_I[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF1_IO[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF2_IO[0]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {SFP_RATE_SELECT[0]} ]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_DISABLE_O[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_FAULT_I[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_LOS_I[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF0_I[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF1_IO[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SFP_MOD_DEF2_IO[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SFP_RATE_SELECT[1]} ]

# set_property PACKAGE_PIN G3 [get_ports SFP_1G_I_N]
# set_property PACKAGE_PIN G4 [get_ports SFP_1G_I_P]
# set_property PACKAGE_PIN B1 [get_ports SFP_1G_O_N]
# set_property PACKAGE_PIN B2 [get_ports SFP_1G_O_P]


#####################################################
########################  LED  ######################
#####################################################
# set_property PACKAGE_PIN AH2 [get_ports {LED[0]}]
# set_property IOSTANDARD LVCMOS18 [get_ports {LED[0]}]
# set_property PACKAGE_PIN AJ2 [get_ports {LED[1]}]
# set_property IOSTANDARD LVCMOS18 [get_ports {LED[1]}]

#set_property PACKAGE_PIN J23 [get_ports {LED[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
# set_property PACKAGE_PIN H17 [get_ports {led_act_o[1]}]
# set_property IOSTANDARD LVCMOS25 [get_ports {led_act_o[1]}]
# set_property PACKAGE_PIN E18 [get_ports {led_link_o[1]}]
# set_property IOSTANDARD LVCMOS25 [get_ports {led_link_o[1]}]
#set_property PACKAGE_PIN P23 [get_ports {USER_LED[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {USER_LED[0]}]
#set_property PACKAGE_PIN N24 [get_ports {USER_LED[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {USER_LED[1]}]
#set_property PACKAGE_PIN M24 [get_ports {USER_LED[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {USER_LED[2]}]
#set_property PACKAGE_PIN K24 [get_ports {USER_LED[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {USER_LED[3]}]

#####################################################
###################### UART #########################
#####################################################
set_property PACKAGE_PIN J11 [get_ports UART_TX]
set_property PACKAGE_PIN K11 [get_ports UART_RX]
#set_property PACKAGE_PIN T15 [get_ports CLK_25M_BAK]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TX]
set_property IOSTANDARD LVCMOS33 [get_ports UART_RX]
#set_property IOSTANDARD LVCMOS33 CLK_25M_BAK

#####################################################
################### Delay Chip#######################
#####################################################
set_property PACKAGE_PIN H16 [get_ports DELAY_EN]
set_property PACKAGE_PIN K16 [get_ports DELAY_SCLK]
set_property PACKAGE_PIN J16 [get_ports DELAY_SLOAD]
set_property PACKAGE_PIN L16 [get_ports DELAY_SDIN]
set_property IOSTANDARD LVCMOS33 [get_ports DELAY_EN]
set_property IOSTANDARD LVCMOS33 [get_ports DELAY_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports DELAY_SLOAD]
set_property IOSTANDARD LVCMOS33 [get_ports DELAY_SDIN]

#####################################################
###################### FLASH ########################
#####################################################
set_property PACKAGE_PIN U19 [get_ports QSPI_CS]
set_property IOSTANDARD LVCMOS33 [get_ports QSPI_CS]
set_property PACKAGE_PIN P24 [get_ports QSPI_DQ0]
set_property IOSTANDARD LVCMOS33 [get_ports QSPI_DQ0]
set_property PACKAGE_PIN R25 [get_ports QSPI_DQ1]
set_property IOSTANDARD LVCMOS33 [get_ports QSPI_DQ1]
#set_property PACKAGE_PIN J15 [get_ports QSPI_DQ2]
#set_property IOSTANDARD LVCMOS33 [get_ports QSPI_DQ2]
#set_property PACKAGE_PIN J16 [get_ports QSPI_DQ3]
#set_property IOSTANDARD LVCMOS33 [get_ports QSPI_DQ3]
# set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
# set_property CONFIG_MODE SPIx1 [current_design]
# set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

#####################################################
############### main PLL AD9516 #####################
#####################################################
set_property PACKAGE_PIN D12 [get_ports PLL_CS]
set_property PACKAGE_PIN E16 [get_ports PLL_REFSEL]
set_property PACKAGE_PIN C11 [get_ports PLL_RESET]
set_property PACKAGE_PIN D13 [get_ports PLL_SCLK]
#set_property PACKAGE_PIN D11 [get_ports PLL_SDI]
set_property PACKAGE_PIN C12 [get_ports PLL_SDI]
set_property PACKAGE_PIN C14 [get_ports PLL_SYNC]
set_property PACKAGE_PIN C15 [get_ports PLL_LOCK]
#set_property PACKAGE_PIN C12 [get_ports PLL_SDO]
set_property PACKAGE_PIN D11 [get_ports PLL_SDO]
set_property PACKAGE_PIN D14 [get_ports PLL_STAT]

set_property IOSTANDARD LVCMOS33 [get_ports PLL_CS]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_REFSEL]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_RESET]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SDO]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SYNC]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_LOCK]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SDI]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_STAT]
create_clock -period 16.000 -name CLK_62M5_DMTD -waveform {0.000 8.000} [get_ports CLK_62M5_DMTD]
create_clock -period 8.000 -name MGTREFCLK0_P -waveform {0.000 4.000} [get_ports MGTREFCLK0_P]
# create_clock -period 16.000 -name clk_gtp_ref0_div2 [get_pins */gen_phy_kintex7.cmp_gtp_dedicated_clk/ODIV2]
#create_clock -period 8.000 -name MGTREFCLK1_P -waveform {0.000 4.000} [get_ports MGTREFCLK1_P]
#create_clock -period 4.000 -name clk_serdes_i -waveform {0.000 2.000} [get_ports FPGA_GCLK_P]
# create_clock -period 16.000 -name RXOUTCLK0 -waveform {0.000 8.000} [get_pins *cmp_xwrc_platform/gen_phy_kintex7.cmp_gtx/U_GTX_INST/gtxe2_i/RXOUTCLK]
# create_clock -period 16.000 -name TXOUTCLK0 -waveform {0.000 8.000} [get_pins *cmp_xwrc_platform/gen_phy_kintex7.cmp_gtx/U_GTX_INST/gtxe2_i/TXOUTCLK]
create_clock -period 16.000 -name clk_gtp_ref0_div2 -waveform {0.000 8.000} -add [get_pins u_MD10_top/Inst_wr_nem/cmp_xwrc_platform/gen_phy_kintex7.cmp_gtp_dedicated_clk/ODIV2]
create_clock -period 16.000 -name RXOUTCLK0 -waveform {0.000 8.000} -add [get_pins u_MD10_top/Inst_wr_nem/cmp_xwrc_platform/gen_phy_kintex7.cmp_gtx/U_GTX_INST/gtxe2_i/RXOUTCLK]
create_clock -period 16.000 -name TXOUTCLK0 -waveform {0.000 8.000} -add [get_pins u_MD10_top/Inst_wr_nem/cmp_xwrc_platform/gen_phy_kintex7.cmp_gtx/U_GTX_INST/gtxe2_i/TXOUTCLK]
set_clock_groups -name g1  -asynchronous -group CLK_62M5_DMTD -group RXOUTCLK0
set_clock_groups -name g2  -asynchronous -group CLK_62M5_DMTD -group TXOUTCLK0
set_clock_groups -name g3 -asynchronous -group CLK_62M5_DMTD -group MGTREFCLK0_P
set_clock_groups -name g4 -asynchronous -group CLK_62M5_DMTD -group clk_gtp_ref0_div2

set_property ASYNC_REG true [get_cells {u_MD10_top/Inst_wr_nem/*/cmp_xwr_core/WRPC/U_SOFTPLL/U_Wrapped_Softpll/gen_with_ext_clock_input.U_Aligner_EXT/cnt_in_gray_xd_reg[*]}]
set_property ASYNC_REG true [get_cells {u_MD10_top/Inst_wr_nem/*/cmp_xwr_core/WRPC/U_SOFTPLL/U_Wrapped_Softpll/gen_with_ext_clock_input.U_Aligner_EXT/cnt_in_gray_x_reg[*]}]
set_property ASYNC_REG true [get_cells {u_MD10_top/Inst_wr_nem/*/cmp_xwr_core/WRPC/U_SOFTPLL/U_Wrapped_Softpll/gen_ref_dmtds[0].DMTD_REF/gen_builtin.U_Sampler/gen_straight_nonoversampled.clk_i_d0_reg}]
set_property ASYNC_REG true [get_cells {u_MD10_top/Inst_wr_nem/*/cmp_xwr_core/WRPC/U_SOFTPLL/U_Wrapped_Softpll/gen_ref_dmtds[0].DMTD_REF/gen_builtin.U_Sampler/gen_straight_nonoversampled.clk_i_d3_reg}]

# set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
#set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
#set_property CONFIG_MODE SPIx4 [current_design]

set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets testsysclk_OBUF]
