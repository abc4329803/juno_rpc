create_clock -period 10.000 [get_ports clk_p_tdc]
set_input_jitter [get_clocks -of_objects [get_ports clk_p_tdc]] 0.050



set_property IOSTANDARD DIFF_SSTL135 [get_ports clk_p_tdc]
set_property PACKAGE_PIN AC9 [get_ports clk_p_tdc]


set_property PACKAGE_PIN C14 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[1]}]
set_property PACKAGE_PIN C13 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[0]}]


set_property IOSTANDARD LVCMOS25 [get_ports Dataout_CE]
set_property IOSTANDARD LVCMOS25 [get_ports sys_CE]
set_property PACKAGE_PIN C9 [get_ports sys_CE]
set_property PACKAGE_PIN G11 [get_ports Dataout_CE]


set_property PACKAGE_PIN AA23 [get_ports scl]
set_property IOSTANDARD LVCMOS25 [get_ports scl]
set_property PACKAGE_PIN AA24 [get_ports sda]
set_property IOSTANDARD LVCMOS25 [get_ports sda]
set_property PACKAGE_PIN Y22 [get_ports DAC_A0]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_A0]
set_property PACKAGE_PIN AA22 [get_ports DAC_A1]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_A1]
set_property PACKAGE_PIN AB24 [get_ports DAC_nLdac]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_nLdac]
set_property PACKAGE_PIN Y23 [get_ports DAC_nReset]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_nReset]

#set_property BEL D5FF [get_cells Calibration_table/MultiEdge_DelayChain_Top/Singal_Input/valid_reg]
#set_property LOC SLICE_X87Y136 [get_cells Calibration_table/MultiEdge_DelayChain_Top/Singal_Input/valid_reg]
#
#set_property BEL CFF [get_cells Calibration_table/MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst]
#set_property LOC SLICE_X89Y140 [get_cells Calibration_table/MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst]







set_property IOSTANDARD LVDS_25 [get_ports {signal_p[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[8]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_n[8]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[9]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[10]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[11]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[12]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[13]}]

set_property PACKAGE_PIN M21 [get_ports {signal_p[0]}]
set_property PACKAGE_PIN P19 [get_ports {signal_p[1]}]
set_property PACKAGE_PIN R22 [get_ports {signal_p[2]}]
set_property PACKAGE_PIN T20 [get_ports {signal_p[3]}]
set_property PACKAGE_PIN U19 [get_ports {signal_p[4]}]
set_property PACKAGE_PIN T18 [get_ports {signal_p[5]}]
set_property PACKAGE_PIN T22 [get_ports {signal_p[6]}]
set_property PACKAGE_PIN T24 [get_ports {signal_p[7]}]
set_property PACKAGE_PIN R16 [get_ports {signal_p[8]}]
set_property PACKAGE_PIN P16 [get_ports {signal_p[9]}]
set_property PACKAGE_PIN R18 [get_ports {signal_p[10]}]
set_property PACKAGE_PIN N18 [get_ports {signal_p[11]}]
set_property PACKAGE_PIN P23 [get_ports {signal_p[12]}]
set_property PACKAGE_PIN U17 [get_ports {signal_p[13]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_n[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {signal_n[0]}]
set_property PACKAGE_PIN D10 [get_ports signal_sma1]
set_property IOSTANDARD LVCMOS25 [get_ports signal_sma1]


set_max_delay -from [get_pins {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst/Q}] -through [get_pins {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/DELAYCHAIN_400bit/genblk1[24].carry4/S[0]}] -to [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/D_out_reg[96]}] 0.200
set_max_delay -from [get_pins {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst/Q}] -through [get_pins {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/DELAYCHAIN_400bit/genblk1[24].carry4/S[0]}] -to [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/D_out_reg[96]}] 0.200

#set_min_delay -from [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[2].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[2].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[3].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[3].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[4].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[4].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[5].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[5].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[6].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[6].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[7].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[7].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[8].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[8].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[9].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[9].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[10].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[10].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[11].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[11].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[12].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[12].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[13].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[13].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[14].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[14].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6
#set_min_delay -from [get_cells {Calibration_table/genblk1[15].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}] -to [get_cells {Calibration_table/genblk1[15].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}] 0.6

#set_property BEL AFF [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]
#set_property LOC SLICE_X39Y180 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]
#
#set_property BEL DFF [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
#set_property LOC SLICE_X21Y121 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]


#set_property BEL CFF [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
#set_property LOC SLICE_X44Y124 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
#set_property BEL AFF [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]
#set_property LOC SLICE_X39Y165 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]
#set_property BEL BFF [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
#set_property LOC SLICE_X53Y125 [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
#set_property BEL DFF [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]
#set_property LOC SLICE_X53Y175 [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/valid_reg}]

#set _xlnx_shared_i0 [get_cells -hierarchical *dstore_reg*]
#set_false_path -from $_xlnx_shared_i0 -to [get_cells -hierarchical *dout_reg*]
#set_false_path -from [get_cells -hierarchical *d_req_reg*] -to $_xlnx_shared_i0
#set_false_path -from [get_cells -hierarchical *d_req_reg*] -to [get_cells -hierarchical *d_req_syn_1_reg*]
#set_false_path -from [get_cells dataout_flag_reg]
#set_false_path -from [get_cells -hierarchical *d_req_syn_2_reg*] -to [get_cells -hierarchical *d_ask_syn_reg*]


#set_max_delay -from [get_cells -hierarchical "*D_out_reg*"] -to [get_cells -hierarchical "*SRL16E*"] 2.500

set_property BEL CFF [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
set_property LOC SLICE_X61Y224 [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
set_property LOC SLICE_X60Y200 [get_cells {Calibration_table/genblk1[0].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/DELAYCHAIN_400bit/genblk1[0].carry4}]

set_property BEL AFF [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
set_property LOC SLICE_X143Y224 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/Singal_Input/LDCE_inst}]
set_property LOC SLICE_X142Y200 [get_cells {Calibration_table/genblk1[1].MultiEdge_DelayChain_Top/MultiEdge_DelayChain/DELAYCHAIN_400bit/genblk1[0].carry4}]


#set_max_delay -from [get_cells -hierarchical *dstore_reg*] -to [get_cells -hierarchical *dout_reg*] 2.500
#set_max_delay -from [get_cells -hierarchical *d_req_reg*] -to [get_cells -hierarchical *d_req_syn_1_reg*] 2.500
#set_max_delay -from [get_cells -hierarchical *d_req_syn_2_reg*] -to [get_cells -hierarchical *d_ask_syn_reg*] 2.500

#set_min_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[0]*" }] 3.000
#set_min_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[1]*" }] 3.000
#
#set_min_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[0]*" }] 3.000
#set_min_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[1]*" }] 3.000
#
#
#set_multicycle_path 2 -setup -start -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[0]*" }]
#set_multicycle_path 1 -hold -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[0]*" }]
#set_multicycle_path 2 -setup -start -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[1]*" }]
#set_multicycle_path 1 -hold -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[1]*" && NAME =~  "*genblk1[1]*" }]
#
#set_multicycle_path 2 -setup -start -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[0]*" }]
#set_multicycle_path 1 -hold -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[0]*" }]
#set_multicycle_path 2 -setup -start -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[1]*" }]
#set_multicycle_path 1 -hold -from [get_cells -hierarchical -filter { NAME =~  "*D_out*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180*" && NAME =~  "*genblk1[1]*" }]

set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out_reg*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180_reg*" && NAME =~  "*genblk1[0]*" }] 2.5
set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out_reg*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_180_reg*" && NAME =~  "*genblk1[1]*" }] 2.5

set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out_reg*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[0]*" && NAME =~  "*genblk1[0]*" }] 2.5
set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*D_out_reg*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_reg[0]*" && NAME =~  "*genblk1[1]*" }] 2.5

set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*Data_200_180_reg*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_90_reg*" && NAME =~  "*genblk1[0]*" }] 3.75
set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*Data_200_180_reg*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_90_reg*" && NAME =~  "*genblk1[1]*" }] 3.75

set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*Data_200_90_reg*" && NAME =~  "*genblk1[0]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_syn_reg*" && NAME =~  "*genblk1[0]*" }] 3.75
set_max_delay -from [get_cells -hierarchical -filter { NAME =~  "*Data_200_90_reg*" && NAME =~  "*genblk1[1]*" }] -to [get_cells -hierarchical -filter { NAME =~  "*Data_200_syn_reg*" && NAME =~  "*genblk1[1]*" }] 3.75