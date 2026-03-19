set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets instance_name/inst/clk_in1_manchester_clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_wiz_100M/inst/clk_in1_clk_wiz_100M]

set_property PACKAGE_PIN E10 [get_ports EXT_CLK]
set_property IOSTANDARD LVCMOS25 [get_ports EXT_CLK]

# set_property PACKAGE_PIN E10 [get_ports EXT_CLK_P]
# set_property IOSTANDARD LVCMOS25 [get_ports EXT_CLK_P]
# set_property PACKAGE_PIN D10 [get_ports EXT_CLK_N]
# set_property IOSTANDARD LVCMOS25 [get_ports EXT_CLK_N]

#set_property PACKAGE_PIN E10 [get_ports EXT_CLK_P]
#set_property IOSTANDARD LVDS_25 [get_ports EXT_CLK_P]
create_clock -period 8.000 -name EXT_CLK [get_ports EXT_CLK]
# set_property PACKAGE_PIN D10 [get_ports EXT_CLK_N]
# set_property IOSTANDARD LVCMOS25 [get_ports EXT_CLK_P]
# set_property IOSTANDARD LVCMOS25 [get_ports EXT_CLK_N]


#set_property PACKAGE_PIN E10 [get_ports SYS_CLK_P]
set_property PACKAGE_PIN C12 [get_ports SYS_CLK_P]
set_property IOSTANDARD LVDS_25 [get_ports SYS_CLK_P]
#set_property PACKAGE_PIN AC9 [get_ports SYS_CLK_P]
#set_property IOSTANDARD DIFF_SSTL135 [get_ports SYS_CLK_P]

create_clock -period 8.000 -name SYS_CLK [get_ports SYS_CLK_P]

#set_property PACKAGE_PIN T20 [get_ports RESET_OUT]
set_property PACKAGE_PIN M21 [get_ports RESET_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports RESET_OUT]

set_property PACKAGE_PIN T20 [get_ports CLK_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_OUT]

set_property PACKAGE_PIN M24 [get_ports DATA_IN]
set_property IOSTANDARD LVCMOS33 [get_ports DATA_IN]

#set_property PACKAGE_PIN M21 [get_ports FB_OUT]
set_property PACKAGE_PIN R20 [get_ports FB_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports FB_OUT]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets FB_OUT_IBUF[0]]

set_property PACKAGE_PIN H9 [get_ports RESET_IN]
set_property IOSTANDARD LVCMOS25 [get_ports RESET_IN]
set_property PULLDOWN true [get_ports RESET_IN]

# set_property PACKAGE_PIN C23 [get_ports FLASH_SCK]
# set_property IOSTANDARD LVCMOS25 [get_ports FLASH_SCK]

set_property PACKAGE_PIN C23 [get_ports FLASH_CS_n]
set_property IOSTANDARD LVCMOS33 [get_ports FLASH_CS_n]

# set_property PACKAGE_PIN B24 [get_ports FLASH_TDI]
# set_property IOSTANDARD LVCMOS33 [get_ports FLASH_TDI]

# set_property PACKAGE_PIN A25 [get_ports FLASH_TDO]
# set_property IOSTANDARD LVCMOS33 [get_ports FLASH_TDO]

# set_property PACKAGE_PIN B22 [get_ports WRITE_PROTECT_n]
# set_property IOSTANDARD LVCMOS33 [get_ports WRITE_PROTECT_n]

# set_property PACKAGE_PIN A22 [get_ports HOLD_n]
# set_property IOSTANDARD LVCMOS33 [get_ports HOLD_n]

set_property PACKAGE_PIN A25 [get_ports MISO]
set_property IOSTANDARD LVCMOS33 [get_ports MISO]
set_property PACKAGE_PIN B24 [get_ports MOSI]                      
set_property IOSTANDARD LVCMOS33 [get_ports MOSI]
set_property PACKAGE_PIN B22 [get_ports WRITE_PROTECT_n]                      
set_property IOSTANDARD LVCMOS33 [get_ports WRITE_PROTECT_n]
set_property PACKAGE_PIN A22 [get_ports HOLD_n]                      
set_property IOSTANDARD LVCMOS33 [get_ports HOLD_n]
# JTAG
set_property PACKAGE_PIN U20 [get_ports {TCK[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TCK[0]}]
set_property PULLDOWN true [get_ports {TCK[0]}]

set_property PACKAGE_PIN R17 [get_ports {TMS[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TMS[0]}]
set_property PULLDOWN true [get_ports {TMS[0]}]

set_property PACKAGE_PIN U19 [get_ports {TDI[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TDI[0]}]
set_property PULLDOWN true [get_ports {TDI[0]}]

set_property PACKAGE_PIN M22 [get_ports {TDO[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TDO[0]}]
set_property PULLDOWN true [get_ports {TDO[0]}]

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

# GPIO
#SW
set_property PACKAGE_PIN F8 [get_ports {GPIO[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[0]}]
set_property PULLDOWN true [get_ports {GPIO[0]}]

set_property PACKAGE_PIN D9 [get_ports {GPIO[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[1]}]
set_property PULLDOWN true [get_ports {GPIO[1]}]

set_property PACKAGE_PIN D8 [get_ports {GPIO[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[2]}]
set_property PULLDOWN true [get_ports {GPIO[2]}]

set_property PACKAGE_PIN A9 [get_ports {GPIO[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {GPIO[3]}]
set_property PULLDOWN true [get_ports {GPIO[3]}]

#SFP
set_property PACKAGE_PIN N3 [get_ports SFP_RXN]
set_property PACKAGE_PIN N4 [get_ports SFP_RXP]
set_property PACKAGE_PIN M1 [get_ports SFP_TXN]
set_property PACKAGE_PIN M2 [get_ports SFP_TXP]

set_property PACKAGE_PIN H5 [get_ports GTREFCLK_N]
set_property PACKAGE_PIN H6 [get_ports GTREFCLK_P]

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
set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h00800000 [current_design]
set_property BITSTREAM.CONFIG.NEXT_CONFIG_REBOOT ENABLE [current_design]

