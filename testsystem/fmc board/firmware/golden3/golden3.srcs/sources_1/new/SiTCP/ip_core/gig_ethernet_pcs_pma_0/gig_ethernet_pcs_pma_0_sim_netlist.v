// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Aug 20 16:08:33 2023
// Host        : DESKTOP-PTU6AJN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top gig_ethernet_pcs_pma_0 -prefix
//               gig_ethernet_pcs_pma_0_ gig_ethernet_pcs_pma_0_sim_netlist.v
// Design      : gig_ethernet_pcs_pma_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg676-2
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block inst
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD
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

  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init inst
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM gt0_rxresetfsm_i
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM gt0_txresetfsm_i
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt gtwizard_i
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt
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

  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing cpll_railing0_i
       (.gt0_cpllpd_i(gt0_cpllpd_i),
        .gt0_cpllreset_i(gt0_cpllreset_i),
        .gt0_cpllreset_i_0(gt0_cpllreset_i_0),
        .gtrefclk_bufg(gtrefclk_bufg));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT gt0_GTWIZARD_i
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 sync_RXRESETDONE
       (.data_out(rxresetdone_s2),
        .data_sync_reg1_0(data_sync_reg1),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 sync_cplllock
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 sync_data_valid
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 sync_mmcm_lock_reclocked
       (.SR(sync_mmcm_lock_reclocked_n_0),
        .data_out(mmcm_lock_i),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 sync_run_phase_alignment_int
       (.data_in(run_phase_alignment_int_reg_n_0),
        .data_out(run_phase_alignment_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 sync_rx_fsm_reset_done_int
       (.data_in(data_in),
        .data_out(rx_fsm_reset_done_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 sync_time_out_wait_bypass
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4 sync_TXRESETDONE
       (.data_out(txresetdone_s2),
        .data_sync_reg1_0(data_sync_reg1),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5 sync_cplllock
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6 sync_mmcm_lock_reclocked
       (.SR(sync_mmcm_lock_reclocked_n_0),
        .data_out(mmcm_lock_i),
        .independent_clock_bufg(independent_clock_bufg),
        .mmcm_locked(mmcm_locked));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 sync_run_phase_alignment_int
       (.data_in(run_phase_alignment_int_reg_n_0),
        .data_out(run_phase_alignment_int_s2),
        .userclk(userclk));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 sync_time_out_wait_bypass
       (.data_in(time_out_wait_bypass_reg_n_0),
        .data_out(time_out_wait_bypass_s2),
        .independent_clock_bufg(independent_clock_bufg));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 sync_tx_fsm_reset_done_int
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block sync_block_rx_reset_done
       (.data_in(transceiver_inst_n_6),
        .data_out(tx_reset_done_i),
        .resetdone(resetdone),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0 sync_block_tx_reset_done
       (.data_in(transceiver_inst_n_5),
        .data_out(tx_reset_done_i),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver transceiver_inst
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8
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
module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9
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

module gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver
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

  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD gtwizard_inst
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync reclock_encommaalign
       (.enablealign(enablealign),
        .reset_out(encommaalign_int),
        .userclk2(userclk2));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1 reclock_rxreset
       (.independent_clock_bufg(independent_clock_bufg),
        .reset_out(rxreset_int),
        .reset_sync5_0(reset_sync5));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2 reclock_txreset
       (.SR(SR),
        .independent_clock_bufg(independent_clock_bufg),
        .reset_out(txreset_int));
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer reset_wtd_timer
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
  gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3 sync_block_data_valid
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 322848)
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
