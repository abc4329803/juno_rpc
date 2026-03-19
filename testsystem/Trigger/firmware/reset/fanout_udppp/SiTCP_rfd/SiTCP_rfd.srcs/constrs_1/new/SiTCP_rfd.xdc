##################################
# System
#set_property PACKAGE_PIN AC9 [get_ports SYS_CLK_P]
#set_property IOSTANDARD LVDS [get_ports SYS_CLK_P]
#create_clock -period 10.000 -name SYS_CLK_P [get_ports SYS_CLK_P]

#set_property PACKAGE_PIN F14 [get_ports CLK_EXT_P]
#set_property IOSTANDARD LVDS_25 [get_ports CLK_EXT_P]

#GPIO0
#set_property PACKAGE_PIN C9 [get_ports RESET_IN]
#set_property IOSTANDARD LVCMOS25 [get_ports RESET_IN]
#set_property PULLDOWN true [get_ports RESET_IN]

##################################
# Debug
#set_property PACKAGE_PIN C9 [get_ports {SW[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {SW[0]}]
#set_property PULLUP true [get_ports {SW[0]}]
#set_property PACKAGE_PIN B9 [get_ports {SW[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {SW[1]}]
#set_property PULLUP true [get_ports {SW[1]}]
#set_property PACKAGE_PIN G11 [get_ports {SW[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {SW[2]}]
#set_property PULLUP true [get_ports {SW[2]}]
#set_property PACKAGE_PIN F10 [get_ports {SW[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {SW[3]}]
#set_property PULLUP true [get_ports {SW[3]}]

#set_property PACKAGE_PIN E13 [get_ports {LED[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[0]}]
#set_property PACKAGE_PIN E12 [get_ports {LED[1]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[1]}]
#set_property PACKAGE_PIN C14 [get_ports {LED[2]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[2]}]
#set_property PACKAGE_PIN C13 [get_ports {LED[3]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[3]}]
#set_property PACKAGE_PIN B12 [get_ports {LED[4]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[4]}]
#set_property PACKAGE_PIN B11 [get_ports {LED[5]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {LED[5]}]

#set_property PACKAGE_PIN E10 [get_ports CLK_IN]
#set_property IOSTANDARD LVCMOS25 [get_ports CLK_IN]
#set_property PULLDOWN true [get_ports CLK_IN]
set_property PULLDOWN true [get_ports TRIG_IN]


set_property PACKAGE_PIN F8 [get_ports {GPIO[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[0]}]
set_property PACKAGE_PIN D9 [get_ports {GPIO[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[1]}]
set_property PACKAGE_PIN D8 [get_ports {GPIO[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[2]}]
set_property PACKAGE_PIN A9 [get_ports {GPIO[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[3]}]

##################################
# SFP
set_property PACKAGE_PIN R3 [get_ports SFP_RXN]
set_property PACKAGE_PIN R4 [get_ports SFP_RXP]
set_property PACKAGE_PIN P1 [get_ports SFP_TXN]
set_property PACKAGE_PIN P2 [get_ports SFP_TXP]
#set_property PACKAGE_PIN H6 [get_ports GTREFCLK_P]
#set_property PACKAGE_PIN H5 [get_ports GTREFCLK_N]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]










