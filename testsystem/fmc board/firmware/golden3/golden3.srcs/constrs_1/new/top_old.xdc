set_property PACKAGE_PIN E10 [get_ports clk_p_sys]
set_property IOSTANDARD LVCMOS25 [get_ports clk_p_sys]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p_sys]
create_clock -period 8.000 -name SYS_CLK [get_ports clk_p_sys]
set_input_jitter [get_clocks -of_objects [get_ports clk_p_sys]] 0.100

set_property IOSTANDARD LVDS_25 [get_ports clk_p_tdc]
set_property PACKAGE_PIN F20 [get_ports clk_p_tdc]     
create_clock -period 10.000 [get_ports clk_p_tdc]
set_input_jitter [get_clocks -of_objects [get_ports clk_p_tdc]] 0.100

#set_property PACKAGE_PIN E11 [get_ports greset]
#set_property IOSTANDARD LVCMOS25 [get_ports greset]
# LED
set_property PACKAGE_PIN E13 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[1]}]
set_property PULLDOWN true [get_ports {LED[1]}]

set_property PACKAGE_PIN E12 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[2]}]
set_property PULLDOWN true [get_ports {LED[2]}]

set_property PACKAGE_PIN C14 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[3]}]
set_property PULLDOWN true [get_ports {LED[3]}]

set_property PACKAGE_PIN C13 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[4]}]
set_property PULLDOWN true [get_ports {LED[4]}]

set_property PACKAGE_PIN B12 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[5]}]
set_property PULLDOWN true [get_ports {LED[5]}]

set_property PACKAGE_PIN B11 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[6]}]
set_property PULLDOWN true [get_ports {LED[6]}]

#set_property PACKAGE_PIN C14 [get_ports icap_done]
#set_property IOSTANDARD LVCMOS25 [get_ports icap_done]
#set_property PACKAGE_PIN C13 [get_ports FPGA_LED3]
#set_property IOSTANDARD LVCMOS25 [get_ports FPGA_LED3]
#set_property PACKAGE_PIN B12 [get_ports FPGA_LED4]
#set_property IOSTANDARD LVCMOS25 [get_ports FPGA_LED4]

# multiboot
set_property PACKAGE_PIN C23 [get_ports CS]
set_property IOSTANDARD LVCMOS33 [get_ports CS]
set_property PACKAGE_PIN A25 [get_ports MISO]
set_property IOSTANDARD LVCMOS33 [get_ports MISO]
set_property PACKAGE_PIN B24 [get_ports MOSI]                      
set_property IOSTANDARD LVCMOS33 [get_ports MOSI]
set_property PACKAGE_PIN B22 [get_ports WRITE_PROTECT_n]                      
set_property IOSTANDARD LVCMOS33 [get_ports WRITE_PROTECT_n]
set_property PACKAGE_PIN A22 [get_ports HOLD_n]                      
set_property IOSTANDARD LVCMOS33 [get_ports HOLD_n]
##################################

# offset_switch
set_property PACKAGE_PIN N30 [get_ports {offset_switch[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {offset_switch[0]}]
set_property PULLDOWN true [get_ports {offset_switch[0]}]

set_property PACKAGE_PIN N29 [get_ports {offset_switch[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {offset_switch[1]}]
set_property PULLDOWN true [get_ports {offset_switch[1]}]

#AD5532HS_0
# J28
set_property PACKAGE_PIN G24 [get_ports {sclk[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sclk[0]}]
# J26
set_property PACKAGE_PIN G22 [get_ports {din[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {din[0]}]
# J29
set_property PACKAGE_PIN G23 [get_ports {sync[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sync[0]}]

set_property PACKAGE_PIN F22 [get_ports {AD5532_reset[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AD5532_reset[0]}]

#AD5532HS_1
# J28
set_property PACKAGE_PIN D23 [get_ports {sclk[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sclk[1]}]
# J26
set_property PACKAGE_PIN H21 [get_ports {din[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {din[1]}]
# J29
set_property PACKAGE_PIN E23 [get_ports {sync[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sync[1]}]

set_property PACKAGE_PIN H22 [get_ports {AD5532_reset[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {AD5532_reset[1]}]

# OSC1
set_property PACKAGE_PIN T26 [get_ports INIT_CLK_IN]
set_property IOSTANDARD LVCMOS33 [get_ports INIT_CLK_IN]
create_clock -period 20.000 -name init_clk [get_ports INIT_CLK_IN]

# Si5345
set_property PACKAGE_PIN H21 [get_ports PLL_OE]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_OE]
set_property PACKAGE_PIN G21 [get_ports PLL_I2CSEL]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_I2CSEL]
set_property PACKAGE_PIN K22 [get_ports {PLL_INSEL[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PLL_INSEL[0]}]
set_property PACKAGE_PIN K23 [get_ports {PLL_INSEL[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {PLL_INSEL[1]}]
set_property PACKAGE_PIN H23 [get_ports PLL_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SCLK]
set_property PACKAGE_PIN H24 [get_ports PLL_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SDA]
set_property PACKAGE_PIN J21 [get_ports PLL_SDO]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_SDO]
set_property PACKAGE_PIN H22 [get_ports PLL_CSB]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_CSB]
set_property PACKAGE_PIN J24 [get_ports PLL_RST]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_RST]
set_property PACKAGE_PIN J25 [get_ports PLL_INTR]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_INTR]
set_property PACKAGE_PIN L22 [get_ports PLL_LOL]
set_property IOSTANDARD LVCMOS33 [get_ports PLL_LOL]

##################################
#SFP
set_property PACKAGE_PIN N3 [get_ports SFP_RXN]
set_property PACKAGE_PIN N4 [get_ports SFP_RXP]
set_property PACKAGE_PIN M1 [get_ports SFP_TXN]
set_property PACKAGE_PIN M2 [get_ports SFP_TXP]

set_property PACKAGE_PIN H5 [get_ports GTREFCLK_N]
set_property PACKAGE_PIN H6 [get_ports GTREFCLK_P]

#SW
set_property PACKAGE_PIN C9 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[0]}]
set_property PULLDOWN true [get_ports {SW[0]}]

set_property PACKAGE_PIN B9 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[1]}]
set_property PULLDOWN true [get_ports {SW[1]}]

set_property PACKAGE_PIN G11 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[2]}]
set_property PULLDOWN true [get_ports {SW[2]}]

set_property PACKAGE_PIN F10 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[3]}]
set_property PULLDOWN true [get_ports {SW[3]}]

#output

set_property PACKAGE_PIN F22 [get_ports outclock1]
set_property IOSTANDARD LVCMOS33 [get_ports outclock1]
set_property PULLDOWN true [get_ports outclock1]

set_property PACKAGE_PIN E23 [get_ports outclock2]
set_property IOSTANDARD LVCMOS33 [get_ports outclock2]
set_property PULLDOWN true [get_ports outclock2]


# bit stream compression enable
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

# qspi flash buswidth 1
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.CONFIG.USERID 32'h12345678 [current_design]

# golden
#set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h00B00000 [current_design]
set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h00500000 [current_design]
set_property BITSTREAM.CONFIG.NEXT_CONFIG_REBOOT ENABLE [current_design]

# multiboot
# set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]


set_false_path -from [get_clocks clkout0] -to [get_clocks clk_out1_TCP_clk_1]
set_false_path -from [get_clocks clk_out1_TCP_clk_1] -to [get_clocks clkout0]
