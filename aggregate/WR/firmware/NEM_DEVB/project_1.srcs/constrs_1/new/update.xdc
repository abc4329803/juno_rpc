set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]
set_property BITSTREAM.CONFIG.TIMER_CFG 32'h00989680 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
#set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property CONFIG_MODE SPIx1 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]

# multiboot
set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]
set_property BITSTREAM.CONFIG.TIMER_CFG 32'h0007A120 [current_design]

# golden
# set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'hAF0000 [current_design]
# set_property BITSTREAM.CONFIG.NEXT_CONFIG_REBOOT ENABLE [current_design]



