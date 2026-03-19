// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Sep 30 15:55:42 2022
// Host        : LAPTOP-8T9G1ILJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/50653/Desktop/TDC_update/SiTCP_rfd/SRC/ip_core/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_sim_netlist.v
// Design      : gig_ethernet_pcs_pma_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DowngradeIPIdentifiedWarnings = "yes" *) (* EXAMPLE_SIMULATION = "0" *) 
(* NotValidForBitStream *)
module gig_ethernet_pcs_pma_0
   (gtrefclk,
    gtrefclk_bufg,
    txp,
    txn,
    rxp,
    rxn,
    resetdone,
    cplllock,
    mmcm_reset,
    txoutclk,
    rxoutclk,
    userclk,
    userclk2,
    rxuserclk,
    rxuserclk2,
    independent_clock_bufg,
    pma_reset,
    mmcm_locked,
    gmii_txd,
    gmii_tx_en,
    gmii_tx_er,
    gmii_rxd,
    gmii_rx_dv,
    gmii_rx_er,
    gmii_isolate,
    mdc,
    mdio_i,
    mdio_o,
    mdio_t,
    phyaddr,
    configuration_vector,
    configuration_valid,
    an_interrupt,
    an_adv_config_vector,
    an_adv_config_val,
    an_restart_config,
    status_vector,
    reset,
    signal_detect,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in);
  input gtrefclk;
  input gtrefclk_bufg;
  output txp;
  output txn;
  input rxp;
  input rxn;
  output resetdone;
  output cplllock;
  output mmcm_reset;
  output txoutclk;
  output rxoutclk;
  input userclk;
  input userclk2;
  input rxuserclk;
  input rxuserclk2;
  input independent_clock_bufg;
  input pma_reset;
  input mmcm_locked;
  input [7:0]gmii_txd;
  input gmii_tx_en;
  input gmii_tx_er;
  output [7:0]gmii_rxd;
  output gmii_rx_dv;
  output gmii_rx_er;
  output gmii_isolate;
  input mdc;
  input mdio_i;
  output mdio_o;
  output mdio_t;
  input [4:0]phyaddr;
  input [4:0]configuration_vector;
  input configuration_valid;
  output an_interrupt;
  input [15:0]an_adv_config_vector;
  input an_adv_config_val;
  input an_restart_config;
  output [15:0]status_vector;
  input reset;
  input signal_detect;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;

  wire \<const0> ;
  wire \<const1> ;
  wire an_adv_config_val;
  wire [15:0]an_adv_config_vector;
  wire an_interrupt;
  wire an_restart_config;
  wire configuration_valid;
  wire [4:0]configuration_vector;
  wire cplllock;
  wire gmii_isolate;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire independent_clock_bufg;
  wire mdc;
  wire mdio_i;
  wire mdio_o;
  wire mdio_t;
  wire mmcm_locked;
  wire mmcm_reset;
  wire [4:0]phyaddr;
  wire pma_reset;
  wire reset;
  wire resetdone;
  wire rxn;
  wire rxoutclk;
  wire rxp;
  wire signal_detect;
  wire [15:0]\^status_vector ;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire userclk2;
  wire [11:7]NLW_inst_status_vector_UNCONNECTED;

  assign status_vector[15:12] = \^status_vector [15:12];
  assign status_vector[11] = \<const1> ;
  assign status_vector[10] = \<const0> ;
  assign status_vector[9:8] = \^status_vector [9:8];
  assign status_vector[7] = \<const0> ;
  assign status_vector[6:0] = \^status_vector [6:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* EXAMPLE_SIMULATION = "0" *) 
  (* X_CORE_INFO = "gig_ethernet_pcs_pma_v16_2_8,Vivado 2022.1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  gig_ethernet_pcs_pma_0_block inst
       (.an_adv_config_val(an_adv_config_val),
        .an_adv_config_vector({an_adv_config_vector[15],1'b0,an_adv_config_vector[13:12],1'b0,1'b0,1'b0,an_adv_config_vector[8:7],1'b0,an_adv_config_vector[5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .an_interrupt(an_interrupt),
        .an_restart_config(an_restart_config),
        .configuration_valid(configuration_valid),
        .configuration_vector(configuration_vector),
        .cplllock(cplllock),
        .gmii_isolate(gmii_isolate),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_rxd(gmii_rxd),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),
        .gmii_txd(gmii_txd),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .independent_clock_bufg(independent_clock_bufg),
        .mdc(mdc),
        .mdio_i(mdio_i),
        .mdio_o(mdio_o),
        .mdio_t(mdio_t),
        .mmcm_locked(mmcm_locked),
        .mmcm_reset(mmcm_reset),
        .phyaddr(phyaddr),
        .pma_reset(pma_reset),
        .reset(reset),
        .resetdone(resetdone),
        .rxn(rxn),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .rxuserclk(1'b0),
        .rxuserclk2(1'b0),
        .signal_detect(signal_detect),
        .status_vector(\^status_vector ),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .userclk2(userclk2));
endmodule

module gig_ethernet_pcs_pma_0_GTWIZARD
   (cplllock,
    txn,
    txp,
    rxoutclk,
    txoutclk,
    D,
    TXBUFSTATUS,
    RXBUFSTATUS,
    gtxe2_i,
    gtxe2_i_0,
    gtxe2_i_1,
    gtxe2_i_2,
    gtxe2_i_3,
    mmcm_reset,
    data_in,
    rx_fsm_reset_done_int_reg,
    gtrefclk_bufg,
    independent_clock_bufg,
    gtrefclk,
    rxn,
    rxp,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in,
    reset_out,
    wtd_rxpcsreset_in,
    userclk,
    TXPD,
    RXPD,
    Q,
    gtxe2_i_4,
    gtxe2_i_5,
    gtxe2_i_6,
    pma_reset,
    gtxe2_i_7,
    gtxe2_i_8,
    mmcm_locked,
    data_out);
  output cplllock;
  output txn;
  output txp;
  output rxoutclk;
  output txoutclk;
  output [1:0]D;
  output [0:0]TXBUFSTATUS;
  output [0:0]RXBUFSTATUS;
  output [15:0]gtxe2_i;
  output [1:0]gtxe2_i_0;
  output [1:0]gtxe2_i_1;
  output [1:0]gtxe2_i_2;
  output [1:0]gtxe2_i_3;
  output mmcm_reset;
  output data_in;
  output rx_fsm_reset_done_int_reg;
  input gtrefclk_bufg;
  input independent_clock_bufg;
  input gtrefclk;
  input rxn;
  input rxp;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;
  input reset_out;
  input wtd_rxpcsreset_in;
  input userclk;
  input [0:0]TXPD;
  input [0:0]RXPD;
  input [15:0]Q;
  input [1:0]gtxe2_i_4;
  input [1:0]gtxe2_i_5;
  input [1:0]gtxe2_i_6;
  input pma_reset;
  input gtxe2_i_7;
  input gtxe2_i_8;
  input mmcm_locked;
  input data_out;

  wire [1:0]D;
  wire [15:0]Q;
  wire [0:0]RXBUFSTATUS;
  wire [0:0]RXPD;
  wire [0:0]TXBUFSTATUS;
  wire [0:0]TXPD;
  wire cplllock;
  wire data_in;
  wire data_out;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire [15:0]gtxe2_i;
  wire [1:0]gtxe2_i_0;
  wire [1:0]gtxe2_i_1;
  wire [1:0]gtxe2_i_2;
  wire [1:0]gtxe2_i_3;
  wire [1:0]gtxe2_i_4;
  wire [1:0]gtxe2_i_5;
  wire [1:0]gtxe2_i_6;
  wire gtxe2_i_7;
  wire gtxe2_i_8;
  wire independent_clock_bufg;
  wire mmcm_locked;
  wire mmcm_reset;
  wire pma_reset;
  wire reset_out;
  wire rx_fsm_reset_done_int_reg;
  wire rxn;
  wire rxoutclk;
  wire rxp;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire wtd_rxpcsreset_in;

  gig_ethernet_pcs_pma_0_GTWIZARD_init inst
       (.D(D),
        .Q(Q),
        .RXBUFSTATUS(RXBUFSTATUS),
        .RXPD(RXPD),
        .TXBUFSTATUS(TXBUFSTATUS),
        .TXPD(TXPD),
        .cplllock(cplllock),
        .data_in(data_in),
        .data_out(data_out),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .gtxe2_i(gtxe2_i),
        .gtxe2_i_0(gtxe2_i_0),
        .gtxe2_i_1(gtxe2_i_1),
        .gtxe2_i_2(gtxe2_i_2),
        .gtxe2_i_3(gtxe2_i_3),
        .gtxe2_i_4(gtxe2_i_4),
        .gtxe2_i_5(gtxe2_i_5),
        .gtxe2_i_6(gtxe2_i_6),
        .gtxe2_i_7(gtxe2_i_7),
        .gtxe2_i_8(gtxe2_i_8),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked),
        .mmcm_reset(mmcm_reset),
        .pma_reset(pma_reset),
        .reset_out(reset_out),
        .rx_fsm_reset_done_int_reg(rx_fsm_reset_done_int_reg),
        .rxn(rxn),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .wtd_rxpcsreset_in(wtd_rxpcsreset_in));
endmodule

module gig_ethernet_pcs_pma_0_GTWIZARD_GT
   (cplllock,
    gt0_cpllrefclklost_i,
    txn,
    txp,
    rxoutclk,
    gtxe2_i_0,
    txoutclk,
    gtxe2_i_1,
    D,
    TXBUFSTATUS,
    RXBUFSTATUS,
    gtxe2_i_2,
    gtxe2_i_3,
    gtxe2_i_4,
    gtxe2_i_5,
    gtxe2_i_6,
    independent_clock_bufg,
    gt0_cpllpd_i,
    gt0_cpllreset_i_0,
    gtrefclk_bufg,
    gtrefclk,
    SR,
    gt0_gttxreset_gt,
    rxn,
    rxp,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in,
    reset_out,
    wtd_rxpcsreset_in,
    gt0_rxuserrdy_i,
    userclk,
    TXPD,
    gt0_txuserrdy_i,
    RXPD,
    Q,
    gtxe2_i_7,
    gtxe2_i_8,
    gtxe2_i_9);
  output cplllock;
  output gt0_cpllrefclklost_i;
  output txn;
  output txp;
  output rxoutclk;
  output gtxe2_i_0;
  output txoutclk;
  output gtxe2_i_1;
  output [1:0]D;
  output [0:0]TXBUFSTATUS;
  output [0:0]RXBUFSTATUS;
  output [15:0]gtxe2_i_2;
  output [1:0]gtxe2_i_3;
  output [1:0]gtxe2_i_4;
  output [1:0]gtxe2_i_5;
  output [1:0]gtxe2_i_6;
  input independent_clock_bufg;
  input gt0_cpllpd_i;
  input gt0_cpllreset_i_0;
  input gtrefclk_bufg;
  input gtrefclk;
  input [0:0]SR;
  input gt0_gttxreset_gt;
  input rxn;
  input rxp;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;
  input reset_out;
  input wtd_rxpcsreset_in;
  input gt0_rxuserrdy_i;
  input userclk;
  input [0:0]TXPD;
  input gt0_txuserrdy_i;
  input [0:0]RXPD;
  input [15:0]Q;
  input [1:0]gtxe2_i_7;
  input [1:0]gtxe2_i_8;
  input [1:0]gtxe2_i_9;

  wire [1:0]D;
  wire [15:0]Q;
  wire [0:0]RXBUFSTATUS;
  wire [0:0]RXPD;
  wire [0:0]SR;
  wire [0:0]TXBUFSTATUS;
  wire [0:0]TXPD;
  wire cplllock;
  wire gt0_cpllpd_i;
  wire gt0_cpllrefclklost_i;
  wire gt0_cpllreset_i_0;
  wire gt0_gttxreset_gt;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gt0_rxuserrdy_i;
  wire gt0_txuserrdy_i;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire gtxe2_i_0;
  wire gtxe2_i_1;
  wire [15:0]gtxe2_i_2;
  wire [1:0]gtxe2_i_3;
  wire [1:0]gtxe2_i_4;
  wire [1:0]gtxe2_i_5;
  wire [1:0]gtxe2_i_6;
  wire [1:0]gtxe2_i_7;
  wire [1:0]gtxe2_i_8;
  wire [1:0]gtxe2_i_9;
  wire gtxe2_i_n_0;
  wire gtxe2_i_n_10;
  wire gtxe2_i_n_16;
  wire gtxe2_i_n_170;
  wire gtxe2_i_n_171;
  wire gtxe2_i_n_172;
  wire gtxe2_i_n_173;
  wire gtxe2_i_n_174;
  wire gtxe2_i_n_175;
  wire gtxe2_i_n_176;
  wire gtxe2_i_n_177;
  wire gtxe2_i_n_178;
  wire gtxe2_i_n_179;
  wire gtxe2_i_n_180;
  wire gtxe2_i_n_181;
  wire gtxe2_i_n_182;
  wire gtxe2_i_n_183;
  wire gtxe2_i_n_184;
  wire gtxe2_i_n_27;
  wire gtxe2_i_n_3;
  wire gtxe2_i_n_38;
  wire gtxe2_i_n_39;
  wire gtxe2_i_n_4;
  wire gtxe2_i_n_46;
  wire gtxe2_i_n_47;
  wire gtxe2_i_n_48;
  wire gtxe2_i_n_49;
  wire gtxe2_i_n_50;
  wire gtxe2_i_n_51;
  wire gtxe2_i_n_52;
  wire gtxe2_i_n_53;
  wire gtxe2_i_n_54;
  wire gtxe2_i_n_55;
  wire gtxe2_i_n_56;
  wire gtxe2_i_n_57;
  wire gtxe2_i_n_58;
  wire gtxe2_i_n_59;
  wire gtxe2_i_n_60;
  wire gtxe2_i_n_61;
  wire gtxe2_i_n_81;
  wire gtxe2_i_n_83;
  wire gtxe2_i_n_84;
  wire gtxe2_i_n_9;
  wire independent_clock_bufg;
  wire reset_out;
  wire rxn;
  wire rxoutclk;
  wire rxp;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire wtd_rxpcsreset_in;
  wire NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED;
  wire NLW_gtxe2_i_PHYSTATUS_UNCONNECTED;
  wire NLW_gtxe2_i_RXCDRLOCK_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED;
  wire NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED;
  wire NLW_gtxe2_i_RXDATAVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXELECIDLE_UNCONNECTED;
  wire NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED;
  wire NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED;
  wire NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_RXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_RXRATEDONE_UNCONNECTED;
  wire NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED;
  wire NLW_gtxe2_i_RXVALID_UNCONNECTED;
  wire NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED;
  wire NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENN_UNCONNECTED;
  wire NLW_gtxe2_i_TXQPISENP_UNCONNECTED;
  wire NLW_gtxe2_i_TXRATEDONE_UNCONNECTED;
  wire [15:0]NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXCHARISK_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXCHBONDO_UNCONNECTED;
  wire [63:16]NLW_gtxe2_i_RXDATA_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXDISPERR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXHEADER_UNCONNECTED;
  wire [7:2]NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED;
  wire [4:0]NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED;
  wire [2:0]NLW_gtxe2_i_RXSTATUS_UNCONNECTED;
  wire [9:0]NLW_gtxe2_i_TSTOUT_UNCONNECTED;

  (* box_type = "PRIMITIVE" *) 
  GTXE2_CHANNEL #(
    .ALIGN_COMMA_DOUBLE("FALSE"),
    .ALIGN_COMMA_ENABLE(10'b0001111111),
    .ALIGN_COMMA_WORD(2),
    .ALIGN_MCOMMA_DET("TRUE"),
    .ALIGN_MCOMMA_VALUE(10'b1010000011),
    .ALIGN_PCOMMA_DET("TRUE"),
    .ALIGN_PCOMMA_VALUE(10'b0101111100),
    .CBCC_DATA_SOURCE_SEL("DECODED"),
    .CHAN_BOND_KEEP_ALIGN("FALSE"),
    .CHAN_BOND_MAX_SKEW(1),
    .CHAN_BOND_SEQ_1_1(10'b0000000000),
    .CHAN_BOND_SEQ_1_2(10'b0000000000),
    .CHAN_BOND_SEQ_1_3(10'b0000000000),
    .CHAN_BOND_SEQ_1_4(10'b0000000000),
    .CHAN_BOND_SEQ_1_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_1(10'b0000000000),
    .CHAN_BOND_SEQ_2_2(10'b0000000000),
    .CHAN_BOND_SEQ_2_3(10'b0000000000),
    .CHAN_BOND_SEQ_2_4(10'b0000000000),
    .CHAN_BOND_SEQ_2_ENABLE(4'b1111),
    .CHAN_BOND_SEQ_2_USE("FALSE"),
    .CHAN_BOND_SEQ_LEN(1),
    .CLK_CORRECT_USE("TRUE"),
    .CLK_COR_KEEP_IDLE("FALSE"),
    .CLK_COR_MAX_LAT(36),
    .CLK_COR_MIN_LAT(33),
    .CLK_COR_PRECEDENCE("TRUE"),
    .CLK_COR_REPEAT_WAIT(0),
    .CLK_COR_SEQ_1_1(10'b0110111100),
    .CLK_COR_SEQ_1_2(10'b0001010000),
    .CLK_COR_SEQ_1_3(10'b0000000000),
    .CLK_COR_SEQ_1_4(10'b0000000000),
    .CLK_COR_SEQ_1_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_1(10'b0110111100),
    .CLK_COR_SEQ_2_2(10'b0010110101),
    .CLK_COR_SEQ_2_3(10'b0000000000),
    .CLK_COR_SEQ_2_4(10'b0000000000),
    .CLK_COR_SEQ_2_ENABLE(4'b1111),
    .CLK_COR_SEQ_2_USE("TRUE"),
    .CLK_COR_SEQ_LEN(2),
    .CPLL_CFG(24'hBC07DC),
    .CPLL_FBDIV(4),
    .CPLL_FBDIV_45(5),
    .CPLL_INIT_CFG(24'h00001E),
    .CPLL_LOCK_CFG(16'h01E8),
    .CPLL_REFCLK_DIV(1),
    .DEC_MCOMMA_DETECT("TRUE"),
    .DEC_PCOMMA_DETECT("TRUE"),
    .DEC_VALID_COMMA_ONLY("FALSE"),
    .DMONITOR_CFG(24'h000A00),
    .ES_CONTROL(6'b000000),
    .ES_ERRDET_EN("FALSE"),
    .ES_EYE_SCAN_EN("TRUE"),
    .ES_HORZ_OFFSET(12'h000),
    .ES_PMA_CFG(10'b0000000000),
    .ES_PRESCALE(5'b00000),
    .ES_QUALIFIER(80'h00000000000000000000),
    .ES_QUAL_MASK(80'h00000000000000000000),
    .ES_SDATA_MASK(80'h00000000000000000000),
    .ES_VERT_OFFSET(9'b000000000),
    .FTS_DESKEW_SEQ_ENABLE(4'b1111),
    .FTS_LANE_DESKEW_CFG(4'b1111),
    .FTS_LANE_DESKEW_EN("FALSE"),
    .GEARBOX_MODE(3'b000),
    .IS_CPLLLOCKDETCLK_INVERTED(1'b0),
    .IS_DRPCLK_INVERTED(1'b0),
    .IS_GTGREFCLK_INVERTED(1'b0),
    .IS_RXUSRCLK2_INVERTED(1'b0),
    .IS_RXUSRCLK_INVERTED(1'b0),
    .IS_TXPHDLYTSTCLK_INVERTED(1'b0),
    .IS_TXUSRCLK2_INVERTED(1'b0),
    .IS_TXUSRCLK_INVERTED(1'b0),
    .OUTREFCLK_SEL_INV(2'b11),
    .PCS_PCIE_EN("FALSE"),
    .PCS_RSVD_ATTR(48'h000000000000),
    .PD_TRANS_TIME_FROM_P2(12'h03C),
    .PD_TRANS_TIME_NONE_P2(8'h19),
    .PD_TRANS_TIME_TO_P2(8'h64),
    .PMA_RSV(32'h00018480),
    .PMA_RSV2(16'h2050),
    .PMA_RSV3(2'b00),
    .PMA_RSV4(32'h00000000),
    .RXBUFRESET_TIME(5'b00001),
    .RXBUF_ADDR_MODE("FULL"),
    .RXBUF_EIDLE_HI_CNT(4'b1000),
    .RXBUF_EIDLE_LO_CNT(4'b0000),
    .RXBUF_EN("TRUE"),
    .RXBUF_RESET_ON_CB_CHANGE("TRUE"),
    .RXBUF_RESET_ON_COMMAALIGN("FALSE"),
    .RXBUF_RESET_ON_EIDLE("FALSE"),
    .RXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .RXBUF_THRESH_OVFLW(61),
    .RXBUF_THRESH_OVRD("FALSE"),
    .RXBUF_THRESH_UNDFLW(8),
    .RXCDRFREQRESET_TIME(5'b00001),
    .RXCDRPHRESET_TIME(5'b00001),
    .RXCDR_CFG(72'h03000023FF10100020),
    .RXCDR_FR_RESET_ON_EIDLE(1'b0),
    .RXCDR_HOLD_DURING_EIDLE(1'b0),
    .RXCDR_LOCK_CFG(6'b010101),
    .RXCDR_PH_RESET_ON_EIDLE(1'b0),
    .RXDFELPMRESET_TIME(7'b0001111),
    .RXDLY_CFG(16'h001F),
    .RXDLY_LCFG(9'h030),
    .RXDLY_TAP_CFG(16'h0000),
    .RXGEARBOX_EN("FALSE"),
    .RXISCANRESET_TIME(5'b00001),
    .RXLPM_HF_CFG(14'b00000011110000),
    .RXLPM_LF_CFG(14'b00000011110000),
    .RXOOB_CFG(7'b0000110),
    .RXOUT_DIV(4),
    .RXPCSRESET_TIME(5'b00001),
    .RXPHDLY_CFG(24'h084020),
    .RXPH_CFG(24'h000000),
    .RXPH_MONITOR_SEL(5'b00000),
    .RXPMARESET_TIME(5'b00011),
    .RXPRBS_ERR_LOOPBACK(1'b0),
    .RXSLIDE_AUTO_WAIT(7),
    .RXSLIDE_MODE("OFF"),
    .RX_BIAS_CFG(12'b000000000100),
    .RX_BUFFER_CFG(6'b000000),
    .RX_CLK25_DIV(5),
    .RX_CLKMUX_PD(1'b1),
    .RX_CM_SEL(2'b11),
    .RX_CM_TRIM(3'b010),
    .RX_DATA_WIDTH(20),
    .RX_DDI_SEL(6'b000000),
    .RX_DEBUG_CFG(12'b000000000000),
    .RX_DEFER_RESET_BUF_EN("TRUE"),
    .RX_DFE_GAIN_CFG(23'h020FEA),
    .RX_DFE_H2_CFG(12'b000000000000),
    .RX_DFE_H3_CFG(12'b000001000000),
    .RX_DFE_H4_CFG(11'b00011110000),
    .RX_DFE_H5_CFG(11'b00011100000),
    .RX_DFE_KL_CFG(13'b0000011111110),
    .RX_DFE_KL_CFG2(32'h301148AC),
    .RX_DFE_LPM_CFG(16'h0904),
    .RX_DFE_LPM_HOLD_DURING_EIDLE(1'b0),
    .RX_DFE_UT_CFG(17'b10001111000000000),
    .RX_DFE_VP_CFG(17'b00011111100000011),
    .RX_DFE_XYD_CFG(13'b0000000000000),
    .RX_DISPERR_SEQ_MATCH("TRUE"),
    .RX_INT_DATAWIDTH(0),
    .RX_OS_CFG(13'b0000010000000),
    .RX_SIG_VALID_DLY(10),
    .RX_XCLK_SEL("RXREC"),
    .SAS_MAX_COM(64),
    .SAS_MIN_COM(36),
    .SATA_BURST_SEQ_LEN(4'b0101),
    .SATA_BURST_VAL(3'b100),
    .SATA_CPLL_CFG("VCO_3000MHZ"),
    .SATA_EIDLE_VAL(3'b100),
    .SATA_MAX_BURST(8),
    .SATA_MAX_INIT(21),
    .SATA_MAX_WAKE(7),
    .SATA_MIN_BURST(4),
    .SATA_MIN_INIT(12),
    .SATA_MIN_WAKE(4),
    .SHOW_REALIGN_COMMA("TRUE"),
    .SIM_CPLLREFCLK_SEL(3'b001),
    .SIM_RECEIVER_DETECT_PASS("TRUE"),
    .SIM_RESET_SPEEDUP("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL("X"),
    .SIM_VERSION("4.0"),
    .TERM_RCAL_CFG(5'b10000),
    .TERM_RCAL_OVRD(1'b0),
    .TRANS_TIME_RATE(8'h0E),
    .TST_RSV(32'h00000000),
    .TXBUF_EN("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE("TRUE"),
    .TXDLY_CFG(16'h001F),
    .TXDLY_LCFG(9'h030),
    .TXDLY_TAP_CFG(16'h0000),
    .TXGEARBOX_EN("FALSE"),
    .TXOUT_DIV(4),
    .TXPCSRESET_TIME(5'b00001),
    .TXPHDLY_CFG(24'h084020),
    .TXPH_CFG(16'h0780),
    .TXPH_MONITOR_SEL(5'b00000),
    .TXPMARESET_TIME(5'b00001),
    .TX_CLK25_DIV(5),
    .TX_CLKMUX_PD(1'b1),
    .TX_DATA_WIDTH(20),
    .TX_DEEMPH0(5'b00000),
    .TX_DEEMPH1(5'b00000),
    .TX_DRIVE_MODE("DIRECT"),
    .TX_EIDLE_ASSERT_DELAY(3'b110),
    .TX_EIDLE_DEASSERT_DELAY(3'b100),
    .TX_INT_DATAWIDTH(0),
    .TX_LOOPBACK_DRIVE_HIZ("FALSE"),
    .TX_MAINCURSOR_SEL(1'b0),
    .TX_MARGIN_FULL_0(7'b1001110),
    .TX_MARGIN_FULL_1(7'b1001001),
    .TX_MARGIN_FULL_2(7'b1000101),
    .TX_MARGIN_FULL_3(7'b1000010),
    .TX_MARGIN_FULL_4(7'b1000000),
    .TX_MARGIN_LOW_0(7'b1000110),
    .TX_MARGIN_LOW_1(7'b1000100),
    .TX_MARGIN_LOW_2(7'b1000010),
    .TX_MARGIN_LOW_3(7'b1000000),
    .TX_MARGIN_LOW_4(7'b1000000),
    .TX_PREDRIVER_MODE(1'b0),
    .TX_QPI_STATUS_EN(1'b0),
    .TX_RXDETECT_CFG(14'h1832),
    .TX_RXDETECT_REF(3'b100),
    .TX_XCLK_SEL("TXOUT"),
    .UCODEER_CLR(1'b0)) 
    gtxe2_i
       (.CFGRESET(1'b0),
        .CLKRSVD({1'b0,1'b0,1'b0,1'b0}),
        .CPLLFBCLKLOST(gtxe2_i_n_0),
        .CPLLLOCK(cplllock),
        .CPLLLOCKDETCLK(independent_clock_bufg),
        .CPLLLOCKEN(1'b1),
        .CPLLPD(gt0_cpllpd_i),
        .CPLLREFCLKLOST(gt0_cpllrefclklost_i),
        .CPLLREFCLKSEL({1'b0,1'b0,1'b1}),
        .CPLLRESET(gt0_cpllreset_i_0),
        .DMONITOROUT({gtxe2_i_n_177,gtxe2_i_n_178,gtxe2_i_n_179,gtxe2_i_n_180,gtxe2_i_n_181,gtxe2_i_n_182,gtxe2_i_n_183,gtxe2_i_n_184}),
        .DRPADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DRPCLK(gtrefclk_bufg),
        .DRPDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DRPDO({gtxe2_i_n_46,gtxe2_i_n_47,gtxe2_i_n_48,gtxe2_i_n_49,gtxe2_i_n_50,gtxe2_i_n_51,gtxe2_i_n_52,gtxe2_i_n_53,gtxe2_i_n_54,gtxe2_i_n_55,gtxe2_i_n_56,gtxe2_i_n_57,gtxe2_i_n_58,gtxe2_i_n_59,gtxe2_i_n_60,gtxe2_i_n_61}),
        .DRPEN(1'b0),
        .DRPRDY(gtxe2_i_n_3),
        .DRPWE(1'b0),
        .EYESCANDATAERROR(gtxe2_i_n_4),
        .EYESCANMODE(1'b0),
        .EYESCANRESET(1'b0),
        .EYESCANTRIGGER(1'b0),
        .GTGREFCLK(1'b0),
        .GTNORTHREFCLK0(1'b0),
        .GTNORTHREFCLK1(1'b0),
        .GTREFCLK0(gtrefclk),
        .GTREFCLK1(1'b0),
        .GTREFCLKMONITOR(NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED),
        .GTRESETSEL(1'b0),
        .GTRSVD({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GTRXRESET(SR),
        .GTSOUTHREFCLK0(1'b0),
        .GTSOUTHREFCLK1(1'b0),
        .GTTXRESET(gt0_gttxreset_gt),
        .GTXRXN(rxn),
        .GTXRXP(rxp),
        .GTXTXN(txn),
        .GTXTXP(txp),
        .LOOPBACK({1'b0,1'b0,1'b0}),
        .PCSRSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCSRSVDOUT(NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED[15:0]),
        .PHYSTATUS(NLW_gtxe2_i_PHYSTATUS_UNCONNECTED),
        .PMARSVDIN({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PMARSVDIN2({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .QPLLCLK(gt0_qplloutclk_in),
        .QPLLREFCLK(gt0_qplloutrefclk_in),
        .RESETOVRD(1'b0),
        .RX8B10BEN(1'b1),
        .RXBUFRESET(1'b0),
        .RXBUFSTATUS({RXBUFSTATUS,gtxe2_i_n_83,gtxe2_i_n_84}),
        .RXBYTEISALIGNED(gtxe2_i_n_9),
        .RXBYTEREALIGN(gtxe2_i_n_10),
        .RXCDRFREQRESET(1'b0),
        .RXCDRHOLD(1'b0),
        .RXCDRLOCK(NLW_gtxe2_i_RXCDRLOCK_UNCONNECTED),
        .RXCDROVRDEN(1'b0),
        .RXCDRRESET(1'b0),
        .RXCDRRESETRSV(1'b0),
        .RXCHANBONDSEQ(NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED),
        .RXCHANISALIGNED(NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED),
        .RXCHANREALIGN(NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED),
        .RXCHARISCOMMA({NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED[7:2],gtxe2_i_3}),
        .RXCHARISK({NLW_gtxe2_i_RXCHARISK_UNCONNECTED[7:2],gtxe2_i_4}),
        .RXCHBONDEN(1'b0),
        .RXCHBONDI({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RXCHBONDLEVEL({1'b0,1'b0,1'b0}),
        .RXCHBONDMASTER(1'b0),
        .RXCHBONDO(NLW_gtxe2_i_RXCHBONDO_UNCONNECTED[4:0]),
        .RXCHBONDSLAVE(1'b0),
        .RXCLKCORCNT(D),
        .RXCOMINITDET(NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED),
        .RXCOMMADET(gtxe2_i_n_16),
        .RXCOMMADETEN(1'b1),
        .RXCOMSASDET(NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED),
        .RXCOMWAKEDET(NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED),
        .RXDATA({NLW_gtxe2_i_RXDATA_UNCONNECTED[63:16],gtxe2_i_2}),
        .RXDATAVALID(NLW_gtxe2_i_RXDATAVALID_UNCONNECTED),
        .RXDDIEN(1'b0),
        .RXDFEAGCHOLD(1'b0),
        .RXDFEAGCOVRDEN(1'b0),
        .RXDFECM1EN(1'b0),
        .RXDFELFHOLD(1'b0),
        .RXDFELFOVRDEN(1'b0),
        .RXDFELPMRESET(1'b0),
        .RXDFETAP2HOLD(1'b0),
        .RXDFETAP2OVRDEN(1'b0),
        .RXDFETAP3HOLD(1'b0),
        .RXDFETAP3OVRDEN(1'b0),
        .RXDFETAP4HOLD(1'b0),
        .RXDFETAP4OVRDEN(1'b0),
        .RXDFETAP5HOLD(1'b0),
        .RXDFETAP5OVRDEN(1'b0),
        .RXDFEUTHOLD(1'b0),
        .RXDFEUTOVRDEN(1'b0),
        .RXDFEVPHOLD(1'b0),
        .RXDFEVPOVRDEN(1'b0),
        .RXDFEVSEN(1'b0),
        .RXDFEXYDEN(1'b1),
        .RXDFEXYDHOLD(1'b0),
        .RXDFEXYDOVRDEN(1'b0),
        .RXDISPERR({NLW_gtxe2_i_RXDISPERR_UNCONNECTED[7:2],gtxe2_i_5}),
        .RXDLYBYPASS(1'b1),
        .RXDLYEN(1'b0),
        .RXDLYOVRDEN(1'b0),
        .RXDLYSRESET(1'b0),
        .RXDLYSRESETDONE(NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED),
        .RXELECIDLE(NLW_gtxe2_i_RXELECIDLE_UNCONNECTED),
        .RXELECIDLEMODE({1'b1,1'b1}),
        .RXGEARBOXSLIP(1'b0),
        .RXHEADER(NLW_gtxe2_i_RXHEADER_UNCONNECTED[2:0]),
        .RXHEADERVALID(NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED),
        .RXLPMEN(1'b1),
        .RXLPMHFHOLD(1'b0),
        .RXLPMHFOVRDEN(1'b0),
        .RXLPMLFHOLD(1'b0),
        .RXLPMLFKLOVRDEN(1'b0),
        .RXMCOMMAALIGNEN(reset_out),
        .RXMONITOROUT({gtxe2_i_n_170,gtxe2_i_n_171,gtxe2_i_n_172,gtxe2_i_n_173,gtxe2_i_n_174,gtxe2_i_n_175,gtxe2_i_n_176}),
        .RXMONITORSEL({1'b0,1'b0}),
        .RXNOTINTABLE({NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED[7:2],gtxe2_i_6}),
        .RXOOBRESET(1'b0),
        .RXOSHOLD(1'b0),
        .RXOSOVRDEN(1'b0),
        .RXOUTCLK(rxoutclk),
        .RXOUTCLKFABRIC(NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED),
        .RXOUTCLKPCS(NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED),
        .RXOUTCLKSEL({1'b0,1'b1,1'b0}),
        .RXPCOMMAALIGNEN(reset_out),
        .RXPCSRESET(wtd_rxpcsreset_in),
        .RXPD({RXPD,RXPD}),
        .RXPHALIGN(1'b0),
        .RXPHALIGNDONE(NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED),
        .RXPHALIGNEN(1'b0),
        .RXPHDLYPD(1'b0),
        .RXPHDLYRESET(1'b0),
        .RXPHMONITOR(NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED[4:0]),
        .RXPHOVRDEN(1'b0),
        .RXPHSLIPMONITOR(NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED[4:0]),
        .RXPMARESET(1'b0),
        .RXPOLARITY(1'b0),
        .RXPRBSCNTRESET(1'b0),
        .RXPRBSERR(gtxe2_i_n_27),
        .RXPRBSSEL({1'b0,1'b0,1'b0}),
        .RXQPIEN(1'b0),
        .RXQPISENN(NLW_gtxe2_i_RXQPISENN_UNCONNECTED),
        .RXQPISENP(NLW_gtxe2_i_RXQPISENP_UNCONNECTED),
        .RXRATE({1'b0,1'b0,1'b0}),
        .RXRATEDONE(NLW_gtxe2_i_RXRATEDONE_UNCONNECTED),
        .RXRESETDONE(gtxe2_i_0),
        .RXSLIDE(1'b0),
        .RXSTARTOFSEQ(NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED),
        .RXSTATUS(NLW_gtxe2_i_RXSTATUS_UNCONNECTED[2:0]),
        .RXSYSCLKSEL({1'b0,1'b0}),
        .RXUSERRDY(gt0_rxuserrdy_i),
        .RXUSRCLK(userclk),
        .RXUSRCLK2(userclk),
        .RXVALID(NLW_gtxe2_i_RXVALID_UNCONNECTED),
        .SETERRSTATUS(1'b0),
        .TSTIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .TSTOUT(NLW_gtxe2_i_TSTOUT_UNCONNECTED[9:0]),
        .TX8B10BBYPASS({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TX8B10BEN(1'b1),
        .TXBUFDIFFCTRL({1'b1,1'b0,1'b0}),
        .TXBUFSTATUS({TXBUFSTATUS,gtxe2_i_n_81}),
        .TXCHARDISPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gtxe2_i_7}),
        .TXCHARDISPVAL({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gtxe2_i_8}),
        .TXCHARISK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gtxe2_i_9}),
        .TXCOMFINISH(NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED),
        .TXCOMINIT(1'b0),
        .TXCOMSAS(1'b0),
        .TXCOMWAKE(1'b0),
        .TXDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,Q}),
        .TXDEEMPH(1'b0),
        .TXDETECTRX(1'b0),
        .TXDIFFCTRL({1'b1,1'b0,1'b0,1'b0}),
        .TXDIFFPD(1'b0),
        .TXDLYBYPASS(1'b1),
        .TXDLYEN(1'b0),
        .TXDLYHOLD(1'b0),
        .TXDLYOVRDEN(1'b0),
        .TXDLYSRESET(1'b0),
        .TXDLYSRESETDONE(NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED),
        .TXDLYUPDOWN(1'b0),
        .TXELECIDLE(TXPD),
        .TXGEARBOXREADY(NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED),
        .TXHEADER({1'b0,1'b0,1'b0}),
        .TXINHIBIT(1'b0),
        .TXMAINCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXMARGIN({1'b0,1'b0,1'b0}),
        .TXOUTCLK(txoutclk),
        .TXOUTCLKFABRIC(gtxe2_i_n_38),
        .TXOUTCLKPCS(gtxe2_i_n_39),
        .TXOUTCLKSEL({1'b1,1'b0,1'b0}),
        .TXPCSRESET(1'b0),
        .TXPD({TXPD,TXPD}),
        .TXPDELECIDLEMODE(1'b0),
        .TXPHALIGN(1'b0),
        .TXPHALIGNDONE(NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED),
        .TXPHALIGNEN(1'b0),
        .TXPHDLYPD(1'b0),
        .TXPHDLYRESET(1'b0),
        .TXPHDLYTSTCLK(1'b0),
        .TXPHINIT(1'b0),
        .TXPHINITDONE(NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED),
        .TXPHOVRDEN(1'b0),
        .TXPISOPD(1'b0),
        .TXPMARESET(1'b0),
        .TXPOLARITY(1'b0),
        .TXPOSTCURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPOSTCURSORINV(1'b0),
        .TXPRBSFORCEERR(1'b0),
        .TXPRBSSEL({1'b0,1'b0,1'b0}),
        .TXPRECURSOR({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXPRECURSORINV(1'b0),
        .TXQPIBIASEN(1'b0),
        .TXQPISENN(NLW_gtxe2_i_TXQPISENN_UNCONNECTED),
        .TXQPISENP(NLW_gtxe2_i_TXQPISENP_UNCONNECTED),
        .TXQPISTRONGPDOWN(1'b0),
        .TXQPIWEAKPUP(1'b0),
        .TXRATE({1'b0,1'b0,1'b0}),
        .TXRATEDONE(NLW_gtxe2_i_TXRATEDONE_UNCONNECTED),
        .TXRESETDONE(gtxe2_i_1),
        .TXSEQUENCE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .TXSTARTSEQ(1'b0),
        .TXSWING(1'b0),
        .TXSYSCLKSEL({1'b0,1'b0}),
        .TXUSERRDY(gt0_txuserrdy_i),
        .TXUSRCLK(userclk),
        .TXUSRCLK2(userclk));
endmodule

module gig_ethernet_pcs_pma_0_GTWIZARD_init
   (cplllock,
    txn,
    txp,
    rxoutclk,
    txoutclk,
    D,
    TXBUFSTATUS,
    RXBUFSTATUS,
    gtxe2_i,
    gtxe2_i_0,
    gtxe2_i_1,
    gtxe2_i_2,
    gtxe2_i_3,
    mmcm_reset,
    data_in,
    rx_fsm_reset_done_int_reg,
    gtrefclk_bufg,
    independent_clock_bufg,
    gtrefclk,
    rxn,
    rxp,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in,
    reset_out,
    wtd_rxpcsreset_in,
    userclk,
    TXPD,
    RXPD,
    Q,
    gtxe2_i_4,
    gtxe2_i_5,
    gtxe2_i_6,
    pma_reset,
    gtxe2_i_7,
    gtxe2_i_8,
    mmcm_locked,
    data_out);
  output cplllock;
  output txn;
  output txp;
  output rxoutclk;
  output txoutclk;
  output [1:0]D;
  output [0:0]TXBUFSTATUS;
  output [0:0]RXBUFSTATUS;
  output [15:0]gtxe2_i;
  output [1:0]gtxe2_i_0;
  output [1:0]gtxe2_i_1;
  output [1:0]gtxe2_i_2;
  output [1:0]gtxe2_i_3;
  output mmcm_reset;
  output data_in;
  output rx_fsm_reset_done_int_reg;
  input gtrefclk_bufg;
  input independent_clock_bufg;
  input gtrefclk;
  input rxn;
  input rxp;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;
  input reset_out;
  input wtd_rxpcsreset_in;
  input userclk;
  input [0:0]TXPD;
  input [0:0]RXPD;
  input [15:0]Q;
  input [1:0]gtxe2_i_4;
  input [1:0]gtxe2_i_5;
  input [1:0]gtxe2_i_6;
  input pma_reset;
  input gtxe2_i_7;
  input gtxe2_i_8;
  input mmcm_locked;
  input data_out;

  wire [1:0]D;
  wire [15:0]Q;
  wire [0:0]RXBUFSTATUS;
  wire [0:0]RXPD;
  wire [0:0]TXBUFSTATUS;
  wire [0:0]TXPD;
  wire cplllock;
  wire [31:1]data0;
  wire data_in;
  wire data_out;
  wire gt0_cpllrefclklost_i;
  wire gt0_cpllreset_i;
  wire gt0_gtrxreset_gt;
  wire gt0_gttxreset_gt;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire [31:0]gt0_rx_cdrlock_counter;
  wire gt0_rx_cdrlock_counter0_carry__0_n_0;
  wire gt0_rx_cdrlock_counter0_carry__0_n_1;
  wire gt0_rx_cdrlock_counter0_carry__0_n_2;
  wire gt0_rx_cdrlock_counter0_carry__0_n_3;
  wire gt0_rx_cdrlock_counter0_carry__1_n_0;
  wire gt0_rx_cdrlock_counter0_carry__1_n_1;
  wire gt0_rx_cdrlock_counter0_carry__1_n_2;
  wire gt0_rx_cdrlock_counter0_carry__1_n_3;
  wire gt0_rx_cdrlock_counter0_carry__2_n_0;
  wire gt0_rx_cdrlock_counter0_carry__2_n_1;
  wire gt0_rx_cdrlock_counter0_carry__2_n_2;
  wire gt0_rx_cdrlock_counter0_carry__2_n_3;
  wire gt0_rx_cdrlock_counter0_carry__3_n_0;
  wire gt0_rx_cdrlock_counter0_carry__3_n_1;
  wire gt0_rx_cdrlock_counter0_carry__3_n_2;
  wire gt0_rx_cdrlock_counter0_carry__3_n_3;
  wire gt0_rx_cdrlock_counter0_carry__4_n_0;
  wire gt0_rx_cdrlock_counter0_carry__4_n_1;
  wire gt0_rx_cdrlock_counter0_carry__4_n_2;
  wire gt0_rx_cdrlock_counter0_carry__4_n_3;
  wire gt0_rx_cdrlock_counter0_carry__5_n_0;
  wire gt0_rx_cdrlock_counter0_carry__5_n_1;
  wire gt0_rx_cdrlock_counter0_carry__5_n_2;
  wire gt0_rx_cdrlock_counter0_carry__5_n_3;
  wire gt0_rx_cdrlock_counter0_carry__6_n_2;
  wire gt0_rx_cdrlock_counter0_carry__6_n_3;
  wire gt0_rx_cdrlock_counter0_carry_n_0;
  wire gt0_rx_cdrlock_counter0_carry_n_1;
  wire gt0_rx_cdrlock_counter0_carry_n_2;
  wire gt0_rx_cdrlock_counter0_carry_n_3;
  wire \gt0_rx_cdrlock_counter[31]_i_2_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_3_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_4_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_5_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_6_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_7_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_8_n_0 ;
  wire \gt0_rx_cdrlock_counter[31]_i_9_n_0 ;
  wire [31:0]gt0_rx_cdrlock_counter_0;
  wire gt0_rx_cdrlocked_i_1_n_0;
  wire gt0_rx_cdrlocked_reg_n_0;
  wire gt0_rxuserrdy_i;
  wire gt0_txuserrdy_i;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire gtwizard_i_n_5;
  wire gtwizard_i_n_7;
  wire [15:0]gtxe2_i;
  wire [1:0]gtxe2_i_0;
  wire [1:0]gtxe2_i_1;
  wire [1:0]gtxe2_i_2;
  wire [1:0]gtxe2_i_3;
  wire [1:0]gtxe2_i_4;
  wire [1:0]gtxe2_i_5;
  wire [1:0]gtxe2_i_6;
  wire gtxe2_i_7;
  wire gtxe2_i_8;
  wire independent_clock_bufg;
  wire mmcm_locked;
  wire mmcm_reset;
  wire pma_reset;
  wire reset_out;
  wire rx_fsm_reset_done_int_reg;
  wire rxn;
  wire rxoutclk;
  wire rxp;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire wtd_rxpcsreset_in;
  wire [3:2]NLW_gt0_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_gt0_rx_cdrlock_counter0_carry__6_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry
       (.CI(1'b0),
        .CO({gt0_rx_cdrlock_counter0_carry_n_0,gt0_rx_cdrlock_counter0_carry_n_1,gt0_rx_cdrlock_counter0_carry_n_2,gt0_rx_cdrlock_counter0_carry_n_3}),
        .CYINIT(gt0_rx_cdrlock_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(gt0_rx_cdrlock_counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__0
       (.CI(gt0_rx_cdrlock_counter0_carry_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__0_n_0,gt0_rx_cdrlock_counter0_carry__0_n_1,gt0_rx_cdrlock_counter0_carry__0_n_2,gt0_rx_cdrlock_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(gt0_rx_cdrlock_counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__1
       (.CI(gt0_rx_cdrlock_counter0_carry__0_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__1_n_0,gt0_rx_cdrlock_counter0_carry__1_n_1,gt0_rx_cdrlock_counter0_carry__1_n_2,gt0_rx_cdrlock_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(gt0_rx_cdrlock_counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__2
       (.CI(gt0_rx_cdrlock_counter0_carry__1_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__2_n_0,gt0_rx_cdrlock_counter0_carry__2_n_1,gt0_rx_cdrlock_counter0_carry__2_n_2,gt0_rx_cdrlock_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(gt0_rx_cdrlock_counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__3
       (.CI(gt0_rx_cdrlock_counter0_carry__2_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__3_n_0,gt0_rx_cdrlock_counter0_carry__3_n_1,gt0_rx_cdrlock_counter0_carry__3_n_2,gt0_rx_cdrlock_counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(gt0_rx_cdrlock_counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__4
       (.CI(gt0_rx_cdrlock_counter0_carry__3_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__4_n_0,gt0_rx_cdrlock_counter0_carry__4_n_1,gt0_rx_cdrlock_counter0_carry__4_n_2,gt0_rx_cdrlock_counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(gt0_rx_cdrlock_counter[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__5
       (.CI(gt0_rx_cdrlock_counter0_carry__4_n_0),
        .CO({gt0_rx_cdrlock_counter0_carry__5_n_0,gt0_rx_cdrlock_counter0_carry__5_n_1,gt0_rx_cdrlock_counter0_carry__5_n_2,gt0_rx_cdrlock_counter0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(gt0_rx_cdrlock_counter[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 gt0_rx_cdrlock_counter0_carry__6
       (.CI(gt0_rx_cdrlock_counter0_carry__5_n_0),
        .CO({NLW_gt0_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED[3:2],gt0_rx_cdrlock_counter0_carry__6_n_2,gt0_rx_cdrlock_counter0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_gt0_rx_cdrlock_counter0_carry__6_O_UNCONNECTED[3],data0[31:29]}),
        .S({1'b0,gt0_rx_cdrlock_counter[31:29]}));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \gt0_rx_cdrlock_counter[0]_i_1 
       (.I0(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I1(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(gt0_rx_cdrlock_counter[0]),
        .O(gt0_rx_cdrlock_counter_0[0]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[10]_i_1 
       (.I0(data0[10]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[10]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[11]_i_1 
       (.I0(data0[11]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[11]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[12]_i_1 
       (.I0(data0[12]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[13]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[13]),
        .O(gt0_rx_cdrlock_counter_0[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[14]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[14]),
        .O(gt0_rx_cdrlock_counter_0[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[15]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[15]),
        .O(gt0_rx_cdrlock_counter_0[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[16]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[16]),
        .O(gt0_rx_cdrlock_counter_0[16]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[17]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[17]),
        .O(gt0_rx_cdrlock_counter_0[17]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[18]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[18]),
        .O(gt0_rx_cdrlock_counter_0[18]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[19]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[19]),
        .O(gt0_rx_cdrlock_counter_0[19]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[1]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[1]),
        .O(gt0_rx_cdrlock_counter_0[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[20]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[20]),
        .O(gt0_rx_cdrlock_counter_0[20]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[21]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[21]),
        .O(gt0_rx_cdrlock_counter_0[21]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[22]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[22]),
        .O(gt0_rx_cdrlock_counter_0[22]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[23]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[23]),
        .O(gt0_rx_cdrlock_counter_0[23]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[24]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[24]),
        .O(gt0_rx_cdrlock_counter_0[24]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[25]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[25]),
        .O(gt0_rx_cdrlock_counter_0[25]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[26]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[26]),
        .O(gt0_rx_cdrlock_counter_0[26]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[27]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[27]),
        .O(gt0_rx_cdrlock_counter_0[27]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[28]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[28]),
        .O(gt0_rx_cdrlock_counter_0[28]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[29]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[29]),
        .O(gt0_rx_cdrlock_counter_0[29]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[2]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[2]),
        .O(gt0_rx_cdrlock_counter_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[30]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[30]),
        .O(gt0_rx_cdrlock_counter_0[30]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[31]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[31]),
        .O(gt0_rx_cdrlock_counter_0[31]));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \gt0_rx_cdrlock_counter[31]_i_2 
       (.I0(gt0_rx_cdrlock_counter[13]),
        .I1(gt0_rx_cdrlock_counter[12]),
        .I2(gt0_rx_cdrlock_counter[10]),
        .I3(gt0_rx_cdrlock_counter[11]),
        .I4(\gt0_rx_cdrlock_counter[31]_i_5_n_0 ),
        .O(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_3 
       (.I0(gt0_rx_cdrlock_counter[4]),
        .I1(gt0_rx_cdrlock_counter[5]),
        .I2(gt0_rx_cdrlock_counter[2]),
        .I3(gt0_rx_cdrlock_counter[3]),
        .I4(\gt0_rx_cdrlock_counter[31]_i_6_n_0 ),
        .O(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_4 
       (.I0(\gt0_rx_cdrlock_counter[31]_i_7_n_0 ),
        .I1(\gt0_rx_cdrlock_counter[31]_i_8_n_0 ),
        .I2(gt0_rx_cdrlock_counter[31]),
        .I3(gt0_rx_cdrlock_counter[30]),
        .I4(gt0_rx_cdrlock_counter[1]),
        .I5(\gt0_rx_cdrlock_counter[31]_i_9_n_0 ),
        .O(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_5 
       (.I0(gt0_rx_cdrlock_counter[15]),
        .I1(gt0_rx_cdrlock_counter[14]),
        .I2(gt0_rx_cdrlock_counter[17]),
        .I3(gt0_rx_cdrlock_counter[16]),
        .O(\gt0_rx_cdrlock_counter[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \gt0_rx_cdrlock_counter[31]_i_6 
       (.I0(gt0_rx_cdrlock_counter[6]),
        .I1(gt0_rx_cdrlock_counter[7]),
        .I2(gt0_rx_cdrlock_counter[9]),
        .I3(gt0_rx_cdrlock_counter[8]),
        .O(\gt0_rx_cdrlock_counter[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_7 
       (.I0(gt0_rx_cdrlock_counter[23]),
        .I1(gt0_rx_cdrlock_counter[22]),
        .I2(gt0_rx_cdrlock_counter[25]),
        .I3(gt0_rx_cdrlock_counter[24]),
        .O(\gt0_rx_cdrlock_counter[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_8 
       (.I0(gt0_rx_cdrlock_counter[19]),
        .I1(gt0_rx_cdrlock_counter[18]),
        .I2(gt0_rx_cdrlock_counter[21]),
        .I3(gt0_rx_cdrlock_counter[20]),
        .O(\gt0_rx_cdrlock_counter[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gt0_rx_cdrlock_counter[31]_i_9 
       (.I0(gt0_rx_cdrlock_counter[27]),
        .I1(gt0_rx_cdrlock_counter[26]),
        .I2(gt0_rx_cdrlock_counter[29]),
        .I3(gt0_rx_cdrlock_counter[28]),
        .O(\gt0_rx_cdrlock_counter[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[3]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[3]),
        .O(gt0_rx_cdrlock_counter_0[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[4]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[4]),
        .O(gt0_rx_cdrlock_counter_0[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[5]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[5]),
        .O(gt0_rx_cdrlock_counter_0[5]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[6]_i_1 
       (.I0(data0[6]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \gt0_rx_cdrlock_counter[7]_i_1 
       (.I0(gt0_rx_cdrlock_counter[0]),
        .I1(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I2(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .I4(data0[7]),
        .O(gt0_rx_cdrlock_counter_0[7]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[8]_i_1 
       (.I0(data0[8]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[8]));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \gt0_rx_cdrlock_counter[9]_i_1 
       (.I0(data0[9]),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlock_counter_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[0] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[0]),
        .Q(gt0_rx_cdrlock_counter[0]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[10] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[10]),
        .Q(gt0_rx_cdrlock_counter[10]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[11] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[11]),
        .Q(gt0_rx_cdrlock_counter[11]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[12] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[12]),
        .Q(gt0_rx_cdrlock_counter[12]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[13] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[13]),
        .Q(gt0_rx_cdrlock_counter[13]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[14] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[14]),
        .Q(gt0_rx_cdrlock_counter[14]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[15] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[15]),
        .Q(gt0_rx_cdrlock_counter[15]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[16] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[16]),
        .Q(gt0_rx_cdrlock_counter[16]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[17] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[17]),
        .Q(gt0_rx_cdrlock_counter[17]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[18] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[18]),
        .Q(gt0_rx_cdrlock_counter[18]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[19] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[19]),
        .Q(gt0_rx_cdrlock_counter[19]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[1] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[1]),
        .Q(gt0_rx_cdrlock_counter[1]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[20] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[20]),
        .Q(gt0_rx_cdrlock_counter[20]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[21] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[21]),
        .Q(gt0_rx_cdrlock_counter[21]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[22] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[22]),
        .Q(gt0_rx_cdrlock_counter[22]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[23] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[23]),
        .Q(gt0_rx_cdrlock_counter[23]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[24] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[24]),
        .Q(gt0_rx_cdrlock_counter[24]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[25] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[25]),
        .Q(gt0_rx_cdrlock_counter[25]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[26] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[26]),
        .Q(gt0_rx_cdrlock_counter[26]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[27] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[27]),
        .Q(gt0_rx_cdrlock_counter[27]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[28] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[28]),
        .Q(gt0_rx_cdrlock_counter[28]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[29] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[29]),
        .Q(gt0_rx_cdrlock_counter[29]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[2] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[2]),
        .Q(gt0_rx_cdrlock_counter[2]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[30] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[30]),
        .Q(gt0_rx_cdrlock_counter[30]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[31] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[31]),
        .Q(gt0_rx_cdrlock_counter[31]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[3] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[3]),
        .Q(gt0_rx_cdrlock_counter[3]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[4] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[4]),
        .Q(gt0_rx_cdrlock_counter[4]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[5] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[5]),
        .Q(gt0_rx_cdrlock_counter[5]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[6] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[6]),
        .Q(gt0_rx_cdrlock_counter[6]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[7] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[7]),
        .Q(gt0_rx_cdrlock_counter[7]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[8] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[8]),
        .Q(gt0_rx_cdrlock_counter[8]),
        .R(gt0_gtrxreset_gt));
  FDRE #(
    .INIT(1'b0)) 
    \gt0_rx_cdrlock_counter_reg[9] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlock_counter_0[9]),
        .Q(gt0_rx_cdrlock_counter[9]),
        .R(gt0_gtrxreset_gt));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    gt0_rx_cdrlocked_i_1
       (.I0(gt0_rx_cdrlocked_reg_n_0),
        .I1(gt0_rx_cdrlock_counter[0]),
        .I2(\gt0_rx_cdrlock_counter[31]_i_2_n_0 ),
        .I3(\gt0_rx_cdrlock_counter[31]_i_3_n_0 ),
        .I4(\gt0_rx_cdrlock_counter[31]_i_4_n_0 ),
        .O(gt0_rx_cdrlocked_i_1_n_0));
  FDRE gt0_rx_cdrlocked_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gt0_rx_cdrlocked_i_1_n_0),
        .Q(gt0_rx_cdrlocked_reg_n_0),
        .R(gt0_gtrxreset_gt));
  gig_ethernet_pcs_pma_0_RX_STARTUP_FSM gt0_rxresetfsm_i
       (.SR(gt0_gtrxreset_gt),
        .cplllock(cplllock),
        .data_in(rx_fsm_reset_done_int_reg),
        .data_out(data_out),
        .data_sync_reg1(gtwizard_i_n_5),
        .gt0_rxuserrdy_i(gt0_rxuserrdy_i),
        .gtxe2_i(gtxe2_i_7),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked),
        .pma_reset(pma_reset),
        .reset_time_out_reg_0(gt0_rx_cdrlocked_reg_n_0),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_TX_STARTUP_FSM gt0_txresetfsm_i
       (.cplllock(cplllock),
        .data_in(data_in),
        .data_sync_reg1(gtwizard_i_n_7),
        .gt0_cpllrefclklost_i(gt0_cpllrefclklost_i),
        .gt0_cpllreset_i(gt0_cpllreset_i),
        .gt0_gttxreset_gt(gt0_gttxreset_gt),
        .gt0_txuserrdy_i(gt0_txuserrdy_i),
        .gtxe2_i(gtxe2_i_8),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked),
        .mmcm_reset(mmcm_reset),
        .pma_reset(pma_reset),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt gtwizard_i
       (.D(D),
        .Q(Q),
        .RXBUFSTATUS(RXBUFSTATUS),
        .RXPD(RXPD),
        .SR(gt0_gtrxreset_gt),
        .TXBUFSTATUS(TXBUFSTATUS),
        .TXPD(TXPD),
        .cplllock(cplllock),
        .gt0_cpllrefclklost_i(gt0_cpllrefclklost_i),
        .gt0_cpllreset_i(gt0_cpllreset_i),
        .gt0_gttxreset_gt(gt0_gttxreset_gt),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gt0_rxuserrdy_i(gt0_rxuserrdy_i),
        .gt0_txuserrdy_i(gt0_txuserrdy_i),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .gtxe2_i(gtwizard_i_n_5),
        .gtxe2_i_0(gtwizard_i_n_7),
        .gtxe2_i_1(gtxe2_i),
        .gtxe2_i_2(gtxe2_i_0),
        .gtxe2_i_3(gtxe2_i_1),
        .gtxe2_i_4(gtxe2_i_2),
        .gtxe2_i_5(gtxe2_i_3),
        .gtxe2_i_6(gtxe2_i_4),
        .gtxe2_i_7(gtxe2_i_5),
        .gtxe2_i_8(gtxe2_i_6),
        .independent_clock_bufg(independent_clock_bufg),
        .reset_out(reset_out),
        .rxn(rxn),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .wtd_rxpcsreset_in(wtd_rxpcsreset_in));
endmodule

module gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt
   (cplllock,
    gt0_cpllrefclklost_i,
    txn,
    txp,
    rxoutclk,
    gtxe2_i,
    txoutclk,
    gtxe2_i_0,
    D,
    TXBUFSTATUS,
    RXBUFSTATUS,
    gtxe2_i_1,
    gtxe2_i_2,
    gtxe2_i_3,
    gtxe2_i_4,
    gtxe2_i_5,
    gtrefclk_bufg,
    independent_clock_bufg,
    gtrefclk,
    SR,
    gt0_gttxreset_gt,
    rxn,
    rxp,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in,
    reset_out,
    wtd_rxpcsreset_in,
    gt0_rxuserrdy_i,
    userclk,
    TXPD,
    gt0_txuserrdy_i,
    RXPD,
    Q,
    gtxe2_i_6,
    gtxe2_i_7,
    gtxe2_i_8,
    gt0_cpllreset_i);
  output cplllock;
  output gt0_cpllrefclklost_i;
  output txn;
  output txp;
  output rxoutclk;
  output gtxe2_i;
  output txoutclk;
  output gtxe2_i_0;
  output [1:0]D;
  output [0:0]TXBUFSTATUS;
  output [0:0]RXBUFSTATUS;
  output [15:0]gtxe2_i_1;
  output [1:0]gtxe2_i_2;
  output [1:0]gtxe2_i_3;
  output [1:0]gtxe2_i_4;
  output [1:0]gtxe2_i_5;
  input gtrefclk_bufg;
  input independent_clock_bufg;
  input gtrefclk;
  input [0:0]SR;
  input gt0_gttxreset_gt;
  input rxn;
  input rxp;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;
  input reset_out;
  input wtd_rxpcsreset_in;
  input gt0_rxuserrdy_i;
  input userclk;
  input [0:0]TXPD;
  input gt0_txuserrdy_i;
  input [0:0]RXPD;
  input [15:0]Q;
  input [1:0]gtxe2_i_6;
  input [1:0]gtxe2_i_7;
  input [1:0]gtxe2_i_8;
  input gt0_cpllreset_i;

  wire [1:0]D;
  wire [15:0]Q;
  wire [0:0]RXBUFSTATUS;
  wire [0:0]RXPD;
  wire [0:0]SR;
  wire [0:0]TXBUFSTATUS;
  wire [0:0]TXPD;
  wire cplllock;
  wire gt0_cpllpd_i;
  wire gt0_cpllrefclklost_i;
  wire gt0_cpllreset_i;
  wire gt0_cpllreset_i_0;
  wire gt0_gttxreset_gt;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gt0_rxuserrdy_i;
  wire gt0_txuserrdy_i;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire gtxe2_i;
  wire gtxe2_i_0;
  wire [15:0]gtxe2_i_1;
  wire [1:0]gtxe2_i_2;
  wire [1:0]gtxe2_i_3;
  wire [1:0]gtxe2_i_4;
  wire [1:0]gtxe2_i_5;
  wire [1:0]gtxe2_i_6;
  wire [1:0]gtxe2_i_7;
  wire [1:0]gtxe2_i_8;
  wire independent_clock_bufg;
  wire reset_out;
  wire rxn;
  wire rxoutclk;
  wire rxp;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire wtd_rxpcsreset_in;

  gig_ethernet_pcs_pma_0_cpll_railing cpll_railing0_i
       (.gt0_cpllpd_i(gt0_cpllpd_i),
        .gt0_cpllreset_i(gt0_cpllreset_i),
        .gt0_cpllreset_i_0(gt0_cpllreset_i_0),
        .gtrefclk_bufg(gtrefclk_bufg));
  gig_ethernet_pcs_pma_0_GTWIZARD_GT gt0_GTWIZARD_i
       (.D(D),
        .Q(Q),
        .RXBUFSTATUS(RXBUFSTATUS),
        .RXPD(RXPD),
        .SR(SR),
        .TXBUFSTATUS(TXBUFSTATUS),
        .TXPD(TXPD),
        .cplllock(cplllock),
        .gt0_cpllpd_i(gt0_cpllpd_i),
        .gt0_cpllrefclklost_i(gt0_cpllrefclklost_i),
        .gt0_cpllreset_i_0(gt0_cpllreset_i_0),
        .gt0_gttxreset_gt(gt0_gttxreset_gt),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gt0_rxuserrdy_i(gt0_rxuserrdy_i),
        .gt0_txuserrdy_i(gt0_txuserrdy_i),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .gtxe2_i_0(gtxe2_i),
        .gtxe2_i_1(gtxe2_i_0),
        .gtxe2_i_2(gtxe2_i_1),
        .gtxe2_i_3(gtxe2_i_2),
        .gtxe2_i_4(gtxe2_i_3),
        .gtxe2_i_5(gtxe2_i_4),
        .gtxe2_i_6(gtxe2_i_5),
        .gtxe2_i_7(gtxe2_i_6),
        .gtxe2_i_8(gtxe2_i_7),
        .gtxe2_i_9(gtxe2_i_8),
        .independent_clock_bufg(independent_clock_bufg),
        .reset_out(reset_out),
        .rxn(rxn),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .wtd_rxpcsreset_in(wtd_rxpcsreset_in));
endmodule

module gig_ethernet_pcs_pma_0_RX_STARTUP_FSM
   (data_in,
    gt0_rxuserrdy_i,
    SR,
    independent_clock_bufg,
    userclk,
    pma_reset,
    reset_time_out_reg_0,
    gtxe2_i,
    data_sync_reg1,
    mmcm_locked,
    data_out,
    cplllock);
  output data_in;
  output gt0_rxuserrdy_i;
  output [0:0]SR;
  input independent_clock_bufg;
  input userclk;
  input pma_reset;
  input reset_time_out_reg_0;
  input gtxe2_i;
  input data_sync_reg1;
  input mmcm_locked;
  input data_out;
  input cplllock;

  wire \FSM_sequential_rx_state[0]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[1]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[2]_i_1_n_0 ;
  wire \FSM_sequential_rx_state[2]_i_2_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_10_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_4_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_6_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_8_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_9_n_0 ;
  wire RXUSERRDY_i_1_n_0;
  wire [0:0]SR;
  wire check_tlock_max;
  wire check_tlock_max_i_1_n_0;
  wire check_tlock_max_reg_n_0;
  wire cplllock;
  wire data_in;
  wire data_out;
  wire data_sync_reg1;
  wire data_valid_sync;
  wire gt0_gtrxreset_t;
  wire gt0_rxuserrdy_i;
  wire gtrxreset_i_i_1_n_0;
  wire gtxe2_i;
  wire independent_clock_bufg;
  wire init_wait_count;
  wire \init_wait_count[0]_i_1__0_n_0 ;
  wire \init_wait_count[7]_i_3__0_n_0 ;
  wire \init_wait_count[7]_i_4__0_n_0 ;
  wire [7:0]init_wait_count_reg;
  wire init_wait_done_i_1__0_n_0;
  wire init_wait_done_reg_n_0;
  wire \mmcm_lock_count[7]_i_2__0_n_0 ;
  wire [7:0]mmcm_lock_count_reg;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;
  wire mmcm_lock_reclocked_i_1_n_0;
  wire mmcm_lock_reclocked_i_2__0_n_0;
  wire mmcm_locked;
  wire [7:1]p_0_in__3;
  wire [7:0]p_0_in__4;
  wire pma_reset;
  wire reset_time_out_i_2__0_n_0;
  wire reset_time_out_i_4_n_0;
  wire reset_time_out_i_6_n_0;
  wire reset_time_out_reg_0;
  wire reset_time_out_reg_n_0;
  wire run_phase_alignment_int_i_1__0_n_0;
  wire run_phase_alignment_int_reg_n_0;
  wire run_phase_alignment_int_s2;
  wire run_phase_alignment_int_s3_reg_n_0;
  wire rx_fsm_reset_done_int_s2;
  wire rx_fsm_reset_done_int_s3;
  wire [3:0]rx_state;
  wire [3:0]rx_state__0;
  wire rxresetdone_s2;
  wire rxresetdone_s3;
  wire sync_cplllock_n_0;
  wire sync_cplllock_n_1;
  wire sync_data_valid_n_1;
  wire sync_data_valid_n_5;
  wire sync_mmcm_lock_reclocked_n_0;
  wire time_out_100us_i_1_n_0;
  wire time_out_100us_i_2_n_0;
  wire time_out_100us_i_3_n_0;
  wire time_out_100us_reg_n_0;
  wire time_out_1us_i_1_n_0;
  wire time_out_1us_i_2_n_0;
  wire time_out_1us_i_3_n_0;
  wire time_out_1us_i_4_n_0;
  wire time_out_1us_i_5_n_0;
  wire time_out_1us_i_6_n_0;
  wire time_out_1us_reg_n_0;
  wire time_out_2ms;
  wire time_out_2ms_i_1_n_0;
  wire time_out_2ms_i_3__0_n_0;
  wire time_out_2ms_i_4__0_n_0;
  wire time_out_2ms_i_5__0_n_0;
  wire time_out_2ms_i_6__0_n_0;
  wire time_out_2ms_i_7_n_0;
  wire time_out_2ms_i_8_n_0;
  wire time_out_2ms_reg_n_0;
  wire time_out_counter;
  wire \time_out_counter[0]_i_3__0_n_0 ;
  wire [18:0]time_out_counter_reg;
  wire \time_out_counter_reg[0]_i_2__0_n_0 ;
  wire \time_out_counter_reg[0]_i_2__0_n_1 ;
  wire \time_out_counter_reg[0]_i_2__0_n_2 ;
  wire \time_out_counter_reg[0]_i_2__0_n_3 ;
  wire \time_out_counter_reg[0]_i_2__0_n_4 ;
  wire \time_out_counter_reg[0]_i_2__0_n_5 ;
  wire \time_out_counter_reg[0]_i_2__0_n_6 ;
  wire \time_out_counter_reg[0]_i_2__0_n_7 ;
  wire \time_out_counter_reg[12]_i_1__0_n_0 ;
  wire \time_out_counter_reg[12]_i_1__0_n_1 ;
  wire \time_out_counter_reg[12]_i_1__0_n_2 ;
  wire \time_out_counter_reg[12]_i_1__0_n_3 ;
  wire \time_out_counter_reg[12]_i_1__0_n_4 ;
  wire \time_out_counter_reg[12]_i_1__0_n_5 ;
  wire \time_out_counter_reg[12]_i_1__0_n_6 ;
  wire \time_out_counter_reg[12]_i_1__0_n_7 ;
  wire \time_out_counter_reg[16]_i_1__0_n_2 ;
  wire \time_out_counter_reg[16]_i_1__0_n_3 ;
  wire \time_out_counter_reg[16]_i_1__0_n_5 ;
  wire \time_out_counter_reg[16]_i_1__0_n_6 ;
  wire \time_out_counter_reg[16]_i_1__0_n_7 ;
  wire \time_out_counter_reg[4]_i_1__0_n_0 ;
  wire \time_out_counter_reg[4]_i_1__0_n_1 ;
  wire \time_out_counter_reg[4]_i_1__0_n_2 ;
  wire \time_out_counter_reg[4]_i_1__0_n_3 ;
  wire \time_out_counter_reg[4]_i_1__0_n_4 ;
  wire \time_out_counter_reg[4]_i_1__0_n_5 ;
  wire \time_out_counter_reg[4]_i_1__0_n_6 ;
  wire \time_out_counter_reg[4]_i_1__0_n_7 ;
  wire \time_out_counter_reg[8]_i_1__0_n_0 ;
  wire \time_out_counter_reg[8]_i_1__0_n_1 ;
  wire \time_out_counter_reg[8]_i_1__0_n_2 ;
  wire \time_out_counter_reg[8]_i_1__0_n_3 ;
  wire \time_out_counter_reg[8]_i_1__0_n_4 ;
  wire \time_out_counter_reg[8]_i_1__0_n_5 ;
  wire \time_out_counter_reg[8]_i_1__0_n_6 ;
  wire \time_out_counter_reg[8]_i_1__0_n_7 ;
  wire time_out_wait_bypass_i_1_n_0;
  wire time_out_wait_bypass_i_2__0_n_0;
  wire time_out_wait_bypass_i_3__0_n_0;
  wire time_out_wait_bypass_i_4__0_n_0;
  wire time_out_wait_bypass_reg_n_0;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max;
  wire time_tlock_max_i_1_n_0;
  wire time_tlock_max_i_2_n_0;
  wire time_tlock_max_i_3_n_0;
  wire time_tlock_max_i_4_n_0;
  wire time_tlock_max_i_5_n_0;
  wire time_tlock_max_i_6_n_0;
  wire userclk;
  wire \wait_bypass_count[0]_i_1__0_n_0 ;
  wire \wait_bypass_count[0]_i_2__0_n_0 ;
  wire \wait_bypass_count[0]_i_4_n_0 ;
  wire [12:0]wait_bypass_count_reg;
  wire \wait_bypass_count_reg[0]_i_3__0_n_0 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_1 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_2 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_3 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_4 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_5 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_6 ;
  wire \wait_bypass_count_reg[0]_i_3__0_n_7 ;
  wire \wait_bypass_count_reg[12]_i_1__0_n_7 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_0 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_1 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_2 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_3 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_4 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_5 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_6 ;
  wire \wait_bypass_count_reg[4]_i_1__0_n_7 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_0 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_1 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_2 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_3 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_4 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_5 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_6 ;
  wire \wait_bypass_count_reg[8]_i_1__0_n_7 ;
  wire \wait_time_cnt[0]_i_10__0_n_0 ;
  wire \wait_time_cnt[0]_i_11__0_n_0 ;
  wire \wait_time_cnt[0]_i_1_n_0 ;
  wire \wait_time_cnt[0]_i_2__0_n_0 ;
  wire \wait_time_cnt[0]_i_4__0_n_0 ;
  wire \wait_time_cnt[0]_i_5__0_n_0 ;
  wire \wait_time_cnt[0]_i_6__0_n_0 ;
  wire \wait_time_cnt[0]_i_7__0_n_0 ;
  wire \wait_time_cnt[0]_i_8__0_n_0 ;
  wire \wait_time_cnt[0]_i_9__0_n_0 ;
  wire \wait_time_cnt[12]_i_2__0_n_0 ;
  wire \wait_time_cnt[12]_i_3__0_n_0 ;
  wire \wait_time_cnt[12]_i_4__0_n_0 ;
  wire \wait_time_cnt[12]_i_5__0_n_0 ;
  wire \wait_time_cnt[4]_i_2__0_n_0 ;
  wire \wait_time_cnt[4]_i_3__0_n_0 ;
  wire \wait_time_cnt[4]_i_4__0_n_0 ;
  wire \wait_time_cnt[4]_i_5__0_n_0 ;
  wire \wait_time_cnt[8]_i_2__0_n_0 ;
  wire \wait_time_cnt[8]_i_3__0_n_0 ;
  wire \wait_time_cnt[8]_i_4__0_n_0 ;
  wire \wait_time_cnt[8]_i_5__0_n_0 ;
  wire [15:0]wait_time_cnt_reg;
  wire \wait_time_cnt_reg[0]_i_3__0_n_0 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_1 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_2 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_3 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_4 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_5 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_6 ;
  wire \wait_time_cnt_reg[0]_i_3__0_n_7 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_1 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_2 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_3 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_4 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_5 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_6 ;
  wire \wait_time_cnt_reg[12]_i_1__0_n_7 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_0 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_1 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_2 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_3 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_4 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_5 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_6 ;
  wire \wait_time_cnt_reg[4]_i_1__0_n_7 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_0 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_1 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_2 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_3 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_4 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_5 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_6 ;
  wire \wait_time_cnt_reg[8]_i_1__0_n_7 ;
  wire [3:2]\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED ;
  wire [3:3]\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED ;
  wire [3:0]\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED ;
  wire [3:3]\NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFF8000AF00)) 
    \FSM_sequential_rx_state[0]_i_2 
       (.I0(rx_state[1]),
        .I1(reset_time_out_reg_n_0),
        .I2(rx_state[2]),
        .I3(rx_state[0]),
        .I4(time_out_2ms_reg_n_0),
        .I5(rx_state[3]),
        .O(\FSM_sequential_rx_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF5555FFFF7555)) 
    \FSM_sequential_rx_state[1]_i_2 
       (.I0(rx_state[0]),
        .I1(reset_time_out_reg_n_0),
        .I2(time_tlock_max),
        .I3(rx_state[2]),
        .I4(rx_state[1]),
        .I5(rx_state[3]),
        .O(\FSM_sequential_rx_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000100005551555)) 
    \FSM_sequential_rx_state[2]_i_1 
       (.I0(rx_state[3]),
        .I1(rx_state[2]),
        .I2(rx_state[1]),
        .I3(rx_state[0]),
        .I4(time_out_2ms_reg_n_0),
        .I5(\FSM_sequential_rx_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_rx_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2727FF2727272727)) 
    \FSM_sequential_rx_state[2]_i_2 
       (.I0(rx_state[3]),
        .I1(rx_state[1]),
        .I2(rx_state[2]),
        .I3(rx_state[0]),
        .I4(reset_time_out_reg_n_0),
        .I5(time_tlock_max),
        .O(\FSM_sequential_rx_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    \FSM_sequential_rx_state[3]_i_10 
       (.I0(rx_state[3]),
        .I1(rx_state[1]),
        .I2(rx_state[2]),
        .I3(rx_state[0]),
        .I4(init_wait_done_reg_n_0),
        .O(\FSM_sequential_rx_state[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000151)) 
    \FSM_sequential_rx_state[3]_i_4 
       (.I0(rx_state[1]),
        .I1(reset_time_out_reg_0),
        .I2(rx_state[0]),
        .I3(mmcm_lock_reclocked),
        .I4(\FSM_sequential_rx_state[2]_i_2_n_0 ),
        .I5(\FSM_sequential_rx_state[3]_i_10_n_0 ),
        .O(\FSM_sequential_rx_state[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAEAEFFFFAEFFFFFF)) 
    \FSM_sequential_rx_state[3]_i_6 
       (.I0(rxresetdone_s3),
        .I1(time_out_2ms_reg_n_0),
        .I2(reset_time_out_reg_n_0),
        .I3(rx_state[2]),
        .I4(rx_state[1]),
        .I5(rx_state[3]),
        .O(\FSM_sequential_rx_state[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \FSM_sequential_rx_state[3]_i_8 
       (.I0(rx_state[2]),
        .I1(rx_state[1]),
        .I2(rx_state[3]),
        .O(\FSM_sequential_rx_state[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hDDD0000000000000)) 
    \FSM_sequential_rx_state[3]_i_9 
       (.I0(time_out_2ms_reg_n_0),
        .I1(reset_time_out_reg_n_0),
        .I2(rx_state[2]),
        .I3(rx_state[3]),
        .I4(rx_state[0]),
        .I5(rx_state[1]),
        .O(\FSM_sequential_rx_state[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[0] 
       (.C(independent_clock_bufg),
        .CE(sync_data_valid_n_1),
        .D(rx_state__0[0]),
        .Q(rx_state[0]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[1] 
       (.C(independent_clock_bufg),
        .CE(sync_data_valid_n_1),
        .D(rx_state__0[1]),
        .Q(rx_state[1]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[2] 
       (.C(independent_clock_bufg),
        .CE(sync_data_valid_n_1),
        .D(\FSM_sequential_rx_state[2]_i_1_n_0 ),
        .Q(rx_state[2]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_rx_state_reg[3] 
       (.C(independent_clock_bufg),
        .CE(sync_data_valid_n_1),
        .D(rx_state__0[3]),
        .Q(rx_state[3]),
        .R(pma_reset));
  LUT5 #(
    .INIT(32'hFFFB4000)) 
    RXUSERRDY_i_1
       (.I0(rx_state[3]),
        .I1(rx_state[0]),
        .I2(rx_state[2]),
        .I3(rx_state[1]),
        .I4(gt0_rxuserrdy_i),
        .O(RXUSERRDY_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RXUSERRDY_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(RXUSERRDY_i_1_n_0),
        .Q(gt0_rxuserrdy_i),
        .R(pma_reset));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    check_tlock_max_i_1
       (.I0(rx_state[2]),
        .I1(rx_state[3]),
        .I2(rx_state[0]),
        .I3(rx_state[1]),
        .I4(check_tlock_max_reg_n_0),
        .O(check_tlock_max_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    check_tlock_max_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(check_tlock_max_i_1_n_0),
        .Q(check_tlock_max_reg_n_0),
        .R(pma_reset));
  LUT5 #(
    .INIT(32'hFFFD0004)) 
    gtrxreset_i_i_1
       (.I0(rx_state[2]),
        .I1(rx_state[0]),
        .I2(rx_state[3]),
        .I3(rx_state[1]),
        .I4(gt0_gtrxreset_t),
        .O(gtrxreset_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gtrxreset_i_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gtrxreset_i_i_1_n_0),
        .Q(gt0_gtrxreset_t),
        .R(pma_reset));
  LUT3 #(
    .INIT(8'hEA)) 
    gtxe2_i_i_2
       (.I0(gt0_gtrxreset_t),
        .I1(data_in),
        .I2(gtxe2_i),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \init_wait_count[0]_i_1__0 
       (.I0(init_wait_count_reg[0]),
        .O(\init_wait_count[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[1]_i_1__0 
       (.I0(init_wait_count_reg[0]),
        .I1(init_wait_count_reg[1]),
        .O(p_0_in__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \init_wait_count[2]_i_1__0 
       (.I0(init_wait_count_reg[2]),
        .I1(init_wait_count_reg[0]),
        .I2(init_wait_count_reg[1]),
        .O(p_0_in__3[2]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \init_wait_count[3]_i_1__0 
       (.I0(init_wait_count_reg[3]),
        .I1(init_wait_count_reg[1]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[2]),
        .O(p_0_in__3[3]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \init_wait_count[4]_i_1__0 
       (.I0(init_wait_count_reg[4]),
        .I1(init_wait_count_reg[2]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[1]),
        .I4(init_wait_count_reg[3]),
        .O(p_0_in__3[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \init_wait_count[5]_i_1__0 
       (.I0(init_wait_count_reg[3]),
        .I1(init_wait_count_reg[1]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[2]),
        .I4(init_wait_count_reg[4]),
        .I5(init_wait_count_reg[5]),
        .O(p_0_in__3[5]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[6]_i_1__0 
       (.I0(init_wait_count_reg[6]),
        .I1(\init_wait_count[7]_i_4__0_n_0 ),
        .O(p_0_in__3[6]));
  LUT5 #(
    .INIT(32'hFFFFEFFF)) 
    \init_wait_count[7]_i_1__0 
       (.I0(\init_wait_count[7]_i_3__0_n_0 ),
        .I1(init_wait_count_reg[4]),
        .I2(init_wait_count_reg[5]),
        .I3(init_wait_count_reg[6]),
        .I4(init_wait_count_reg[7]),
        .O(init_wait_count));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \init_wait_count[7]_i_2__0 
       (.I0(init_wait_count_reg[7]),
        .I1(\init_wait_count[7]_i_4__0_n_0 ),
        .I2(init_wait_count_reg[6]),
        .O(p_0_in__3[7]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \init_wait_count[7]_i_3__0 
       (.I0(init_wait_count_reg[1]),
        .I1(init_wait_count_reg[0]),
        .I2(init_wait_count_reg[3]),
        .I3(init_wait_count_reg[2]),
        .O(\init_wait_count[7]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \init_wait_count[7]_i_4__0 
       (.I0(init_wait_count_reg[5]),
        .I1(init_wait_count_reg[4]),
        .I2(init_wait_count_reg[2]),
        .I3(init_wait_count_reg[0]),
        .I4(init_wait_count_reg[1]),
        .I5(init_wait_count_reg[3]),
        .O(\init_wait_count[7]_i_4__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[0] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(\init_wait_count[0]_i_1__0_n_0 ),
        .Q(init_wait_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[1] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[1]),
        .Q(init_wait_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[2] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[2]),
        .Q(init_wait_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[3] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[3]),
        .Q(init_wait_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[4] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[4]),
        .Q(init_wait_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[5] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[5]),
        .Q(init_wait_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[6] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[6]),
        .Q(init_wait_count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[7] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__3[7]),
        .Q(init_wait_count_reg[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001000)) 
    init_wait_done_i_1__0
       (.I0(\init_wait_count[7]_i_3__0_n_0 ),
        .I1(init_wait_count_reg[4]),
        .I2(init_wait_count_reg[5]),
        .I3(init_wait_count_reg[6]),
        .I4(init_wait_count_reg[7]),
        .I5(init_wait_done_reg_n_0),
        .O(init_wait_done_i_1__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    init_wait_done_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .CLR(pma_reset),
        .D(init_wait_done_i_1__0_n_0),
        .Q(init_wait_done_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[0]_i_1__0 
       (.I0(mmcm_lock_count_reg[0]),
        .O(p_0_in__4[0]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[1]_i_1__0 
       (.I0(mmcm_lock_count_reg[1]),
        .I1(mmcm_lock_count_reg[0]),
        .O(p_0_in__4[1]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \mmcm_lock_count[2]_i_1__0 
       (.I0(mmcm_lock_count_reg[2]),
        .I1(mmcm_lock_count_reg[1]),
        .I2(mmcm_lock_count_reg[0]),
        .O(p_0_in__4[2]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \mmcm_lock_count[3]_i_1__0 
       (.I0(mmcm_lock_count_reg[3]),
        .I1(mmcm_lock_count_reg[0]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[2]),
        .O(p_0_in__4[3]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \mmcm_lock_count[4]_i_1__0 
       (.I0(mmcm_lock_count_reg[4]),
        .I1(mmcm_lock_count_reg[2]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[0]),
        .I4(mmcm_lock_count_reg[3]),
        .O(p_0_in__4[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \mmcm_lock_count[5]_i_1__0 
       (.I0(mmcm_lock_count_reg[3]),
        .I1(mmcm_lock_count_reg[0]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[2]),
        .I4(mmcm_lock_count_reg[4]),
        .I5(mmcm_lock_count_reg[5]),
        .O(p_0_in__4[5]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[6]_i_1__0 
       (.I0(mmcm_lock_count_reg[6]),
        .I1(mmcm_lock_reclocked_i_2__0_n_0),
        .O(p_0_in__4[6]));
  LUT3 #(
    .INIT(8'h7F)) 
    \mmcm_lock_count[7]_i_2__0 
       (.I0(mmcm_lock_count_reg[6]),
        .I1(mmcm_lock_reclocked_i_2__0_n_0),
        .I2(mmcm_lock_count_reg[7]),
        .O(\mmcm_lock_count[7]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \mmcm_lock_count[7]_i_3__0 
       (.I0(mmcm_lock_count_reg[7]),
        .I1(mmcm_lock_reclocked_i_2__0_n_0),
        .I2(mmcm_lock_count_reg[6]),
        .O(p_0_in__4[7]));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[0] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[0]),
        .Q(mmcm_lock_count_reg[0]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[1] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[1]),
        .Q(mmcm_lock_count_reg[1]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[2] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[2]),
        .Q(mmcm_lock_count_reg[2]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[3] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[3]),
        .Q(mmcm_lock_count_reg[3]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[4] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[4]),
        .Q(mmcm_lock_count_reg[4]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[5] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[5]),
        .Q(mmcm_lock_count_reg[5]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[6] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[6]),
        .Q(mmcm_lock_count_reg[6]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[7] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2__0_n_0 ),
        .D(p_0_in__4[7]),
        .Q(mmcm_lock_count_reg[7]),
        .R(sync_mmcm_lock_reclocked_n_0));
  LUT5 #(
    .INIT(32'hEAAA0000)) 
    mmcm_lock_reclocked_i_1
       (.I0(mmcm_lock_reclocked),
        .I1(mmcm_lock_count_reg[7]),
        .I2(mmcm_lock_reclocked_i_2__0_n_0),
        .I3(mmcm_lock_count_reg[6]),
        .I4(mmcm_lock_i),
        .O(mmcm_lock_reclocked_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    mmcm_lock_reclocked_i_2__0
       (.I0(mmcm_lock_count_reg[5]),
        .I1(mmcm_lock_count_reg[4]),
        .I2(mmcm_lock_count_reg[2]),
        .I3(mmcm_lock_count_reg[1]),
        .I4(mmcm_lock_count_reg[0]),
        .I5(mmcm_lock_count_reg[3]),
        .O(mmcm_lock_reclocked_i_2__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mmcm_lock_reclocked_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(mmcm_lock_reclocked_i_1_n_0),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT2 #(
    .INIT(4'hB)) 
    reset_time_out_i_2__0
       (.I0(rxresetdone_s3),
        .I1(rx_state[1]),
        .O(reset_time_out_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    reset_time_out_i_3__0
       (.I0(rx_state[2]),
        .I1(rx_state[3]),
        .O(check_tlock_max));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    reset_time_out_i_4
       (.I0(rx_state[1]),
        .I1(reset_time_out_reg_0),
        .I2(rx_state[0]),
        .I3(mmcm_lock_reclocked),
        .O(reset_time_out_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT5 #(
    .INIT(32'h0F303F38)) 
    reset_time_out_i_6
       (.I0(reset_time_out_reg_0),
        .I1(rx_state[2]),
        .I2(rx_state[3]),
        .I3(rx_state[0]),
        .I4(rx_state[1]),
        .O(reset_time_out_i_6_n_0));
  FDSE #(
    .INIT(1'b0)) 
    reset_time_out_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(sync_cplllock_n_1),
        .Q(reset_time_out_reg_n_0),
        .S(pma_reset));
  LUT5 #(
    .INIT(32'hFFFB0002)) 
    run_phase_alignment_int_i_1__0
       (.I0(rx_state[3]),
        .I1(rx_state[0]),
        .I2(rx_state[2]),
        .I3(rx_state[1]),
        .I4(run_phase_alignment_int_reg_n_0),
        .O(run_phase_alignment_int_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(run_phase_alignment_int_i_1__0_n_0),
        .Q(run_phase_alignment_int_reg_n_0),
        .R(pma_reset));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_s3_reg
       (.C(userclk),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(run_phase_alignment_int_s3_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rx_fsm_reset_done_int_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(sync_data_valid_n_5),
        .Q(data_in),
        .R(pma_reset));
  FDRE #(
    .INIT(1'b0)) 
    rx_fsm_reset_done_int_s3_reg
       (.C(userclk),
        .CE(1'b1),
        .D(rx_fsm_reset_done_int_s2),
        .Q(rx_fsm_reset_done_int_s3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rxresetdone_s3_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(rxresetdone_s2),
        .Q(rxresetdone_s3),
        .R(1'b0));
  gig_ethernet_pcs_pma_0_sync_block_10 sync_RXRESETDONE
       (.data_out(rxresetdone_s2),
        .data_sync_reg1_0(data_sync_reg1),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_sync_block_11 sync_cplllock
       (.\FSM_sequential_rx_state_reg[0] (time_out_2ms_reg_n_0),
        .Q(rx_state),
        .check_tlock_max(check_tlock_max),
        .cplllock(cplllock),
        .data_out(data_valid_sync),
        .independent_clock_bufg(independent_clock_bufg),
        .reset_time_out_reg(sync_cplllock_n_1),
        .reset_time_out_reg_0(reset_time_out_i_2__0_n_0),
        .reset_time_out_reg_1(reset_time_out_i_4_n_0),
        .reset_time_out_reg_2(reset_time_out_i_6_n_0),
        .reset_time_out_reg_3(reset_time_out_reg_n_0),
        .time_out_2ms_reg(sync_cplllock_n_0));
  gig_ethernet_pcs_pma_0_sync_block_12 sync_data_valid
       (.D({rx_state__0[3],rx_state__0[1:0]}),
        .E(sync_data_valid_n_1),
        .\FSM_sequential_rx_state_reg[0] (\FSM_sequential_rx_state[3]_i_4_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_0 (\wait_time_cnt[0]_i_2__0_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_1 (sync_cplllock_n_0),
        .\FSM_sequential_rx_state_reg[0]_2 (\FSM_sequential_rx_state[3]_i_6_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_3 (\FSM_sequential_rx_state[0]_i_2_n_0 ),
        .\FSM_sequential_rx_state_reg[0]_4 (\FSM_sequential_rx_state[1]_i_2_n_0 ),
        .\FSM_sequential_rx_state_reg[2] (sync_data_valid_n_5),
        .\FSM_sequential_rx_state_reg[3] (\FSM_sequential_rx_state[3]_i_8_n_0 ),
        .\FSM_sequential_rx_state_reg[3]_0 (\FSM_sequential_rx_state[3]_i_9_n_0 ),
        .Q(rx_state),
        .data_in(data_in),
        .data_out(data_valid_sync),
        .data_sync_reg1_0(data_out),
        .independent_clock_bufg(independent_clock_bufg),
        .rx_fsm_reset_done_int_reg(reset_time_out_reg_n_0),
        .rx_fsm_reset_done_int_reg_0(time_out_100us_reg_n_0),
        .rx_fsm_reset_done_int_reg_1(time_out_1us_reg_n_0),
        .time_out_wait_bypass_s3(time_out_wait_bypass_s3));
  gig_ethernet_pcs_pma_0_sync_block_13 sync_mmcm_lock_reclocked
       (.SR(sync_mmcm_lock_reclocked_n_0),
        .data_out(mmcm_lock_i),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked));
  gig_ethernet_pcs_pma_0_sync_block_14 sync_run_phase_alignment_int
       (.data_in(run_phase_alignment_int_reg_n_0),
        .data_out(run_phase_alignment_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_sync_block_15 sync_rx_fsm_reset_done_int
       (.data_in(data_in),
        .data_out(rx_fsm_reset_done_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_sync_block_16 sync_time_out_wait_bypass
       (.data_in(time_out_wait_bypass_reg_n_0),
        .data_out(time_out_wait_bypass_s2),
        .independent_clock_bufg(independent_clock_bufg));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000001)) 
    time_out_100us_i_1
       (.I0(time_out_100us_i_2_n_0),
        .I1(time_out_counter_reg[18]),
        .I2(time_out_counter_reg[17]),
        .I3(time_out_counter_reg[16]),
        .I4(time_out_100us_i_3_n_0),
        .I5(time_out_100us_reg_n_0),
        .O(time_out_100us_i_1_n_0));
  LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
    time_out_100us_i_2
       (.I0(time_tlock_max_i_6_n_0),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .I3(time_out_counter_reg[14]),
        .I4(time_out_counter_reg[5]),
        .I5(time_tlock_max_i_4_n_0),
        .O(time_out_100us_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF2)) 
    time_out_100us_i_3
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[16]),
        .I2(time_out_counter_reg[17]),
        .I3(time_out_counter_reg[6]),
        .I4(time_out_counter_reg[7]),
        .I5(time_out_counter_reg[8]),
        .O(time_out_100us_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_100us_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_100us_i_1_n_0),
        .Q(time_out_100us_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT4 #(
    .INIT(16'hFF10)) 
    time_out_1us_i_1
       (.I0(time_out_1us_i_2_n_0),
        .I1(time_out_1us_i_3_n_0),
        .I2(time_out_1us_i_4_n_0),
        .I3(time_out_1us_reg_n_0),
        .O(time_out_1us_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    time_out_1us_i_2
       (.I0(time_out_2ms_i_7_n_0),
        .I1(time_out_counter_reg[4]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[13]),
        .I4(time_out_counter_reg[5]),
        .O(time_out_1us_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    time_out_1us_i_3
       (.I0(time_out_counter_reg[9]),
        .I1(time_out_counter_reg[11]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[8]),
        .I4(time_out_counter_reg[7]),
        .I5(time_out_1us_i_5_n_0),
        .O(time_out_1us_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT5 #(
    .INIT(32'h0000F800)) 
    time_out_1us_i_4
       (.I0(time_out_counter_reg[6]),
        .I1(time_out_counter_reg[7]),
        .I2(time_out_counter_reg[8]),
        .I3(time_tlock_max_i_3_n_0),
        .I4(time_out_1us_i_6_n_0),
        .O(time_out_1us_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF2F2FFF2)) 
    time_out_1us_i_5
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[15]),
        .I4(time_out_counter_reg[16]),
        .I5(time_out_counter_reg[17]),
        .O(time_out_1us_i_5_n_0));
  LUT3 #(
    .INIT(8'h45)) 
    time_out_1us_i_6
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[4]),
        .I2(time_out_counter_reg[3]),
        .O(time_out_1us_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_1us_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_1us_i_1_n_0),
        .Q(time_out_1us_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    time_out_2ms_i_1
       (.I0(time_out_2ms),
        .I1(time_out_2ms_reg_n_0),
        .O(time_out_2ms_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    time_out_2ms_i_2
       (.I0(time_out_2ms_i_3__0_n_0),
        .I1(time_out_2ms_i_4__0_n_0),
        .I2(time_out_2ms_i_5__0_n_0),
        .I3(time_out_2ms_i_6__0_n_0),
        .I4(time_out_2ms_i_7_n_0),
        .I5(time_out_2ms_i_8_n_0),
        .O(time_out_2ms));
  LUT6 #(
    .INIT(64'hF2FFFFFFFFFFFFFF)) 
    time_out_2ms_i_3__0
       (.I0(time_out_counter_reg[3]),
        .I1(time_out_counter_reg[4]),
        .I2(time_out_counter_reg[5]),
        .I3(time_out_counter_reg[17]),
        .I4(time_out_counter_reg[11]),
        .I5(time_out_counter_reg[18]),
        .O(time_out_2ms_i_3__0_n_0));
  LUT3 #(
    .INIT(8'hBA)) 
    time_out_2ms_i_4__0
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .O(time_out_2ms_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    time_out_2ms_i_5__0
       (.I0(time_out_counter_reg[15]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[16]),
        .O(time_out_2ms_i_5__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    time_out_2ms_i_6__0
       (.I0(time_out_counter_reg[7]),
        .I1(time_out_counter_reg[8]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[9]),
        .O(time_out_2ms_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    time_out_2ms_i_7
       (.I0(time_out_counter_reg[2]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[0]),
        .O(time_out_2ms_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    time_out_2ms_i_8
       (.I0(time_out_counter_reg[5]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[4]),
        .O(time_out_2ms_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_2ms_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_2ms_i_1_n_0),
        .Q(time_out_2ms_reg_n_0),
        .R(reset_time_out_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_1 
       (.I0(time_out_2ms),
        .O(time_out_counter));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_3__0 
       (.I0(time_out_counter_reg[0]),
        .O(\time_out_counter[0]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[0] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2__0_n_7 ),
        .Q(time_out_counter_reg[0]),
        .R(reset_time_out_reg_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\time_out_counter_reg[0]_i_2__0_n_0 ,\time_out_counter_reg[0]_i_2__0_n_1 ,\time_out_counter_reg[0]_i_2__0_n_2 ,\time_out_counter_reg[0]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\time_out_counter_reg[0]_i_2__0_n_4 ,\time_out_counter_reg[0]_i_2__0_n_5 ,\time_out_counter_reg[0]_i_2__0_n_6 ,\time_out_counter_reg[0]_i_2__0_n_7 }),
        .S({time_out_counter_reg[3:1],\time_out_counter[0]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[10] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1__0_n_5 ),
        .Q(time_out_counter_reg[10]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[11] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1__0_n_4 ),
        .Q(time_out_counter_reg[11]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[12] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1__0_n_7 ),
        .Q(time_out_counter_reg[12]),
        .R(reset_time_out_reg_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[12]_i_1__0 
       (.CI(\time_out_counter_reg[8]_i_1__0_n_0 ),
        .CO({\time_out_counter_reg[12]_i_1__0_n_0 ,\time_out_counter_reg[12]_i_1__0_n_1 ,\time_out_counter_reg[12]_i_1__0_n_2 ,\time_out_counter_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[12]_i_1__0_n_4 ,\time_out_counter_reg[12]_i_1__0_n_5 ,\time_out_counter_reg[12]_i_1__0_n_6 ,\time_out_counter_reg[12]_i_1__0_n_7 }),
        .S(time_out_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[13] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1__0_n_6 ),
        .Q(time_out_counter_reg[13]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[14] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1__0_n_5 ),
        .Q(time_out_counter_reg[14]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[15] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1__0_n_4 ),
        .Q(time_out_counter_reg[15]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[16] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1__0_n_7 ),
        .Q(time_out_counter_reg[16]),
        .R(reset_time_out_reg_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[16]_i_1__0 
       (.CI(\time_out_counter_reg[12]_i_1__0_n_0 ),
        .CO({\NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED [3:2],\time_out_counter_reg[16]_i_1__0_n_2 ,\time_out_counter_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED [3],\time_out_counter_reg[16]_i_1__0_n_5 ,\time_out_counter_reg[16]_i_1__0_n_6 ,\time_out_counter_reg[16]_i_1__0_n_7 }),
        .S({1'b0,time_out_counter_reg[18:16]}));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[17] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1__0_n_6 ),
        .Q(time_out_counter_reg[17]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[18] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1__0_n_5 ),
        .Q(time_out_counter_reg[18]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[1] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2__0_n_6 ),
        .Q(time_out_counter_reg[1]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[2] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2__0_n_5 ),
        .Q(time_out_counter_reg[2]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[3] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2__0_n_4 ),
        .Q(time_out_counter_reg[3]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[4] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1__0_n_7 ),
        .Q(time_out_counter_reg[4]),
        .R(reset_time_out_reg_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[4]_i_1__0 
       (.CI(\time_out_counter_reg[0]_i_2__0_n_0 ),
        .CO({\time_out_counter_reg[4]_i_1__0_n_0 ,\time_out_counter_reg[4]_i_1__0_n_1 ,\time_out_counter_reg[4]_i_1__0_n_2 ,\time_out_counter_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[4]_i_1__0_n_4 ,\time_out_counter_reg[4]_i_1__0_n_5 ,\time_out_counter_reg[4]_i_1__0_n_6 ,\time_out_counter_reg[4]_i_1__0_n_7 }),
        .S(time_out_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[5] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1__0_n_6 ),
        .Q(time_out_counter_reg[5]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[6] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1__0_n_5 ),
        .Q(time_out_counter_reg[6]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[7] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1__0_n_4 ),
        .Q(time_out_counter_reg[7]),
        .R(reset_time_out_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[8] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1__0_n_7 ),
        .Q(time_out_counter_reg[8]),
        .R(reset_time_out_reg_n_0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[8]_i_1__0 
       (.CI(\time_out_counter_reg[4]_i_1__0_n_0 ),
        .CO({\time_out_counter_reg[8]_i_1__0_n_0 ,\time_out_counter_reg[8]_i_1__0_n_1 ,\time_out_counter_reg[8]_i_1__0_n_2 ,\time_out_counter_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[8]_i_1__0_n_4 ,\time_out_counter_reg[8]_i_1__0_n_5 ,\time_out_counter_reg[8]_i_1__0_n_6 ,\time_out_counter_reg[8]_i_1__0_n_7 }),
        .S(time_out_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[9] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1__0_n_6 ),
        .Q(time_out_counter_reg[9]),
        .R(reset_time_out_reg_n_0));
  LUT4 #(
    .INIT(16'hAB00)) 
    time_out_wait_bypass_i_1
       (.I0(time_out_wait_bypass_reg_n_0),
        .I1(rx_fsm_reset_done_int_s3),
        .I2(time_out_wait_bypass_i_2__0_n_0),
        .I3(run_phase_alignment_int_s3_reg_n_0),
        .O(time_out_wait_bypass_i_1_n_0));
  LUT5 #(
    .INIT(32'hFBFFFFFF)) 
    time_out_wait_bypass_i_2__0
       (.I0(time_out_wait_bypass_i_3__0_n_0),
        .I1(wait_bypass_count_reg[1]),
        .I2(wait_bypass_count_reg[11]),
        .I3(wait_bypass_count_reg[0]),
        .I4(time_out_wait_bypass_i_4__0_n_0),
        .O(time_out_wait_bypass_i_2__0_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    time_out_wait_bypass_i_3__0
       (.I0(wait_bypass_count_reg[9]),
        .I1(wait_bypass_count_reg[4]),
        .I2(wait_bypass_count_reg[12]),
        .I3(wait_bypass_count_reg[2]),
        .O(time_out_wait_bypass_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    time_out_wait_bypass_i_4__0
       (.I0(wait_bypass_count_reg[5]),
        .I1(wait_bypass_count_reg[7]),
        .I2(wait_bypass_count_reg[3]),
        .I3(wait_bypass_count_reg[6]),
        .I4(wait_bypass_count_reg[10]),
        .I5(wait_bypass_count_reg[8]),
        .O(time_out_wait_bypass_i_4__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_reg
       (.C(userclk),
        .CE(1'b1),
        .D(time_out_wait_bypass_i_1_n_0),
        .Q(time_out_wait_bypass_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_s3_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF8F0000)) 
    time_tlock_max_i_1
       (.I0(time_tlock_max_i_2_n_0),
        .I1(time_out_counter_reg[14]),
        .I2(time_tlock_max_i_3_n_0),
        .I3(time_out_counter_reg[15]),
        .I4(check_tlock_max_reg_n_0),
        .I5(time_tlock_max),
        .O(time_tlock_max_i_1_n_0));
  LUT6 #(
    .INIT(64'hEEFEFEFEEEFEEEFE)) 
    time_tlock_max_i_2
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[12]),
        .I2(time_tlock_max_i_4_n_0),
        .I3(time_tlock_max_i_5_n_0),
        .I4(time_tlock_max_i_6_n_0),
        .I5(time_out_counter_reg[5]),
        .O(time_tlock_max_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'h01)) 
    time_tlock_max_i_3
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[17]),
        .I2(time_out_counter_reg[18]),
        .O(time_tlock_max_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'h80)) 
    time_tlock_max_i_4
       (.I0(time_out_counter_reg[11]),
        .I1(time_out_counter_reg[10]),
        .I2(time_out_counter_reg[9]),
        .O(time_tlock_max_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'h01)) 
    time_tlock_max_i_5
       (.I0(time_out_counter_reg[8]),
        .I1(time_out_counter_reg[7]),
        .I2(time_out_counter_reg[6]),
        .O(time_tlock_max_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    time_tlock_max_i_6
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[1]),
        .I2(time_out_counter_reg[2]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[3]),
        .O(time_tlock_max_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_tlock_max_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_tlock_max_i_1_n_0),
        .Q(time_tlock_max),
        .R(reset_time_out_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_1__0 
       (.I0(run_phase_alignment_int_s3_reg_n_0),
        .O(\wait_bypass_count[0]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \wait_bypass_count[0]_i_2__0 
       (.I0(time_out_wait_bypass_i_2__0_n_0),
        .I1(rx_fsm_reset_done_int_s3),
        .O(\wait_bypass_count[0]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_4 
       (.I0(wait_bypass_count_reg[0]),
        .O(\wait_bypass_count[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[0] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3__0_n_7 ),
        .Q(wait_bypass_count_reg[0]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[0]_i_3__0 
       (.CI(1'b0),
        .CO({\wait_bypass_count_reg[0]_i_3__0_n_0 ,\wait_bypass_count_reg[0]_i_3__0_n_1 ,\wait_bypass_count_reg[0]_i_3__0_n_2 ,\wait_bypass_count_reg[0]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wait_bypass_count_reg[0]_i_3__0_n_4 ,\wait_bypass_count_reg[0]_i_3__0_n_5 ,\wait_bypass_count_reg[0]_i_3__0_n_6 ,\wait_bypass_count_reg[0]_i_3__0_n_7 }),
        .S({wait_bypass_count_reg[3:1],\wait_bypass_count[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[10] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1__0_n_5 ),
        .Q(wait_bypass_count_reg[10]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[11] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1__0_n_4 ),
        .Q(wait_bypass_count_reg[11]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[12] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1__0_n_7 ),
        .Q(wait_bypass_count_reg[12]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[12]_i_1__0 
       (.CI(\wait_bypass_count_reg[8]_i_1__0_n_0 ),
        .CO(\NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED [3:1],\wait_bypass_count_reg[12]_i_1__0_n_7 }),
        .S({1'b0,1'b0,1'b0,wait_bypass_count_reg[12]}));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[1] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3__0_n_6 ),
        .Q(wait_bypass_count_reg[1]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[2] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3__0_n_5 ),
        .Q(wait_bypass_count_reg[2]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[3] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3__0_n_4 ),
        .Q(wait_bypass_count_reg[3]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[4] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1__0_n_7 ),
        .Q(wait_bypass_count_reg[4]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[4]_i_1__0 
       (.CI(\wait_bypass_count_reg[0]_i_3__0_n_0 ),
        .CO({\wait_bypass_count_reg[4]_i_1__0_n_0 ,\wait_bypass_count_reg[4]_i_1__0_n_1 ,\wait_bypass_count_reg[4]_i_1__0_n_2 ,\wait_bypass_count_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[4]_i_1__0_n_4 ,\wait_bypass_count_reg[4]_i_1__0_n_5 ,\wait_bypass_count_reg[4]_i_1__0_n_6 ,\wait_bypass_count_reg[4]_i_1__0_n_7 }),
        .S(wait_bypass_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[5] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1__0_n_6 ),
        .Q(wait_bypass_count_reg[5]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[6] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1__0_n_5 ),
        .Q(wait_bypass_count_reg[6]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[7] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1__0_n_4 ),
        .Q(wait_bypass_count_reg[7]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[8] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1__0_n_7 ),
        .Q(wait_bypass_count_reg[8]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[8]_i_1__0 
       (.CI(\wait_bypass_count_reg[4]_i_1__0_n_0 ),
        .CO({\wait_bypass_count_reg[8]_i_1__0_n_0 ,\wait_bypass_count_reg[8]_i_1__0_n_1 ,\wait_bypass_count_reg[8]_i_1__0_n_2 ,\wait_bypass_count_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[8]_i_1__0_n_4 ,\wait_bypass_count_reg[8]_i_1__0_n_5 ,\wait_bypass_count_reg[8]_i_1__0_n_6 ,\wait_bypass_count_reg[8]_i_1__0_n_7 }),
        .S(wait_bypass_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[9] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2__0_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1__0_n_6 ),
        .Q(wait_bypass_count_reg[9]),
        .R(\wait_bypass_count[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \wait_time_cnt[0]_i_1 
       (.I0(rx_state[3]),
        .I1(rx_state[0]),
        .I2(rx_state[1]),
        .O(\wait_time_cnt[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_10__0 
       (.I0(wait_time_cnt_reg[1]),
        .O(\wait_time_cnt[0]_i_10__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_11__0 
       (.I0(wait_time_cnt_reg[0]),
        .O(\wait_time_cnt[0]_i_11__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_2__0 
       (.I0(\wait_time_cnt[0]_i_4__0_n_0 ),
        .I1(\wait_time_cnt[0]_i_5__0_n_0 ),
        .I2(\wait_time_cnt[0]_i_6__0_n_0 ),
        .I3(\wait_time_cnt[0]_i_7__0_n_0 ),
        .O(\wait_time_cnt[0]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_4__0 
       (.I0(wait_time_cnt_reg[12]),
        .I1(wait_time_cnt_reg[0]),
        .I2(wait_time_cnt_reg[13]),
        .I3(wait_time_cnt_reg[3]),
        .O(\wait_time_cnt[0]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_5__0 
       (.I0(wait_time_cnt_reg[15]),
        .I1(wait_time_cnt_reg[14]),
        .I2(wait_time_cnt_reg[10]),
        .I3(wait_time_cnt_reg[9]),
        .O(\wait_time_cnt[0]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_6__0 
       (.I0(wait_time_cnt_reg[8]),
        .I1(wait_time_cnt_reg[1]),
        .I2(wait_time_cnt_reg[5]),
        .I3(wait_time_cnt_reg[2]),
        .O(\wait_time_cnt[0]_i_6__0_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_7__0 
       (.I0(wait_time_cnt_reg[11]),
        .I1(wait_time_cnt_reg[6]),
        .I2(wait_time_cnt_reg[7]),
        .I3(wait_time_cnt_reg[4]),
        .O(\wait_time_cnt[0]_i_7__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_8__0 
       (.I0(wait_time_cnt_reg[3]),
        .O(\wait_time_cnt[0]_i_8__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_9__0 
       (.I0(wait_time_cnt_reg[2]),
        .O(\wait_time_cnt[0]_i_9__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_2__0 
       (.I0(wait_time_cnt_reg[15]),
        .O(\wait_time_cnt[12]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_3__0 
       (.I0(wait_time_cnt_reg[14]),
        .O(\wait_time_cnt[12]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_4__0 
       (.I0(wait_time_cnt_reg[13]),
        .O(\wait_time_cnt[12]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_5__0 
       (.I0(wait_time_cnt_reg[12]),
        .O(\wait_time_cnt[12]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_2__0 
       (.I0(wait_time_cnt_reg[7]),
        .O(\wait_time_cnt[4]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_3__0 
       (.I0(wait_time_cnt_reg[6]),
        .O(\wait_time_cnt[4]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_4__0 
       (.I0(wait_time_cnt_reg[5]),
        .O(\wait_time_cnt[4]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_5__0 
       (.I0(wait_time_cnt_reg[4]),
        .O(\wait_time_cnt[4]_i_5__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_2__0 
       (.I0(wait_time_cnt_reg[11]),
        .O(\wait_time_cnt[8]_i_2__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_3__0 
       (.I0(wait_time_cnt_reg[10]),
        .O(\wait_time_cnt[8]_i_3__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_4__0 
       (.I0(wait_time_cnt_reg[9]),
        .O(\wait_time_cnt[8]_i_4__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_5__0 
       (.I0(wait_time_cnt_reg[8]),
        .O(\wait_time_cnt[8]_i_5__0_n_0 ));
  FDRE \wait_time_cnt_reg[0] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[0]_i_3__0_n_7 ),
        .Q(wait_time_cnt_reg[0]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[0]_i_3__0 
       (.CI(1'b0),
        .CO({\wait_time_cnt_reg[0]_i_3__0_n_0 ,\wait_time_cnt_reg[0]_i_3__0_n_1 ,\wait_time_cnt_reg[0]_i_3__0_n_2 ,\wait_time_cnt_reg[0]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[0]_i_3__0_n_4 ,\wait_time_cnt_reg[0]_i_3__0_n_5 ,\wait_time_cnt_reg[0]_i_3__0_n_6 ,\wait_time_cnt_reg[0]_i_3__0_n_7 }),
        .S({\wait_time_cnt[0]_i_8__0_n_0 ,\wait_time_cnt[0]_i_9__0_n_0 ,\wait_time_cnt[0]_i_10__0_n_0 ,\wait_time_cnt[0]_i_11__0_n_0 }));
  FDSE \wait_time_cnt_reg[10] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[8]_i_1__0_n_5 ),
        .Q(wait_time_cnt_reg[10]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[11] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[8]_i_1__0_n_4 ),
        .Q(wait_time_cnt_reg[11]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[12] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[12]_i_1__0_n_7 ),
        .Q(wait_time_cnt_reg[12]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[12]_i_1__0 
       (.CI(\wait_time_cnt_reg[8]_i_1__0_n_0 ),
        .CO({\NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED [3],\wait_time_cnt_reg[12]_i_1__0_n_1 ,\wait_time_cnt_reg[12]_i_1__0_n_2 ,\wait_time_cnt_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[12]_i_1__0_n_4 ,\wait_time_cnt_reg[12]_i_1__0_n_5 ,\wait_time_cnt_reg[12]_i_1__0_n_6 ,\wait_time_cnt_reg[12]_i_1__0_n_7 }),
        .S({\wait_time_cnt[12]_i_2__0_n_0 ,\wait_time_cnt[12]_i_3__0_n_0 ,\wait_time_cnt[12]_i_4__0_n_0 ,\wait_time_cnt[12]_i_5__0_n_0 }));
  FDRE \wait_time_cnt_reg[13] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[12]_i_1__0_n_6 ),
        .Q(wait_time_cnt_reg[13]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[14] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[12]_i_1__0_n_5 ),
        .Q(wait_time_cnt_reg[14]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[15] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[12]_i_1__0_n_4 ),
        .Q(wait_time_cnt_reg[15]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[1] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[0]_i_3__0_n_6 ),
        .Q(wait_time_cnt_reg[1]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[2] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[0]_i_3__0_n_5 ),
        .Q(wait_time_cnt_reg[2]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDRE \wait_time_cnt_reg[3] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[0]_i_3__0_n_4 ),
        .Q(wait_time_cnt_reg[3]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[4] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[4]_i_1__0_n_7 ),
        .Q(wait_time_cnt_reg[4]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[4]_i_1__0 
       (.CI(\wait_time_cnt_reg[0]_i_3__0_n_0 ),
        .CO({\wait_time_cnt_reg[4]_i_1__0_n_0 ,\wait_time_cnt_reg[4]_i_1__0_n_1 ,\wait_time_cnt_reg[4]_i_1__0_n_2 ,\wait_time_cnt_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[4]_i_1__0_n_4 ,\wait_time_cnt_reg[4]_i_1__0_n_5 ,\wait_time_cnt_reg[4]_i_1__0_n_6 ,\wait_time_cnt_reg[4]_i_1__0_n_7 }),
        .S({\wait_time_cnt[4]_i_2__0_n_0 ,\wait_time_cnt[4]_i_3__0_n_0 ,\wait_time_cnt[4]_i_4__0_n_0 ,\wait_time_cnt[4]_i_5__0_n_0 }));
  FDRE \wait_time_cnt_reg[5] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[4]_i_1__0_n_6 ),
        .Q(wait_time_cnt_reg[5]),
        .R(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[6] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[4]_i_1__0_n_5 ),
        .Q(wait_time_cnt_reg[6]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[7] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[4]_i_1__0_n_4 ),
        .Q(wait_time_cnt_reg[7]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  FDSE \wait_time_cnt_reg[8] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[8]_i_1__0_n_7 ),
        .Q(wait_time_cnt_reg[8]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[8]_i_1__0 
       (.CI(\wait_time_cnt_reg[4]_i_1__0_n_0 ),
        .CO({\wait_time_cnt_reg[8]_i_1__0_n_0 ,\wait_time_cnt_reg[8]_i_1__0_n_1 ,\wait_time_cnt_reg[8]_i_1__0_n_2 ,\wait_time_cnt_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[8]_i_1__0_n_4 ,\wait_time_cnt_reg[8]_i_1__0_n_5 ,\wait_time_cnt_reg[8]_i_1__0_n_6 ,\wait_time_cnt_reg[8]_i_1__0_n_7 }),
        .S({\wait_time_cnt[8]_i_2__0_n_0 ,\wait_time_cnt[8]_i_3__0_n_0 ,\wait_time_cnt[8]_i_4__0_n_0 ,\wait_time_cnt[8]_i_5__0_n_0 }));
  FDSE \wait_time_cnt_reg[9] 
       (.C(independent_clock_bufg),
        .CE(\wait_time_cnt[0]_i_2__0_n_0 ),
        .D(\wait_time_cnt_reg[8]_i_1__0_n_6 ),
        .Q(wait_time_cnt_reg[9]),
        .S(\wait_time_cnt[0]_i_1_n_0 ));
endmodule

module gig_ethernet_pcs_pma_0_TX_STARTUP_FSM
   (mmcm_reset,
    gt0_cpllreset_i,
    data_in,
    gt0_txuserrdy_i,
    gt0_gttxreset_gt,
    independent_clock_bufg,
    userclk,
    pma_reset,
    gt0_cpllrefclklost_i,
    gtxe2_i,
    data_sync_reg1,
    mmcm_locked,
    cplllock);
  output mmcm_reset;
  output gt0_cpllreset_i;
  output data_in;
  output gt0_txuserrdy_i;
  output gt0_gttxreset_gt;
  input independent_clock_bufg;
  input userclk;
  input pma_reset;
  input gt0_cpllrefclklost_i;
  input gtxe2_i;
  input data_sync_reg1;
  input mmcm_locked;
  input cplllock;

  wire CPLL_RESET0;
  wire CPLL_RESET_i_1_n_0;
  wire \FSM_sequential_tx_state[0]_i_2_n_0 ;
  wire \FSM_sequential_tx_state[1]_i_2_n_0 ;
  wire \FSM_sequential_tx_state[2]_i_1_n_0 ;
  wire \FSM_sequential_tx_state[2]_i_2_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_4_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_5_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_7_n_0 ;
  wire MMCM_RESET_i_1_n_0;
  wire TXUSERRDY_i_1_n_0;
  wire clear;
  wire cplllock;
  wire data_in;
  wire data_sync_reg1;
  wire gt0_cpllrefclklost_i;
  wire gt0_cpllreset_i;
  wire gt0_gttxreset_gt;
  wire gt0_gttxreset_t;
  wire gt0_txuserrdy_i;
  wire gttxreset_i_i_1_n_0;
  wire gtxe2_i;
  wire independent_clock_bufg;
  wire init_wait_count;
  wire \init_wait_count[0]_i_1_n_0 ;
  wire \init_wait_count[7]_i_3_n_0 ;
  wire \init_wait_count[7]_i_4_n_0 ;
  wire [7:0]init_wait_count_reg;
  wire init_wait_done_i_1_n_0;
  wire init_wait_done_reg_n_0;
  wire \mmcm_lock_count[7]_i_2_n_0 ;
  wire [7:0]mmcm_lock_count_reg;
  wire mmcm_lock_i;
  wire mmcm_lock_reclocked;
  wire mmcm_lock_reclocked_i_1_n_0;
  wire mmcm_lock_reclocked_i_2_n_0;
  wire mmcm_locked;
  wire mmcm_reset;
  wire [7:1]p_0_in__1;
  wire [7:0]p_0_in__2;
  wire pll_reset_asserted_i_1_n_0;
  wire pll_reset_asserted_i_2_n_0;
  wire pll_reset_asserted_reg_n_0;
  wire pma_reset;
  wire refclk_stable_count;
  wire \refclk_stable_count[0]_i_3_n_0 ;
  wire \refclk_stable_count[0]_i_4_n_0 ;
  wire \refclk_stable_count[0]_i_5_n_0 ;
  wire \refclk_stable_count[0]_i_6_n_0 ;
  wire \refclk_stable_count[0]_i_7_n_0 ;
  wire [19:0]refclk_stable_count_reg;
  wire \refclk_stable_count_reg[0]_i_2_n_0 ;
  wire \refclk_stable_count_reg[0]_i_2_n_1 ;
  wire \refclk_stable_count_reg[0]_i_2_n_2 ;
  wire \refclk_stable_count_reg[0]_i_2_n_3 ;
  wire \refclk_stable_count_reg[0]_i_2_n_4 ;
  wire \refclk_stable_count_reg[0]_i_2_n_5 ;
  wire \refclk_stable_count_reg[0]_i_2_n_6 ;
  wire \refclk_stable_count_reg[0]_i_2_n_7 ;
  wire \refclk_stable_count_reg[12]_i_1_n_0 ;
  wire \refclk_stable_count_reg[12]_i_1_n_1 ;
  wire \refclk_stable_count_reg[12]_i_1_n_2 ;
  wire \refclk_stable_count_reg[12]_i_1_n_3 ;
  wire \refclk_stable_count_reg[12]_i_1_n_4 ;
  wire \refclk_stable_count_reg[12]_i_1_n_5 ;
  wire \refclk_stable_count_reg[12]_i_1_n_6 ;
  wire \refclk_stable_count_reg[12]_i_1_n_7 ;
  wire \refclk_stable_count_reg[16]_i_1_n_1 ;
  wire \refclk_stable_count_reg[16]_i_1_n_2 ;
  wire \refclk_stable_count_reg[16]_i_1_n_3 ;
  wire \refclk_stable_count_reg[16]_i_1_n_4 ;
  wire \refclk_stable_count_reg[16]_i_1_n_5 ;
  wire \refclk_stable_count_reg[16]_i_1_n_6 ;
  wire \refclk_stable_count_reg[16]_i_1_n_7 ;
  wire \refclk_stable_count_reg[4]_i_1_n_0 ;
  wire \refclk_stable_count_reg[4]_i_1_n_1 ;
  wire \refclk_stable_count_reg[4]_i_1_n_2 ;
  wire \refclk_stable_count_reg[4]_i_1_n_3 ;
  wire \refclk_stable_count_reg[4]_i_1_n_4 ;
  wire \refclk_stable_count_reg[4]_i_1_n_5 ;
  wire \refclk_stable_count_reg[4]_i_1_n_6 ;
  wire \refclk_stable_count_reg[4]_i_1_n_7 ;
  wire \refclk_stable_count_reg[8]_i_1_n_0 ;
  wire \refclk_stable_count_reg[8]_i_1_n_1 ;
  wire \refclk_stable_count_reg[8]_i_1_n_2 ;
  wire \refclk_stable_count_reg[8]_i_1_n_3 ;
  wire \refclk_stable_count_reg[8]_i_1_n_4 ;
  wire \refclk_stable_count_reg[8]_i_1_n_5 ;
  wire \refclk_stable_count_reg[8]_i_1_n_6 ;
  wire \refclk_stable_count_reg[8]_i_1_n_7 ;
  wire refclk_stable_i_1_n_0;
  wire refclk_stable_reg_n_0;
  wire reset_time_out;
  wire reset_time_out_i_3_n_0;
  wire run_phase_alignment_int_i_1_n_0;
  wire run_phase_alignment_int_reg_n_0;
  wire run_phase_alignment_int_s2;
  wire run_phase_alignment_int_s3;
  wire sel;
  wire sync_cplllock_n_0;
  wire sync_cplllock_n_1;
  wire sync_mmcm_lock_reclocked_n_0;
  wire time_out_2ms;
  wire time_out_2ms_i_1_n_0;
  wire time_out_2ms_i_3_n_0;
  wire time_out_2ms_i_4_n_0;
  wire time_out_2ms_i_5_n_0;
  wire time_out_2ms_i_6_n_0;
  wire time_out_2ms_reg_n_0;
  wire time_out_500us_i_1_n_0;
  wire time_out_500us_i_2_n_0;
  wire time_out_500us_i_3_n_0;
  wire time_out_500us_reg_n_0;
  wire time_out_counter;
  wire \time_out_counter[0]_i_3_n_0 ;
  wire [18:0]time_out_counter_reg;
  wire \time_out_counter_reg[0]_i_2_n_0 ;
  wire \time_out_counter_reg[0]_i_2_n_1 ;
  wire \time_out_counter_reg[0]_i_2_n_2 ;
  wire \time_out_counter_reg[0]_i_2_n_3 ;
  wire \time_out_counter_reg[0]_i_2_n_4 ;
  wire \time_out_counter_reg[0]_i_2_n_5 ;
  wire \time_out_counter_reg[0]_i_2_n_6 ;
  wire \time_out_counter_reg[0]_i_2_n_7 ;
  wire \time_out_counter_reg[12]_i_1_n_0 ;
  wire \time_out_counter_reg[12]_i_1_n_1 ;
  wire \time_out_counter_reg[12]_i_1_n_2 ;
  wire \time_out_counter_reg[12]_i_1_n_3 ;
  wire \time_out_counter_reg[12]_i_1_n_4 ;
  wire \time_out_counter_reg[12]_i_1_n_5 ;
  wire \time_out_counter_reg[12]_i_1_n_6 ;
  wire \time_out_counter_reg[12]_i_1_n_7 ;
  wire \time_out_counter_reg[16]_i_1_n_2 ;
  wire \time_out_counter_reg[16]_i_1_n_3 ;
  wire \time_out_counter_reg[16]_i_1_n_5 ;
  wire \time_out_counter_reg[16]_i_1_n_6 ;
  wire \time_out_counter_reg[16]_i_1_n_7 ;
  wire \time_out_counter_reg[4]_i_1_n_0 ;
  wire \time_out_counter_reg[4]_i_1_n_1 ;
  wire \time_out_counter_reg[4]_i_1_n_2 ;
  wire \time_out_counter_reg[4]_i_1_n_3 ;
  wire \time_out_counter_reg[4]_i_1_n_4 ;
  wire \time_out_counter_reg[4]_i_1_n_5 ;
  wire \time_out_counter_reg[4]_i_1_n_6 ;
  wire \time_out_counter_reg[4]_i_1_n_7 ;
  wire \time_out_counter_reg[8]_i_1_n_0 ;
  wire \time_out_counter_reg[8]_i_1_n_1 ;
  wire \time_out_counter_reg[8]_i_1_n_2 ;
  wire \time_out_counter_reg[8]_i_1_n_3 ;
  wire \time_out_counter_reg[8]_i_1_n_4 ;
  wire \time_out_counter_reg[8]_i_1_n_5 ;
  wire \time_out_counter_reg[8]_i_1_n_6 ;
  wire \time_out_counter_reg[8]_i_1_n_7 ;
  wire time_out_wait_bypass_i_1_n_0;
  wire time_out_wait_bypass_i_2_n_0;
  wire time_out_wait_bypass_i_3_n_0;
  wire time_out_wait_bypass_i_4_n_0;
  wire time_out_wait_bypass_i_5_n_0;
  wire time_out_wait_bypass_reg_n_0;
  wire time_out_wait_bypass_s2;
  wire time_out_wait_bypass_s3;
  wire time_tlock_max_i_1_n_0;
  wire time_tlock_max_i_2__0_n_0;
  wire time_tlock_max_i_3__0_n_0;
  wire time_tlock_max_i_4__0_n_0;
  wire time_tlock_max_i_5__0_n_0;
  wire time_tlock_max_reg_n_0;
  wire tx_fsm_reset_done_int_i_1_n_0;
  wire tx_fsm_reset_done_int_s2;
  wire tx_fsm_reset_done_int_s3;
  wire [3:0]tx_state;
  wire [3:0]tx_state__0;
  wire txresetdone_s2;
  wire txresetdone_s3;
  wire userclk;
  wire \wait_bypass_count[0]_i_2_n_0 ;
  wire \wait_bypass_count[0]_i_4__0_n_0 ;
  wire [16:0]wait_bypass_count_reg;
  wire \wait_bypass_count_reg[0]_i_3_n_0 ;
  wire \wait_bypass_count_reg[0]_i_3_n_1 ;
  wire \wait_bypass_count_reg[0]_i_3_n_2 ;
  wire \wait_bypass_count_reg[0]_i_3_n_3 ;
  wire \wait_bypass_count_reg[0]_i_3_n_4 ;
  wire \wait_bypass_count_reg[0]_i_3_n_5 ;
  wire \wait_bypass_count_reg[0]_i_3_n_6 ;
  wire \wait_bypass_count_reg[0]_i_3_n_7 ;
  wire \wait_bypass_count_reg[12]_i_1_n_0 ;
  wire \wait_bypass_count_reg[12]_i_1_n_1 ;
  wire \wait_bypass_count_reg[12]_i_1_n_2 ;
  wire \wait_bypass_count_reg[12]_i_1_n_3 ;
  wire \wait_bypass_count_reg[12]_i_1_n_4 ;
  wire \wait_bypass_count_reg[12]_i_1_n_5 ;
  wire \wait_bypass_count_reg[12]_i_1_n_6 ;
  wire \wait_bypass_count_reg[12]_i_1_n_7 ;
  wire \wait_bypass_count_reg[16]_i_1_n_7 ;
  wire \wait_bypass_count_reg[4]_i_1_n_0 ;
  wire \wait_bypass_count_reg[4]_i_1_n_1 ;
  wire \wait_bypass_count_reg[4]_i_1_n_2 ;
  wire \wait_bypass_count_reg[4]_i_1_n_3 ;
  wire \wait_bypass_count_reg[4]_i_1_n_4 ;
  wire \wait_bypass_count_reg[4]_i_1_n_5 ;
  wire \wait_bypass_count_reg[4]_i_1_n_6 ;
  wire \wait_bypass_count_reg[4]_i_1_n_7 ;
  wire \wait_bypass_count_reg[8]_i_1_n_0 ;
  wire \wait_bypass_count_reg[8]_i_1_n_1 ;
  wire \wait_bypass_count_reg[8]_i_1_n_2 ;
  wire \wait_bypass_count_reg[8]_i_1_n_3 ;
  wire \wait_bypass_count_reg[8]_i_1_n_4 ;
  wire \wait_bypass_count_reg[8]_i_1_n_5 ;
  wire \wait_bypass_count_reg[8]_i_1_n_6 ;
  wire \wait_bypass_count_reg[8]_i_1_n_7 ;
  wire wait_time_cnt0;
  wire \wait_time_cnt[0]_i_10_n_0 ;
  wire \wait_time_cnt[0]_i_11_n_0 ;
  wire \wait_time_cnt[0]_i_4_n_0 ;
  wire \wait_time_cnt[0]_i_5_n_0 ;
  wire \wait_time_cnt[0]_i_6_n_0 ;
  wire \wait_time_cnt[0]_i_7_n_0 ;
  wire \wait_time_cnt[0]_i_8_n_0 ;
  wire \wait_time_cnt[0]_i_9_n_0 ;
  wire \wait_time_cnt[12]_i_2_n_0 ;
  wire \wait_time_cnt[12]_i_3_n_0 ;
  wire \wait_time_cnt[12]_i_4_n_0 ;
  wire \wait_time_cnt[12]_i_5_n_0 ;
  wire \wait_time_cnt[4]_i_2_n_0 ;
  wire \wait_time_cnt[4]_i_3_n_0 ;
  wire \wait_time_cnt[4]_i_4_n_0 ;
  wire \wait_time_cnt[4]_i_5_n_0 ;
  wire \wait_time_cnt[8]_i_2_n_0 ;
  wire \wait_time_cnt[8]_i_3_n_0 ;
  wire \wait_time_cnt[8]_i_4_n_0 ;
  wire \wait_time_cnt[8]_i_5_n_0 ;
  wire [15:0]wait_time_cnt_reg;
  wire \wait_time_cnt_reg[0]_i_3_n_0 ;
  wire \wait_time_cnt_reg[0]_i_3_n_1 ;
  wire \wait_time_cnt_reg[0]_i_3_n_2 ;
  wire \wait_time_cnt_reg[0]_i_3_n_3 ;
  wire \wait_time_cnt_reg[0]_i_3_n_4 ;
  wire \wait_time_cnt_reg[0]_i_3_n_5 ;
  wire \wait_time_cnt_reg[0]_i_3_n_6 ;
  wire \wait_time_cnt_reg[0]_i_3_n_7 ;
  wire \wait_time_cnt_reg[12]_i_1_n_1 ;
  wire \wait_time_cnt_reg[12]_i_1_n_2 ;
  wire \wait_time_cnt_reg[12]_i_1_n_3 ;
  wire \wait_time_cnt_reg[12]_i_1_n_4 ;
  wire \wait_time_cnt_reg[12]_i_1_n_5 ;
  wire \wait_time_cnt_reg[12]_i_1_n_6 ;
  wire \wait_time_cnt_reg[12]_i_1_n_7 ;
  wire \wait_time_cnt_reg[4]_i_1_n_0 ;
  wire \wait_time_cnt_reg[4]_i_1_n_1 ;
  wire \wait_time_cnt_reg[4]_i_1_n_2 ;
  wire \wait_time_cnt_reg[4]_i_1_n_3 ;
  wire \wait_time_cnt_reg[4]_i_1_n_4 ;
  wire \wait_time_cnt_reg[4]_i_1_n_5 ;
  wire \wait_time_cnt_reg[4]_i_1_n_6 ;
  wire \wait_time_cnt_reg[4]_i_1_n_7 ;
  wire \wait_time_cnt_reg[8]_i_1_n_0 ;
  wire \wait_time_cnt_reg[8]_i_1_n_1 ;
  wire \wait_time_cnt_reg[8]_i_1_n_2 ;
  wire \wait_time_cnt_reg[8]_i_1_n_3 ;
  wire \wait_time_cnt_reg[8]_i_1_n_4 ;
  wire \wait_time_cnt_reg[8]_i_1_n_5 ;
  wire \wait_time_cnt_reg[8]_i_1_n_6 ;
  wire \wait_time_cnt_reg[8]_i_1_n_7 ;
  wire [3:3]\NLW_refclk_stable_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFEF00000020)) 
    CPLL_RESET_i_1
       (.I0(CPLL_RESET0),
        .I1(tx_state[2]),
        .I2(tx_state[0]),
        .I3(tx_state[1]),
        .I4(tx_state[3]),
        .I5(gt0_cpllreset_i),
        .O(CPLL_RESET_i_1_n_0));
  LUT3 #(
    .INIT(8'h57)) 
    CPLL_RESET_i_2
       (.I0(refclk_stable_reg_n_0),
        .I1(pll_reset_asserted_reg_n_0),
        .I2(gt0_cpllrefclklost_i),
        .O(CPLL_RESET0));
  FDRE #(
    .INIT(1'b0)) 
    CPLL_RESET_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(CPLL_RESET_i_1_n_0),
        .Q(gt0_cpllreset_i),
        .R(pma_reset));
  LUT6 #(
    .INIT(64'h00000000DDDDD555)) 
    \FSM_sequential_tx_state[0]_i_1 
       (.I0(\FSM_sequential_tx_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_tx_state[2]_i_2_n_0 ),
        .I2(tx_state[1]),
        .I3(time_out_2ms_reg_n_0),
        .I4(tx_state[2]),
        .I5(\FSM_sequential_tx_state[3]_i_5_n_0 ),
        .O(tx_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_tx_state[0]_i_2 
       (.I0(tx_state[0]),
        .I1(tx_state[3]),
        .O(\FSM_sequential_tx_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT5 #(
    .INIT(32'h00070F00)) 
    \FSM_sequential_tx_state[1]_i_1 
       (.I0(\FSM_sequential_tx_state[1]_i_2_n_0 ),
        .I1(tx_state[2]),
        .I2(tx_state[3]),
        .I3(tx_state[1]),
        .I4(tx_state[0]),
        .O(tx_state__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_tx_state[1]_i_2 
       (.I0(mmcm_lock_reclocked),
        .I1(time_tlock_max_reg_n_0),
        .I2(reset_time_out),
        .O(\FSM_sequential_tx_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0055100055555555)) 
    \FSM_sequential_tx_state[2]_i_1 
       (.I0(tx_state[3]),
        .I1(time_out_2ms_reg_n_0),
        .I2(tx_state[1]),
        .I3(tx_state[0]),
        .I4(tx_state[2]),
        .I5(\FSM_sequential_tx_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_tx_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT5 #(
    .INIT(32'hDDDDDFDD)) 
    \FSM_sequential_tx_state[2]_i_2 
       (.I0(tx_state[2]),
        .I1(tx_state[1]),
        .I2(reset_time_out),
        .I3(time_tlock_max_reg_n_0),
        .I4(mmcm_lock_reclocked),
        .O(\FSM_sequential_tx_state[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \FSM_sequential_tx_state[3]_i_2 
       (.I0(time_out_wait_bypass_s3),
        .I1(tx_state[3]),
        .I2(\FSM_sequential_tx_state[3]_i_5_n_0 ),
        .O(tx_state__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_tx_state[3]_i_4 
       (.I0(tx_state[2]),
        .I1(tx_state[1]),
        .O(\FSM_sequential_tx_state[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B0000000)) 
    \FSM_sequential_tx_state[3]_i_5 
       (.I0(reset_time_out),
        .I1(time_out_500us_reg_n_0),
        .I2(tx_state[2]),
        .I3(tx_state[1]),
        .I4(tx_state[0]),
        .I5(tx_state[3]),
        .O(\FSM_sequential_tx_state[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_tx_state[3]_i_7 
       (.I0(reset_time_out),
        .I1(time_tlock_max_reg_n_0),
        .O(\FSM_sequential_tx_state[3]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[0] 
       (.C(independent_clock_bufg),
        .CE(sync_cplllock_n_0),
        .D(tx_state__0[0]),
        .Q(tx_state[0]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[1] 
       (.C(independent_clock_bufg),
        .CE(sync_cplllock_n_0),
        .D(tx_state__0[1]),
        .Q(tx_state[1]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[2] 
       (.C(independent_clock_bufg),
        .CE(sync_cplllock_n_0),
        .D(\FSM_sequential_tx_state[2]_i_1_n_0 ),
        .Q(tx_state[2]),
        .R(pma_reset));
  (* FSM_ENCODED_STATES = "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_tx_state_reg[3] 
       (.C(independent_clock_bufg),
        .CE(sync_cplllock_n_0),
        .D(tx_state__0[3]),
        .Q(tx_state[3]),
        .R(pma_reset));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT5 #(
    .INIT(32'hFFF70004)) 
    MMCM_RESET_i_1
       (.I0(tx_state[2]),
        .I1(tx_state[0]),
        .I2(tx_state[1]),
        .I3(tx_state[3]),
        .I4(mmcm_reset),
        .O(MMCM_RESET_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    MMCM_RESET_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(MMCM_RESET_i_1_n_0),
        .Q(mmcm_reset),
        .R(pma_reset));
  LUT5 #(
    .INIT(32'hFFEF0080)) 
    TXUSERRDY_i_1
       (.I0(tx_state[2]),
        .I1(tx_state[1]),
        .I2(tx_state[0]),
        .I3(tx_state[3]),
        .I4(gt0_txuserrdy_i),
        .O(TXUSERRDY_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TXUSERRDY_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(TXUSERRDY_i_1_n_0),
        .Q(gt0_txuserrdy_i),
        .R(pma_reset));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT5 #(
    .INIT(32'hFFFB0002)) 
    gttxreset_i_i_1
       (.I0(tx_state[0]),
        .I1(tx_state[2]),
        .I2(tx_state[1]),
        .I3(tx_state[3]),
        .I4(gt0_gttxreset_t),
        .O(gttxreset_i_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    gttxreset_i_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(gttxreset_i_i_1_n_0),
        .Q(gt0_gttxreset_t),
        .R(pma_reset));
  LUT3 #(
    .INIT(8'hEA)) 
    gtxe2_i_i_3
       (.I0(gt0_gttxreset_t),
        .I1(data_in),
        .I2(gtxe2_i),
        .O(gt0_gttxreset_gt));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \init_wait_count[0]_i_1 
       (.I0(init_wait_count_reg[0]),
        .O(\init_wait_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[1]_i_1 
       (.I0(init_wait_count_reg[0]),
        .I1(init_wait_count_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \init_wait_count[2]_i_1 
       (.I0(init_wait_count_reg[2]),
        .I1(init_wait_count_reg[0]),
        .I2(init_wait_count_reg[1]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \init_wait_count[3]_i_1 
       (.I0(init_wait_count_reg[3]),
        .I1(init_wait_count_reg[1]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[2]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \init_wait_count[4]_i_1 
       (.I0(init_wait_count_reg[4]),
        .I1(init_wait_count_reg[2]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[1]),
        .I4(init_wait_count_reg[3]),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \init_wait_count[5]_i_1 
       (.I0(init_wait_count_reg[3]),
        .I1(init_wait_count_reg[1]),
        .I2(init_wait_count_reg[0]),
        .I3(init_wait_count_reg[2]),
        .I4(init_wait_count_reg[4]),
        .I5(init_wait_count_reg[5]),
        .O(p_0_in__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \init_wait_count[6]_i_1 
       (.I0(init_wait_count_reg[6]),
        .I1(\init_wait_count[7]_i_4_n_0 ),
        .O(p_0_in__1[6]));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \init_wait_count[7]_i_1 
       (.I0(\init_wait_count[7]_i_3_n_0 ),
        .I1(init_wait_count_reg[7]),
        .I2(init_wait_count_reg[4]),
        .I3(init_wait_count_reg[3]),
        .I4(init_wait_count_reg[2]),
        .O(init_wait_count));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \init_wait_count[7]_i_2 
       (.I0(init_wait_count_reg[7]),
        .I1(\init_wait_count[7]_i_4_n_0 ),
        .I2(init_wait_count_reg[6]),
        .O(p_0_in__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \init_wait_count[7]_i_3 
       (.I0(init_wait_count_reg[6]),
        .I1(init_wait_count_reg[1]),
        .I2(init_wait_count_reg[5]),
        .I3(init_wait_count_reg[0]),
        .O(\init_wait_count[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \init_wait_count[7]_i_4 
       (.I0(init_wait_count_reg[5]),
        .I1(init_wait_count_reg[4]),
        .I2(init_wait_count_reg[2]),
        .I3(init_wait_count_reg[0]),
        .I4(init_wait_count_reg[1]),
        .I5(init_wait_count_reg[3]),
        .O(\init_wait_count[7]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[0] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(\init_wait_count[0]_i_1_n_0 ),
        .Q(init_wait_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[1] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[1]),
        .Q(init_wait_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[2] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[2]),
        .Q(init_wait_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[3] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[3]),
        .Q(init_wait_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[4] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[4]),
        .Q(init_wait_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[5] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[5]),
        .Q(init_wait_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[6] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[6]),
        .Q(init_wait_count_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \init_wait_count_reg[7] 
       (.C(independent_clock_bufg),
        .CE(init_wait_count),
        .CLR(pma_reset),
        .D(p_0_in__1[7]),
        .Q(init_wait_count_reg[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFF01000000)) 
    init_wait_done_i_1
       (.I0(\init_wait_count[7]_i_3_n_0 ),
        .I1(init_wait_count_reg[7]),
        .I2(init_wait_count_reg[4]),
        .I3(init_wait_count_reg[3]),
        .I4(init_wait_count_reg[2]),
        .I5(init_wait_done_reg_n_0),
        .O(init_wait_done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    init_wait_done_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .CLR(pma_reset),
        .D(init_wait_done_i_1_n_0),
        .Q(init_wait_done_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[0]_i_1 
       (.I0(mmcm_lock_count_reg[0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[1]_i_1 
       (.I0(mmcm_lock_count_reg[1]),
        .I1(mmcm_lock_count_reg[0]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \mmcm_lock_count[2]_i_1 
       (.I0(mmcm_lock_count_reg[2]),
        .I1(mmcm_lock_count_reg[1]),
        .I2(mmcm_lock_count_reg[0]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \mmcm_lock_count[3]_i_1 
       (.I0(mmcm_lock_count_reg[3]),
        .I1(mmcm_lock_count_reg[0]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[2]),
        .O(p_0_in__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \mmcm_lock_count[4]_i_1 
       (.I0(mmcm_lock_count_reg[4]),
        .I1(mmcm_lock_count_reg[2]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[0]),
        .I4(mmcm_lock_count_reg[3]),
        .O(p_0_in__2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \mmcm_lock_count[5]_i_1 
       (.I0(mmcm_lock_count_reg[3]),
        .I1(mmcm_lock_count_reg[0]),
        .I2(mmcm_lock_count_reg[1]),
        .I3(mmcm_lock_count_reg[2]),
        .I4(mmcm_lock_count_reg[4]),
        .I5(mmcm_lock_count_reg[5]),
        .O(p_0_in__2[5]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mmcm_lock_count[6]_i_1 
       (.I0(mmcm_lock_count_reg[6]),
        .I1(mmcm_lock_reclocked_i_2_n_0),
        .O(p_0_in__2[6]));
  LUT3 #(
    .INIT(8'h7F)) 
    \mmcm_lock_count[7]_i_2 
       (.I0(mmcm_lock_count_reg[6]),
        .I1(mmcm_lock_reclocked_i_2_n_0),
        .I2(mmcm_lock_count_reg[7]),
        .O(\mmcm_lock_count[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \mmcm_lock_count[7]_i_3 
       (.I0(mmcm_lock_count_reg[7]),
        .I1(mmcm_lock_reclocked_i_2_n_0),
        .I2(mmcm_lock_count_reg[6]),
        .O(p_0_in__2[7]));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[0] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[0]),
        .Q(mmcm_lock_count_reg[0]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[1] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[1]),
        .Q(mmcm_lock_count_reg[1]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[2] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[2]),
        .Q(mmcm_lock_count_reg[2]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[3] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[3]),
        .Q(mmcm_lock_count_reg[3]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[4] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[4]),
        .Q(mmcm_lock_count_reg[4]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[5] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[5]),
        .Q(mmcm_lock_count_reg[5]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[6] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[6]),
        .Q(mmcm_lock_count_reg[6]),
        .R(sync_mmcm_lock_reclocked_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \mmcm_lock_count_reg[7] 
       (.C(independent_clock_bufg),
        .CE(\mmcm_lock_count[7]_i_2_n_0 ),
        .D(p_0_in__2[7]),
        .Q(mmcm_lock_count_reg[7]),
        .R(sync_mmcm_lock_reclocked_n_0));
  LUT5 #(
    .INIT(32'hEAAA0000)) 
    mmcm_lock_reclocked_i_1
       (.I0(mmcm_lock_reclocked),
        .I1(mmcm_lock_count_reg[7]),
        .I2(mmcm_lock_reclocked_i_2_n_0),
        .I3(mmcm_lock_count_reg[6]),
        .I4(mmcm_lock_i),
        .O(mmcm_lock_reclocked_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    mmcm_lock_reclocked_i_2
       (.I0(mmcm_lock_count_reg[5]),
        .I1(mmcm_lock_count_reg[4]),
        .I2(mmcm_lock_count_reg[2]),
        .I3(mmcm_lock_count_reg[1]),
        .I4(mmcm_lock_count_reg[0]),
        .I5(mmcm_lock_count_reg[3]),
        .O(mmcm_lock_reclocked_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mmcm_lock_reclocked_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(mmcm_lock_reclocked_i_1_n_0),
        .Q(mmcm_lock_reclocked),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBB00BB00FF04FF44)) 
    pll_reset_asserted_i_1
       (.I0(tx_state[3]),
        .I1(pll_reset_asserted_i_2_n_0),
        .I2(refclk_stable_reg_n_0),
        .I3(pll_reset_asserted_reg_n_0),
        .I4(gt0_cpllrefclklost_i),
        .I5(tx_state[1]),
        .O(pll_reset_asserted_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h2)) 
    pll_reset_asserted_i_2
       (.I0(tx_state[0]),
        .I1(tx_state[2]),
        .O(pll_reset_asserted_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    pll_reset_asserted_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(pll_reset_asserted_i_1_n_0),
        .Q(pll_reset_asserted_reg_n_0),
        .R(pma_reset));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \refclk_stable_count[0]_i_1 
       (.I0(\refclk_stable_count[0]_i_3_n_0 ),
        .I1(refclk_stable_count_reg[4]),
        .I2(refclk_stable_count_reg[8]),
        .I3(refclk_stable_count_reg[5]),
        .I4(refclk_stable_count_reg[17]),
        .I5(\refclk_stable_count[0]_i_4_n_0 ),
        .O(refclk_stable_count));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \refclk_stable_count[0]_i_3 
       (.I0(refclk_stable_count_reg[2]),
        .I1(refclk_stable_count_reg[15]),
        .I2(refclk_stable_count_reg[0]),
        .I3(refclk_stable_count_reg[11]),
        .I4(\refclk_stable_count[0]_i_6_n_0 ),
        .I5(\refclk_stable_count[0]_i_7_n_0 ),
        .O(\refclk_stable_count[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \refclk_stable_count[0]_i_4 
       (.I0(refclk_stable_count_reg[6]),
        .I1(refclk_stable_count_reg[1]),
        .I2(refclk_stable_count_reg[10]),
        .I3(refclk_stable_count_reg[18]),
        .O(\refclk_stable_count[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \refclk_stable_count[0]_i_5 
       (.I0(refclk_stable_count_reg[0]),
        .O(\refclk_stable_count[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \refclk_stable_count[0]_i_6 
       (.I0(refclk_stable_count_reg[13]),
        .I1(refclk_stable_count_reg[19]),
        .I2(refclk_stable_count_reg[12]),
        .I3(refclk_stable_count_reg[14]),
        .O(\refclk_stable_count[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \refclk_stable_count[0]_i_7 
       (.I0(refclk_stable_count_reg[16]),
        .I1(refclk_stable_count_reg[7]),
        .I2(refclk_stable_count_reg[9]),
        .I3(refclk_stable_count_reg[3]),
        .O(\refclk_stable_count[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[0] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[0]_i_2_n_7 ),
        .Q(refclk_stable_count_reg[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \refclk_stable_count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\refclk_stable_count_reg[0]_i_2_n_0 ,\refclk_stable_count_reg[0]_i_2_n_1 ,\refclk_stable_count_reg[0]_i_2_n_2 ,\refclk_stable_count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\refclk_stable_count_reg[0]_i_2_n_4 ,\refclk_stable_count_reg[0]_i_2_n_5 ,\refclk_stable_count_reg[0]_i_2_n_6 ,\refclk_stable_count_reg[0]_i_2_n_7 }),
        .S({refclk_stable_count_reg[3:1],\refclk_stable_count[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[10] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[8]_i_1_n_5 ),
        .Q(refclk_stable_count_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[11] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[8]_i_1_n_4 ),
        .Q(refclk_stable_count_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[12] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[12]_i_1_n_7 ),
        .Q(refclk_stable_count_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \refclk_stable_count_reg[12]_i_1 
       (.CI(\refclk_stable_count_reg[8]_i_1_n_0 ),
        .CO({\refclk_stable_count_reg[12]_i_1_n_0 ,\refclk_stable_count_reg[12]_i_1_n_1 ,\refclk_stable_count_reg[12]_i_1_n_2 ,\refclk_stable_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refclk_stable_count_reg[12]_i_1_n_4 ,\refclk_stable_count_reg[12]_i_1_n_5 ,\refclk_stable_count_reg[12]_i_1_n_6 ,\refclk_stable_count_reg[12]_i_1_n_7 }),
        .S(refclk_stable_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[13] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[12]_i_1_n_6 ),
        .Q(refclk_stable_count_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[14] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[12]_i_1_n_5 ),
        .Q(refclk_stable_count_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[15] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[12]_i_1_n_4 ),
        .Q(refclk_stable_count_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[16] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[16]_i_1_n_7 ),
        .Q(refclk_stable_count_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \refclk_stable_count_reg[16]_i_1 
       (.CI(\refclk_stable_count_reg[12]_i_1_n_0 ),
        .CO({\NLW_refclk_stable_count_reg[16]_i_1_CO_UNCONNECTED [3],\refclk_stable_count_reg[16]_i_1_n_1 ,\refclk_stable_count_reg[16]_i_1_n_2 ,\refclk_stable_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refclk_stable_count_reg[16]_i_1_n_4 ,\refclk_stable_count_reg[16]_i_1_n_5 ,\refclk_stable_count_reg[16]_i_1_n_6 ,\refclk_stable_count_reg[16]_i_1_n_7 }),
        .S(refclk_stable_count_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[17] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[16]_i_1_n_6 ),
        .Q(refclk_stable_count_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[18] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[16]_i_1_n_5 ),
        .Q(refclk_stable_count_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[19] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[16]_i_1_n_4 ),
        .Q(refclk_stable_count_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[1] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[0]_i_2_n_6 ),
        .Q(refclk_stable_count_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[2] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[0]_i_2_n_5 ),
        .Q(refclk_stable_count_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[3] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[0]_i_2_n_4 ),
        .Q(refclk_stable_count_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[4] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[4]_i_1_n_7 ),
        .Q(refclk_stable_count_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \refclk_stable_count_reg[4]_i_1 
       (.CI(\refclk_stable_count_reg[0]_i_2_n_0 ),
        .CO({\refclk_stable_count_reg[4]_i_1_n_0 ,\refclk_stable_count_reg[4]_i_1_n_1 ,\refclk_stable_count_reg[4]_i_1_n_2 ,\refclk_stable_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refclk_stable_count_reg[4]_i_1_n_4 ,\refclk_stable_count_reg[4]_i_1_n_5 ,\refclk_stable_count_reg[4]_i_1_n_6 ,\refclk_stable_count_reg[4]_i_1_n_7 }),
        .S(refclk_stable_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[5] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[4]_i_1_n_6 ),
        .Q(refclk_stable_count_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[6] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[4]_i_1_n_5 ),
        .Q(refclk_stable_count_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[7] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[4]_i_1_n_4 ),
        .Q(refclk_stable_count_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[8] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[8]_i_1_n_7 ),
        .Q(refclk_stable_count_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \refclk_stable_count_reg[8]_i_1 
       (.CI(\refclk_stable_count_reg[4]_i_1_n_0 ),
        .CO({\refclk_stable_count_reg[8]_i_1_n_0 ,\refclk_stable_count_reg[8]_i_1_n_1 ,\refclk_stable_count_reg[8]_i_1_n_2 ,\refclk_stable_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\refclk_stable_count_reg[8]_i_1_n_4 ,\refclk_stable_count_reg[8]_i_1_n_5 ,\refclk_stable_count_reg[8]_i_1_n_6 ,\refclk_stable_count_reg[8]_i_1_n_7 }),
        .S(refclk_stable_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \refclk_stable_count_reg[9] 
       (.C(independent_clock_bufg),
        .CE(refclk_stable_count),
        .D(\refclk_stable_count_reg[8]_i_1_n_6 ),
        .Q(refclk_stable_count_reg[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    refclk_stable_i_1
       (.I0(\refclk_stable_count[0]_i_4_n_0 ),
        .I1(refclk_stable_count_reg[17]),
        .I2(refclk_stable_count_reg[5]),
        .I3(refclk_stable_count_reg[8]),
        .I4(refclk_stable_count_reg[4]),
        .I5(\refclk_stable_count[0]_i_3_n_0 ),
        .O(refclk_stable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    refclk_stable_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(refclk_stable_i_1_n_0),
        .Q(refclk_stable_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h4C7C)) 
    reset_time_out_i_3
       (.I0(txresetdone_s3),
        .I1(tx_state[1]),
        .I2(tx_state[2]),
        .I3(mmcm_lock_reclocked),
        .O(reset_time_out_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    reset_time_out_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(sync_cplllock_n_1),
        .Q(reset_time_out),
        .R(pma_reset));
  LUT5 #(
    .INIT(32'hFFEF0100)) 
    run_phase_alignment_int_i_1
       (.I0(tx_state[1]),
        .I1(tx_state[2]),
        .I2(tx_state[0]),
        .I3(tx_state[3]),
        .I4(run_phase_alignment_int_reg_n_0),
        .O(run_phase_alignment_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(run_phase_alignment_int_i_1_n_0),
        .Q(run_phase_alignment_int_reg_n_0),
        .R(pma_reset));
  FDRE #(
    .INIT(1'b0)) 
    run_phase_alignment_int_s3_reg
       (.C(userclk),
        .CE(1'b1),
        .D(run_phase_alignment_int_s2),
        .Q(run_phase_alignment_int_s3),
        .R(1'b0));
  gig_ethernet_pcs_pma_0_sync_block_4 sync_TXRESETDONE
       (.data_out(txresetdone_s2),
        .data_sync_reg1_0(data_sync_reg1),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_sync_block_5 sync_cplllock
       (.E(sync_cplllock_n_0),
        .\FSM_sequential_tx_state[3]_i_3_0 (time_out_500us_reg_n_0),
        .\FSM_sequential_tx_state[3]_i_3_1 (time_out_2ms_reg_n_0),
        .\FSM_sequential_tx_state[3]_i_3_2 (pll_reset_asserted_reg_n_0),
        .\FSM_sequential_tx_state[3]_i_3_3 (refclk_stable_reg_n_0),
        .\FSM_sequential_tx_state_reg[0] (init_wait_done_reg_n_0),
        .\FSM_sequential_tx_state_reg[0]_0 (\FSM_sequential_tx_state[3]_i_4_n_0 ),
        .\FSM_sequential_tx_state_reg[0]_1 (\FSM_sequential_tx_state[3]_i_7_n_0 ),
        .\FSM_sequential_tx_state_reg[1] (sync_cplllock_n_1),
        .Q(tx_state),
        .cplllock(cplllock),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_lock_reclocked(mmcm_lock_reclocked),
        .reset_time_out(reset_time_out),
        .reset_time_out_reg(reset_time_out_i_3_n_0),
        .sel(sel),
        .txresetdone_s3(txresetdone_s3));
  gig_ethernet_pcs_pma_0_sync_block_6 sync_mmcm_lock_reclocked
       (.SR(sync_mmcm_lock_reclocked_n_0),
        .data_out(mmcm_lock_i),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked));
  gig_ethernet_pcs_pma_0_sync_block_7 sync_run_phase_alignment_int
       (.data_in(run_phase_alignment_int_reg_n_0),
        .data_out(run_phase_alignment_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_sync_block_8 sync_time_out_wait_bypass
       (.data_in(time_out_wait_bypass_reg_n_0),
        .data_out(time_out_wait_bypass_s2),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_sync_block_9 sync_tx_fsm_reset_done_int
       (.data_in(data_in),
        .data_out(tx_fsm_reset_done_int_s2),
        .userclk(userclk));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    time_out_2ms_i_1
       (.I0(time_out_2ms_reg_n_0),
        .I1(time_out_2ms),
        .I2(reset_time_out),
        .O(time_out_2ms_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000010)) 
    time_out_2ms_i_2__0
       (.I0(time_out_2ms_i_3_n_0),
        .I1(time_out_2ms_i_4_n_0),
        .I2(time_out_2ms_i_5_n_0),
        .I3(time_out_2ms_i_6_n_0),
        .I4(time_out_500us_i_3_n_0),
        .O(time_out_2ms));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'h45)) 
    time_out_2ms_i_3
       (.I0(time_out_counter_reg[14]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[12]),
        .O(time_out_2ms_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    time_out_2ms_i_4
       (.I0(time_out_counter_reg[3]),
        .I1(time_out_counter_reg[5]),
        .I2(time_out_counter_reg[9]),
        .I3(time_out_counter_reg[10]),
        .O(time_out_2ms_i_4_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    time_out_2ms_i_5
       (.I0(time_out_counter_reg[1]),
        .I1(time_out_counter_reg[2]),
        .I2(time_out_counter_reg[0]),
        .O(time_out_2ms_i_5_n_0));
  LUT6 #(
    .INIT(64'hFEFFFFFFFFFFFFFF)) 
    time_out_2ms_i_6
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[4]),
        .I3(time_out_counter_reg[18]),
        .I4(time_out_counter_reg[11]),
        .I5(time_out_counter_reg[17]),
        .O(time_out_2ms_i_6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_2ms_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_2ms_i_1_n_0),
        .Q(time_out_2ms_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAABAAA)) 
    time_out_500us_i_1
       (.I0(time_out_500us_reg_n_0),
        .I1(time_out_500us_i_2_n_0),
        .I2(time_tlock_max_i_3__0_n_0),
        .I3(time_tlock_max_i_2__0_n_0),
        .I4(time_out_500us_i_3_n_0),
        .I5(reset_time_out),
        .O(time_out_500us_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF2FFFFFFFFFF)) 
    time_out_500us_i_2
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[13]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[16]),
        .I4(time_out_counter_reg[11]),
        .I5(time_out_counter_reg[15]),
        .O(time_out_500us_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    time_out_500us_i_3
       (.I0(time_out_counter_reg[13]),
        .I1(time_out_counter_reg[8]),
        .I2(time_out_counter_reg[6]),
        .I3(time_out_counter_reg[7]),
        .I4(time_out_counter_reg[14]),
        .O(time_out_500us_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_500us_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_500us_i_1_n_0),
        .Q(time_out_500us_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_1__0 
       (.I0(time_out_2ms),
        .O(time_out_counter));
  LUT1 #(
    .INIT(2'h1)) 
    \time_out_counter[0]_i_3 
       (.I0(time_out_counter_reg[0]),
        .O(\time_out_counter[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[0] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_7 ),
        .Q(time_out_counter_reg[0]),
        .R(reset_time_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\time_out_counter_reg[0]_i_2_n_0 ,\time_out_counter_reg[0]_i_2_n_1 ,\time_out_counter_reg[0]_i_2_n_2 ,\time_out_counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\time_out_counter_reg[0]_i_2_n_4 ,\time_out_counter_reg[0]_i_2_n_5 ,\time_out_counter_reg[0]_i_2_n_6 ,\time_out_counter_reg[0]_i_2_n_7 }),
        .S({time_out_counter_reg[3:1],\time_out_counter[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[10] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_5 ),
        .Q(time_out_counter_reg[10]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[11] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_4 ),
        .Q(time_out_counter_reg[11]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[12] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_7 ),
        .Q(time_out_counter_reg[12]),
        .R(reset_time_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[12]_i_1 
       (.CI(\time_out_counter_reg[8]_i_1_n_0 ),
        .CO({\time_out_counter_reg[12]_i_1_n_0 ,\time_out_counter_reg[12]_i_1_n_1 ,\time_out_counter_reg[12]_i_1_n_2 ,\time_out_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[12]_i_1_n_4 ,\time_out_counter_reg[12]_i_1_n_5 ,\time_out_counter_reg[12]_i_1_n_6 ,\time_out_counter_reg[12]_i_1_n_7 }),
        .S(time_out_counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[13] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_6 ),
        .Q(time_out_counter_reg[13]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[14] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_5 ),
        .Q(time_out_counter_reg[14]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[15] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[12]_i_1_n_4 ),
        .Q(time_out_counter_reg[15]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[16] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1_n_7 ),
        .Q(time_out_counter_reg[16]),
        .R(reset_time_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[16]_i_1 
       (.CI(\time_out_counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED [3:2],\time_out_counter_reg[16]_i_1_n_2 ,\time_out_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED [3],\time_out_counter_reg[16]_i_1_n_5 ,\time_out_counter_reg[16]_i_1_n_6 ,\time_out_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,time_out_counter_reg[18:16]}));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[17] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1_n_6 ),
        .Q(time_out_counter_reg[17]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[18] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[16]_i_1_n_5 ),
        .Q(time_out_counter_reg[18]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[1] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_6 ),
        .Q(time_out_counter_reg[1]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[2] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_5 ),
        .Q(time_out_counter_reg[2]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[3] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[0]_i_2_n_4 ),
        .Q(time_out_counter_reg[3]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[4] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_7 ),
        .Q(time_out_counter_reg[4]),
        .R(reset_time_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[4]_i_1 
       (.CI(\time_out_counter_reg[0]_i_2_n_0 ),
        .CO({\time_out_counter_reg[4]_i_1_n_0 ,\time_out_counter_reg[4]_i_1_n_1 ,\time_out_counter_reg[4]_i_1_n_2 ,\time_out_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[4]_i_1_n_4 ,\time_out_counter_reg[4]_i_1_n_5 ,\time_out_counter_reg[4]_i_1_n_6 ,\time_out_counter_reg[4]_i_1_n_7 }),
        .S(time_out_counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[5] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_6 ),
        .Q(time_out_counter_reg[5]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[6] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_5 ),
        .Q(time_out_counter_reg[6]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[7] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[4]_i_1_n_4 ),
        .Q(time_out_counter_reg[7]),
        .R(reset_time_out));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[8] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_7 ),
        .Q(time_out_counter_reg[8]),
        .R(reset_time_out));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \time_out_counter_reg[8]_i_1 
       (.CI(\time_out_counter_reg[4]_i_1_n_0 ),
        .CO({\time_out_counter_reg[8]_i_1_n_0 ,\time_out_counter_reg[8]_i_1_n_1 ,\time_out_counter_reg[8]_i_1_n_2 ,\time_out_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\time_out_counter_reg[8]_i_1_n_4 ,\time_out_counter_reg[8]_i_1_n_5 ,\time_out_counter_reg[8]_i_1_n_6 ,\time_out_counter_reg[8]_i_1_n_7 }),
        .S(time_out_counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \time_out_counter_reg[9] 
       (.C(independent_clock_bufg),
        .CE(time_out_counter),
        .D(\time_out_counter_reg[8]_i_1_n_6 ),
        .Q(time_out_counter_reg[9]),
        .R(reset_time_out));
  LUT4 #(
    .INIT(16'hAB00)) 
    time_out_wait_bypass_i_1
       (.I0(time_out_wait_bypass_reg_n_0),
        .I1(tx_fsm_reset_done_int_s3),
        .I2(time_out_wait_bypass_i_2_n_0),
        .I3(run_phase_alignment_int_s3),
        .O(time_out_wait_bypass_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFEFFFFFFFFF)) 
    time_out_wait_bypass_i_2
       (.I0(time_out_wait_bypass_i_3_n_0),
        .I1(time_out_wait_bypass_i_4_n_0),
        .I2(wait_bypass_count_reg[5]),
        .I3(wait_bypass_count_reg[13]),
        .I4(wait_bypass_count_reg[11]),
        .I5(time_out_wait_bypass_i_5_n_0),
        .O(time_out_wait_bypass_i_2_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    time_out_wait_bypass_i_3
       (.I0(wait_bypass_count_reg[16]),
        .I1(wait_bypass_count_reg[9]),
        .I2(wait_bypass_count_reg[12]),
        .I3(wait_bypass_count_reg[10]),
        .O(time_out_wait_bypass_i_3_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    time_out_wait_bypass_i_4
       (.I0(wait_bypass_count_reg[4]),
        .I1(wait_bypass_count_reg[15]),
        .I2(wait_bypass_count_reg[6]),
        .I3(wait_bypass_count_reg[0]),
        .O(time_out_wait_bypass_i_4_n_0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    time_out_wait_bypass_i_5
       (.I0(wait_bypass_count_reg[8]),
        .I1(wait_bypass_count_reg[1]),
        .I2(wait_bypass_count_reg[7]),
        .I3(wait_bypass_count_reg[14]),
        .I4(wait_bypass_count_reg[2]),
        .I5(wait_bypass_count_reg[3]),
        .O(time_out_wait_bypass_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_reg
       (.C(userclk),
        .CE(1'b1),
        .D(time_out_wait_bypass_i_1_n_0),
        .Q(time_out_wait_bypass_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    time_out_wait_bypass_s3_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_out_wait_bypass_s2),
        .Q(time_out_wait_bypass_s3),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000AAAAEAAA)) 
    time_tlock_max_i_1
       (.I0(time_tlock_max_reg_n_0),
        .I1(time_tlock_max_i_2__0_n_0),
        .I2(time_tlock_max_i_3__0_n_0),
        .I3(time_tlock_max_i_4__0_n_0),
        .I4(time_tlock_max_i_5__0_n_0),
        .I5(reset_time_out),
        .O(time_tlock_max_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    time_tlock_max_i_2__0
       (.I0(time_out_counter_reg[0]),
        .I1(time_out_counter_reg[2]),
        .I2(time_out_counter_reg[1]),
        .I3(time_out_counter_reg[4]),
        .I4(time_out_counter_reg[5]),
        .I5(time_out_counter_reg[3]),
        .O(time_tlock_max_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    time_tlock_max_i_3__0
       (.I0(time_out_counter_reg[17]),
        .I1(time_out_counter_reg[9]),
        .I2(time_out_counter_reg[10]),
        .I3(time_out_counter_reg[18]),
        .O(time_tlock_max_i_3__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'h01)) 
    time_tlock_max_i_4__0
       (.I0(time_out_counter_reg[12]),
        .I1(time_out_counter_reg[6]),
        .I2(time_out_counter_reg[7]),
        .O(time_tlock_max_i_4__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    time_tlock_max_i_5__0
       (.I0(time_out_counter_reg[16]),
        .I1(time_out_counter_reg[15]),
        .I2(time_out_counter_reg[14]),
        .I3(time_out_counter_reg[11]),
        .I4(time_out_counter_reg[8]),
        .I5(time_out_counter_reg[13]),
        .O(time_tlock_max_i_5__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    time_tlock_max_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(time_tlock_max_i_1_n_0),
        .Q(time_tlock_max_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFF0200)) 
    tx_fsm_reset_done_int_i_1
       (.I0(tx_state[0]),
        .I1(tx_state[1]),
        .I2(tx_state[2]),
        .I3(tx_state[3]),
        .I4(data_in),
        .O(tx_fsm_reset_done_int_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_fsm_reset_done_int_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(tx_fsm_reset_done_int_i_1_n_0),
        .Q(data_in),
        .R(pma_reset));
  FDRE #(
    .INIT(1'b0)) 
    tx_fsm_reset_done_int_s3_reg
       (.C(userclk),
        .CE(1'b1),
        .D(tx_fsm_reset_done_int_s2),
        .Q(tx_fsm_reset_done_int_s3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    txresetdone_s3_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(txresetdone_s2),
        .Q(txresetdone_s3),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_1 
       (.I0(run_phase_alignment_int_s3),
        .O(clear));
  LUT2 #(
    .INIT(4'h2)) 
    \wait_bypass_count[0]_i_2 
       (.I0(time_out_wait_bypass_i_2_n_0),
        .I1(tx_fsm_reset_done_int_s3),
        .O(\wait_bypass_count[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_bypass_count[0]_i_4__0 
       (.I0(wait_bypass_count_reg[0]),
        .O(\wait_bypass_count[0]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[0] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_7 ),
        .Q(wait_bypass_count_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wait_bypass_count_reg[0]_i_3_n_0 ,\wait_bypass_count_reg[0]_i_3_n_1 ,\wait_bypass_count_reg[0]_i_3_n_2 ,\wait_bypass_count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wait_bypass_count_reg[0]_i_3_n_4 ,\wait_bypass_count_reg[0]_i_3_n_5 ,\wait_bypass_count_reg[0]_i_3_n_6 ,\wait_bypass_count_reg[0]_i_3_n_7 }),
        .S({wait_bypass_count_reg[3:1],\wait_bypass_count[0]_i_4__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[10] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[11] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[12] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[12]_i_1 
       (.CI(\wait_bypass_count_reg[8]_i_1_n_0 ),
        .CO({\wait_bypass_count_reg[12]_i_1_n_0 ,\wait_bypass_count_reg[12]_i_1_n_1 ,\wait_bypass_count_reg[12]_i_1_n_2 ,\wait_bypass_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[12]_i_1_n_4 ,\wait_bypass_count_reg[12]_i_1_n_5 ,\wait_bypass_count_reg[12]_i_1_n_6 ,\wait_bypass_count_reg[12]_i_1_n_7 }),
        .S(wait_bypass_count_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[13] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[14] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[15] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[12]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[15]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[16] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[16]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[16]_i_1 
       (.CI(\wait_bypass_count_reg[12]_i_1_n_0 ),
        .CO(\NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED [3:1],\wait_bypass_count_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,wait_bypass_count_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[1] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_6 ),
        .Q(wait_bypass_count_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[2] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_5 ),
        .Q(wait_bypass_count_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[3] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[0]_i_3_n_4 ),
        .Q(wait_bypass_count_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[4] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[4]_i_1 
       (.CI(\wait_bypass_count_reg[0]_i_3_n_0 ),
        .CO({\wait_bypass_count_reg[4]_i_1_n_0 ,\wait_bypass_count_reg[4]_i_1_n_1 ,\wait_bypass_count_reg[4]_i_1_n_2 ,\wait_bypass_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[4]_i_1_n_4 ,\wait_bypass_count_reg[4]_i_1_n_5 ,\wait_bypass_count_reg[4]_i_1_n_6 ,\wait_bypass_count_reg[4]_i_1_n_7 }),
        .S(wait_bypass_count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[5] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[6] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_5 ),
        .Q(wait_bypass_count_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[7] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[4]_i_1_n_4 ),
        .Q(wait_bypass_count_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[8] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_7 ),
        .Q(wait_bypass_count_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_bypass_count_reg[8]_i_1 
       (.CI(\wait_bypass_count_reg[4]_i_1_n_0 ),
        .CO({\wait_bypass_count_reg[8]_i_1_n_0 ,\wait_bypass_count_reg[8]_i_1_n_1 ,\wait_bypass_count_reg[8]_i_1_n_2 ,\wait_bypass_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wait_bypass_count_reg[8]_i_1_n_4 ,\wait_bypass_count_reg[8]_i_1_n_5 ,\wait_bypass_count_reg[8]_i_1_n_6 ,\wait_bypass_count_reg[8]_i_1_n_7 }),
        .S(wait_bypass_count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \wait_bypass_count_reg[9] 
       (.C(userclk),
        .CE(\wait_bypass_count[0]_i_2_n_0 ),
        .D(\wait_bypass_count_reg[8]_i_1_n_6 ),
        .Q(wait_bypass_count_reg[9]),
        .R(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_10 
       (.I0(wait_time_cnt_reg[1]),
        .O(\wait_time_cnt[0]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_11 
       (.I0(wait_time_cnt_reg[0]),
        .O(\wait_time_cnt[0]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h0444)) 
    \wait_time_cnt[0]_i_1__0 
       (.I0(tx_state[3]),
        .I1(tx_state[0]),
        .I2(tx_state[1]),
        .I3(tx_state[2]),
        .O(wait_time_cnt0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_2 
       (.I0(\wait_time_cnt[0]_i_4_n_0 ),
        .I1(\wait_time_cnt[0]_i_5_n_0 ),
        .I2(\wait_time_cnt[0]_i_6_n_0 ),
        .I3(\wait_time_cnt[0]_i_7_n_0 ),
        .O(sel));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_4 
       (.I0(wait_time_cnt_reg[6]),
        .I1(wait_time_cnt_reg[4]),
        .I2(wait_time_cnt_reg[7]),
        .I3(wait_time_cnt_reg[0]),
        .O(\wait_time_cnt[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_5 
       (.I0(wait_time_cnt_reg[12]),
        .I1(wait_time_cnt_reg[10]),
        .I2(wait_time_cnt_reg[3]),
        .I3(wait_time_cnt_reg[1]),
        .O(\wait_time_cnt[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_6 
       (.I0(wait_time_cnt_reg[15]),
        .I1(wait_time_cnt_reg[14]),
        .I2(wait_time_cnt_reg[11]),
        .I3(wait_time_cnt_reg[9]),
        .O(\wait_time_cnt[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wait_time_cnt[0]_i_7 
       (.I0(wait_time_cnt_reg[13]),
        .I1(wait_time_cnt_reg[8]),
        .I2(wait_time_cnt_reg[5]),
        .I3(wait_time_cnt_reg[2]),
        .O(\wait_time_cnt[0]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_8 
       (.I0(wait_time_cnt_reg[3]),
        .O(\wait_time_cnt[0]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[0]_i_9 
       (.I0(wait_time_cnt_reg[2]),
        .O(\wait_time_cnt[0]_i_9_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_2 
       (.I0(wait_time_cnt_reg[15]),
        .O(\wait_time_cnt[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_3 
       (.I0(wait_time_cnt_reg[14]),
        .O(\wait_time_cnt[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_4 
       (.I0(wait_time_cnt_reg[13]),
        .O(\wait_time_cnt[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[12]_i_5 
       (.I0(wait_time_cnt_reg[12]),
        .O(\wait_time_cnt[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_2 
       (.I0(wait_time_cnt_reg[7]),
        .O(\wait_time_cnt[4]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_3 
       (.I0(wait_time_cnt_reg[6]),
        .O(\wait_time_cnt[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_4 
       (.I0(wait_time_cnt_reg[5]),
        .O(\wait_time_cnt[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[4]_i_5 
       (.I0(wait_time_cnt_reg[4]),
        .O(\wait_time_cnt[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_2 
       (.I0(wait_time_cnt_reg[11]),
        .O(\wait_time_cnt[8]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_3 
       (.I0(wait_time_cnt_reg[10]),
        .O(\wait_time_cnt[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_4 
       (.I0(wait_time_cnt_reg[9]),
        .O(\wait_time_cnt[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \wait_time_cnt[8]_i_5 
       (.I0(wait_time_cnt_reg[8]),
        .O(\wait_time_cnt[8]_i_5_n_0 ));
  FDRE \wait_time_cnt_reg[0] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_7 ),
        .Q(wait_time_cnt_reg[0]),
        .R(wait_time_cnt0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wait_time_cnt_reg[0]_i_3_n_0 ,\wait_time_cnt_reg[0]_i_3_n_1 ,\wait_time_cnt_reg[0]_i_3_n_2 ,\wait_time_cnt_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[0]_i_3_n_4 ,\wait_time_cnt_reg[0]_i_3_n_5 ,\wait_time_cnt_reg[0]_i_3_n_6 ,\wait_time_cnt_reg[0]_i_3_n_7 }),
        .S({\wait_time_cnt[0]_i_8_n_0 ,\wait_time_cnt[0]_i_9_n_0 ,\wait_time_cnt[0]_i_10_n_0 ,\wait_time_cnt[0]_i_11_n_0 }));
  FDSE \wait_time_cnt_reg[10] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[10]),
        .S(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[11] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[11]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[12] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[12]),
        .R(wait_time_cnt0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[12]_i_1 
       (.CI(\wait_time_cnt_reg[8]_i_1_n_0 ),
        .CO({\NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED [3],\wait_time_cnt_reg[12]_i_1_n_1 ,\wait_time_cnt_reg[12]_i_1_n_2 ,\wait_time_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[12]_i_1_n_4 ,\wait_time_cnt_reg[12]_i_1_n_5 ,\wait_time_cnt_reg[12]_i_1_n_6 ,\wait_time_cnt_reg[12]_i_1_n_7 }),
        .S({\wait_time_cnt[12]_i_2_n_0 ,\wait_time_cnt[12]_i_3_n_0 ,\wait_time_cnt[12]_i_4_n_0 ,\wait_time_cnt[12]_i_5_n_0 }));
  FDRE \wait_time_cnt_reg[13] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[13]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[14] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[14]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[15] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[12]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[15]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[1] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_6 ),
        .Q(wait_time_cnt_reg[1]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[2] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_5 ),
        .Q(wait_time_cnt_reg[2]),
        .R(wait_time_cnt0));
  FDRE \wait_time_cnt_reg[3] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[0]_i_3_n_4 ),
        .Q(wait_time_cnt_reg[3]),
        .R(wait_time_cnt0));
  FDSE \wait_time_cnt_reg[4] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[4]),
        .S(wait_time_cnt0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[4]_i_1 
       (.CI(\wait_time_cnt_reg[0]_i_3_n_0 ),
        .CO({\wait_time_cnt_reg[4]_i_1_n_0 ,\wait_time_cnt_reg[4]_i_1_n_1 ,\wait_time_cnt_reg[4]_i_1_n_2 ,\wait_time_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[4]_i_1_n_4 ,\wait_time_cnt_reg[4]_i_1_n_5 ,\wait_time_cnt_reg[4]_i_1_n_6 ,\wait_time_cnt_reg[4]_i_1_n_7 }),
        .S({\wait_time_cnt[4]_i_2_n_0 ,\wait_time_cnt[4]_i_3_n_0 ,\wait_time_cnt[4]_i_4_n_0 ,\wait_time_cnt[4]_i_5_n_0 }));
  FDRE \wait_time_cnt_reg[5] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[5]),
        .R(wait_time_cnt0));
  FDSE \wait_time_cnt_reg[6] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_5 ),
        .Q(wait_time_cnt_reg[6]),
        .S(wait_time_cnt0));
  FDSE \wait_time_cnt_reg[7] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[4]_i_1_n_4 ),
        .Q(wait_time_cnt_reg[7]),
        .S(wait_time_cnt0));
  FDSE \wait_time_cnt_reg[8] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_7 ),
        .Q(wait_time_cnt_reg[8]),
        .S(wait_time_cnt0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \wait_time_cnt_reg[8]_i_1 
       (.CI(\wait_time_cnt_reg[4]_i_1_n_0 ),
        .CO({\wait_time_cnt_reg[8]_i_1_n_0 ,\wait_time_cnt_reg[8]_i_1_n_1 ,\wait_time_cnt_reg[8]_i_1_n_2 ,\wait_time_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O({\wait_time_cnt_reg[8]_i_1_n_4 ,\wait_time_cnt_reg[8]_i_1_n_5 ,\wait_time_cnt_reg[8]_i_1_n_6 ,\wait_time_cnt_reg[8]_i_1_n_7 }),
        .S({\wait_time_cnt[8]_i_2_n_0 ,\wait_time_cnt[8]_i_3_n_0 ,\wait_time_cnt[8]_i_4_n_0 ,\wait_time_cnt[8]_i_5_n_0 }));
  FDSE \wait_time_cnt_reg[9] 
       (.C(independent_clock_bufg),
        .CE(sel),
        .D(\wait_time_cnt_reg[8]_i_1_n_6 ),
        .Q(wait_time_cnt_reg[9]),
        .S(wait_time_cnt0));
endmodule

(* DowngradeIPIdentifiedWarnings = "yes" *) (* EXAMPLE_SIMULATION = "0" *) 
module gig_ethernet_pcs_pma_0_block
   (gtrefclk,
    gtrefclk_bufg,
    txp,
    txn,
    rxp,
    rxn,
    txoutclk,
    rxoutclk,
    resetdone,
    cplllock,
    mmcm_reset,
    mmcm_locked,
    userclk,
    userclk2,
    rxuserclk,
    rxuserclk2,
    independent_clock_bufg,
    pma_reset,
    gmii_txd,
    gmii_tx_en,
    gmii_tx_er,
    gmii_rxd,
    gmii_rx_dv,
    gmii_rx_er,
    gmii_isolate,
    mdc,
    mdio_i,
    mdio_o,
    mdio_t,
    phyaddr,
    configuration_vector,
    configuration_valid,
    an_interrupt,
    an_adv_config_vector,
    an_adv_config_val,
    an_restart_config,
    status_vector,
    reset,
    signal_detect,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in);
  input gtrefclk;
  input gtrefclk_bufg;
  output txp;
  output txn;
  input rxp;
  input rxn;
  output txoutclk;
  output rxoutclk;
  output resetdone;
  output cplllock;
  output mmcm_reset;
  input mmcm_locked;
  input userclk;
  input userclk2;
  input rxuserclk;
  input rxuserclk2;
  input independent_clock_bufg;
  input pma_reset;
  input [7:0]gmii_txd;
  input gmii_tx_en;
  input gmii_tx_er;
  output [7:0]gmii_rxd;
  output gmii_rx_dv;
  output gmii_rx_er;
  output gmii_isolate;
  input mdc;
  input mdio_i;
  output mdio_o;
  output mdio_t;
  input [4:0]phyaddr;
  input [4:0]configuration_vector;
  input configuration_valid;
  output an_interrupt;
  input [15:0]an_adv_config_vector;
  input an_adv_config_val;
  input an_restart_config;
  output [15:0]status_vector;
  input reset;
  input signal_detect;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;

  wire \<const0> ;
  wire an_adv_config_val;
  wire [15:0]an_adv_config_vector;
  wire an_interrupt;
  wire an_restart_config;
  wire configuration_valid;
  wire [4:0]configuration_vector;
  wire cplllock;
  wire enablealign;
  wire gmii_isolate;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire independent_clock_bufg;
  wire mdc;
  wire mdio_i;
  wire mdio_o;
  wire mdio_t;
  wire mgt_rx_reset;
  wire mgt_tx_reset;
  wire mmcm_locked;
  wire mmcm_reset;
  wire [4:0]phyaddr;
  wire pma_reset;
  wire powerdown;
  wire reset;
  wire resetdone;
  wire [1:1]rxbufstatus;
  wire rxchariscomma;
  wire rxcharisk;
  wire [1:0]rxclkcorcnt;
  wire [7:0]rxdata;
  wire rxdisperr;
  wire rxn;
  wire rxnotintable;
  wire rxoutclk;
  wire rxp;
  wire signal_detect;
  wire [15:0]\^status_vector ;
  wire transceiver_inst_n_5;
  wire transceiver_inst_n_6;
  wire tx_reset_done_i;
  wire txbuferr;
  wire txchardispmode;
  wire txchardispval;
  wire txcharisk;
  wire [7:0]txdata;
  wire txn;
  wire txoutclk;
  wire txp;
  wire userclk;
  wire userclk2;
  wire NLW_gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED;
  wire NLW_gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED;
  wire [9:0]NLW_gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED;
  wire [15:0]NLW_gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED;
  wire [63:0]NLW_gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED;
  wire [31:0]NLW_gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED;
  wire [47:0]NLW_gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED;
  wire [1:0]NLW_gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED;
  wire [1:0]NLW_gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED;
  wire [1:0]NLW_gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED;
  wire [11:7]NLW_gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED;
  wire [9:0]NLW_gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED;

  assign status_vector[15:12] = \^status_vector [15:12];
  assign status_vector[11] = \<const0> ;
  assign status_vector[10] = \<const0> ;
  assign status_vector[9:8] = \^status_vector [9:8];
  assign status_vector[7] = \<const0> ;
  assign status_vector[6:0] = \^status_vector [6:0];
  GND GND
       (.G(\<const0> ));
  (* B_SHIFTER_ADDR = "10'b0101001110" *) 
  (* C_1588 = "0" *) 
  (* C_2_5G = "FALSE" *) 
  (* C_COMPONENT_NAME = "gig_ethernet_pcs_pma_0" *) 
  (* C_DYNAMIC_SWITCHING = "FALSE" *) 
  (* C_ELABORATION_TRANSIENT_DIR = "BlankString" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AN = "TRUE" *) 
  (* C_HAS_AXIL = "FALSE" *) 
  (* C_HAS_MDIO = "TRUE" *) 
  (* C_HAS_TEMAC = "TRUE" *) 
  (* C_IS_SGMII = "FALSE" *) 
  (* C_RX_GMII_CLK = "TXOUTCLK" *) 
  (* C_SGMII_FABRIC_BUFFER = "TRUE" *) 
  (* C_SGMII_PHY_MODE = "FALSE" *) 
  (* C_USE_LVDS = "FALSE" *) 
  (* C_USE_TBI = "FALSE" *) 
  (* C_USE_TRANSCEIVER = "TRUE" *) 
  (* GT_RX_BYTE_WIDTH = "1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_2_8 gig_ethernet_pcs_pma_0_core
       (.an_adv_config_val(an_adv_config_val),
        .an_adv_config_vector({an_adv_config_vector[15],1'b0,an_adv_config_vector[13:12],1'b0,1'b0,1'b0,an_adv_config_vector[8:7],1'b0,an_adv_config_vector[5],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .an_enable(NLW_gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED),
        .an_interrupt(an_interrupt),
        .an_restart_config(an_restart_config),
        .basex_or_sgmii(1'b0),
        .configuration_valid(configuration_valid),
        .configuration_vector(configuration_vector),
        .correction_timer({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dcm_locked(mmcm_locked),
        .drp_daddr(NLW_gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED[9:0]),
        .drp_dclk(1'b0),
        .drp_den(NLW_gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED),
        .drp_di(NLW_gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED[15:0]),
        .drp_do({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_drdy(1'b0),
        .drp_dwe(NLW_gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED),
        .drp_gnt(1'b0),
        .drp_req(NLW_gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED),
        .en_cdet(NLW_gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED),
        .enablealign(enablealign),
        .ewrap(NLW_gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED),
        .gmii_isolate(gmii_isolate),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_rxd(gmii_rxd),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),
        .gmii_txd(gmii_txd),
        .gtx_clk(1'b0),
        .link_timer_basex({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link_timer_sgmii({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .link_timer_value({1'b0,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1}),
        .loc_ref(NLW_gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED),
        .mdc(mdc),
        .mdio_in(mdio_i),
        .mdio_out(mdio_o),
        .mdio_tri(mdio_t),
        .mgt_rx_reset(mgt_rx_reset),
        .mgt_tx_reset(mgt_tx_reset),
        .phyad(phyaddr),
        .pma_rx_clk0(1'b0),
        .pma_rx_clk1(1'b0),
        .powerdown(powerdown),
        .reset(reset),
        .reset_done(resetdone),
        .rx_code_group0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_code_group1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_gt_nominal_latency({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}),
        .rxbufstatus({rxbufstatus,1'b0}),
        .rxchariscomma(rxchariscomma),
        .rxcharisk(rxcharisk),
        .rxclkcorcnt({1'b0,rxclkcorcnt}),
        .rxdata(rxdata),
        .rxdisperr(rxdisperr),
        .rxnotintable(rxnotintable),
        .rxphy_correction_timer(NLW_gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED[63:0]),
        .rxphy_ns_field(NLW_gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED[31:0]),
        .rxphy_s_field(NLW_gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED[47:0]),
        .rxrecclk(1'b0),
        .rxrundisp(1'b0),
        .s_axi_aclk(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED),
        .s_axi_awvalid(1'b0),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_resetn(1'b0),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wready(NLW_gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED),
        .s_axi_wvalid(1'b0),
        .signal_detect(signal_detect),
        .speed_is_100(1'b0),
        .speed_is_10_100(1'b0),
        .speed_selection(NLW_gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED[1:0]),
        .status_vector(\^status_vector ),
        .systemtimer_ns_field({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .systemtimer_s_field({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .tx_code_group(NLW_gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED[9:0]),
        .txbuferr(txbuferr),
        .txchardispmode(txchardispmode),
        .txchardispval(txchardispval),
        .txcharisk(txcharisk),
        .txdata(txdata),
        .userclk(1'b0),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_sync_block sync_block_rx_reset_done
       (.data_in(transceiver_inst_n_6),
        .data_out(tx_reset_done_i),
        .resetdone(resetdone),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_sync_block_0 sync_block_tx_reset_done
       (.data_in(transceiver_inst_n_5),
        .data_out(tx_reset_done_i),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_transceiver transceiver_inst
       (.D(txchardispmode),
        .Q(rxclkcorcnt),
        .SR(mgt_tx_reset),
        .cplllock(cplllock),
        .data_in(transceiver_inst_n_5),
        .enablealign(enablealign),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked),
        .mmcm_reset(mmcm_reset),
        .pma_reset(pma_reset),
        .powerdown(powerdown),
        .reset_sync5(mgt_rx_reset),
        .rx_fsm_reset_done_int_reg(transceiver_inst_n_6),
        .rxbuferr(rxbufstatus),
        .rxchariscomma(rxchariscomma),
        .rxcharisk(rxcharisk),
        .\rxdata_reg[7]_0 (rxdata),
        .rxdisperr(rxdisperr),
        .rxn(rxn),
        .rxnotintable(rxnotintable),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .status_vector(\^status_vector [1]),
        .txbuferr(txbuferr),
        .txchardispval_reg_reg_0(txchardispval),
        .txcharisk_reg_reg_0(txcharisk),
        .\txdata_reg_reg[7]_0 (txdata),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .userclk2(userclk2));
endmodule

module gig_ethernet_pcs_pma_0_cpll_railing
   (gt0_cpllpd_i,
    gt0_cpllreset_i_0,
    gtrefclk_bufg,
    gt0_cpllreset_i);
  output gt0_cpllpd_i;
  output gt0_cpllreset_i_0;
  input gtrefclk_bufg;
  input gt0_cpllreset_i;

  wire cpll_reset0_i;
  wire \cpllpd_wait_reg[31]_srl32_n_1 ;
  wire \cpllpd_wait_reg[63]_srl32_n_1 ;
  wire \cpllpd_wait_reg[94]_srl31_n_0 ;
  wire \cpllreset_wait_reg[126]_srl31_n_0 ;
  wire \cpllreset_wait_reg[31]_srl32_n_1 ;
  wire \cpllreset_wait_reg[63]_srl32_n_1 ;
  wire \cpllreset_wait_reg[95]_srl32_n_1 ;
  wire gt0_cpllpd_i;
  wire gt0_cpllreset_i;
  wire gt0_cpllreset_i_0;
  wire gtrefclk_bufg;
  wire \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ;
  wire \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ;

  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(1'b0),
        .Q(\NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'hFFFFFFFF)) 
    \cpllpd_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(\cpllpd_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllpd_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[94]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h7FFFFFFF)) 
    \cpllpd_wait_reg[94]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(\cpllpd_wait_reg[63]_srl32_n_1 ),
        .Q(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q31(\NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    \cpllpd_wait_reg[95] 
       (.C(gtrefclk_bufg),
        .CE(1'b1),
        .D(\cpllpd_wait_reg[94]_srl31_n_0 ),
        .Q(gt0_cpllpd_i),
        .R(1'b0));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[126]_srl31 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[126]_srl31 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b0}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(\cpllreset_wait_reg[95]_srl32_n_1 ),
        .Q(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q31(\NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \cpllreset_wait_reg[127] 
       (.C(gtrefclk_bufg),
        .CE(1'b1),
        .D(\cpllreset_wait_reg[126]_srl31_n_0 ),
        .Q(cpll_reset0_i),
        .R(1'b0));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[31]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h000000FF)) 
    \cpllreset_wait_reg[31]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(1'b0),
        .Q(\NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[31]_srl32_n_1 ));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[63]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[63]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(\cpllreset_wait_reg[31]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[63]_srl32_n_1 ));
  (* srl_bus_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg " *) 
  (* srl_name = "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[95]_srl32 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \cpllreset_wait_reg[95]_srl32 
       (.A({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CE(1'b1),
        .CLK(gtrefclk_bufg),
        .D(\cpllreset_wait_reg[63]_srl32_n_1 ),
        .Q(\NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED ),
        .Q31(\cpllreset_wait_reg[95]_srl32_n_1 ));
  LUT2 #(
    .INIT(4'hE)) 
    gtxe2_i_i_1
       (.I0(cpll_reset0_i),
        .I1(gt0_cpllreset_i),
        .O(gt0_cpllreset_i_0));
endmodule

module gig_ethernet_pcs_pma_0_reset_sync
   (reset_out,
    userclk2,
    enablealign);
  output reset_out;
  input userclk2;
  input enablealign;

  wire enablealign;
  wire reset_out;
  wire reset_stage1;
  wire reset_stage2;
  wire reset_stage3;
  wire reset_stage4;
  wire reset_stage5;
  wire userclk2;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(userclk2),
        .CE(1'b1),
        .D(1'b0),
        .PRE(enablealign),
        .Q(reset_stage1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_stage1),
        .PRE(enablealign),
        .Q(reset_stage2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_stage2),
        .PRE(enablealign),
        .Q(reset_stage3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_stage3),
        .PRE(enablealign),
        .Q(reset_stage4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_stage4),
        .PRE(enablealign),
        .Q(reset_stage5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(userclk2),
        .CE(1'b1),
        .D(reset_stage5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_reset_sync" *) 
module gig_ethernet_pcs_pma_0_reset_sync_1
   (reset_out,
    independent_clock_bufg,
    reset_sync5_0);
  output reset_out;
  input independent_clock_bufg;
  input [0:0]reset_sync5_0;

  wire independent_clock_bufg;
  wire reset_out;
  wire reset_stage1;
  wire reset_stage2;
  wire reset_stage3;
  wire reset_stage4;
  wire reset_stage5;
  wire [0:0]reset_sync5_0;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(1'b0),
        .PRE(reset_sync5_0),
        .Q(reset_stage1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage1),
        .PRE(reset_sync5_0),
        .Q(reset_stage2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage2),
        .PRE(reset_sync5_0),
        .Q(reset_stage3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage3),
        .PRE(reset_sync5_0),
        .Q(reset_stage4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage4),
        .PRE(reset_sync5_0),
        .Q(reset_stage5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_reset_sync" *) 
module gig_ethernet_pcs_pma_0_reset_sync_2
   (reset_out,
    independent_clock_bufg,
    SR);
  output reset_out;
  input independent_clock_bufg;
  input [0:0]SR;

  wire [0:0]SR;
  wire independent_clock_bufg;
  wire reset_out;
  wire reset_stage1;
  wire reset_stage2;
  wire reset_stage3;
  wire reset_stage4;
  wire reset_stage5;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(1'b0),
        .PRE(SR),
        .Q(reset_stage1));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage1),
        .PRE(SR),
        .Q(reset_stage2));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage2),
        .PRE(SR),
        .Q(reset_stage3));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage3),
        .PRE(SR),
        .Q(reset_stage4));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage4),
        .PRE(SR),
        .Q(reset_stage5));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FDP" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  FDPE #(
    .INIT(1'b1)) 
    reset_sync6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset_stage5),
        .PRE(1'b0),
        .Q(reset_out));
endmodule

module gig_ethernet_pcs_pma_0_reset_wtd_timer
   (wtd_rxpcsreset_in,
    independent_clock_bufg,
    data_out);
  output wtd_rxpcsreset_in;
  input independent_clock_bufg;
  input data_out;

  wire \counter_stg1[5]_i_1_n_0 ;
  wire [5:5]counter_stg1_reg;
  wire [4:0]counter_stg1_reg__0;
  wire counter_stg1_roll;
  wire \counter_stg2[0]_i_3_n_0 ;
  wire [11:0]counter_stg2_reg;
  wire \counter_stg2_reg[0]_i_2_n_0 ;
  wire \counter_stg2_reg[0]_i_2_n_1 ;
  wire \counter_stg2_reg[0]_i_2_n_2 ;
  wire \counter_stg2_reg[0]_i_2_n_3 ;
  wire \counter_stg2_reg[0]_i_2_n_4 ;
  wire \counter_stg2_reg[0]_i_2_n_5 ;
  wire \counter_stg2_reg[0]_i_2_n_6 ;
  wire \counter_stg2_reg[0]_i_2_n_7 ;
  wire \counter_stg2_reg[4]_i_1_n_0 ;
  wire \counter_stg2_reg[4]_i_1_n_1 ;
  wire \counter_stg2_reg[4]_i_1_n_2 ;
  wire \counter_stg2_reg[4]_i_1_n_3 ;
  wire \counter_stg2_reg[4]_i_1_n_4 ;
  wire \counter_stg2_reg[4]_i_1_n_5 ;
  wire \counter_stg2_reg[4]_i_1_n_6 ;
  wire \counter_stg2_reg[4]_i_1_n_7 ;
  wire \counter_stg2_reg[8]_i_1_n_1 ;
  wire \counter_stg2_reg[8]_i_1_n_2 ;
  wire \counter_stg2_reg[8]_i_1_n_3 ;
  wire \counter_stg2_reg[8]_i_1_n_4 ;
  wire \counter_stg2_reg[8]_i_1_n_5 ;
  wire \counter_stg2_reg[8]_i_1_n_6 ;
  wire \counter_stg2_reg[8]_i_1_n_7 ;
  wire counter_stg30;
  wire \counter_stg3[0]_i_3_n_0 ;
  wire \counter_stg3[0]_i_4_n_0 ;
  wire \counter_stg3[0]_i_5_n_0 ;
  wire [11:0]counter_stg3_reg;
  wire \counter_stg3_reg[0]_i_2_n_0 ;
  wire \counter_stg3_reg[0]_i_2_n_1 ;
  wire \counter_stg3_reg[0]_i_2_n_2 ;
  wire \counter_stg3_reg[0]_i_2_n_3 ;
  wire \counter_stg3_reg[0]_i_2_n_4 ;
  wire \counter_stg3_reg[0]_i_2_n_5 ;
  wire \counter_stg3_reg[0]_i_2_n_6 ;
  wire \counter_stg3_reg[0]_i_2_n_7 ;
  wire \counter_stg3_reg[4]_i_1_n_0 ;
  wire \counter_stg3_reg[4]_i_1_n_1 ;
  wire \counter_stg3_reg[4]_i_1_n_2 ;
  wire \counter_stg3_reg[4]_i_1_n_3 ;
  wire \counter_stg3_reg[4]_i_1_n_4 ;
  wire \counter_stg3_reg[4]_i_1_n_5 ;
  wire \counter_stg3_reg[4]_i_1_n_6 ;
  wire \counter_stg3_reg[4]_i_1_n_7 ;
  wire \counter_stg3_reg[8]_i_1_n_1 ;
  wire \counter_stg3_reg[8]_i_1_n_2 ;
  wire \counter_stg3_reg[8]_i_1_n_3 ;
  wire \counter_stg3_reg[8]_i_1_n_4 ;
  wire \counter_stg3_reg[8]_i_1_n_5 ;
  wire \counter_stg3_reg[8]_i_1_n_6 ;
  wire \counter_stg3_reg[8]_i_1_n_7 ;
  wire data_out;
  wire independent_clock_bufg;
  wire [5:0]p_0_in__0;
  wire reset0;
  wire reset_i_2_n_0;
  wire reset_i_3_n_0;
  wire reset_i_4_n_0;
  wire reset_i_5_n_0;
  wire reset_i_6_n_0;
  wire reset_i_7_n_0;
  wire reset_i_8_n_0;
  wire wtd_rxpcsreset_in;
  wire [3:3]\NLW_counter_stg2_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_stg3_reg[8]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \counter_stg1[0]_i_1 
       (.I0(counter_stg1_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter_stg1[1]_i_1 
       (.I0(counter_stg1_reg__0[1]),
        .I1(counter_stg1_reg__0[0]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter_stg1[2]_i_1 
       (.I0(counter_stg1_reg__0[2]),
        .I1(counter_stg1_reg__0[1]),
        .I2(counter_stg1_reg__0[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \counter_stg1[3]_i_1 
       (.I0(counter_stg1_reg__0[3]),
        .I1(counter_stg1_reg__0[0]),
        .I2(counter_stg1_reg__0[1]),
        .I3(counter_stg1_reg__0[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \counter_stg1[4]_i_1 
       (.I0(counter_stg1_reg__0[4]),
        .I1(counter_stg1_reg__0[2]),
        .I2(counter_stg1_reg__0[1]),
        .I3(counter_stg1_reg__0[0]),
        .I4(counter_stg1_reg__0[3]),
        .O(p_0_in__0[4]));
  LUT3 #(
    .INIT(8'hBA)) 
    \counter_stg1[5]_i_1 
       (.I0(data_out),
        .I1(reset_i_2_n_0),
        .I2(counter_stg1_roll),
        .O(\counter_stg1[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \counter_stg1[5]_i_2 
       (.I0(counter_stg1_reg__0[3]),
        .I1(counter_stg1_reg__0[0]),
        .I2(counter_stg1_reg__0[1]),
        .I3(counter_stg1_reg__0[2]),
        .I4(counter_stg1_reg__0[4]),
        .I5(counter_stg1_reg),
        .O(p_0_in__0[5]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[0] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(counter_stg1_reg__0[0]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[1] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(counter_stg1_reg__0[1]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[2] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(counter_stg1_reg__0[2]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[3] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(counter_stg1_reg__0[3]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[4] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(counter_stg1_reg__0[4]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg1_reg[5] 
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(counter_stg1_reg),
        .R(\counter_stg1[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \counter_stg2[0]_i_1 
       (.I0(counter_stg1_reg),
        .I1(counter_stg1_reg__0[4]),
        .I2(counter_stg1_reg__0[2]),
        .I3(counter_stg1_reg__0[1]),
        .I4(counter_stg1_reg__0[0]),
        .I5(counter_stg1_reg__0[3]),
        .O(counter_stg1_roll));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_stg2[0]_i_3 
       (.I0(counter_stg2_reg[0]),
        .O(\counter_stg2[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[0] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[0]_i_2_n_7 ),
        .Q(counter_stg2_reg[0]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg2_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_stg2_reg[0]_i_2_n_0 ,\counter_stg2_reg[0]_i_2_n_1 ,\counter_stg2_reg[0]_i_2_n_2 ,\counter_stg2_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_stg2_reg[0]_i_2_n_4 ,\counter_stg2_reg[0]_i_2_n_5 ,\counter_stg2_reg[0]_i_2_n_6 ,\counter_stg2_reg[0]_i_2_n_7 }),
        .S({counter_stg2_reg[3:1],\counter_stg2[0]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[10] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[8]_i_1_n_5 ),
        .Q(counter_stg2_reg[10]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[11] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[8]_i_1_n_4 ),
        .Q(counter_stg2_reg[11]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[1] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[0]_i_2_n_6 ),
        .Q(counter_stg2_reg[1]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[2] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[0]_i_2_n_5 ),
        .Q(counter_stg2_reg[2]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[3] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[0]_i_2_n_4 ),
        .Q(counter_stg2_reg[3]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[4] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[4]_i_1_n_7 ),
        .Q(counter_stg2_reg[4]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg2_reg[4]_i_1 
       (.CI(\counter_stg2_reg[0]_i_2_n_0 ),
        .CO({\counter_stg2_reg[4]_i_1_n_0 ,\counter_stg2_reg[4]_i_1_n_1 ,\counter_stg2_reg[4]_i_1_n_2 ,\counter_stg2_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_stg2_reg[4]_i_1_n_4 ,\counter_stg2_reg[4]_i_1_n_5 ,\counter_stg2_reg[4]_i_1_n_6 ,\counter_stg2_reg[4]_i_1_n_7 }),
        .S(counter_stg2_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[5] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[4]_i_1_n_6 ),
        .Q(counter_stg2_reg[5]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[6] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[4]_i_1_n_5 ),
        .Q(counter_stg2_reg[6]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[7] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[4]_i_1_n_4 ),
        .Q(counter_stg2_reg[7]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[8] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[8]_i_1_n_7 ),
        .Q(counter_stg2_reg[8]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg2_reg[8]_i_1 
       (.CI(\counter_stg2_reg[4]_i_1_n_0 ),
        .CO({\NLW_counter_stg2_reg[8]_i_1_CO_UNCONNECTED [3],\counter_stg2_reg[8]_i_1_n_1 ,\counter_stg2_reg[8]_i_1_n_2 ,\counter_stg2_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_stg2_reg[8]_i_1_n_4 ,\counter_stg2_reg[8]_i_1_n_5 ,\counter_stg2_reg[8]_i_1_n_6 ,\counter_stg2_reg[8]_i_1_n_7 }),
        .S(counter_stg2_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg2_reg[9] 
       (.C(independent_clock_bufg),
        .CE(counter_stg1_roll),
        .D(\counter_stg2_reg[8]_i_1_n_6 ),
        .Q(counter_stg2_reg[9]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \counter_stg3[0]_i_1 
       (.I0(counter_stg1_roll),
        .I1(\counter_stg3[0]_i_3_n_0 ),
        .I2(counter_stg2_reg[3]),
        .I3(counter_stg2_reg[8]),
        .I4(counter_stg2_reg[11]),
        .I5(counter_stg2_reg[4]),
        .O(counter_stg30));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \counter_stg3[0]_i_3 
       (.I0(counter_stg2_reg[10]),
        .I1(counter_stg2_reg[1]),
        .I2(counter_stg2_reg[2]),
        .I3(counter_stg2_reg[5]),
        .I4(\counter_stg3[0]_i_5_n_0 ),
        .O(\counter_stg3[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_stg3[0]_i_4 
       (.I0(counter_stg3_reg[0]),
        .O(\counter_stg3[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \counter_stg3[0]_i_5 
       (.I0(counter_stg2_reg[9]),
        .I1(counter_stg2_reg[7]),
        .I2(counter_stg2_reg[0]),
        .I3(counter_stg2_reg[6]),
        .O(\counter_stg3[0]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[0] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[0]_i_2_n_7 ),
        .Q(counter_stg3_reg[0]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg3_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_stg3_reg[0]_i_2_n_0 ,\counter_stg3_reg[0]_i_2_n_1 ,\counter_stg3_reg[0]_i_2_n_2 ,\counter_stg3_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_stg3_reg[0]_i_2_n_4 ,\counter_stg3_reg[0]_i_2_n_5 ,\counter_stg3_reg[0]_i_2_n_6 ,\counter_stg3_reg[0]_i_2_n_7 }),
        .S({counter_stg3_reg[3:1],\counter_stg3[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[10] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[8]_i_1_n_5 ),
        .Q(counter_stg3_reg[10]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[11] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[8]_i_1_n_4 ),
        .Q(counter_stg3_reg[11]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[1] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[0]_i_2_n_6 ),
        .Q(counter_stg3_reg[1]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[2] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[0]_i_2_n_5 ),
        .Q(counter_stg3_reg[2]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[3] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[0]_i_2_n_4 ),
        .Q(counter_stg3_reg[3]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[4] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[4]_i_1_n_7 ),
        .Q(counter_stg3_reg[4]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg3_reg[4]_i_1 
       (.CI(\counter_stg3_reg[0]_i_2_n_0 ),
        .CO({\counter_stg3_reg[4]_i_1_n_0 ,\counter_stg3_reg[4]_i_1_n_1 ,\counter_stg3_reg[4]_i_1_n_2 ,\counter_stg3_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_stg3_reg[4]_i_1_n_4 ,\counter_stg3_reg[4]_i_1_n_5 ,\counter_stg3_reg[4]_i_1_n_6 ,\counter_stg3_reg[4]_i_1_n_7 }),
        .S(counter_stg3_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[5] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[4]_i_1_n_6 ),
        .Q(counter_stg3_reg[5]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[6] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[4]_i_1_n_5 ),
        .Q(counter_stg3_reg[6]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[7] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[4]_i_1_n_4 ),
        .Q(counter_stg3_reg[7]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[8] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[8]_i_1_n_7 ),
        .Q(counter_stg3_reg[8]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_stg3_reg[8]_i_1 
       (.CI(\counter_stg3_reg[4]_i_1_n_0 ),
        .CO({\NLW_counter_stg3_reg[8]_i_1_CO_UNCONNECTED [3],\counter_stg3_reg[8]_i_1_n_1 ,\counter_stg3_reg[8]_i_1_n_2 ,\counter_stg3_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_stg3_reg[8]_i_1_n_4 ,\counter_stg3_reg[8]_i_1_n_5 ,\counter_stg3_reg[8]_i_1_n_6 ,\counter_stg3_reg[8]_i_1_n_7 }),
        .S(counter_stg3_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_stg3_reg[9] 
       (.C(independent_clock_bufg),
        .CE(counter_stg30),
        .D(\counter_stg3_reg[8]_i_1_n_6 ),
        .Q(counter_stg3_reg[9]),
        .R(\counter_stg1[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    reset_i_1
       (.I0(counter_stg1_reg),
        .I1(reset_i_2_n_0),
        .O(reset0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    reset_i_2
       (.I0(reset_i_3_n_0),
        .I1(reset_i_4_n_0),
        .I2(reset_i_5_n_0),
        .I3(reset_i_6_n_0),
        .I4(reset_i_7_n_0),
        .I5(reset_i_8_n_0),
        .O(reset_i_2_n_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    reset_i_3
       (.I0(counter_stg3_reg[9]),
        .I1(counter_stg3_reg[8]),
        .I2(counter_stg3_reg[6]),
        .I3(counter_stg3_reg[11]),
        .O(reset_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    reset_i_4
       (.I0(counter_stg3_reg[1]),
        .I1(counter_stg2_reg[0]),
        .I2(counter_stg2_reg[10]),
        .I3(counter_stg3_reg[0]),
        .O(reset_i_4_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    reset_i_5
       (.I0(counter_stg2_reg[3]),
        .I1(counter_stg2_reg[8]),
        .I2(counter_stg2_reg[11]),
        .I3(counter_stg2_reg[4]),
        .O(reset_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    reset_i_6
       (.I0(counter_stg2_reg[7]),
        .I1(counter_stg3_reg[10]),
        .I2(counter_stg2_reg[2]),
        .I3(counter_stg3_reg[3]),
        .O(reset_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    reset_i_7
       (.I0(counter_stg3_reg[7]),
        .I1(counter_stg2_reg[5]),
        .I2(counter_stg3_reg[5]),
        .I3(counter_stg3_reg[2]),
        .O(reset_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFEF)) 
    reset_i_8
       (.I0(counter_stg2_reg[9]),
        .I1(counter_stg2_reg[6]),
        .I2(counter_stg3_reg[4]),
        .I3(counter_stg2_reg[1]),
        .O(reset_i_8_n_0));
  FDRE reset_reg
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(reset0),
        .Q(wtd_rxpcsreset_in),
        .R(1'b0));
endmodule

module gig_ethernet_pcs_pma_0_sync_block
   (resetdone,
    data_out,
    data_in,
    userclk2);
  output resetdone;
  input data_out;
  input data_in;
  input userclk2;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire resetdone;
  wire rx_reset_done_i;
  wire userclk2;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk2),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync5),
        .Q(rx_reset_done_i),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    resetdone_INST_0
       (.I0(rx_reset_done_i),
        .I1(data_out),
        .O(resetdone));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_0
   (data_out,
    data_in,
    userclk2);
  output data_out;
  input data_in;
  input userclk2;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire userclk2;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk2),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk2),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_10
   (data_out,
    data_sync_reg1_0,
    independent_clock_bufg);
  output data_out;
  input data_sync_reg1_0;
  input independent_clock_bufg;

  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg1_0;
  wire independent_clock_bufg;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync_reg1_0),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_11
   (time_out_2ms_reg,
    reset_time_out_reg,
    \FSM_sequential_rx_state_reg[0] ,
    Q,
    data_out,
    reset_time_out_reg_0,
    check_tlock_max,
    reset_time_out_reg_1,
    reset_time_out_reg_2,
    reset_time_out_reg_3,
    cplllock,
    independent_clock_bufg);
  output time_out_2ms_reg;
  output reset_time_out_reg;
  input \FSM_sequential_rx_state_reg[0] ;
  input [3:0]Q;
  input data_out;
  input reset_time_out_reg_0;
  input check_tlock_max;
  input reset_time_out_reg_1;
  input reset_time_out_reg_2;
  input reset_time_out_reg_3;
  input cplllock;
  input independent_clock_bufg;

  wire \FSM_sequential_rx_state_reg[0] ;
  wire [3:0]Q;
  wire check_tlock_max;
  wire cplllock;
  wire cplllock_sync;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;
  wire reset_time_out_i_5_n_0;
  wire reset_time_out_reg;
  wire reset_time_out_reg_0;
  wire reset_time_out_reg_1;
  wire reset_time_out_reg_2;
  wire reset_time_out_reg_3;
  wire time_out_2ms_reg;

  LUT6 #(
    .INIT(64'h0001FFFF00000000)) 
    \FSM_sequential_rx_state[3]_i_5 
       (.I0(\FSM_sequential_rx_state_reg[0] ),
        .I1(cplllock_sync),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(time_out_2ms_reg));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(cplllock),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(cplllock_sync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF80FFFFFF800000)) 
    reset_time_out_i_1__0
       (.I0(reset_time_out_reg_0),
        .I1(check_tlock_max),
        .I2(reset_time_out_reg_1),
        .I3(reset_time_out_i_5_n_0),
        .I4(reset_time_out_reg_2),
        .I5(reset_time_out_reg_3),
        .O(reset_time_out_reg));
  LUT6 #(
    .INIT(64'h1D0D1D0DD1C1DDCD)) 
    reset_time_out_i_5
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(cplllock_sync),
        .I4(Q[0]),
        .I5(data_out),
        .O(reset_time_out_i_5_n_0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_12
   (data_out,
    E,
    D,
    \FSM_sequential_rx_state_reg[2] ,
    rx_fsm_reset_done_int_reg,
    rx_fsm_reset_done_int_reg_0,
    Q,
    \FSM_sequential_rx_state_reg[0] ,
    \FSM_sequential_rx_state_reg[0]_0 ,
    \FSM_sequential_rx_state_reg[0]_1 ,
    \FSM_sequential_rx_state_reg[0]_2 ,
    \FSM_sequential_rx_state_reg[3] ,
    time_out_wait_bypass_s3,
    \FSM_sequential_rx_state_reg[3]_0 ,
    rx_fsm_reset_done_int_reg_1,
    \FSM_sequential_rx_state_reg[0]_3 ,
    \FSM_sequential_rx_state_reg[0]_4 ,
    data_in,
    data_sync_reg1_0,
    independent_clock_bufg);
  output data_out;
  output [0:0]E;
  output [2:0]D;
  output \FSM_sequential_rx_state_reg[2] ;
  input rx_fsm_reset_done_int_reg;
  input rx_fsm_reset_done_int_reg_0;
  input [3:0]Q;
  input \FSM_sequential_rx_state_reg[0] ;
  input \FSM_sequential_rx_state_reg[0]_0 ;
  input \FSM_sequential_rx_state_reg[0]_1 ;
  input \FSM_sequential_rx_state_reg[0]_2 ;
  input \FSM_sequential_rx_state_reg[3] ;
  input time_out_wait_bypass_s3;
  input \FSM_sequential_rx_state_reg[3]_0 ;
  input rx_fsm_reset_done_int_reg_1;
  input \FSM_sequential_rx_state_reg[0]_3 ;
  input \FSM_sequential_rx_state_reg[0]_4 ;
  input data_in;
  input data_sync_reg1_0;
  input independent_clock_bufg;

  wire [2:0]D;
  wire [0:0]E;
  wire \FSM_sequential_rx_state[3]_i_3_n_0 ;
  wire \FSM_sequential_rx_state[3]_i_7_n_0 ;
  wire \FSM_sequential_rx_state_reg[0] ;
  wire \FSM_sequential_rx_state_reg[0]_0 ;
  wire \FSM_sequential_rx_state_reg[0]_1 ;
  wire \FSM_sequential_rx_state_reg[0]_2 ;
  wire \FSM_sequential_rx_state_reg[0]_3 ;
  wire \FSM_sequential_rx_state_reg[0]_4 ;
  wire \FSM_sequential_rx_state_reg[2] ;
  wire \FSM_sequential_rx_state_reg[3] ;
  wire \FSM_sequential_rx_state_reg[3]_0 ;
  wire [3:0]Q;
  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg1_0;
  wire independent_clock_bufg;
  wire rx_fsm_reset_done_int;
  wire rx_fsm_reset_done_int_i_3_n_0;
  wire rx_fsm_reset_done_int_reg;
  wire rx_fsm_reset_done_int_reg_0;
  wire rx_fsm_reset_done_int_reg_1;
  wire time_out_wait_bypass_s3;

  LUT5 #(
    .INIT(32'hA8FFA8A8)) 
    \FSM_sequential_rx_state[0]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(\FSM_sequential_rx_state[3]_i_7_n_0 ),
        .I3(\FSM_sequential_rx_state_reg[0]_3 ),
        .I4(\FSM_sequential_rx_state_reg[0]_4 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'h03443377)) 
    \FSM_sequential_rx_state[1]_i_1 
       (.I0(\FSM_sequential_rx_state[3]_i_7_n_0 ),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\FSM_sequential_rx_state_reg[0]_4 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hAAABBBBBAAABAAAB)) 
    \FSM_sequential_rx_state[3]_i_1 
       (.I0(\FSM_sequential_rx_state[3]_i_3_n_0 ),
        .I1(\FSM_sequential_rx_state_reg[0] ),
        .I2(\FSM_sequential_rx_state_reg[0]_0 ),
        .I3(Q[0]),
        .I4(\FSM_sequential_rx_state_reg[0]_1 ),
        .I5(\FSM_sequential_rx_state_reg[0]_2 ),
        .O(E));
  LUT6 #(
    .INIT(64'hDDDFFFFFDDDF0000)) 
    \FSM_sequential_rx_state[3]_i_2 
       (.I0(\FSM_sequential_rx_state[3]_i_7_n_0 ),
        .I1(\FSM_sequential_rx_state_reg[3] ),
        .I2(Q[0]),
        .I3(time_out_wait_bypass_s3),
        .I4(Q[3]),
        .I5(\FSM_sequential_rx_state_reg[3]_0 ),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h4C48)) 
    \FSM_sequential_rx_state[3]_i_3 
       (.I0(data_out),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(\FSM_sequential_rx_state[3]_i_7_n_0 ),
        .O(\FSM_sequential_rx_state[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h04FF)) 
    \FSM_sequential_rx_state[3]_i_7 
       (.I0(rx_fsm_reset_done_int_reg),
        .I1(rx_fsm_reset_done_int_reg_0),
        .I2(data_out),
        .I3(Q[0]),
        .O(\FSM_sequential_rx_state[3]_i_7_n_0 ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync_reg1_0),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    rx_fsm_reset_done_int_i_1
       (.I0(rx_fsm_reset_done_int),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(rx_fsm_reset_done_int_i_3_n_0),
        .I4(data_in),
        .O(\FSM_sequential_rx_state_reg[2] ));
  LUT5 #(
    .INIT(32'h00100000)) 
    rx_fsm_reset_done_int_i_2
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(rx_fsm_reset_done_int_reg_1),
        .I3(rx_fsm_reset_done_int_reg),
        .I4(data_out),
        .O(rx_fsm_reset_done_int));
  LUT6 #(
    .INIT(64'hFFFF3131C0CCFFFF)) 
    rx_fsm_reset_done_int_i_3
       (.I0(rx_fsm_reset_done_int_reg_0),
        .I1(data_out),
        .I2(rx_fsm_reset_done_int_reg),
        .I3(rx_fsm_reset_done_int_reg_1),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(rx_fsm_reset_done_int_i_3_n_0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_13
   (SR,
    data_out,
    mmcm_locked,
    independent_clock_bufg);
  output [0:0]SR;
  output data_out;
  input mmcm_locked;
  input independent_clock_bufg;

  wire [0:0]SR;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;
  wire mmcm_locked;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(mmcm_locked),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[7]_i_1__0 
       (.I0(data_out),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_14
   (data_out,
    data_in,
    userclk);
  output data_out;
  input data_in;
  input userclk;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire userclk;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_15
   (data_out,
    data_in,
    userclk);
  output data_out;
  input data_in;
  input userclk;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire userclk;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_16
   (data_out,
    data_in,
    independent_clock_bufg);
  output data_out;
  input data_in;
  input independent_clock_bufg;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_3
   (data_out,
    status_vector,
    independent_clock_bufg);
  output data_out;
  input [0:0]status_vector;
  input independent_clock_bufg;

  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;
  wire [0:0]status_vector;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(status_vector),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_4
   (data_out,
    data_sync_reg1_0,
    independent_clock_bufg);
  output data_out;
  input data_sync_reg1_0;
  input independent_clock_bufg;

  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire data_sync_reg1_0;
  wire independent_clock_bufg;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync_reg1_0),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_5
   (E,
    \FSM_sequential_tx_state_reg[1] ,
    Q,
    reset_time_out_reg,
    \FSM_sequential_tx_state_reg[0] ,
    \FSM_sequential_tx_state_reg[0]_0 ,
    sel,
    \FSM_sequential_tx_state_reg[0]_1 ,
    mmcm_lock_reclocked,
    txresetdone_s3,
    reset_time_out,
    \FSM_sequential_tx_state[3]_i_3_0 ,
    \FSM_sequential_tx_state[3]_i_3_1 ,
    \FSM_sequential_tx_state[3]_i_3_2 ,
    \FSM_sequential_tx_state[3]_i_3_3 ,
    cplllock,
    independent_clock_bufg);
  output [0:0]E;
  output \FSM_sequential_tx_state_reg[1] ;
  input [3:0]Q;
  input reset_time_out_reg;
  input \FSM_sequential_tx_state_reg[0] ;
  input \FSM_sequential_tx_state_reg[0]_0 ;
  input sel;
  input \FSM_sequential_tx_state_reg[0]_1 ;
  input mmcm_lock_reclocked;
  input txresetdone_s3;
  input reset_time_out;
  input \FSM_sequential_tx_state[3]_i_3_0 ;
  input \FSM_sequential_tx_state[3]_i_3_1 ;
  input \FSM_sequential_tx_state[3]_i_3_2 ;
  input \FSM_sequential_tx_state[3]_i_3_3 ;
  input cplllock;
  input independent_clock_bufg;

  wire [0:0]E;
  wire \FSM_sequential_tx_state[3]_i_3_0 ;
  wire \FSM_sequential_tx_state[3]_i_3_1 ;
  wire \FSM_sequential_tx_state[3]_i_3_2 ;
  wire \FSM_sequential_tx_state[3]_i_3_3 ;
  wire \FSM_sequential_tx_state[3]_i_3_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_6_n_0 ;
  wire \FSM_sequential_tx_state[3]_i_8_n_0 ;
  wire \FSM_sequential_tx_state_reg[0] ;
  wire \FSM_sequential_tx_state_reg[0]_0 ;
  wire \FSM_sequential_tx_state_reg[0]_1 ;
  wire \FSM_sequential_tx_state_reg[1] ;
  wire [3:0]Q;
  wire cplllock;
  wire cplllock_sync;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;
  wire mmcm_lock_reclocked;
  wire reset_time_out;
  wire reset_time_out_0;
  wire reset_time_out_reg;
  wire sel;
  wire txresetdone_s3;

  LUT6 #(
    .INIT(64'h3300744433007477)) 
    \FSM_sequential_tx_state[3]_i_1 
       (.I0(\FSM_sequential_tx_state[3]_i_3_n_0 ),
        .I1(Q[0]),
        .I2(\FSM_sequential_tx_state_reg[0] ),
        .I3(\FSM_sequential_tx_state_reg[0]_0 ),
        .I4(Q[3]),
        .I5(sel),
        .O(E));
  LUT6 #(
    .INIT(64'h88B8BBBB88B88888)) 
    \FSM_sequential_tx_state[3]_i_3 
       (.I0(\FSM_sequential_tx_state[3]_i_6_n_0 ),
        .I1(Q[1]),
        .I2(\FSM_sequential_tx_state_reg[0]_1 ),
        .I3(mmcm_lock_reclocked),
        .I4(Q[2]),
        .I5(\FSM_sequential_tx_state[3]_i_8_n_0 ),
        .O(\FSM_sequential_tx_state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h45004500450045FF)) 
    \FSM_sequential_tx_state[3]_i_6 
       (.I0(txresetdone_s3),
        .I1(reset_time_out),
        .I2(\FSM_sequential_tx_state[3]_i_3_0 ),
        .I3(Q[2]),
        .I4(cplllock_sync),
        .I5(\FSM_sequential_tx_state[3]_i_3_1 ),
        .O(\FSM_sequential_tx_state[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \FSM_sequential_tx_state[3]_i_8 
       (.I0(\FSM_sequential_tx_state[3]_i_3_2 ),
        .I1(cplllock_sync),
        .I2(\FSM_sequential_tx_state[3]_i_3_3 ),
        .O(\FSM_sequential_tx_state[3]_i_8_n_0 ));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(cplllock),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(cplllock_sync),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFEAAFEFE02AA0202)) 
    reset_time_out_i_1
       (.I0(reset_time_out_0),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(reset_time_out),
        .O(\FSM_sequential_tx_state_reg[1] ));
  LUT5 #(
    .INIT(32'h10337733)) 
    reset_time_out_i_2
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(cplllock_sync),
        .I3(Q[0]),
        .I4(reset_time_out_reg),
        .O(reset_time_out_0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_6
   (SR,
    data_out,
    mmcm_locked,
    independent_clock_bufg);
  output [0:0]SR;
  output data_out;
  input mmcm_locked;
  input independent_clock_bufg;

  wire [0:0]SR;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;
  wire mmcm_locked;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(mmcm_locked),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mmcm_lock_count[7]_i_1 
       (.I0(data_out),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_7
   (data_out,
    data_in,
    userclk);
  output data_out;
  input data_in;
  input userclk;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire userclk;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_8
   (data_out,
    data_in,
    independent_clock_bufg);
  output data_out;
  input data_in;
  input independent_clock_bufg;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire independent_clock_bufg;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(independent_clock_bufg),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "gig_ethernet_pcs_pma_0_sync_block" *) 
module gig_ethernet_pcs_pma_0_sync_block_9
   (data_out,
    data_in,
    userclk);
  output data_out;
  input data_in;
  input userclk;

  wire data_in;
  wire data_out;
  wire data_sync1;
  wire data_sync2;
  wire data_sync3;
  wire data_sync4;
  wire data_sync5;
  wire userclk;

  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg1
       (.C(userclk),
        .CE(1'b1),
        .D(data_in),
        .Q(data_sync1),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg2
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync1),
        .Q(data_sync2),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg3
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync2),
        .Q(data_sync3),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg4
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync3),
        .Q(data_sync4),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg5
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync4),
        .Q(data_sync5),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* SHREG_EXTRACT = "no" *) 
  (* XILINX_LEGACY_PRIM = "FD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE GND:R" *) 
  (* box_type = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0)) 
    data_sync_reg6
       (.C(userclk),
        .CE(1'b1),
        .D(data_sync5),
        .Q(data_out),
        .R(1'b0));
endmodule

module gig_ethernet_pcs_pma_0_transceiver
   (cplllock,
    txn,
    txp,
    rxoutclk,
    txoutclk,
    data_in,
    rx_fsm_reset_done_int_reg,
    rxchariscomma,
    rxcharisk,
    Q,
    \rxdata_reg[7]_0 ,
    rxdisperr,
    rxnotintable,
    rxbuferr,
    txbuferr,
    mmcm_reset,
    gtrefclk_bufg,
    status_vector,
    independent_clock_bufg,
    userclk2,
    enablealign,
    SR,
    reset_sync5,
    gtrefclk,
    rxn,
    rxp,
    gt0_qplloutclk_in,
    gt0_qplloutrefclk_in,
    userclk,
    mmcm_locked,
    pma_reset,
    powerdown,
    D,
    txchardispval_reg_reg_0,
    \txdata_reg_reg[7]_0 ,
    txcharisk_reg_reg_0);
  output cplllock;
  output txn;
  output txp;
  output rxoutclk;
  output txoutclk;
  output data_in;
  output rx_fsm_reset_done_int_reg;
  output rxchariscomma;
  output rxcharisk;
  output [1:0]Q;
  output [7:0]\rxdata_reg[7]_0 ;
  output rxdisperr;
  output rxnotintable;
  output rxbuferr;
  output txbuferr;
  output mmcm_reset;
  input gtrefclk_bufg;
  input [0:0]status_vector;
  input independent_clock_bufg;
  input userclk2;
  input enablealign;
  input [0:0]SR;
  input [0:0]reset_sync5;
  input gtrefclk;
  input rxn;
  input rxp;
  input gt0_qplloutclk_in;
  input gt0_qplloutrefclk_in;
  input userclk;
  input mmcm_locked;
  input pma_reset;
  input powerdown;
  input [0:0]D;
  input [0:0]txchardispval_reg_reg_0;
  input [7:0]\txdata_reg_reg[7]_0 ;
  input [0:0]txcharisk_reg_reg_0;

  wire [0:0]D;
  wire [1:0]Q;
  wire [0:0]SR;
  wire cplllock;
  wire data_in;
  wire data_valid_reg2;
  wire enablealign;
  wire encommaalign_int;
  wire gt0_qplloutclk_in;
  wire gt0_qplloutrefclk_in;
  wire gtrefclk;
  wire gtrefclk_bufg;
  wire gtwizard_inst_n_7;
  wire gtwizard_inst_n_8;
  wire independent_clock_bufg;
  wire mmcm_locked;
  wire mmcm_reset;
  wire p_0_in;
  wire [0:0]p_1_in;
  wire [0:0]p_1_in__0;
  wire [7:0]p_1_in__1;
  wire [0:0]p_1_in__2;
  wire pma_reset;
  wire powerdown;
  wire [0:0]reset_sync5;
  wire rx_fsm_reset_done_int_reg;
  wire rxbuferr;
  wire rxchariscomma;
  wire [1:0]rxchariscomma_double;
  wire rxchariscomma_i_1_n_0;
  wire [1:0]rxchariscomma_int;
  wire [1:0]rxchariscomma_reg__0;
  wire rxcharisk;
  wire [1:0]rxcharisk_double;
  wire rxcharisk_i_1_n_0;
  wire [1:0]rxcharisk_int;
  wire [1:0]rxcharisk_reg__0;
  wire [1:0]rxclkcorcnt_double;
  wire [1:0]rxclkcorcnt_int;
  wire [1:0]rxclkcorcnt_reg;
  wire \rxdata[0]_i_1_n_0 ;
  wire \rxdata[1]_i_1_n_0 ;
  wire \rxdata[2]_i_1_n_0 ;
  wire \rxdata[3]_i_1_n_0 ;
  wire \rxdata[4]_i_1_n_0 ;
  wire \rxdata[5]_i_1_n_0 ;
  wire \rxdata[6]_i_1_n_0 ;
  wire \rxdata[7]_i_1_n_0 ;
  wire [15:0]rxdata_double;
  wire [15:0]rxdata_int;
  wire [15:0]rxdata_reg;
  wire [7:0]\rxdata_reg[7]_0 ;
  wire rxdisperr;
  wire [1:0]rxdisperr_double;
  wire rxdisperr_i_1_n_0;
  wire [1:0]rxdisperr_int;
  wire [1:0]rxdisperr_reg__0;
  wire rxn;
  wire rxnotintable;
  wire [1:0]rxnotintable_double;
  wire rxnotintable_i_1_n_0;
  wire [1:0]rxnotintable_int;
  wire [1:0]rxnotintable_reg__0;
  wire rxoutclk;
  wire rxp;
  wire rxpowerdown;
  wire rxpowerdown_double;
  wire rxpowerdown_reg__0;
  wire rxreset_int;
  wire [0:0]status_vector;
  wire toggle;
  wire toggle_i_1_n_0;
  wire txbuferr;
  wire [1:1]txbufstatus_reg;
  wire [1:0]txchardispmode_double;
  wire [1:0]txchardispmode_int;
  wire [1:0]txchardispval_double;
  wire [1:0]txchardispval_int;
  wire [0:0]txchardispval_reg_reg_0;
  wire [1:0]txcharisk_double;
  wire [1:0]txcharisk_int;
  wire [0:0]txcharisk_reg_reg_0;
  wire [15:0]txdata_double;
  wire [15:0]txdata_int;
  wire [7:0]\txdata_reg_reg[7]_0 ;
  wire txn;
  wire txoutclk;
  wire txp;
  wire txpowerdown;
  wire txpowerdown_double;
  wire txpowerdown_reg__0;
  wire txreset_int;
  wire userclk;
  wire userclk2;
  wire wtd_rxpcsreset_in;

  gig_ethernet_pcs_pma_0_GTWIZARD gtwizard_inst
       (.D(rxclkcorcnt_int),
        .Q(txdata_int),
        .RXBUFSTATUS(gtwizard_inst_n_8),
        .RXPD(rxpowerdown),
        .TXBUFSTATUS(gtwizard_inst_n_7),
        .TXPD(txpowerdown),
        .cplllock(cplllock),
        .data_in(data_in),
        .data_out(data_valid_reg2),
        .gt0_qplloutclk_in(gt0_qplloutclk_in),
        .gt0_qplloutrefclk_in(gt0_qplloutrefclk_in),
        .gtrefclk(gtrefclk),
        .gtrefclk_bufg(gtrefclk_bufg),
        .gtxe2_i(rxdata_int),
        .gtxe2_i_0(rxchariscomma_int),
        .gtxe2_i_1(rxcharisk_int),
        .gtxe2_i_2(rxdisperr_int),
        .gtxe2_i_3(rxnotintable_int),
        .gtxe2_i_4(txchardispmode_int),
        .gtxe2_i_5(txchardispval_int),
        .gtxe2_i_6(txcharisk_int),
        .gtxe2_i_7(rxreset_int),
        .gtxe2_i_8(txreset_int),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked),
        .mmcm_reset(mmcm_reset),
        .pma_reset(pma_reset),
        .reset_out(encommaalign_int),
        .rx_fsm_reset_done_int_reg(rx_fsm_reset_done_int_reg),
        .rxn(rxn),
        .rxoutclk(rxoutclk),
        .rxp(rxp),
        .txn(txn),
        .txoutclk(txoutclk),
        .txp(txp),
        .userclk(userclk),
        .wtd_rxpcsreset_in(wtd_rxpcsreset_in));
  gig_ethernet_pcs_pma_0_reset_sync reclock_encommaalign
       (.enablealign(enablealign),
        .reset_out(encommaalign_int),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_reset_sync_1 reclock_rxreset
       (.independent_clock_bufg(independent_clock_bufg),
        .reset_out(rxreset_int),
        .reset_sync5_0(reset_sync5));
  gig_ethernet_pcs_pma_0_reset_sync_2 reclock_txreset
       (.SR(SR),
        .independent_clock_bufg(independent_clock_bufg),
        .reset_out(txreset_int));
  gig_ethernet_pcs_pma_0_reset_wtd_timer reset_wtd_timer
       (.data_out(data_valid_reg2),
        .independent_clock_bufg(independent_clock_bufg),
        .wtd_rxpcsreset_in(wtd_rxpcsreset_in));
  FDRE rxbuferr_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(p_0_in),
        .Q(rxbuferr),
        .R(1'b0));
  FDRE \rxbufstatus_reg_reg[2] 
       (.C(userclk),
        .CE(1'b1),
        .D(gtwizard_inst_n_8),
        .Q(p_0_in),
        .R(1'b0));
  FDRE \rxchariscomma_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxchariscomma_reg__0[0]),
        .Q(rxchariscomma_double[0]),
        .R(reset_sync5));
  FDRE \rxchariscomma_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxchariscomma_reg__0[1]),
        .Q(rxchariscomma_double[1]),
        .R(reset_sync5));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    rxchariscomma_i_1
       (.I0(rxchariscomma_double[1]),
        .I1(toggle),
        .I2(rxchariscomma_double[0]),
        .O(rxchariscomma_i_1_n_0));
  FDRE rxchariscomma_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(rxchariscomma_i_1_n_0),
        .Q(rxchariscomma),
        .R(reset_sync5));
  FDRE \rxchariscomma_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxchariscomma_int[0]),
        .Q(rxchariscomma_reg__0[0]),
        .R(1'b0));
  FDRE \rxchariscomma_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxchariscomma_int[1]),
        .Q(rxchariscomma_reg__0[1]),
        .R(1'b0));
  FDRE \rxcharisk_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxcharisk_reg__0[0]),
        .Q(rxcharisk_double[0]),
        .R(reset_sync5));
  FDRE \rxcharisk_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxcharisk_reg__0[1]),
        .Q(rxcharisk_double[1]),
        .R(reset_sync5));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    rxcharisk_i_1
       (.I0(rxcharisk_double[1]),
        .I1(toggle),
        .I2(rxcharisk_double[0]),
        .O(rxcharisk_i_1_n_0));
  FDRE rxcharisk_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(rxcharisk_i_1_n_0),
        .Q(rxcharisk),
        .R(reset_sync5));
  FDRE \rxcharisk_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxcharisk_int[0]),
        .Q(rxcharisk_reg__0[0]),
        .R(1'b0));
  FDRE \rxcharisk_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxcharisk_int[1]),
        .Q(rxcharisk_reg__0[1]),
        .R(1'b0));
  FDRE \rxclkcorcnt_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxclkcorcnt_reg[0]),
        .Q(rxclkcorcnt_double[0]),
        .R(reset_sync5));
  FDRE \rxclkcorcnt_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxclkcorcnt_reg[1]),
        .Q(rxclkcorcnt_double[1]),
        .R(reset_sync5));
  FDRE \rxclkcorcnt_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxclkcorcnt_double[0]),
        .Q(Q[0]),
        .R(reset_sync5));
  FDRE \rxclkcorcnt_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(rxclkcorcnt_double[1]),
        .Q(Q[1]),
        .R(reset_sync5));
  FDRE \rxclkcorcnt_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxclkcorcnt_int[0]),
        .Q(rxclkcorcnt_reg[0]),
        .R(1'b0));
  FDRE \rxclkcorcnt_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxclkcorcnt_int[1]),
        .Q(rxclkcorcnt_reg[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[0]_i_1 
       (.I0(rxdata_double[8]),
        .I1(toggle),
        .I2(rxdata_double[0]),
        .O(\rxdata[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[1]_i_1 
       (.I0(rxdata_double[9]),
        .I1(toggle),
        .I2(rxdata_double[1]),
        .O(\rxdata[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[2]_i_1 
       (.I0(rxdata_double[10]),
        .I1(toggle),
        .I2(rxdata_double[2]),
        .O(\rxdata[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[3]_i_1 
       (.I0(rxdata_double[11]),
        .I1(toggle),
        .I2(rxdata_double[3]),
        .O(\rxdata[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[4]_i_1 
       (.I0(rxdata_double[12]),
        .I1(toggle),
        .I2(rxdata_double[4]),
        .O(\rxdata[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[5]_i_1 
       (.I0(rxdata_double[13]),
        .I1(toggle),
        .I2(rxdata_double[5]),
        .O(\rxdata[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[6]_i_1 
       (.I0(rxdata_double[14]),
        .I1(toggle),
        .I2(rxdata_double[6]),
        .O(\rxdata[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rxdata[7]_i_1 
       (.I0(rxdata_double[15]),
        .I1(toggle),
        .I2(rxdata_double[7]),
        .O(\rxdata[7]_i_1_n_0 ));
  FDRE \rxdata_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[0]),
        .Q(rxdata_double[0]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[10] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[10]),
        .Q(rxdata_double[10]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[11] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[11]),
        .Q(rxdata_double[11]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[12] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[12]),
        .Q(rxdata_double[12]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[13] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[13]),
        .Q(rxdata_double[13]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[14] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[14]),
        .Q(rxdata_double[14]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[15] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[15]),
        .Q(rxdata_double[15]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[1]),
        .Q(rxdata_double[1]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[2] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[2]),
        .Q(rxdata_double[2]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[3] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[3]),
        .Q(rxdata_double[3]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[4] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[4]),
        .Q(rxdata_double[4]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[5] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[5]),
        .Q(rxdata_double[5]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[6] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[6]),
        .Q(rxdata_double[6]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[7] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[7]),
        .Q(rxdata_double[7]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[8] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[8]),
        .Q(rxdata_double[8]),
        .R(reset_sync5));
  FDRE \rxdata_double_reg[9] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdata_reg[9]),
        .Q(rxdata_double[9]),
        .R(reset_sync5));
  FDRE \rxdata_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[0]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [0]),
        .R(reset_sync5));
  FDRE \rxdata_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[1]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [1]),
        .R(reset_sync5));
  FDRE \rxdata_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[2]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [2]),
        .R(reset_sync5));
  FDRE \rxdata_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[3]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [3]),
        .R(reset_sync5));
  FDRE \rxdata_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[4]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [4]),
        .R(reset_sync5));
  FDRE \rxdata_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[5]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [5]),
        .R(reset_sync5));
  FDRE \rxdata_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[6]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [6]),
        .R(reset_sync5));
  FDRE \rxdata_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\rxdata[7]_i_1_n_0 ),
        .Q(\rxdata_reg[7]_0 [7]),
        .R(reset_sync5));
  FDRE \rxdata_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[0]),
        .Q(rxdata_reg[0]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[10] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[10]),
        .Q(rxdata_reg[10]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[11] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[11]),
        .Q(rxdata_reg[11]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[12] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[12]),
        .Q(rxdata_reg[12]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[13] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[13]),
        .Q(rxdata_reg[13]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[14] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[14]),
        .Q(rxdata_reg[14]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[15] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[15]),
        .Q(rxdata_reg[15]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[1]),
        .Q(rxdata_reg[1]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[2] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[2]),
        .Q(rxdata_reg[2]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[3] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[3]),
        .Q(rxdata_reg[3]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[4] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[4]),
        .Q(rxdata_reg[4]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[5] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[5]),
        .Q(rxdata_reg[5]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[6] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[6]),
        .Q(rxdata_reg[6]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[7] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[7]),
        .Q(rxdata_reg[7]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[8] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[8]),
        .Q(rxdata_reg[8]),
        .R(1'b0));
  FDRE \rxdata_reg_reg[9] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdata_int[9]),
        .Q(rxdata_reg[9]),
        .R(1'b0));
  FDRE \rxdisperr_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdisperr_reg__0[0]),
        .Q(rxdisperr_double[0]),
        .R(reset_sync5));
  FDRE \rxdisperr_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxdisperr_reg__0[1]),
        .Q(rxdisperr_double[1]),
        .R(reset_sync5));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    rxdisperr_i_1
       (.I0(rxdisperr_double[1]),
        .I1(toggle),
        .I2(rxdisperr_double[0]),
        .O(rxdisperr_i_1_n_0));
  FDRE rxdisperr_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(rxdisperr_i_1_n_0),
        .Q(rxdisperr),
        .R(reset_sync5));
  FDRE \rxdisperr_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdisperr_int[0]),
        .Q(rxdisperr_reg__0[0]),
        .R(1'b0));
  FDRE \rxdisperr_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxdisperr_int[1]),
        .Q(rxdisperr_reg__0[1]),
        .R(1'b0));
  FDRE \rxnotintable_double_reg[0] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxnotintable_reg__0[0]),
        .Q(rxnotintable_double[0]),
        .R(reset_sync5));
  FDRE \rxnotintable_double_reg[1] 
       (.C(userclk2),
        .CE(toggle),
        .D(rxnotintable_reg__0[1]),
        .Q(rxnotintable_double[1]),
        .R(reset_sync5));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    rxnotintable_i_1
       (.I0(rxnotintable_double[1]),
        .I1(toggle),
        .I2(rxnotintable_double[0]),
        .O(rxnotintable_i_1_n_0));
  FDRE rxnotintable_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(rxnotintable_i_1_n_0),
        .Q(rxnotintable),
        .R(reset_sync5));
  FDRE \rxnotintable_reg_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxnotintable_int[0]),
        .Q(rxnotintable_reg__0[0]),
        .R(1'b0));
  FDRE \rxnotintable_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(rxnotintable_int[1]),
        .Q(rxnotintable_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rxpowerdown_double_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(powerdown),
        .Q(rxpowerdown_double),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rxpowerdown_reg
       (.C(userclk),
        .CE(1'b1),
        .D(rxpowerdown_reg__0),
        .Q(rxpowerdown),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rxpowerdown_reg_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(rxpowerdown_double),
        .Q(rxpowerdown_reg__0),
        .R(reset_sync5));
  gig_ethernet_pcs_pma_0_sync_block_3 sync_block_data_valid
       (.data_out(data_valid_reg2),
        .independent_clock_bufg(independent_clock_bufg),
        .status_vector(status_vector));
  LUT1 #(
    .INIT(2'h1)) 
    toggle_i_1
       (.I0(toggle),
        .O(toggle_i_1_n_0));
  FDRE toggle_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(toggle_i_1_n_0),
        .Q(toggle),
        .R(SR));
  FDRE txbuferr_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(txbufstatus_reg),
        .Q(txbuferr),
        .R(1'b0));
  FDRE \txbufstatus_reg_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(gtwizard_inst_n_7),
        .Q(txbufstatus_reg),
        .R(1'b0));
  FDRE \txchardispmode_double_reg[0] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in),
        .Q(txchardispmode_double[0]),
        .R(SR));
  FDRE \txchardispmode_double_reg[1] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(D),
        .Q(txchardispmode_double[1]),
        .R(SR));
  FDRE \txchardispmode_int_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(txchardispmode_double[0]),
        .Q(txchardispmode_int[0]),
        .R(1'b0));
  FDRE \txchardispmode_int_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(txchardispmode_double[1]),
        .Q(txchardispmode_int[1]),
        .R(1'b0));
  FDRE txchardispmode_reg_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(D),
        .Q(p_1_in),
        .R(SR));
  FDRE \txchardispval_double_reg[0] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__0),
        .Q(txchardispval_double[0]),
        .R(SR));
  FDRE \txchardispval_double_reg[1] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(txchardispval_reg_reg_0),
        .Q(txchardispval_double[1]),
        .R(SR));
  FDRE \txchardispval_int_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(txchardispval_double[0]),
        .Q(txchardispval_int[0]),
        .R(1'b0));
  FDRE \txchardispval_int_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(txchardispval_double[1]),
        .Q(txchardispval_int[1]),
        .R(1'b0));
  FDRE txchardispval_reg_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(txchardispval_reg_reg_0),
        .Q(p_1_in__0),
        .R(SR));
  FDRE \txcharisk_double_reg[0] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__2),
        .Q(txcharisk_double[0]),
        .R(SR));
  FDRE \txcharisk_double_reg[1] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(txcharisk_reg_reg_0),
        .Q(txcharisk_double[1]),
        .R(SR));
  FDRE \txcharisk_int_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(txcharisk_double[0]),
        .Q(txcharisk_int[0]),
        .R(1'b0));
  FDRE \txcharisk_int_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(txcharisk_double[1]),
        .Q(txcharisk_int[1]),
        .R(1'b0));
  FDRE txcharisk_reg_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(txcharisk_reg_reg_0),
        .Q(p_1_in__2),
        .R(SR));
  FDRE \txdata_double_reg[0] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[0]),
        .Q(txdata_double[0]),
        .R(SR));
  FDRE \txdata_double_reg[10] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [2]),
        .Q(txdata_double[10]),
        .R(SR));
  FDRE \txdata_double_reg[11] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [3]),
        .Q(txdata_double[11]),
        .R(SR));
  FDRE \txdata_double_reg[12] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [4]),
        .Q(txdata_double[12]),
        .R(SR));
  FDRE \txdata_double_reg[13] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [5]),
        .Q(txdata_double[13]),
        .R(SR));
  FDRE \txdata_double_reg[14] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [6]),
        .Q(txdata_double[14]),
        .R(SR));
  FDRE \txdata_double_reg[15] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [7]),
        .Q(txdata_double[15]),
        .R(SR));
  FDRE \txdata_double_reg[1] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[1]),
        .Q(txdata_double[1]),
        .R(SR));
  FDRE \txdata_double_reg[2] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[2]),
        .Q(txdata_double[2]),
        .R(SR));
  FDRE \txdata_double_reg[3] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[3]),
        .Q(txdata_double[3]),
        .R(SR));
  FDRE \txdata_double_reg[4] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[4]),
        .Q(txdata_double[4]),
        .R(SR));
  FDRE \txdata_double_reg[5] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[5]),
        .Q(txdata_double[5]),
        .R(SR));
  FDRE \txdata_double_reg[6] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[6]),
        .Q(txdata_double[6]),
        .R(SR));
  FDRE \txdata_double_reg[7] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(p_1_in__1[7]),
        .Q(txdata_double[7]),
        .R(SR));
  FDRE \txdata_double_reg[8] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [0]),
        .Q(txdata_double[8]),
        .R(SR));
  FDRE \txdata_double_reg[9] 
       (.C(userclk2),
        .CE(toggle_i_1_n_0),
        .D(\txdata_reg_reg[7]_0 [1]),
        .Q(txdata_double[9]),
        .R(SR));
  FDRE \txdata_int_reg[0] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[0]),
        .Q(txdata_int[0]),
        .R(1'b0));
  FDRE \txdata_int_reg[10] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[10]),
        .Q(txdata_int[10]),
        .R(1'b0));
  FDRE \txdata_int_reg[11] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[11]),
        .Q(txdata_int[11]),
        .R(1'b0));
  FDRE \txdata_int_reg[12] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[12]),
        .Q(txdata_int[12]),
        .R(1'b0));
  FDRE \txdata_int_reg[13] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[13]),
        .Q(txdata_int[13]),
        .R(1'b0));
  FDRE \txdata_int_reg[14] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[14]),
        .Q(txdata_int[14]),
        .R(1'b0));
  FDRE \txdata_int_reg[15] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[15]),
        .Q(txdata_int[15]),
        .R(1'b0));
  FDRE \txdata_int_reg[1] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[1]),
        .Q(txdata_int[1]),
        .R(1'b0));
  FDRE \txdata_int_reg[2] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[2]),
        .Q(txdata_int[2]),
        .R(1'b0));
  FDRE \txdata_int_reg[3] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[3]),
        .Q(txdata_int[3]),
        .R(1'b0));
  FDRE \txdata_int_reg[4] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[4]),
        .Q(txdata_int[4]),
        .R(1'b0));
  FDRE \txdata_int_reg[5] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[5]),
        .Q(txdata_int[5]),
        .R(1'b0));
  FDRE \txdata_int_reg[6] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[6]),
        .Q(txdata_int[6]),
        .R(1'b0));
  FDRE \txdata_int_reg[7] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[7]),
        .Q(txdata_int[7]),
        .R(1'b0));
  FDRE \txdata_int_reg[8] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[8]),
        .Q(txdata_int[8]),
        .R(1'b0));
  FDRE \txdata_int_reg[9] 
       (.C(userclk),
        .CE(1'b1),
        .D(txdata_double[9]),
        .Q(txdata_int[9]),
        .R(1'b0));
  FDRE \txdata_reg_reg[0] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [0]),
        .Q(p_1_in__1[0]),
        .R(SR));
  FDRE \txdata_reg_reg[1] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [1]),
        .Q(p_1_in__1[1]),
        .R(SR));
  FDRE \txdata_reg_reg[2] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [2]),
        .Q(p_1_in__1[2]),
        .R(SR));
  FDRE \txdata_reg_reg[3] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [3]),
        .Q(p_1_in__1[3]),
        .R(SR));
  FDRE \txdata_reg_reg[4] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [4]),
        .Q(p_1_in__1[4]),
        .R(SR));
  FDRE \txdata_reg_reg[5] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [5]),
        .Q(p_1_in__1[5]),
        .R(SR));
  FDRE \txdata_reg_reg[6] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [6]),
        .Q(p_1_in__1[6]),
        .R(SR));
  FDRE \txdata_reg_reg[7] 
       (.C(userclk2),
        .CE(1'b1),
        .D(\txdata_reg_reg[7]_0 [7]),
        .Q(p_1_in__1[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    txpowerdown_double_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(txpowerdown_reg__0),
        .Q(txpowerdown_double),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    txpowerdown_reg
       (.C(userclk),
        .CE(1'b1),
        .D(txpowerdown_double),
        .Q(txpowerdown),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    txpowerdown_reg_reg
       (.C(userclk2),
        .CE(1'b1),
        .D(powerdown),
        .Q(txpowerdown_reg__0),
        .R(SR));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XL0vCpwJkpY29C2iE4LPlf/odeUNPw9BVX/J5pEuKj2Daef6TwO4W44ER/rohRxort+oJ1FEnjTl
dO9suKxGx6l5qoEu601AYmdQx5qtrjpt5ZGKiDiqJHQu0sNZj2OpRSMBF2+xpK6q1k0YwWEsL2yM
Dk14qp/TPBMp5RE5dog=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk367+A7d85WWbWihXnmNhli57Ii8GCSlPvH8qHqwzR/ezoXFHJelkpzH2yVZqsPrfmk2NFaOsEs
M1axqfiNh0tU1KMP7/T8Z8SUUXEL8RHmFLGRFGDFU09+/htgWkyd52BTRgIK4xxqdNeHRvHuh9eO
Xoc91nJGkr5lyxxTROPFBa+JdoqRs9bDqyz3atfFQej6vJovFHG2okDG/vCx1XB1qvN+e1+epX31
2giRBGffUGfZdshykZtf0S0Kj1hobLe34cMhJaDdZ+jhjN6QiA9PF+Uhp/S/A8APv5yY2pLwZJi/
lx733RyXkWqUcnNtuuQXd+cbVvDu8Nkgy8Wrqg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
PSDriSbxCGy1IkAQGX1Dpf4e+G70LYZYfQvHhkTdWu3f8dIzce38bnZUYwJ3PFkbLPD9xdrPHXpc
YHffwh/sskJmoWdc3xCXegJzAt03leKM0XeW0QDeuMElufJyRoPGciV0ISzDtCccOegxRPMnXkzI
kE04JwwijsIe2HS3mWA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mY+SycwdugcaAAgVirnNdFm8EBfn62CPaeo94BjJZ+vU9m28AxCSwDD3tD06N21maLpla50ThHcZ
2+106fXzJsWtL9Pz+RPRWduaY/aqQj9DI1lsK962ves+UJ55hZpmrK6XQ0LbTkTACnJ+rbn1XOr6
Sy6zYwJAJc8qnHmIgrQxv5S9PmPs3PD3w/KTPcknzXMtlxwEyfFFJv3qUPbJf4hQiKWId/2N0keC
yuxY3jIMroLsnWmLHYAHDH+KBlPKhm0T47WRfD7mAEUsdvMGdJJMQSAz7kZj14OUMXw4DFxp31LM
Mdw8lsakafIjy2kkFUJbghSGrmLhS9eejA4drA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XD7l6Li/98UDd4ASpKYFRLL/Bm3DF1ctodfSWQQYkOkHw+iPJrP4dUeL4uxbw5cmd13HI9d/+bl7
flwuZn1ZsI8+fTLM3T0oYPyVEcleZHq0WhbH4/fAZVtG1KCzFHAkmPbLs7uv7CMumqjJdmtmn5+j
xPyobFsdk7JkDBGTpiw6sLLYNRajRDRO+TtCCooQg1oZ9mbnKEQn+ccjBbpltTTovGTXxvIys5QE
AyX9dO8uSwtGll4an6rSWFnl0uDG8mKULJjCoJCx5igXn5MfbZyoun9fmtC0oBi6/z70Bc7Ngf/X
BxC2PFv9du+wdtufsrRExX5CtLY6SrrVbYmgsg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NnkpyUpgSR1m9dLBiJuJuOGCGzGq+qYsW2dFPuHEdelcqcyBjCfhAHOxsPTg47uYbXrmZKPQT9oB
mF2IFSybwtNxfbYFoozuT0BNJ/5tM80X+LXJbFfCwvgBsytlBfwh0uSzLrHE/8Rj8J7mLWry0qh3
iJAr2rFe8K6RVUpdeiifjliMaSreWEgvFSdo2esnYOcHcjY+Hu8svZHAEUWDKh73U70IF7FdFvqF
XO1yYXuXJRiceHuJPwpgh+dKsPDerxr30wA8JeIZXlrJf9HlT+0dlKVBCNqzJaYEpnPDQJz729Ff
Z07YHgx5oCRnxKUnnjT955+n0UO5Bm0CbNM98g==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C8Tp/eDRRCMOwHxdxcUmbuASA2jQT5JtPZgfJpftbLH97GxlWZMNcwUflF51EUdAwd7Ir0jGS4SN
cr6Uva26gsckiDjhmtq68IVcUBq8iifyFtfwFTkAYsSR9t4iFExJQmqmJhRj/kjacbUMGJYAC6zR
h3ljNiQdmkYQpOt5jaSWP95maYRqXft/7eCGmAeaT/hsFmBP3RQOCK0k9gUhLLR1PO5xnTyZjGQJ
VCk/JVMUOSmN3A3j8uruhVvih7YMqPc9iQBC+HtbR5h4rhfWuy61XFdNoAJHjYVA1tYMqW+AEV+Q
1VtSSnB2mmxlGlAt5Neajfvuyy7rlpFsJ45pjQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
xpgEYrMDyzTrppjK9pdbdERRVcGsOM1wehgNM05p7/GPYcE/Ldlf0NddSTOkeI7hjbtKJh5O+mOM
1DBGpPYqiLVAGGEkWOjemutvTwnFlOgFP/jBtscvT0xoJBauy19XM/qMu2zEdGpo+cTuJWzONd/i
3ghZO49KQIulbxfD2jQCC9rH6BOq1q57AbVoYFrWhtZyeWmQYWqoBBCoKhU0mW4HcQbiWcYymJHT
F7Wl3c/rvmZ19HaO7JHZa6PyhFnE8YeyhkUhNO5fcvZ7gFHlRumoJS365hjRroAoOu/CLJR/eLzy
ipT4tHFj/T7mhSJUeLz7A/6hK8fdFLzSZwEuZVstx+LDWxZ6pst0+57+uQ0enpOHMLlWG7IDZ9AV
vnJhH0UrMMbR196CYsdG3cIByN27DizesnW+jNkMQBaswtDLtVZnbdkXy8Zk9SXNXJvTwQegCw/a
5CAl8y//34XRWeFt4Wtkeso5A1iTLvpgBuH+GJMSKXA7KSxJoCnBU8Fi

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PtXIj+hfSzAR7L3qE+PnK05Exl2JklQ0WEvqE/2UzQ6NMKlYocvT6ipW6HQPMOEIcQZ0yLsnPM3H
AJTKwnCXBrDf9LrsG68+NcVRqGYlmQxBA+B/Wz13Is/n6cNLZF0gc3NyuJtBtL2Uxe3MwscxIw7q
kdbu2/O6Cyl0g687jBXJycalF9NXdTP1rxdkEcnqKylZS7CE4cy54owMRjqGSecZkwM9W6KM/LnC
gXlHpN84ld6K+TZYDQX69vk5C2jSfvikiyv+hOQBT9MYZBs7WpN6ZB7rzEIftz7mRrfVTftis8ny
vl11eoBQKss+QRJIL8eXborkKe8di5p1yilcPQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 323232)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
