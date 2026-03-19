
set_property PACKAGE_PIN T26 [get_ports CLK_62M5_DMTD]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_62M5_DMTD]

set_property PACKAGE_PIN N8 [get_ports MGTREFCLK0_P]
set_property PACKAGE_PIN N7 [get_ports MGTREFCLK0_N]
#####################################################
############### main PLL AD9516 #####################
#####################################################
set_property PACKAGE_PIN U24 [get_ports PLL_CS]
set_property PACKAGE_PIN V21 [get_ports PLL_REFSEL]
set_property PACKAGE_PIN R26 [get_ports PLL_RESET]
set_property PACKAGE_PIN V24 [get_ports PLL_SCLK]
set_property PACKAGE_PIN R24 [get_ports PLL_SDI]
set_property PACKAGE_PIN V25 [get_ports PLL_SYNC]
set_property PACKAGE_PIN W19 [get_ports PLL_LOCK]
set_property PACKAGE_PIN U23 [get_ports PLL_SDO]
set_property PACKAGE_PIN W23 [get_ports PLL_STAT]

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


set_property PACKAGE_PIN AB27 [get_ports {test_o[0]}]
set_property PACKAGE_PIN AC29 [get_ports {test_o[1]}]
set_property PACKAGE_PIN AB30 [get_ports {test_o[2]}]
set_property PACKAGE_PIN AF26 [get_ports {test_o[3]}]
set_property PACKAGE_PIN AF27 [get_ports {test_o[4]}]
set_property PACKAGE_PIN AG27 [get_ports {test_o[5]}]
set_property PACKAGE_PIN AD26 [get_ports {test_o[6]}]
set_property PACKAGE_PIN AE26 [get_ports {test_o[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports test_o]