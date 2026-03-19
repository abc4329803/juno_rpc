-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Fri Sep 30 15:55:42 2022
-- Host        : LAPTOP-8T9G1ILJ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/50653/Desktop/TDC_update/SiTCP_rfd/SRC/ip_core/gig_ethernet_pcs_pma_0/gig_ethernet_pcs_pma_0_sim_netlist.vhdl
-- Design      : gig_ethernet_pcs_pma_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k325tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_GTWIZARD_GT is
  port (
    cplllock : out STD_LOGIC;
    gt0_cpllrefclklost_i : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    gtxe2_i_0 : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    gtxe2_i_1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    RXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtxe2_i_2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_5 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_6 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    independent_clock_bufg : in STD_LOGIC;
    gt0_cpllpd_i : in STD_LOGIC;
    gt0_cpllreset_i_0 : in STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    gtrefclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_gttxreset_gt : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    wtd_rxpcsreset_in : in STD_LOGIC;
    gt0_rxuserrdy_i : in STD_LOGIC;
    userclk : in STD_LOGIC;
    TXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_txuserrdy_i : in STD_LOGIC;
    RXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_8 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_9 : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end gig_ethernet_pcs_pma_0_GTWIZARD_GT;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_GTWIZARD_GT is
  signal gtxe2_i_n_0 : STD_LOGIC;
  signal gtxe2_i_n_10 : STD_LOGIC;
  signal gtxe2_i_n_16 : STD_LOGIC;
  signal gtxe2_i_n_170 : STD_LOGIC;
  signal gtxe2_i_n_171 : STD_LOGIC;
  signal gtxe2_i_n_172 : STD_LOGIC;
  signal gtxe2_i_n_173 : STD_LOGIC;
  signal gtxe2_i_n_174 : STD_LOGIC;
  signal gtxe2_i_n_175 : STD_LOGIC;
  signal gtxe2_i_n_176 : STD_LOGIC;
  signal gtxe2_i_n_177 : STD_LOGIC;
  signal gtxe2_i_n_178 : STD_LOGIC;
  signal gtxe2_i_n_179 : STD_LOGIC;
  signal gtxe2_i_n_180 : STD_LOGIC;
  signal gtxe2_i_n_181 : STD_LOGIC;
  signal gtxe2_i_n_182 : STD_LOGIC;
  signal gtxe2_i_n_183 : STD_LOGIC;
  signal gtxe2_i_n_184 : STD_LOGIC;
  signal gtxe2_i_n_27 : STD_LOGIC;
  signal gtxe2_i_n_3 : STD_LOGIC;
  signal gtxe2_i_n_38 : STD_LOGIC;
  signal gtxe2_i_n_39 : STD_LOGIC;
  signal gtxe2_i_n_4 : STD_LOGIC;
  signal gtxe2_i_n_46 : STD_LOGIC;
  signal gtxe2_i_n_47 : STD_LOGIC;
  signal gtxe2_i_n_48 : STD_LOGIC;
  signal gtxe2_i_n_49 : STD_LOGIC;
  signal gtxe2_i_n_50 : STD_LOGIC;
  signal gtxe2_i_n_51 : STD_LOGIC;
  signal gtxe2_i_n_52 : STD_LOGIC;
  signal gtxe2_i_n_53 : STD_LOGIC;
  signal gtxe2_i_n_54 : STD_LOGIC;
  signal gtxe2_i_n_55 : STD_LOGIC;
  signal gtxe2_i_n_56 : STD_LOGIC;
  signal gtxe2_i_n_57 : STD_LOGIC;
  signal gtxe2_i_n_58 : STD_LOGIC;
  signal gtxe2_i_n_59 : STD_LOGIC;
  signal gtxe2_i_n_60 : STD_LOGIC;
  signal gtxe2_i_n_61 : STD_LOGIC;
  signal gtxe2_i_n_81 : STD_LOGIC;
  signal gtxe2_i_n_83 : STD_LOGIC;
  signal gtxe2_i_n_84 : STD_LOGIC;
  signal gtxe2_i_n_9 : STD_LOGIC;
  signal NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gtxe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtxe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtxe2_i_TSTOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute box_type : string;
  attribute box_type of gtxe2_i : label is "PRIMITIVE";
begin
gtxe2_i: unisim.vcomponents.GTXE2_CHANNEL
    generic map(
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"0001111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "TRUE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 36,
      CLK_COR_MIN_LAT => 33,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0110111100",
      CLK_COR_SEQ_1_2 => B"0001010000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0110111100",
      CLK_COR_SEQ_2_2 => B"0010110101",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "TRUE",
      CLK_COR_SEQ_LEN => 2,
      CPLL_CFG => X"BC07DC",
      CPLL_FBDIV => 4,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "FALSE",
      DMONITOR_CFG => X"000A00",
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"19",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => X"00018480",
      PMA_RSV2 => X"2050",
      PMA_RSV3 => B"00",
      PMA_RSV4 => X"00000000",
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FULL",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 8,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"03000023FF10100020",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00000011110000",
      RXLPM_LF_CFG => B"00000011110000",
      RXOOB_CFG => B"0000110",
      RXOUT_DIV => 4,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"000000",
      RXPH_MONITOR_SEL => B"00000",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RX_BIAS_CFG => B"000000000100",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 5,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"11",
      RX_CM_TRIM => B"010",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFE_GAIN_CFG => X"020FEA",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011110000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_KL_CFG => B"0000011111110",
      RX_DFE_KL_CFG2 => X"301148AC",
      RX_DFE_LPM_CFG => X"0904",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_UT_CFG => B"10001111000000000",
      RX_DFE_VP_CFG => B"00011111100000011",
      RX_DFE_XYD_CFG => B"0000000000000",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"0101",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "TRUE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "4.0",
      TERM_RCAL_CFG => B"10000",
      TERM_RCAL_OVRD => '0',
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOUT_DIV => 4,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPMARESET_TIME => B"00001",
      TX_CLK25_DIV => 5,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"00000",
      TX_DEEMPH1 => B"00000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_PREDRIVER_MODE => '0',
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0'
    )
        port map (
      CFGRESET => '0',
      CLKRSVD(3 downto 0) => B"0000",
      CPLLFBCLKLOST => gtxe2_i_n_0,
      CPLLLOCK => cplllock,
      CPLLLOCKDETCLK => independent_clock_bufg,
      CPLLLOCKEN => '1',
      CPLLPD => gt0_cpllpd_i,
      CPLLREFCLKLOST => gt0_cpllrefclklost_i,
      CPLLREFCLKSEL(2 downto 0) => B"001",
      CPLLRESET => gt0_cpllreset_i_0,
      DMONITOROUT(7) => gtxe2_i_n_177,
      DMONITOROUT(6) => gtxe2_i_n_178,
      DMONITOROUT(5) => gtxe2_i_n_179,
      DMONITOROUT(4) => gtxe2_i_n_180,
      DMONITOROUT(3) => gtxe2_i_n_181,
      DMONITOROUT(2) => gtxe2_i_n_182,
      DMONITOROUT(1) => gtxe2_i_n_183,
      DMONITOROUT(0) => gtxe2_i_n_184,
      DRPADDR(8 downto 0) => B"000000000",
      DRPCLK => gtrefclk_bufg,
      DRPDI(15 downto 0) => B"0000000000000000",
      DRPDO(15) => gtxe2_i_n_46,
      DRPDO(14) => gtxe2_i_n_47,
      DRPDO(13) => gtxe2_i_n_48,
      DRPDO(12) => gtxe2_i_n_49,
      DRPDO(11) => gtxe2_i_n_50,
      DRPDO(10) => gtxe2_i_n_51,
      DRPDO(9) => gtxe2_i_n_52,
      DRPDO(8) => gtxe2_i_n_53,
      DRPDO(7) => gtxe2_i_n_54,
      DRPDO(6) => gtxe2_i_n_55,
      DRPDO(5) => gtxe2_i_n_56,
      DRPDO(4) => gtxe2_i_n_57,
      DRPDO(3) => gtxe2_i_n_58,
      DRPDO(2) => gtxe2_i_n_59,
      DRPDO(1) => gtxe2_i_n_60,
      DRPDO(0) => gtxe2_i_n_61,
      DRPEN => '0',
      DRPRDY => gtxe2_i_n_3,
      DRPWE => '0',
      EYESCANDATAERROR => gtxe2_i_n_4,
      EYESCANMODE => '0',
      EYESCANRESET => '0',
      EYESCANTRIGGER => '0',
      GTGREFCLK => '0',
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => gtrefclk,
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gtxe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15 downto 0) => B"0000000000000000",
      GTRXRESET => SR(0),
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => gt0_gttxreset_gt,
      GTXRXN => rxn,
      GTXRXP => rxp,
      GTXTXN => txn,
      GTXTXP => txp,
      LOOPBACK(2 downto 0) => B"000",
      PCSRSVDIN(15 downto 0) => B"0000000000000000",
      PCSRSVDIN2(4 downto 0) => B"00000",
      PCSRSVDOUT(15 downto 0) => NLW_gtxe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gtxe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4 downto 0) => B"00000",
      PMARSVDIN2(4 downto 0) => B"00000",
      QPLLCLK => gt0_qplloutclk_in,
      QPLLREFCLK => gt0_qplloutrefclk_in,
      RESETOVRD => '0',
      RX8B10BEN => '1',
      RXBUFRESET => '0',
      RXBUFSTATUS(2) => RXBUFSTATUS(0),
      RXBUFSTATUS(1) => gtxe2_i_n_83,
      RXBUFSTATUS(0) => gtxe2_i_n_84,
      RXBYTEISALIGNED => gtxe2_i_n_9,
      RXBYTEREALIGN => gtxe2_i_n_10,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gtxe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gtxe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gtxe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gtxe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gtxe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => gtxe2_i_3(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gtxe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => gtxe2_i_4(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4 downto 0) => B"00000",
      RXCHBONDLEVEL(2 downto 0) => B"000",
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gtxe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => D(1 downto 0),
      RXCOMINITDET => NLW_gtxe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => gtxe2_i_n_16,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gtxe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gtxe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gtxe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => gtxe2_i_2(15 downto 0),
      RXDATAVALID => NLW_gtxe2_i_RXDATAVALID_UNCONNECTED,
      RXDDIEN => '0',
      RXDFEAGCHOLD => '0',
      RXDFEAGCOVRDEN => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => '0',
      RXDFELFOVRDEN => '0',
      RXDFELPMRESET => '0',
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDFEXYDHOLD => '0',
      RXDFEXYDOVRDEN => '0',
      RXDISPERR(7 downto 2) => NLW_gtxe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => gtxe2_i_5(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gtxe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gtxe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1 downto 0) => B"11",
      RXGEARBOXSLIP => '0',
      RXHEADER(2 downto 0) => NLW_gtxe2_i_RXHEADER_UNCONNECTED(2 downto 0),
      RXHEADERVALID => NLW_gtxe2_i_RXHEADERVALID_UNCONNECTED,
      RXLPMEN => '1',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => reset_out,
      RXMONITOROUT(6) => gtxe2_i_n_170,
      RXMONITOROUT(5) => gtxe2_i_n_171,
      RXMONITOROUT(4) => gtxe2_i_n_172,
      RXMONITOROUT(3) => gtxe2_i_n_173,
      RXMONITOROUT(2) => gtxe2_i_n_174,
      RXMONITOROUT(1) => gtxe2_i_n_175,
      RXMONITOROUT(0) => gtxe2_i_n_176,
      RXMONITORSEL(1 downto 0) => B"00",
      RXNOTINTABLE(7 downto 2) => NLW_gtxe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => gtxe2_i_6(1 downto 0),
      RXOOBRESET => '0',
      RXOSHOLD => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => rxoutclk,
      RXOUTCLKFABRIC => NLW_gtxe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gtxe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2 downto 0) => B"010",
      RXPCOMMAALIGNEN => reset_out,
      RXPCSRESET => wtd_rxpcsreset_in,
      RXPD(1) => RXPD(0),
      RXPD(0) => RXPD(0),
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gtxe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gtxe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gtxe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => gtxe2_i_n_27,
      RXPRBSSEL(2 downto 0) => B"000",
      RXQPIEN => '0',
      RXQPISENN => NLW_gtxe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gtxe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2 downto 0) => B"000",
      RXRATEDONE => NLW_gtxe2_i_RXRATEDONE_UNCONNECTED,
      RXRESETDONE => gtxe2_i_0,
      RXSLIDE => '0',
      RXSTARTOFSEQ => NLW_gtxe2_i_RXSTARTOFSEQ_UNCONNECTED,
      RXSTATUS(2 downto 0) => NLW_gtxe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYSCLKSEL(1 downto 0) => B"00",
      RXUSERRDY => gt0_rxuserrdy_i,
      RXUSRCLK => userclk,
      RXUSRCLK2 => userclk,
      RXVALID => NLW_gtxe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      TSTIN(19 downto 0) => B"11111111111111111111",
      TSTOUT(9 downto 0) => NLW_gtxe2_i_TSTOUT_UNCONNECTED(9 downto 0),
      TX8B10BBYPASS(7 downto 0) => B"00000000",
      TX8B10BEN => '1',
      TXBUFDIFFCTRL(2 downto 0) => B"100",
      TXBUFSTATUS(1) => TXBUFSTATUS(0),
      TXBUFSTATUS(0) => gtxe2_i_n_81,
      TXCHARDISPMODE(7 downto 2) => B"000000",
      TXCHARDISPMODE(1 downto 0) => gtxe2_i_7(1 downto 0),
      TXCHARDISPVAL(7 downto 2) => B"000000",
      TXCHARDISPVAL(1 downto 0) => gtxe2_i_8(1 downto 0),
      TXCHARISK(7 downto 2) => B"000000",
      TXCHARISK(1 downto 0) => gtxe2_i_9(1 downto 0),
      TXCOMFINISH => NLW_gtxe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63 downto 16) => B"000000000000000000000000000000000000000000000000",
      TXDATA(15 downto 0) => Q(15 downto 0),
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3 downto 0) => B"1000",
      TXDIFFPD => '0',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gtxe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => TXPD(0),
      TXGEARBOXREADY => NLW_gtxe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2 downto 0) => B"000",
      TXINHIBIT => '0',
      TXMAINCURSOR(6 downto 0) => B"0000000",
      TXMARGIN(2 downto 0) => B"000",
      TXOUTCLK => txoutclk,
      TXOUTCLKFABRIC => gtxe2_i_n_38,
      TXOUTCLKPCS => gtxe2_i_n_39,
      TXOUTCLKSEL(2 downto 0) => B"100",
      TXPCSRESET => '0',
      TXPD(1) => TXPD(0),
      TXPD(0) => TXPD(0),
      TXPDELECIDLEMODE => '0',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gtxe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '0',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gtxe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPISOPD => '0',
      TXPMARESET => '0',
      TXPOLARITY => '0',
      TXPOSTCURSOR(4 downto 0) => B"00000",
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2 downto 0) => B"000",
      TXPRECURSOR(4 downto 0) => B"00000",
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gtxe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gtxe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2 downto 0) => B"000",
      TXRATEDONE => NLW_gtxe2_i_TXRATEDONE_UNCONNECTED,
      TXRESETDONE => gtxe2_i_1,
      TXSEQUENCE(6 downto 0) => B"0000000",
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYSCLKSEL(1 downto 0) => B"00",
      TXUSERRDY => gt0_txuserrdy_i,
      TXUSRCLK => userclk,
      TXUSRCLK2 => userclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_cpll_railing is
  port (
    gt0_cpllpd_i : out STD_LOGIC;
    gt0_cpllreset_i_0 : out STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    gt0_cpllreset_i : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_cpll_railing;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_cpll_railing is
  signal cpll_reset0_i : STD_LOGIC;
  signal \cpllpd_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllpd_wait_reg[94]_srl31_n_0\ : STD_LOGIC;
  signal \cpllreset_wait_reg[126]_srl31_n_0\ : STD_LOGIC;
  signal \cpllreset_wait_reg[31]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_wait_reg[63]_srl32_n_1\ : STD_LOGIC;
  signal \cpllreset_wait_reg[95]_srl32_n_1\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg ";
  attribute srl_name : string;
  attribute srl_name of \cpllpd_wait_reg[31]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[63]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg ";
  attribute srl_name of \cpllpd_wait_reg[94]_srl31\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllpd_wait_reg[94]_srl31 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \cpllpd_wait_reg[95]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[126]_srl31\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[126]_srl31 ";
  attribute equivalent_register_removal of \cpllreset_wait_reg[127]\ : label is "no";
  attribute srl_bus_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[31]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[31]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[63]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[63]_srl32 ";
  attribute srl_bus_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg ";
  attribute srl_name of \cpllreset_wait_reg[95]_srl32\ : label is "inst/\transceiver_inst/gtwizard_inst/inst/gtwizard_i/cpll_railing0_i/cpllreset_wait_reg[95]_srl32 ";
begin
\cpllpd_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => '0',
      Q => \NLW_cpllpd_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_wait_reg[31]_srl32_n_1\
    );
\cpllpd_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"FFFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => \cpllpd_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllpd_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllpd_wait_reg[63]_srl32_n_1\
    );
\cpllpd_wait_reg[94]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => \cpllpd_wait_reg[63]_srl32_n_1\,
      Q => \cpllpd_wait_reg[94]_srl31_n_0\,
      Q31 => \NLW_cpllpd_wait_reg[94]_srl31_Q31_UNCONNECTED\
    );
\cpllpd_wait_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtrefclk_bufg,
      CE => '1',
      D => \cpllpd_wait_reg[94]_srl31_n_0\,
      Q => gt0_cpllpd_i,
      R => '0'
    );
\cpllreset_wait_reg[126]_srl31\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11110",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => \cpllreset_wait_reg[95]_srl32_n_1\,
      Q => \cpllreset_wait_reg[126]_srl31_n_0\,
      Q31 => \NLW_cpllreset_wait_reg[126]_srl31_Q31_UNCONNECTED\
    );
\cpllreset_wait_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtrefclk_bufg,
      CE => '1',
      D => \cpllreset_wait_reg[126]_srl31_n_0\,
      Q => cpll_reset0_i,
      R => '0'
    );
\cpllreset_wait_reg[31]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"000000FF"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => '0',
      Q => \NLW_cpllreset_wait_reg[31]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[31]_srl32_n_1\
    );
\cpllreset_wait_reg[63]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => \cpllreset_wait_reg[31]_srl32_n_1\,
      Q => \NLW_cpllreset_wait_reg[63]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[63]_srl32_n_1\
    );
\cpllreset_wait_reg[95]_srl32\: unisim.vcomponents.SRLC32E
    generic map(
      INIT => X"00000000"
    )
        port map (
      A(4 downto 0) => B"11111",
      CE => '1',
      CLK => gtrefclk_bufg,
      D => \cpllreset_wait_reg[63]_srl32_n_1\,
      Q => \NLW_cpllreset_wait_reg[95]_srl32_Q_UNCONNECTED\,
      Q31 => \cpllreset_wait_reg[95]_srl32_n_1\
    );
gtxe2_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => cpll_reset0_i,
      I1 => gt0_cpllreset_i,
      O => gt0_cpllreset_i_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync is
  port (
    reset_out : out STD_LOGIC;
    userclk2 : in STD_LOGIC;
    enablealign : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_reset_sync;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of reset_sync1 : label is "VCC:CE";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync2 : label is "VCC:CE";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync3 : label is "VCC:CE";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync4 : label is "VCC:CE";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync5 : label is "VCC:CE";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync6 : label is "VCC:CE";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => '0',
      PRE => enablealign,
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_stage1,
      PRE => enablealign,
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_stage2,
      PRE => enablealign,
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_stage3,
      PRE => enablealign,
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_stage4,
      PRE => enablealign,
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync_1 is
  port (
    reset_out : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    reset_sync5_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_reset_sync_1 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_reset_sync_1;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync_1 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of reset_sync1 : label is "VCC:CE";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync2 : label is "VCC:CE";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync3 : label is "VCC:CE";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync4 : label is "VCC:CE";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync5 : label is "VCC:CE";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync6 : label is "VCC:CE";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => '0',
      PRE => reset_sync5_0(0),
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage1,
      PRE => reset_sync5_0(0),
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage2,
      PRE => reset_sync5_0(0),
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage3,
      PRE => reset_sync5_0(0),
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage4,
      PRE => reset_sync5_0(0),
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_sync_2 is
  port (
    reset_out : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_reset_sync_2 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_reset_sync_2;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_sync_2 is
  signal reset_stage1 : STD_LOGIC;
  signal reset_stage2 : STD_LOGIC;
  signal reset_stage3 : STD_LOGIC;
  signal reset_stage4 : STD_LOGIC;
  signal reset_stage5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of reset_sync1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of reset_sync1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of reset_sync1 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of reset_sync1 : label is "VCC:CE";
  attribute box_type : string;
  attribute box_type of reset_sync1 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync2 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync2 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync2 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync2 : label is "VCC:CE";
  attribute box_type of reset_sync2 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync3 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync3 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync3 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync3 : label is "VCC:CE";
  attribute box_type of reset_sync3 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync4 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync4 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync4 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync4 : label is "VCC:CE";
  attribute box_type of reset_sync4 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync5 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync5 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync5 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync5 : label is "VCC:CE";
  attribute box_type of reset_sync5 : label is "PRIMITIVE";
  attribute ASYNC_REG of reset_sync6 : label is std.standard.true;
  attribute SHREG_EXTRACT of reset_sync6 : label is "no";
  attribute XILINX_LEGACY_PRIM of reset_sync6 : label is "FDP";
  attribute XILINX_TRANSFORM_PINMAP of reset_sync6 : label is "VCC:CE";
  attribute box_type of reset_sync6 : label is "PRIMITIVE";
begin
reset_sync1: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => '0',
      PRE => SR(0),
      Q => reset_stage1
    );
reset_sync2: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage1,
      PRE => SR(0),
      Q => reset_stage2
    );
reset_sync3: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage2,
      PRE => SR(0),
      Q => reset_stage3
    );
reset_sync4: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage3,
      PRE => SR(0),
      Q => reset_stage4
    );
reset_sync5: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage4,
      PRE => SR(0),
      Q => reset_stage5
    );
reset_sync6: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset_stage5,
      PRE => '0',
      Q => reset_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_reset_wtd_timer is
  port (
    wtd_rxpcsreset_in : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    data_out : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_reset_wtd_timer;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_reset_wtd_timer is
  signal \counter_stg1[5]_i_1_n_0\ : STD_LOGIC;
  signal counter_stg1_reg : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \counter_stg1_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal counter_stg1_roll : STD_LOGIC;
  signal \counter_stg2[0]_i_3_n_0\ : STD_LOGIC;
  signal counter_stg2_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \counter_stg2_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_stg2_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_stg2_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_stg2_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal counter_stg30 : STD_LOGIC;
  signal \counter_stg3[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_stg3[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter_stg3[0]_i_5_n_0\ : STD_LOGIC;
  signal counter_stg3_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \counter_stg3_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_stg3_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_stg3_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_stg3_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal reset0 : STD_LOGIC;
  signal reset_i_2_n_0 : STD_LOGIC;
  signal reset_i_3_n_0 : STD_LOGIC;
  signal reset_i_4_n_0 : STD_LOGIC;
  signal reset_i_5_n_0 : STD_LOGIC;
  signal reset_i_6_n_0 : STD_LOGIC;
  signal reset_i_7_n_0 : STD_LOGIC;
  signal reset_i_8_n_0 : STD_LOGIC;
  signal \NLW_counter_stg2_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter_stg3_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter_stg1[1]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \counter_stg1[2]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \counter_stg1[3]_i_1\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \counter_stg1[4]_i_1\ : label is "soft_lutpair119";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_stg2_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_stg2_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_stg2_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_stg3_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_stg3_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_stg3_reg[8]_i_1\ : label is 11;
begin
\counter_stg1[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_stg1_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\counter_stg1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter_stg1_reg__0\(1),
      I1 => \counter_stg1_reg__0\(0),
      O => \p_0_in__0\(1)
    );
\counter_stg1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter_stg1_reg__0\(2),
      I1 => \counter_stg1_reg__0\(1),
      I2 => \counter_stg1_reg__0\(0),
      O => \p_0_in__0\(2)
    );
\counter_stg1[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \counter_stg1_reg__0\(3),
      I1 => \counter_stg1_reg__0\(0),
      I2 => \counter_stg1_reg__0\(1),
      I3 => \counter_stg1_reg__0\(2),
      O => \p_0_in__0\(3)
    );
\counter_stg1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \counter_stg1_reg__0\(4),
      I1 => \counter_stg1_reg__0\(2),
      I2 => \counter_stg1_reg__0\(1),
      I3 => \counter_stg1_reg__0\(0),
      I4 => \counter_stg1_reg__0\(3),
      O => \p_0_in__0\(4)
    );
\counter_stg1[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => data_out,
      I1 => reset_i_2_n_0,
      I2 => counter_stg1_roll,
      O => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \counter_stg1_reg__0\(3),
      I1 => \counter_stg1_reg__0\(0),
      I2 => \counter_stg1_reg__0\(1),
      I3 => \counter_stg1_reg__0\(2),
      I4 => \counter_stg1_reg__0\(4),
      I5 => counter_stg1_reg(5),
      O => \p_0_in__0\(5)
    );
\counter_stg1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \counter_stg1_reg__0\(0),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \counter_stg1_reg__0\(1),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \counter_stg1_reg__0\(2),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => \counter_stg1_reg__0\(3),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => \counter_stg1_reg__0\(4),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => counter_stg1_reg(5),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => counter_stg1_reg(5),
      I1 => \counter_stg1_reg__0\(4),
      I2 => \counter_stg1_reg__0\(2),
      I3 => \counter_stg1_reg__0\(1),
      I4 => \counter_stg1_reg__0\(0),
      I5 => \counter_stg1_reg__0\(3),
      O => counter_stg1_roll
    );
\counter_stg2[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_stg2_reg(0),
      O => \counter_stg2[0]_i_3_n_0\
    );
\counter_stg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[0]_i_2_n_7\,
      Q => counter_stg2_reg(0),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_stg2_reg[0]_i_2_n_0\,
      CO(2) => \counter_stg2_reg[0]_i_2_n_1\,
      CO(1) => \counter_stg2_reg[0]_i_2_n_2\,
      CO(0) => \counter_stg2_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_stg2_reg[0]_i_2_n_4\,
      O(2) => \counter_stg2_reg[0]_i_2_n_5\,
      O(1) => \counter_stg2_reg[0]_i_2_n_6\,
      O(0) => \counter_stg2_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_stg2_reg(3 downto 1),
      S(0) => \counter_stg2[0]_i_3_n_0\
    );
\counter_stg2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[8]_i_1_n_5\,
      Q => counter_stg2_reg(10),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[8]_i_1_n_4\,
      Q => counter_stg2_reg(11),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[0]_i_2_n_6\,
      Q => counter_stg2_reg(1),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[0]_i_2_n_5\,
      Q => counter_stg2_reg(2),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[0]_i_2_n_4\,
      Q => counter_stg2_reg(3),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[4]_i_1_n_7\,
      Q => counter_stg2_reg(4),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_stg2_reg[0]_i_2_n_0\,
      CO(3) => \counter_stg2_reg[4]_i_1_n_0\,
      CO(2) => \counter_stg2_reg[4]_i_1_n_1\,
      CO(1) => \counter_stg2_reg[4]_i_1_n_2\,
      CO(0) => \counter_stg2_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_stg2_reg[4]_i_1_n_4\,
      O(2) => \counter_stg2_reg[4]_i_1_n_5\,
      O(1) => \counter_stg2_reg[4]_i_1_n_6\,
      O(0) => \counter_stg2_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_stg2_reg(7 downto 4)
    );
\counter_stg2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[4]_i_1_n_6\,
      Q => counter_stg2_reg(5),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[4]_i_1_n_5\,
      Q => counter_stg2_reg(6),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[4]_i_1_n_4\,
      Q => counter_stg2_reg(7),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[8]_i_1_n_7\,
      Q => counter_stg2_reg(8),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg2_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_stg2_reg[4]_i_1_n_0\,
      CO(3) => \NLW_counter_stg2_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_stg2_reg[8]_i_1_n_1\,
      CO(1) => \counter_stg2_reg[8]_i_1_n_2\,
      CO(0) => \counter_stg2_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_stg2_reg[8]_i_1_n_4\,
      O(2) => \counter_stg2_reg[8]_i_1_n_5\,
      O(1) => \counter_stg2_reg[8]_i_1_n_6\,
      O(0) => \counter_stg2_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_stg2_reg(11 downto 8)
    );
\counter_stg2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg1_roll,
      D => \counter_stg2_reg[8]_i_1_n_6\,
      Q => counter_stg2_reg(9),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => counter_stg1_roll,
      I1 => \counter_stg3[0]_i_3_n_0\,
      I2 => counter_stg2_reg(3),
      I3 => counter_stg2_reg(8),
      I4 => counter_stg2_reg(11),
      I5 => counter_stg2_reg(4),
      O => counter_stg30
    );
\counter_stg3[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => counter_stg2_reg(10),
      I1 => counter_stg2_reg(1),
      I2 => counter_stg2_reg(2),
      I3 => counter_stg2_reg(5),
      I4 => \counter_stg3[0]_i_5_n_0\,
      O => \counter_stg3[0]_i_3_n_0\
    );
\counter_stg3[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_stg3_reg(0),
      O => \counter_stg3[0]_i_4_n_0\
    );
\counter_stg3[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_stg2_reg(9),
      I1 => counter_stg2_reg(7),
      I2 => counter_stg2_reg(0),
      I3 => counter_stg2_reg(6),
      O => \counter_stg3[0]_i_5_n_0\
    );
\counter_stg3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[0]_i_2_n_7\,
      Q => counter_stg3_reg(0),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_stg3_reg[0]_i_2_n_0\,
      CO(2) => \counter_stg3_reg[0]_i_2_n_1\,
      CO(1) => \counter_stg3_reg[0]_i_2_n_2\,
      CO(0) => \counter_stg3_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_stg3_reg[0]_i_2_n_4\,
      O(2) => \counter_stg3_reg[0]_i_2_n_5\,
      O(1) => \counter_stg3_reg[0]_i_2_n_6\,
      O(0) => \counter_stg3_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_stg3_reg(3 downto 1),
      S(0) => \counter_stg3[0]_i_4_n_0\
    );
\counter_stg3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[8]_i_1_n_5\,
      Q => counter_stg3_reg(10),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[8]_i_1_n_4\,
      Q => counter_stg3_reg(11),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[0]_i_2_n_6\,
      Q => counter_stg3_reg(1),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[0]_i_2_n_5\,
      Q => counter_stg3_reg(2),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[0]_i_2_n_4\,
      Q => counter_stg3_reg(3),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[4]_i_1_n_7\,
      Q => counter_stg3_reg(4),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_stg3_reg[0]_i_2_n_0\,
      CO(3) => \counter_stg3_reg[4]_i_1_n_0\,
      CO(2) => \counter_stg3_reg[4]_i_1_n_1\,
      CO(1) => \counter_stg3_reg[4]_i_1_n_2\,
      CO(0) => \counter_stg3_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_stg3_reg[4]_i_1_n_4\,
      O(2) => \counter_stg3_reg[4]_i_1_n_5\,
      O(1) => \counter_stg3_reg[4]_i_1_n_6\,
      O(0) => \counter_stg3_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_stg3_reg(7 downto 4)
    );
\counter_stg3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[4]_i_1_n_6\,
      Q => counter_stg3_reg(5),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[4]_i_1_n_5\,
      Q => counter_stg3_reg(6),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[4]_i_1_n_4\,
      Q => counter_stg3_reg(7),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[8]_i_1_n_7\,
      Q => counter_stg3_reg(8),
      R => \counter_stg1[5]_i_1_n_0\
    );
\counter_stg3_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_stg3_reg[4]_i_1_n_0\,
      CO(3) => \NLW_counter_stg3_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_stg3_reg[8]_i_1_n_1\,
      CO(1) => \counter_stg3_reg[8]_i_1_n_2\,
      CO(0) => \counter_stg3_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_stg3_reg[8]_i_1_n_4\,
      O(2) => \counter_stg3_reg[8]_i_1_n_5\,
      O(1) => \counter_stg3_reg[8]_i_1_n_6\,
      O(0) => \counter_stg3_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_stg3_reg(11 downto 8)
    );
\counter_stg3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => counter_stg30,
      D => \counter_stg3_reg[8]_i_1_n_6\,
      Q => counter_stg3_reg(9),
      R => \counter_stg1[5]_i_1_n_0\
    );
reset_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter_stg1_reg(5),
      I1 => reset_i_2_n_0,
      O => reset0
    );
reset_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => reset_i_3_n_0,
      I1 => reset_i_4_n_0,
      I2 => reset_i_5_n_0,
      I3 => reset_i_6_n_0,
      I4 => reset_i_7_n_0,
      I5 => reset_i_8_n_0,
      O => reset_i_2_n_0
    );
reset_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter_stg3_reg(9),
      I1 => counter_stg3_reg(8),
      I2 => counter_stg3_reg(6),
      I3 => counter_stg3_reg(11),
      O => reset_i_3_n_0
    );
reset_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter_stg3_reg(1),
      I1 => counter_stg2_reg(0),
      I2 => counter_stg2_reg(10),
      I3 => counter_stg3_reg(0),
      O => reset_i_4_n_0
    );
reset_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => counter_stg2_reg(3),
      I1 => counter_stg2_reg(8),
      I2 => counter_stg2_reg(11),
      I3 => counter_stg2_reg(4),
      O => reset_i_5_n_0
    );
reset_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter_stg2_reg(7),
      I1 => counter_stg3_reg(10),
      I2 => counter_stg2_reg(2),
      I3 => counter_stg3_reg(3),
      O => reset_i_6_n_0
    );
reset_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => counter_stg3_reg(7),
      I1 => counter_stg2_reg(5),
      I2 => counter_stg3_reg(5),
      I3 => counter_stg3_reg(2),
      O => reset_i_7_n_0
    );
reset_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter_stg2_reg(9),
      I1 => counter_stg2_reg(6),
      I2 => counter_stg3_reg(4),
      I3 => counter_stg2_reg(1),
      O => reset_i_8_n_0
    );
reset_reg: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => '1',
      D => reset0,
      Q => wtd_rxpcsreset_in,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block is
  port (
    resetdone : out STD_LOGIC;
    data_out : in STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk2 : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_sync_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal rx_reset_done_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync5,
      Q => rx_reset_done_i,
      R => '0'
    );
resetdone_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rx_reset_done_i,
      I1 => data_out,
      O => resetdone
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_0 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_0 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_0;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_0 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_10 is
  port (
    data_out : out STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_10 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_10;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_10 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync_reg1_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_11 is
  port (
    time_out_2ms_reg : out STD_LOGIC;
    reset_time_out_reg : out STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    data_out : in STD_LOGIC;
    reset_time_out_reg_0 : in STD_LOGIC;
    check_tlock_max : in STD_LOGIC;
    reset_time_out_reg_1 : in STD_LOGIC;
    reset_time_out_reg_2 : in STD_LOGIC;
    reset_time_out_reg_3 : in STD_LOGIC;
    cplllock : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_11 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_11;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_11 is
  signal cplllock_sync : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal reset_time_out_i_5_n_0 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_sequential_rx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFF00000000"
    )
        port map (
      I0 => \FSM_sequential_rx_state_reg[0]\,
      I1 => cplllock_sync,
      I2 => Q(3),
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => time_out_2ms_reg
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => cplllock,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => cplllock_sync,
      R => '0'
    );
\reset_time_out_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80FFFFFF800000"
    )
        port map (
      I0 => reset_time_out_reg_0,
      I1 => check_tlock_max,
      I2 => reset_time_out_reg_1,
      I3 => reset_time_out_i_5_n_0,
      I4 => reset_time_out_reg_2,
      I5 => reset_time_out_reg_3,
      O => reset_time_out_reg
    );
reset_time_out_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1D0D1D0DD1C1DDCD"
    )
        port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => Q(1),
      I3 => cplllock_sync,
      I4 => Q(0),
      I5 => data_out,
      O => reset_time_out_i_5_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_12 is
  port (
    data_out : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_rx_state_reg[2]\ : out STD_LOGIC;
    rx_fsm_reset_done_int_reg : in STD_LOGIC;
    rx_fsm_reset_done_int_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_rx_state_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_1\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_2\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[3]\ : in STD_LOGIC;
    time_out_wait_bypass_s3 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[3]_0\ : in STD_LOGIC;
    rx_fsm_reset_done_int_reg_1 : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_3\ : in STD_LOGIC;
    \FSM_sequential_rx_state_reg[0]_4\ : in STD_LOGIC;
    data_in : in STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_12 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_12;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_12 is
  signal \FSM_sequential_rx_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  signal rx_fsm_reset_done_int_i_3_n_0 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
\FSM_sequential_rx_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8FFA8A8"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => \FSM_sequential_rx_state[3]_i_7_n_0\,
      I3 => \FSM_sequential_rx_state_reg[0]_3\,
      I4 => \FSM_sequential_rx_state_reg[0]_4\,
      O => D(0)
    );
\FSM_sequential_rx_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03443377"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_7_n_0\,
      I1 => Q(3),
      I2 => Q(0),
      I3 => Q(1),
      I4 => \FSM_sequential_rx_state_reg[0]_4\,
      O => D(1)
    );
\FSM_sequential_rx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABBBBBAAABAAAB"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_3_n_0\,
      I1 => \FSM_sequential_rx_state_reg[0]\,
      I2 => \FSM_sequential_rx_state_reg[0]_0\,
      I3 => Q(0),
      I4 => \FSM_sequential_rx_state_reg[0]_1\,
      I5 => \FSM_sequential_rx_state_reg[0]_2\,
      O => E(0)
    );
\FSM_sequential_rx_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDFFFFFDDDF0000"
    )
        port map (
      I0 => \FSM_sequential_rx_state[3]_i_7_n_0\,
      I1 => \FSM_sequential_rx_state_reg[3]\,
      I2 => Q(0),
      I3 => time_out_wait_bypass_s3,
      I4 => Q(3),
      I5 => \FSM_sequential_rx_state_reg[3]_0\,
      O => D(2)
    );
\FSM_sequential_rx_state[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C48"
    )
        port map (
      I0 => \^data_out\,
      I1 => Q(3),
      I2 => Q(1),
      I3 => \FSM_sequential_rx_state[3]_i_7_n_0\,
      O => \FSM_sequential_rx_state[3]_i_3_n_0\
    );
\FSM_sequential_rx_state[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"04FF"
    )
        port map (
      I0 => rx_fsm_reset_done_int_reg,
      I1 => rx_fsm_reset_done_int_reg_0,
      I2 => \^data_out\,
      I3 => Q(0),
      O => \FSM_sequential_rx_state[3]_i_7_n_0\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync_reg1_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
rx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0020"
    )
        port map (
      I0 => rx_fsm_reset_done_int,
      I1 => Q(2),
      I2 => Q(3),
      I3 => rx_fsm_reset_done_int_i_3_n_0,
      I4 => data_in,
      O => \FSM_sequential_rx_state_reg[2]\
    );
rx_fsm_reset_done_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => rx_fsm_reset_done_int_reg_1,
      I3 => rx_fsm_reset_done_int_reg,
      I4 => \^data_out\,
      O => rx_fsm_reset_done_int
    );
rx_fsm_reset_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF3131C0CCFFFF"
    )
        port map (
      I0 => rx_fsm_reset_done_int_reg_0,
      I1 => \^data_out\,
      I2 => rx_fsm_reset_done_int_reg,
      I3 => rx_fsm_reset_done_int_reg_1,
      I4 => Q(1),
      I5 => Q(0),
      O => rx_fsm_reset_done_int_i_3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_13 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_13 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_13;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_13 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => mmcm_locked,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\mmcm_lock_count[7]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^data_out\,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_14 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_14 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_14;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_14 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_15 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_15 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_15;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_15 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_16 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_16 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_16;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_16 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_3 is
  port (
    data_out : out STD_LOGIC;
    status_vector : in STD_LOGIC_VECTOR ( 0 to 0 );
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_3 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_3;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_3 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => status_vector(0),
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_4 is
  port (
    data_out : out STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_4 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_4;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_4 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync_reg1_0,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_5 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_tx_state_reg[1]\ : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    reset_time_out_reg : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]\ : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_0\ : in STD_LOGIC;
    sel : in STD_LOGIC;
    \FSM_sequential_tx_state_reg[0]_1\ : in STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    txresetdone_s3 : in STD_LOGIC;
    reset_time_out : in STD_LOGIC;
    \FSM_sequential_tx_state[3]_i_3_0\ : in STD_LOGIC;
    \FSM_sequential_tx_state[3]_i_3_1\ : in STD_LOGIC;
    \FSM_sequential_tx_state[3]_i_3_2\ : in STD_LOGIC;
    \FSM_sequential_tx_state[3]_i_3_3\ : in STD_LOGIC;
    cplllock : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_5 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_5;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_5 is
  signal \FSM_sequential_tx_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal cplllock_sync : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal reset_time_out_0 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_sequential_tx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3300744433007477"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_3_n_0\,
      I1 => Q(0),
      I2 => \FSM_sequential_tx_state_reg[0]\,
      I3 => \FSM_sequential_tx_state_reg[0]_0\,
      I4 => Q(3),
      I5 => sel,
      O => E(0)
    );
\FSM_sequential_tx_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8BBBB88B88888"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_6_n_0\,
      I1 => Q(1),
      I2 => \FSM_sequential_tx_state_reg[0]_1\,
      I3 => mmcm_lock_reclocked,
      I4 => Q(2),
      I5 => \FSM_sequential_tx_state[3]_i_8_n_0\,
      O => \FSM_sequential_tx_state[3]_i_3_n_0\
    );
\FSM_sequential_tx_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"45004500450045FF"
    )
        port map (
      I0 => txresetdone_s3,
      I1 => reset_time_out,
      I2 => \FSM_sequential_tx_state[3]_i_3_0\,
      I3 => Q(2),
      I4 => cplllock_sync,
      I5 => \FSM_sequential_tx_state[3]_i_3_1\,
      O => \FSM_sequential_tx_state[3]_i_6_n_0\
    );
\FSM_sequential_tx_state[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \FSM_sequential_tx_state[3]_i_3_2\,
      I1 => cplllock_sync,
      I2 => \FSM_sequential_tx_state[3]_i_3_3\,
      O => \FSM_sequential_tx_state[3]_i_8_n_0\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => cplllock,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => cplllock_sync,
      R => '0'
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAAFEFE02AA0202"
    )
        port map (
      I0 => reset_time_out_0,
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(0),
      I5 => reset_time_out,
      O => \FSM_sequential_tx_state_reg[1]\
    );
reset_time_out_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10337733"
    )
        port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => cplllock_sync,
      I3 => Q(0),
      I4 => reset_time_out_reg,
      O => reset_time_out_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_6 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_6 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_6;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_6 is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => mmcm_locked,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\mmcm_lock_count[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^data_out\,
      O => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_7 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_7 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_7;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_7 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_8 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_8 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_8;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_8 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_sync_block_9 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_sync_block_9 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_sync_block_9;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_sync_block_9 is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg1 : label is "VCC:CE GND:R";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg2 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg3 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg4 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg5 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute XILINX_TRANSFORM_PINMAP of data_sync_reg6 : label is "VCC:CE GND:R";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
XL0vCpwJkpY29C2iE4LPlf/odeUNPw9BVX/J5pEuKj2Daef6TwO4W44ER/rohRxort+oJ1FEnjTl
dO9suKxGx6l5qoEu601AYmdQx5qtrjpt5ZGKiDiqJHQu0sNZj2OpRSMBF2+xpK6q1k0YwWEsL2yM
Dk14qp/TPBMp5RE5dog=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Pk367+A7d85WWbWihXnmNhli57Ii8GCSlPvH8qHqwzR/ezoXFHJelkpzH2yVZqsPrfmk2NFaOsEs
M1axqfiNh0tU1KMP7/T8Z8SUUXEL8RHmFLGRFGDFU09+/htgWkyd52BTRgIK4xxqdNeHRvHuh9eO
Xoc91nJGkr5lyxxTROPFBa+JdoqRs9bDqyz3atfFQej6vJovFHG2okDG/vCx1XB1qvN+e1+epX31
2giRBGffUGfZdshykZtf0S0Kj1hobLe34cMhJaDdZ+jhjN6QiA9PF+Uhp/S/A8APv5yY2pLwZJi/
lx733RyXkWqUcnNtuuQXd+cbVvDu8Nkgy8Wrqg==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
PSDriSbxCGy1IkAQGX1Dpf4e+G70LYZYfQvHhkTdWu3f8dIzce38bnZUYwJ3PFkbLPD9xdrPHXpc
YHffwh/sskJmoWdc3xCXegJzAt03leKM0XeW0QDeuMElufJyRoPGciV0ISzDtCccOegxRPMnXkzI
kE04JwwijsIe2HS3mWA=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
mY+SycwdugcaAAgVirnNdFm8EBfn62CPaeo94BjJZ+vU9m28AxCSwDD3tD06N21maLpla50ThHcZ
2+106fXzJsWtL9Pz+RPRWduaY/aqQj9DI1lsK962ves+UJ55hZpmrK6XQ0LbTkTACnJ+rbn1XOr6
Sy6zYwJAJc8qnHmIgrQxv5S9PmPs3PD3w/KTPcknzXMtlxwEyfFFJv3qUPbJf4hQiKWId/2N0keC
yuxY3jIMroLsnWmLHYAHDH+KBlPKhm0T47WRfD7mAEUsdvMGdJJMQSAz7kZj14OUMXw4DFxp31LM
Mdw8lsakafIjy2kkFUJbghSGrmLhS9eejA4drA==

`protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
XD7l6Li/98UDd4ASpKYFRLL/Bm3DF1ctodfSWQQYkOkHw+iPJrP4dUeL4uxbw5cmd13HI9d/+bl7
flwuZn1ZsI8+fTLM3T0oYPyVEcleZHq0WhbH4/fAZVtG1KCzFHAkmPbLs7uv7CMumqjJdmtmn5+j
xPyobFsdk7JkDBGTpiw6sLLYNRajRDRO+TtCCooQg1oZ9mbnKEQn+ccjBbpltTTovGTXxvIys5QE
AyX9dO8uSwtGll4an6rSWFnl0uDG8mKULJjCoJCx5igXn5MfbZyoun9fmtC0oBi6/z70Bc7Ngf/X
BxC2PFv9du+wdtufsrRExX5CtLY6SrrVbYmgsg==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
NnkpyUpgSR1m9dLBiJuJuOGCGzGq+qYsW2dFPuHEdelcqcyBjCfhAHOxsPTg47uYbXrmZKPQT9oB
mF2IFSybwtNxfbYFoozuT0BNJ/5tM80X+LXJbFfCwvgBsytlBfwh0uSzLrHE/8Rj8J7mLWry0qh3
iJAr2rFe8K6RVUpdeiifjliMaSreWEgvFSdo2esnYOcHcjY+Hu8svZHAEUWDKh73U70IF7FdFvqF
XO1yYXuXJRiceHuJPwpgh+dKsPDerxr30wA8JeIZXlrJf9HlT+0dlKVBCNqzJaYEpnPDQJz729Ff
Z07YHgx5oCRnxKUnnjT955+n0UO5Bm0CbNM98g==

`protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
C8Tp/eDRRCMOwHxdxcUmbuASA2jQT5JtPZgfJpftbLH97GxlWZMNcwUflF51EUdAwd7Ir0jGS4SN
cr6Uva26gsckiDjhmtq68IVcUBq8iifyFtfwFTkAYsSR9t4iFExJQmqmJhRj/kjacbUMGJYAC6zR
h3ljNiQdmkYQpOt5jaSWP95maYRqXft/7eCGmAeaT/hsFmBP3RQOCK0k9gUhLLR1PO5xnTyZjGQJ
VCk/JVMUOSmN3A3j8uruhVvih7YMqPc9iQBC+HtbR5h4rhfWuy61XFdNoAJHjYVA1tYMqW+AEV+Q
1VtSSnB2mmxlGlAt5Neajfvuyy7rlpFsJ45pjQ==

`protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`protect key_block
xpgEYrMDyzTrppjK9pdbdERRVcGsOM1wehgNM05p7/GPYcE/Ldlf0NddSTOkeI7hjbtKJh5O+mOM
1DBGpPYqiLVAGGEkWOjemutvTwnFlOgFP/jBtscvT0xoJBauy19XM/qMu2zEdGpo+cTuJWzONd/i
3ghZO49KQIulbxfD2jQCC9rH6BOq1q57AbVoYFrWhtZyeWmQYWqoBBCoKhU0mW4HcQbiWcYymJHT
F7Wl3c/rvmZ19HaO7JHZa6PyhFnE8YeyhkUhNO5fcvZ7gFHlRumoJS365hjRroAoOu/CLJR/eLzy
ipT4tHFj/T7mhSJUeLz7A/6hK8fdFLzSZwEuZVstx+LDWxZ6pst0+57+uQ0enpOHMLlWG7IDZ9AV
vnJhH0UrMMbR196CYsdG3cIByN27DizesnW+jNkMQBaswtDLtVZnbdkXy8Zk9SXNXJvTwQegCw/a
5CAl8y//34XRWeFt4Wtkeso5A1iTLvpgBuH+GJMSKXA7KSxJoCnBU8Fi

`protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
PtXIj+hfSzAR7L3qE+PnK05Exl2JklQ0WEvqE/2UzQ6NMKlYocvT6ipW6HQPMOEIcQZ0yLsnPM3H
AJTKwnCXBrDf9LrsG68+NcVRqGYlmQxBA+B/Wz13Is/n6cNLZF0gc3NyuJtBtL2Uxe3MwscxIw7q
kdbu2/O6Cyl0g687jBXJycalF9NXdTP1rxdkEcnqKylZS7CE4cy54owMRjqGSecZkwM9W6KM/LnC
gXlHpN84ld6K+TZYDQX69vk5C2jSfvikiyv+hOQBT9MYZBs7WpN6ZB7rzEIftz7mRrfVTftis8ny
vl11eoBQKss+QRJIL8eXborkKe8di5p1yilcPQ==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 273360)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt is
  port (
    cplllock : out STD_LOGIC;
    gt0_cpllrefclklost_i : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    gtxe2_i : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    gtxe2_i_0 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    RXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtxe2_i_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_5 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtrefclk_bufg : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    gtrefclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_gttxreset_gt : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    wtd_rxpcsreset_in : in STD_LOGIC;
    gt0_rxuserrdy_i : in STD_LOGIC;
    userclk : in STD_LOGIC;
    TXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt0_txuserrdy_i : in STD_LOGIC;
    RXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_6 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_7 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_8 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_cpllreset_i : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt is
  signal gt0_cpllpd_i : STD_LOGIC;
  signal gt0_cpllreset_i_0 : STD_LOGIC;
begin
cpll_railing0_i: entity work.gig_ethernet_pcs_pma_0_cpll_railing
     port map (
      gt0_cpllpd_i => gt0_cpllpd_i,
      gt0_cpllreset_i => gt0_cpllreset_i,
      gt0_cpllreset_i_0 => gt0_cpllreset_i_0,
      gtrefclk_bufg => gtrefclk_bufg
    );
gt0_GTWIZARD_i: entity work.gig_ethernet_pcs_pma_0_GTWIZARD_GT
     port map (
      D(1 downto 0) => D(1 downto 0),
      Q(15 downto 0) => Q(15 downto 0),
      RXBUFSTATUS(0) => RXBUFSTATUS(0),
      RXPD(0) => RXPD(0),
      SR(0) => SR(0),
      TXBUFSTATUS(0) => TXBUFSTATUS(0),
      TXPD(0) => TXPD(0),
      cplllock => cplllock,
      gt0_cpllpd_i => gt0_cpllpd_i,
      gt0_cpllrefclklost_i => gt0_cpllrefclklost_i,
      gt0_cpllreset_i_0 => gt0_cpllreset_i_0,
      gt0_gttxreset_gt => gt0_gttxreset_gt,
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gt0_txuserrdy_i => gt0_txuserrdy_i,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      gtxe2_i_0 => gtxe2_i,
      gtxe2_i_1 => gtxe2_i_0,
      gtxe2_i_2(15 downto 0) => gtxe2_i_1(15 downto 0),
      gtxe2_i_3(1 downto 0) => gtxe2_i_2(1 downto 0),
      gtxe2_i_4(1 downto 0) => gtxe2_i_3(1 downto 0),
      gtxe2_i_5(1 downto 0) => gtxe2_i_4(1 downto 0),
      gtxe2_i_6(1 downto 0) => gtxe2_i_5(1 downto 0),
      gtxe2_i_7(1 downto 0) => gtxe2_i_6(1 downto 0),
      gtxe2_i_8(1 downto 0) => gtxe2_i_7(1 downto 0),
      gtxe2_i_9(1 downto 0) => gtxe2_i_8(1 downto 0),
      independent_clock_bufg => independent_clock_bufg,
      reset_out => reset_out,
      rxn => rxn,
      rxoutclk => rxoutclk,
      rxp => rxp,
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      wtd_rxpcsreset_in => wtd_rxpcsreset_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_RX_STARTUP_FSM is
  port (
    data_in : out STD_LOGIC;
    gt0_rxuserrdy_i : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    independent_clock_bufg : in STD_LOGIC;
    userclk : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    reset_time_out_reg_0 : in STD_LOGIC;
    gtxe2_i : in STD_LOGIC;
    data_sync_reg1 : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    data_out : in STD_LOGIC;
    cplllock : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_RX_STARTUP_FSM;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_RX_STARTUP_FSM is
  signal \FSM_sequential_rx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_rx_state[3]_i_9_n_0\ : STD_LOGIC;
  signal RXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal check_tlock_max_i_1_n_0 : STD_LOGIC;
  signal check_tlock_max_reg_n_0 : STD_LOGIC;
  signal \^data_in\ : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal gt0_gtrxreset_t : STD_LOGIC;
  signal \^gt0_rxuserrdy_i\ : STD_LOGIC;
  signal gtrxreset_i_i_1_n_0 : STD_LOGIC;
  signal init_wait_count : STD_LOGIC;
  signal \init_wait_count[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_4__0_n_0\ : STD_LOGIC;
  signal init_wait_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \init_wait_done_i_1__0_n_0\ : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[7]_i_2__0_n_0\ : STD_LOGIC;
  signal mmcm_lock_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mmcm_lock_i : STD_LOGIC;
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal mmcm_lock_reclocked_i_1_n_0 : STD_LOGIC;
  signal \mmcm_lock_reclocked_i_2__0_n_0\ : STD_LOGIC;
  signal \p_0_in__3\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \p_0_in__4\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \reset_time_out_i_2__0_n_0\ : STD_LOGIC;
  signal reset_time_out_i_4_n_0 : STD_LOGIC;
  signal reset_time_out_i_6_n_0 : STD_LOGIC;
  signal reset_time_out_reg_n_0 : STD_LOGIC;
  signal \run_phase_alignment_int_i_1__0_n_0\ : STD_LOGIC;
  signal run_phase_alignment_int_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3_reg_n_0 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal rx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \rx_state__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal sync_cplllock_n_0 : STD_LOGIC;
  signal sync_cplllock_n_1 : STD_LOGIC;
  signal sync_data_valid_n_1 : STD_LOGIC;
  signal sync_data_valid_n_5 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_n_0 : STD_LOGIC;
  signal time_out_100us_i_1_n_0 : STD_LOGIC;
  signal time_out_100us_i_2_n_0 : STD_LOGIC;
  signal time_out_100us_i_3_n_0 : STD_LOGIC;
  signal time_out_100us_reg_n_0 : STD_LOGIC;
  signal time_out_1us_i_1_n_0 : STD_LOGIC;
  signal time_out_1us_i_2_n_0 : STD_LOGIC;
  signal time_out_1us_i_3_n_0 : STD_LOGIC;
  signal time_out_1us_i_4_n_0 : STD_LOGIC;
  signal time_out_1us_i_5_n_0 : STD_LOGIC;
  signal time_out_1us_i_6_n_0 : STD_LOGIC;
  signal time_out_1us_reg_n_0 : STD_LOGIC;
  signal time_out_2ms : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal \time_out_2ms_i_3__0_n_0\ : STD_LOGIC;
  signal \time_out_2ms_i_4__0_n_0\ : STD_LOGIC;
  signal \time_out_2ms_i_5__0_n_0\ : STD_LOGIC;
  signal \time_out_2ms_i_6__0_n_0\ : STD_LOGIC;
  signal time_out_2ms_i_7_n_0 : STD_LOGIC;
  signal time_out_2ms_i_8_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC;
  signal \time_out_counter[0]_i_3__0_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \time_out_counter_reg[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal time_out_wait_bypass_i_1_n_0 : STD_LOGIC;
  signal \time_out_wait_bypass_i_2__0_n_0\ : STD_LOGIC;
  signal \time_out_wait_bypass_i_3__0_n_0\ : STD_LOGIC;
  signal \time_out_wait_bypass_i_4__0_n_0\ : STD_LOGIC;
  signal time_out_wait_bypass_reg_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal time_tlock_max_i_2_n_0 : STD_LOGIC;
  signal time_tlock_max_i_3_n_0 : STD_LOGIC;
  signal time_tlock_max_i_4_n_0 : STD_LOGIC;
  signal time_tlock_max_i_5_n_0 : STD_LOGIC;
  signal time_tlock_max_i_6_n_0 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_10__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_11__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5__0_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_10\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \FSM_sequential_rx_state[3]_i_8\ : label is "soft_lutpair90";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[0]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[1]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[2]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_rx_state_reg[3]\ : label is "RELEASE_PLL_RESET:0011,VERIFY_RECCLK_STABLE:0100,WAIT_FOR_PLL_LOCK:0010,FSM_DONE:1010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,MONITOR_DATA_VALID:1001,WAIT_FOR_RXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute SOFT_HLUTNM of \init_wait_count[0]_i_1__0\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1__0\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1__0\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1__0\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1__0\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_1__0\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2__0\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_3__0\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1__0\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1__0\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1__0\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1__0\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \mmcm_lock_count[6]_i_1__0\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_3__0\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \reset_time_out_i_2__0\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \reset_time_out_i_3__0\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of reset_time_out_i_4 : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of reset_time_out_i_6 : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of time_out_1us_i_2 : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of time_out_1us_i_4 : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \time_out_2ms_i_5__0\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \time_out_2ms_i_6__0\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of time_out_2ms_i_7 : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of time_out_2ms_i_8 : label is "soft_lutpair93";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[0]_i_2__0\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[16]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[8]_i_1__0\ : label is 11;
  attribute SOFT_HLUTNM of time_tlock_max_i_3 : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of time_tlock_max_i_4 : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of time_tlock_max_i_5 : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of time_tlock_max_i_6 : label is "soft_lutpair92";
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[0]_i_3__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[8]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[0]_i_3__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[8]_i_1__0\ : label is 11;
begin
  data_in <= \^data_in\;
  gt0_rxuserrdy_i <= \^gt0_rxuserrdy_i\;
\FSM_sequential_rx_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF8000AF00"
    )
        port map (
      I0 => rx_state(1),
      I1 => reset_time_out_reg_n_0,
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => time_out_2ms_reg_n_0,
      I5 => rx_state(3),
      O => \FSM_sequential_rx_state[0]_i_2_n_0\
    );
\FSM_sequential_rx_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5555FFFF7555"
    )
        port map (
      I0 => rx_state(0),
      I1 => reset_time_out_reg_n_0,
      I2 => time_tlock_max,
      I3 => rx_state(2),
      I4 => rx_state(1),
      I5 => rx_state(3),
      O => \FSM_sequential_rx_state[1]_i_2_n_0\
    );
\FSM_sequential_rx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100005551555"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(2),
      I2 => rx_state(1),
      I3 => rx_state(0),
      I4 => time_out_2ms_reg_n_0,
      I5 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      O => \FSM_sequential_rx_state[2]_i_1_n_0\
    );
\FSM_sequential_rx_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2727FF2727272727"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => reset_time_out_reg_n_0,
      I5 => time_tlock_max,
      O => \FSM_sequential_rx_state[2]_i_2_n_0\
    );
\FSM_sequential_rx_state[3]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(1),
      I2 => rx_state(2),
      I3 => rx_state(0),
      I4 => init_wait_done_reg_n_0,
      O => \FSM_sequential_rx_state[3]_i_10_n_0\
    );
\FSM_sequential_rx_state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000151"
    )
        port map (
      I0 => rx_state(1),
      I1 => reset_time_out_reg_0,
      I2 => rx_state(0),
      I3 => mmcm_lock_reclocked,
      I4 => \FSM_sequential_rx_state[2]_i_2_n_0\,
      I5 => \FSM_sequential_rx_state[3]_i_10_n_0\,
      O => \FSM_sequential_rx_state[3]_i_4_n_0\
    );
\FSM_sequential_rx_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAEFFFFAEFFFFFF"
    )
        port map (
      I0 => rxresetdone_s3,
      I1 => time_out_2ms_reg_n_0,
      I2 => reset_time_out_reg_n_0,
      I3 => rx_state(2),
      I4 => rx_state(1),
      I5 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_6_n_0\
    );
\FSM_sequential_rx_state[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(1),
      I2 => rx_state(3),
      O => \FSM_sequential_rx_state[3]_i_8_n_0\
    );
\FSM_sequential_rx_state[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDD0000000000000"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => reset_time_out_reg_n_0,
      I2 => rx_state(2),
      I3 => rx_state(3),
      I4 => rx_state(0),
      I5 => rx_state(1),
      O => \FSM_sequential_rx_state[3]_i_9_n_0\
    );
\FSM_sequential_rx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_data_valid_n_1,
      D => \rx_state__0\(0),
      Q => rx_state(0),
      R => pma_reset
    );
\FSM_sequential_rx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_data_valid_n_1,
      D => \rx_state__0\(1),
      Q => rx_state(1),
      R => pma_reset
    );
\FSM_sequential_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_data_valid_n_1,
      D => \FSM_sequential_rx_state[2]_i_1_n_0\,
      Q => rx_state(2),
      R => pma_reset
    );
\FSM_sequential_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_data_valid_n_1,
      D => \rx_state__0\(3),
      Q => rx_state(3),
      R => pma_reset
    );
RXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB4000"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(1),
      I4 => \^gt0_rxuserrdy_i\,
      O => RXUSERRDY_i_1_n_0
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => RXUSERRDY_i_1_n_0,
      Q => \^gt0_rxuserrdy_i\,
      R => pma_reset
    );
check_tlock_max_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0020"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(3),
      I2 => rx_state(0),
      I3 => rx_state(1),
      I4 => check_tlock_max_reg_n_0,
      O => check_tlock_max_i_1_n_0
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => check_tlock_max_i_1_n_0,
      Q => check_tlock_max_reg_n_0,
      R => pma_reset
    );
gtrxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0004"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(0),
      I2 => rx_state(3),
      I3 => rx_state(1),
      I4 => gt0_gtrxreset_t,
      O => gtrxreset_i_i_1_n_0
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gtrxreset_i_i_1_n_0,
      Q => gt0_gtrxreset_t,
      R => pma_reset
    );
gtxe2_i_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => gt0_gtrxreset_t,
      I1 => \^data_in\,
      I2 => gtxe2_i,
      O => SR(0)
    );
\init_wait_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => init_wait_count_reg(0),
      O => \init_wait_count[0]_i_1__0_n_0\
    );
\init_wait_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => init_wait_count_reg(0),
      I1 => init_wait_count_reg(1),
      O => \p_0_in__3\(1)
    );
\init_wait_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => init_wait_count_reg(2),
      I1 => init_wait_count_reg(0),
      I2 => init_wait_count_reg(1),
      O => \p_0_in__3\(2)
    );
\init_wait_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => init_wait_count_reg(3),
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(2),
      O => \p_0_in__3\(3)
    );
\init_wait_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => init_wait_count_reg(4),
      I1 => init_wait_count_reg(2),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(1),
      I4 => init_wait_count_reg(3),
      O => \p_0_in__3\(4)
    );
\init_wait_count[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => init_wait_count_reg(3),
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(2),
      I4 => init_wait_count_reg(4),
      I5 => init_wait_count_reg(5),
      O => \p_0_in__3\(5)
    );
\init_wait_count[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => init_wait_count_reg(6),
      I1 => \init_wait_count[7]_i_4__0_n_0\,
      O => \p_0_in__3\(6)
    );
\init_wait_count[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => \init_wait_count[7]_i_3__0_n_0\,
      I1 => init_wait_count_reg(4),
      I2 => init_wait_count_reg(5),
      I3 => init_wait_count_reg(6),
      I4 => init_wait_count_reg(7),
      O => init_wait_count
    );
\init_wait_count[7]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => init_wait_count_reg(7),
      I1 => \init_wait_count[7]_i_4__0_n_0\,
      I2 => init_wait_count_reg(6),
      O => \p_0_in__3\(7)
    );
\init_wait_count[7]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => init_wait_count_reg(1),
      I1 => init_wait_count_reg(0),
      I2 => init_wait_count_reg(3),
      I3 => init_wait_count_reg(2),
      O => \init_wait_count[7]_i_3__0_n_0\
    );
\init_wait_count[7]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => init_wait_count_reg(5),
      I1 => init_wait_count_reg(4),
      I2 => init_wait_count_reg(2),
      I3 => init_wait_count_reg(0),
      I4 => init_wait_count_reg(1),
      I5 => init_wait_count_reg(3),
      O => \init_wait_count[7]_i_4__0_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \init_wait_count[0]_i_1__0_n_0\,
      Q => init_wait_count_reg(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(1),
      Q => init_wait_count_reg(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(2),
      Q => init_wait_count_reg(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(3),
      Q => init_wait_count_reg(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(4),
      Q => init_wait_count_reg(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(5),
      Q => init_wait_count_reg(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(6),
      Q => init_wait_count_reg(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__3\(7),
      Q => init_wait_count_reg(7)
    );
\init_wait_done_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001000"
    )
        port map (
      I0 => \init_wait_count[7]_i_3__0_n_0\,
      I1 => init_wait_count_reg(4),
      I2 => init_wait_count_reg(5),
      I3 => init_wait_count_reg(6),
      I4 => init_wait_count_reg(7),
      I5 => init_wait_done_reg_n_0,
      O => \init_wait_done_i_1__0_n_0\
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      CLR => pma_reset,
      D => \init_wait_done_i_1__0_n_0\,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mmcm_lock_count_reg(0),
      O => \p_0_in__4\(0)
    );
\mmcm_lock_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mmcm_lock_count_reg(1),
      I1 => mmcm_lock_count_reg(0),
      O => \p_0_in__4\(1)
    );
\mmcm_lock_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => mmcm_lock_count_reg(2),
      I1 => mmcm_lock_count_reg(1),
      I2 => mmcm_lock_count_reg(0),
      O => \p_0_in__4\(2)
    );
\mmcm_lock_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => mmcm_lock_count_reg(3),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(2),
      O => \p_0_in__4\(3)
    );
\mmcm_lock_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => mmcm_lock_count_reg(4),
      I1 => mmcm_lock_count_reg(2),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(0),
      I4 => mmcm_lock_count_reg(3),
      O => \p_0_in__4\(4)
    );
\mmcm_lock_count[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => mmcm_lock_count_reg(3),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(2),
      I4 => mmcm_lock_count_reg(4),
      I5 => mmcm_lock_count_reg(5),
      O => \p_0_in__4\(5)
    );
\mmcm_lock_count[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mmcm_lock_count_reg(6),
      I1 => \mmcm_lock_reclocked_i_2__0_n_0\,
      O => \p_0_in__4\(6)
    );
\mmcm_lock_count[7]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => mmcm_lock_count_reg(6),
      I1 => \mmcm_lock_reclocked_i_2__0_n_0\,
      I2 => mmcm_lock_count_reg(7),
      O => \mmcm_lock_count[7]_i_2__0_n_0\
    );
\mmcm_lock_count[7]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => mmcm_lock_count_reg(7),
      I1 => \mmcm_lock_reclocked_i_2__0_n_0\,
      I2 => mmcm_lock_count_reg(6),
      O => \p_0_in__4\(7)
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(0),
      Q => mmcm_lock_count_reg(0),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(1),
      Q => mmcm_lock_count_reg(1),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(2),
      Q => mmcm_lock_count_reg(2),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(3),
      Q => mmcm_lock_count_reg(3),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(4),
      Q => mmcm_lock_count_reg(4),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(5),
      Q => mmcm_lock_count_reg(5),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(6),
      Q => mmcm_lock_count_reg(6),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2__0_n_0\,
      D => \p_0_in__4\(7),
      Q => mmcm_lock_count_reg(7),
      R => sync_mmcm_lock_reclocked_n_0
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAA0000"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => mmcm_lock_count_reg(7),
      I2 => \mmcm_lock_reclocked_i_2__0_n_0\,
      I3 => mmcm_lock_count_reg(6),
      I4 => mmcm_lock_i,
      O => mmcm_lock_reclocked_i_1_n_0
    );
\mmcm_lock_reclocked_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => mmcm_lock_count_reg(5),
      I1 => mmcm_lock_count_reg(4),
      I2 => mmcm_lock_count_reg(2),
      I3 => mmcm_lock_count_reg(1),
      I4 => mmcm_lock_count_reg(0),
      I5 => mmcm_lock_count_reg(3),
      O => \mmcm_lock_reclocked_i_2__0_n_0\
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => mmcm_lock_reclocked_i_1_n_0,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
\reset_time_out_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rxresetdone_s3,
      I1 => rx_state(1),
      O => \reset_time_out_i_2__0_n_0\
    );
\reset_time_out_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rx_state(2),
      I1 => rx_state(3),
      O => check_tlock_max
    );
reset_time_out_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEAE"
    )
        port map (
      I0 => rx_state(1),
      I1 => reset_time_out_reg_0,
      I2 => rx_state(0),
      I3 => mmcm_lock_reclocked,
      O => reset_time_out_i_4_n_0
    );
reset_time_out_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F303F38"
    )
        port map (
      I0 => reset_time_out_reg_0,
      I1 => rx_state(2),
      I2 => rx_state(3),
      I3 => rx_state(0),
      I4 => rx_state(1),
      O => reset_time_out_i_6_n_0
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => sync_cplllock_n_1,
      Q => reset_time_out_reg_n_0,
      S => pma_reset
    );
\run_phase_alignment_int_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0002"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(2),
      I3 => rx_state(1),
      I4 => run_phase_alignment_int_reg_n_0,
      O => \run_phase_alignment_int_i_1__0_n_0\
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => \run_phase_alignment_int_i_1__0_n_0\,
      Q => run_phase_alignment_int_reg_n_0,
      R => pma_reset
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3_reg_n_0,
      R => '0'
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => sync_data_valid_n_5,
      Q => \^data_in\,
      R => pma_reset
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => rx_fsm_reset_done_int_s3,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_RXRESETDONE: entity work.gig_ethernet_pcs_pma_0_sync_block_10
     port map (
      data_out => rxresetdone_s2,
      data_sync_reg1_0 => data_sync_reg1,
      independent_clock_bufg => independent_clock_bufg
    );
sync_cplllock: entity work.gig_ethernet_pcs_pma_0_sync_block_11
     port map (
      \FSM_sequential_rx_state_reg[0]\ => time_out_2ms_reg_n_0,
      Q(3 downto 0) => rx_state(3 downto 0),
      check_tlock_max => check_tlock_max,
      cplllock => cplllock,
      data_out => data_valid_sync,
      independent_clock_bufg => independent_clock_bufg,
      reset_time_out_reg => sync_cplllock_n_1,
      reset_time_out_reg_0 => \reset_time_out_i_2__0_n_0\,
      reset_time_out_reg_1 => reset_time_out_i_4_n_0,
      reset_time_out_reg_2 => reset_time_out_i_6_n_0,
      reset_time_out_reg_3 => reset_time_out_reg_n_0,
      time_out_2ms_reg => sync_cplllock_n_0
    );
sync_data_valid: entity work.gig_ethernet_pcs_pma_0_sync_block_12
     port map (
      D(2) => \rx_state__0\(3),
      D(1 downto 0) => \rx_state__0\(1 downto 0),
      E(0) => sync_data_valid_n_1,
      \FSM_sequential_rx_state_reg[0]\ => \FSM_sequential_rx_state[3]_i_4_n_0\,
      \FSM_sequential_rx_state_reg[0]_0\ => \wait_time_cnt[0]_i_2__0_n_0\,
      \FSM_sequential_rx_state_reg[0]_1\ => sync_cplllock_n_0,
      \FSM_sequential_rx_state_reg[0]_2\ => \FSM_sequential_rx_state[3]_i_6_n_0\,
      \FSM_sequential_rx_state_reg[0]_3\ => \FSM_sequential_rx_state[0]_i_2_n_0\,
      \FSM_sequential_rx_state_reg[0]_4\ => \FSM_sequential_rx_state[1]_i_2_n_0\,
      \FSM_sequential_rx_state_reg[2]\ => sync_data_valid_n_5,
      \FSM_sequential_rx_state_reg[3]\ => \FSM_sequential_rx_state[3]_i_8_n_0\,
      \FSM_sequential_rx_state_reg[3]_0\ => \FSM_sequential_rx_state[3]_i_9_n_0\,
      Q(3 downto 0) => rx_state(3 downto 0),
      data_in => \^data_in\,
      data_out => data_valid_sync,
      data_sync_reg1_0 => data_out,
      independent_clock_bufg => independent_clock_bufg,
      rx_fsm_reset_done_int_reg => reset_time_out_reg_n_0,
      rx_fsm_reset_done_int_reg_0 => time_out_100us_reg_n_0,
      rx_fsm_reset_done_int_reg_1 => time_out_1us_reg_n_0,
      time_out_wait_bypass_s3 => time_out_wait_bypass_s3
    );
sync_mmcm_lock_reclocked: entity work.gig_ethernet_pcs_pma_0_sync_block_13
     port map (
      SR(0) => sync_mmcm_lock_reclocked_n_0,
      data_out => mmcm_lock_i,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked
    );
sync_run_phase_alignment_int: entity work.gig_ethernet_pcs_pma_0_sync_block_14
     port map (
      data_in => run_phase_alignment_int_reg_n_0,
      data_out => run_phase_alignment_int_s2,
      userclk => userclk
    );
sync_rx_fsm_reset_done_int: entity work.gig_ethernet_pcs_pma_0_sync_block_15
     port map (
      data_in => \^data_in\,
      data_out => rx_fsm_reset_done_int_s2,
      userclk => userclk
    );
sync_time_out_wait_bypass: entity work.gig_ethernet_pcs_pma_0_sync_block_16
     port map (
      data_in => time_out_wait_bypass_reg_n_0,
      data_out => time_out_wait_bypass_s2,
      independent_clock_bufg => independent_clock_bufg
    );
time_out_100us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => time_out_100us_i_2_n_0,
      I1 => time_out_counter_reg(18),
      I2 => time_out_counter_reg(17),
      I3 => time_out_counter_reg(16),
      I4 => time_out_100us_i_3_n_0,
      I5 => time_out_100us_reg_n_0,
      O => time_out_100us_i_1_n_0
    );
time_out_100us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
        port map (
      I0 => time_tlock_max_i_6_n_0,
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(5),
      I5 => time_tlock_max_i_4_n_0,
      O => time_out_100us_i_2_n_0
    );
time_out_100us_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF2"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(17),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(7),
      I5 => time_out_counter_reg(8),
      O => time_out_100us_i_3_n_0
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_100us_i_1_n_0,
      Q => time_out_100us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_1us_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => time_out_1us_i_2_n_0,
      I1 => time_out_1us_i_3_n_0,
      I2 => time_out_1us_i_4_n_0,
      I3 => time_out_1us_reg_n_0,
      O => time_out_1us_i_1_n_0
    );
time_out_1us_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => time_out_2ms_i_7_n_0,
      I1 => time_out_counter_reg(4),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(13),
      I4 => time_out_counter_reg(5),
      O => time_out_1us_i_2_n_0
    );
time_out_1us_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(11),
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(8),
      I4 => time_out_counter_reg(7),
      I5 => time_out_1us_i_5_n_0,
      O => time_out_1us_i_3_n_0
    );
time_out_1us_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F800"
    )
        port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(8),
      I3 => time_tlock_max_i_3_n_0,
      I4 => time_out_1us_i_6_n_0,
      O => time_out_1us_i_4_n_0
    );
time_out_1us_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF2F2FFF2"
    )
        port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(15),
      I4 => time_out_counter_reg(16),
      I5 => time_out_counter_reg(17),
      O => time_out_1us_i_5_n_0
    );
time_out_1us_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(4),
      I2 => time_out_counter_reg(3),
      O => time_out_1us_i_6_n_0
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_1us_i_1_n_0,
      Q => time_out_1us_reg_n_0,
      R => reset_time_out_reg_n_0
    );
time_out_2ms_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => time_out_2ms,
      I1 => time_out_2ms_reg_n_0,
      O => time_out_2ms_i_1_n_0
    );
time_out_2ms_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => \time_out_2ms_i_3__0_n_0\,
      I1 => \time_out_2ms_i_4__0_n_0\,
      I2 => \time_out_2ms_i_5__0_n_0\,
      I3 => \time_out_2ms_i_6__0_n_0\,
      I4 => time_out_2ms_i_7_n_0,
      I5 => time_out_2ms_i_8_n_0,
      O => time_out_2ms
    );
\time_out_2ms_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FFFFFFFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(3),
      I1 => time_out_counter_reg(4),
      I2 => time_out_counter_reg(5),
      I3 => time_out_counter_reg(17),
      I4 => time_out_counter_reg(11),
      I5 => time_out_counter_reg(18),
      O => \time_out_2ms_i_3__0_n_0\
    );
\time_out_2ms_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      O => \time_out_2ms_i_4__0_n_0\
    );
\time_out_2ms_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(16),
      O => \time_out_2ms_i_5__0_n_0\
    );
\time_out_2ms_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => time_out_counter_reg(7),
      I1 => time_out_counter_reg(8),
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(9),
      O => \time_out_2ms_i_6__0_n_0\
    );
time_out_2ms_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(0),
      O => time_out_2ms_i_7_n_0
    );
time_out_2ms_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(4),
      O => time_out_2ms_i_8_n_0
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_2ms_i_1_n_0,
      Q => time_out_2ms_reg_n_0,
      R => reset_time_out_reg_n_0
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_2ms,
      O => time_out_counter
    );
\time_out_counter[0]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_3__0_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2__0_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2__0_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2__0_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2__0_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2__0_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2__0_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2__0_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_3__0_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1__0_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1__0_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1__0_n_0\,
      CO(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \time_out_counter_reg[16]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\(3),
      O(2) => \time_out_counter_reg[16]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[16]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1__0_n_7\,
      S(3) => '0',
      S(2 downto 0) => time_out_counter_reg(18 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1__0_n_5\,
      Q => time_out_counter_reg(18),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2__0_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2__0_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1__0_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out_reg_n_0
    );
\time_out_counter_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1__0_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1__0_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1__0_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1__0_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1__0_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1__0_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1__0_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1__0_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out_reg_n_0
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass_reg_n_0,
      I1 => rx_fsm_reset_done_int_s3,
      I2 => \time_out_wait_bypass_i_2__0_n_0\,
      I3 => run_phase_alignment_int_s3_reg_n_0,
      O => time_out_wait_bypass_i_1_n_0
    );
\time_out_wait_bypass_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFFFFFF"
    )
        port map (
      I0 => \time_out_wait_bypass_i_3__0_n_0\,
      I1 => wait_bypass_count_reg(1),
      I2 => wait_bypass_count_reg(11),
      I3 => wait_bypass_count_reg(0),
      I4 => \time_out_wait_bypass_i_4__0_n_0\,
      O => \time_out_wait_bypass_i_2__0_n_0\
    );
\time_out_wait_bypass_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(9),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(12),
      I3 => wait_bypass_count_reg(2),
      O => \time_out_wait_bypass_i_3__0_n_0\
    );
\time_out_wait_bypass_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => wait_bypass_count_reg(5),
      I1 => wait_bypass_count_reg(7),
      I2 => wait_bypass_count_reg(3),
      I3 => wait_bypass_count_reg(6),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(8),
      O => \time_out_wait_bypass_i_4__0_n_0\
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => time_out_wait_bypass_i_1_n_0,
      Q => time_out_wait_bypass_reg_n_0,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF8F0000"
    )
        port map (
      I0 => time_tlock_max_i_2_n_0,
      I1 => time_out_counter_reg(14),
      I2 => time_tlock_max_i_3_n_0,
      I3 => time_out_counter_reg(15),
      I4 => check_tlock_max_reg_n_0,
      I5 => time_tlock_max,
      O => time_tlock_max_i_1_n_0
    );
time_tlock_max_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEFEFEFEEEFEEEFE"
    )
        port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(12),
      I2 => time_tlock_max_i_4_n_0,
      I3 => time_tlock_max_i_5_n_0,
      I4 => time_tlock_max_i_6_n_0,
      I5 => time_out_counter_reg(5),
      O => time_tlock_max_i_2_n_0
    );
time_tlock_max_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(17),
      I2 => time_out_counter_reg(18),
      O => time_tlock_max_i_3_n_0
    );
time_tlock_max_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(10),
      I2 => time_out_counter_reg(9),
      O => time_tlock_max_i_4_n_0
    );
time_tlock_max_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(7),
      I2 => time_out_counter_reg(6),
      O => time_tlock_max_i_5_n_0
    );
time_tlock_max_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(2),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(3),
      O => time_tlock_max_i_6_n_0
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max,
      R => reset_time_out_reg_n_0
    );
\wait_bypass_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3_reg_n_0,
      O => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \time_out_wait_bypass_i_2__0_n_0\,
      I1 => rx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2__0_n_0\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_7\,
      Q => wait_bypass_count_reg(0),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3__0_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3__0_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3__0_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3__0_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3__0_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3__0_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3__0_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_4_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_5\,
      Q => wait_bypass_count_reg(10),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_4\,
      Q => wait_bypass_count_reg(11),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[12]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(12),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1__0_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[12]_i_1__0_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(12)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_6\,
      Q => wait_bypass_count_reg(1),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_5\,
      Q => wait_bypass_count_reg(2),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[0]_i_3__0_n_4\,
      Q => wait_bypass_count_reg(3),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(4),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3__0_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1__0_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1__0_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1__0_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1__0_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1__0_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1__0_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_6\,
      Q => wait_bypass_count_reg(5),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_5\,
      Q => wait_bypass_count_reg(6),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[4]_i_1__0_n_4\,
      Q => wait_bypass_count_reg(7),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_7\,
      Q => wait_bypass_count_reg(8),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_bypass_count_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1__0_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1__0_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1__0_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1__0_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1__0_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1__0_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1__0_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2__0_n_0\,
      D => \wait_bypass_count_reg[8]_i_1__0_n_6\,
      Q => wait_bypass_count_reg(9),
      R => \wait_bypass_count[0]_i_1__0_n_0\
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rx_state(3),
      I1 => rx_state(0),
      I2 => rx_state(1),
      O => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt[0]_i_10__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_10__0_n_0\
    );
\wait_time_cnt[0]_i_11__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_11__0_n_0\
    );
\wait_time_cnt[0]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_time_cnt[0]_i_4__0_n_0\,
      I1 => \wait_time_cnt[0]_i_5__0_n_0\,
      I2 => \wait_time_cnt[0]_i_6__0_n_0\,
      I3 => \wait_time_cnt[0]_i_7__0_n_0\,
      O => \wait_time_cnt[0]_i_2__0_n_0\
    );
\wait_time_cnt[0]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      I1 => wait_time_cnt_reg(0),
      I2 => wait_time_cnt_reg(13),
      I3 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_4__0_n_0\
    );
\wait_time_cnt[0]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      I1 => wait_time_cnt_reg(14),
      I2 => wait_time_cnt_reg(10),
      I3 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[0]_i_5__0_n_0\
    );
\wait_time_cnt[0]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      I1 => wait_time_cnt_reg(1),
      I2 => wait_time_cnt_reg(5),
      I3 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_6__0_n_0\
    );
\wait_time_cnt[0]_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      I1 => wait_time_cnt_reg(6),
      I2 => wait_time_cnt_reg(7),
      I3 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[0]_i_7__0_n_0\
    );
\wait_time_cnt[0]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_8__0_n_0\
    );
\wait_time_cnt[0]_i_9__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_9__0_n_0\
    );
\wait_time_cnt[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2__0_n_0\
    );
\wait_time_cnt[12]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3__0_n_0\
    );
\wait_time_cnt[12]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4__0_n_0\
    );
\wait_time_cnt[12]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5__0_n_0\
    );
\wait_time_cnt[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2__0_n_0\
    );
\wait_time_cnt[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3__0_n_0\
    );
\wait_time_cnt[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4__0_n_0\
    );
\wait_time_cnt[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5__0_n_0\
    );
\wait_time_cnt[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2__0_n_0\
    );
\wait_time_cnt[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3__0_n_0\
    );
\wait_time_cnt[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4__0_n_0\
    );
\wait_time_cnt[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5__0_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_7\,
      Q => wait_time_cnt_reg(0),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3__0_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3__0_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3__0_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3__0_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3__0_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3__0_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3__0_n_7\,
      S(3) => \wait_time_cnt[0]_i_8__0_n_0\,
      S(2) => \wait_time_cnt[0]_i_9__0_n_0\,
      S(1) => \wait_time_cnt[0]_i_10__0_n_0\,
      S(0) => \wait_time_cnt[0]_i_11__0_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(10),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(11),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(12),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1__0_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[12]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[12]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[12]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[12]_i_5__0_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(13),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(14),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[12]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(15),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_6\,
      Q => wait_time_cnt_reg(1),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_5\,
      Q => wait_time_cnt_reg(2),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[0]_i_3__0_n_4\,
      Q => wait_time_cnt_reg(3),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(4),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3__0_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1__0_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[4]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[4]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[4]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[4]_i_5__0_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(5),
      R => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_5\,
      Q => wait_time_cnt_reg(6),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[4]_i_1__0_n_4\,
      Q => wait_time_cnt_reg(7),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_7\,
      Q => wait_time_cnt_reg(8),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
\wait_time_cnt_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1__0_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1__0_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1__0_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1__0_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1__0_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1__0_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1__0_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1__0_n_7\,
      S(3) => \wait_time_cnt[8]_i_2__0_n_0\,
      S(2) => \wait_time_cnt[8]_i_3__0_n_0\,
      S(1) => \wait_time_cnt[8]_i_4__0_n_0\,
      S(0) => \wait_time_cnt[8]_i_5__0_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => \wait_time_cnt[0]_i_2__0_n_0\,
      D => \wait_time_cnt_reg[8]_i_1__0_n_6\,
      Q => wait_time_cnt_reg(9),
      S => \wait_time_cnt[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_TX_STARTUP_FSM is
  port (
    mmcm_reset : out STD_LOGIC;
    gt0_cpllreset_i : out STD_LOGIC;
    data_in : out STD_LOGIC;
    gt0_txuserrdy_i : out STD_LOGIC;
    gt0_gttxreset_gt : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    userclk : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    gt0_cpllrefclklost_i : in STD_LOGIC;
    gtxe2_i : in STD_LOGIC;
    data_sync_reg1 : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    cplllock : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_TX_STARTUP_FSM;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_TX_STARTUP_FSM is
  signal CPLL_RESET0 : STD_LOGIC;
  signal CPLL_RESET_i_1_n_0 : STD_LOGIC;
  signal \FSM_sequential_tx_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_tx_state[3]_i_7_n_0\ : STD_LOGIC;
  signal MMCM_RESET_i_1_n_0 : STD_LOGIC;
  signal TXUSERRDY_i_1_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^data_in\ : STD_LOGIC;
  signal \^gt0_cpllreset_i\ : STD_LOGIC;
  signal gt0_gttxreset_t : STD_LOGIC;
  signal \^gt0_txuserrdy_i\ : STD_LOGIC;
  signal gttxreset_i_i_1_n_0 : STD_LOGIC;
  signal init_wait_count : STD_LOGIC;
  signal \init_wait_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_3_n_0\ : STD_LOGIC;
  signal \init_wait_count[7]_i_4_n_0\ : STD_LOGIC;
  signal init_wait_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal init_wait_done_i_1_n_0 : STD_LOGIC;
  signal init_wait_done_reg_n_0 : STD_LOGIC;
  signal \mmcm_lock_count[7]_i_2_n_0\ : STD_LOGIC;
  signal mmcm_lock_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mmcm_lock_i : STD_LOGIC;
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal mmcm_lock_reclocked_i_1_n_0 : STD_LOGIC;
  signal mmcm_lock_reclocked_i_2_n_0 : STD_LOGIC;
  signal \^mmcm_reset\ : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pll_reset_asserted_i_1_n_0 : STD_LOGIC;
  signal pll_reset_asserted_i_2_n_0 : STD_LOGIC;
  signal pll_reset_asserted_reg_n_0 : STD_LOGIC;
  signal refclk_stable_count : STD_LOGIC;
  signal \refclk_stable_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \refclk_stable_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \refclk_stable_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \refclk_stable_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \refclk_stable_count[0]_i_7_n_0\ : STD_LOGIC;
  signal refclk_stable_count_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \refclk_stable_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \refclk_stable_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \refclk_stable_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \refclk_stable_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \refclk_stable_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \refclk_stable_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal refclk_stable_i_1_n_0 : STD_LOGIC;
  signal refclk_stable_reg_n_0 : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal reset_time_out_i_3_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_i_1_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_reg_n_0 : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sync_cplllock_n_0 : STD_LOGIC;
  signal sync_cplllock_n_1 : STD_LOGIC;
  signal sync_mmcm_lock_reclocked_n_0 : STD_LOGIC;
  signal time_out_2ms : STD_LOGIC;
  signal time_out_2ms_i_1_n_0 : STD_LOGIC;
  signal time_out_2ms_i_3_n_0 : STD_LOGIC;
  signal time_out_2ms_i_4_n_0 : STD_LOGIC;
  signal time_out_2ms_i_5_n_0 : STD_LOGIC;
  signal time_out_2ms_i_6_n_0 : STD_LOGIC;
  signal time_out_2ms_reg_n_0 : STD_LOGIC;
  signal time_out_500us_i_1_n_0 : STD_LOGIC;
  signal time_out_500us_i_2_n_0 : STD_LOGIC;
  signal time_out_500us_i_3_n_0 : STD_LOGIC;
  signal time_out_500us_reg_n_0 : STD_LOGIC;
  signal time_out_counter : STD_LOGIC;
  signal \time_out_counter[0]_i_3_n_0\ : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \time_out_counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \time_out_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal time_out_wait_bypass_i_1_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_2_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_3_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_4_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_i_5_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_reg_n_0 : STD_LOGIC;
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max_i_1_n_0 : STD_LOGIC;
  signal \time_tlock_max_i_2__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_3__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_4__0_n_0\ : STD_LOGIC;
  signal \time_tlock_max_i_5__0_n_0\ : STD_LOGIC;
  signal time_tlock_max_reg_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int_i_1_n_0 : STD_LOGIC;
  signal tx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal tx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal tx_state : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \tx_state__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal txresetdone_s2 : STD_LOGIC;
  signal txresetdone_s3 : STD_LOGIC;
  signal \wait_bypass_count[0]_i_2_n_0\ : STD_LOGIC;
  signal \wait_bypass_count[0]_i_4__0_n_0\ : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \wait_bypass_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_bypass_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal wait_time_cnt0 : STD_LOGIC;
  signal \wait_time_cnt[0]_i_10_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_11_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \wait_time_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal wait_time_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \wait_time_cnt_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wait_time_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_refclk_stable_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[0]_i_2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[1]_i_1\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[1]_i_2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[2]_i_2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_4\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \FSM_sequential_tx_state[3]_i_7\ : label is "soft_lutpair113";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[0]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[1]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[2]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_tx_state_reg[3]\ : label is "WAIT_FOR_TXOUTCLK:0100,RELEASE_PLL_RESET:0011,WAIT_FOR_PLL_LOCK:0010,ASSERT_ALL_RESETS:0001,INIT:0000,WAIT_RESET_DONE:0111,RESET_FSM_DONE:1001,WAIT_FOR_TXUSRCLK:0110,DO_PHASE_ALIGNMENT:1000,RELEASE_MMCM_RESET:0101";
  attribute SOFT_HLUTNM of MMCM_RESET_i_1 : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of gttxreset_i_i_1 : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \init_wait_count[0]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_1\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \init_wait_count[6]_i_1\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_2\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \init_wait_count[7]_i_3\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \mmcm_lock_count[6]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_3\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of pll_reset_asserted_i_2 : label is "soft_lutpair109";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \refclk_stable_count_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \refclk_stable_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \refclk_stable_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \refclk_stable_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \refclk_stable_count_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of time_out_2ms_i_1 : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of time_out_2ms_i_3 : label is "soft_lutpair112";
  attribute ADDER_THRESHOLD of \time_out_counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \time_out_counter_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of \time_tlock_max_i_4__0\ : label is "soft_lutpair112";
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_bypass_count_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[0]_i_3\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wait_time_cnt_reg[8]_i_1\ : label is 11;
begin
  data_in <= \^data_in\;
  gt0_cpllreset_i <= \^gt0_cpllreset_i\;
  gt0_txuserrdy_i <= \^gt0_txuserrdy_i\;
  mmcm_reset <= \^mmcm_reset\;
CPLL_RESET_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => CPLL_RESET0,
      I1 => tx_state(2),
      I2 => tx_state(0),
      I3 => tx_state(1),
      I4 => tx_state(3),
      I5 => \^gt0_cpllreset_i\,
      O => CPLL_RESET_i_1_n_0
    );
CPLL_RESET_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => refclk_stable_reg_n_0,
      I1 => pll_reset_asserted_reg_n_0,
      I2 => gt0_cpllrefclklost_i,
      O => CPLL_RESET0
    );
CPLL_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => CPLL_RESET_i_1_n_0,
      Q => \^gt0_cpllreset_i\,
      R => pma_reset
    );
\FSM_sequential_tx_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000DDDDD555"
    )
        port map (
      I0 => \FSM_sequential_tx_state[0]_i_2_n_0\,
      I1 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      I2 => tx_state(1),
      I3 => time_out_2ms_reg_n_0,
      I4 => tx_state(2),
      I5 => \FSM_sequential_tx_state[3]_i_5_n_0\,
      O => \tx_state__0\(0)
    );
\FSM_sequential_tx_state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(3),
      O => \FSM_sequential_tx_state[0]_i_2_n_0\
    );
\FSM_sequential_tx_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00070F00"
    )
        port map (
      I0 => \FSM_sequential_tx_state[1]_i_2_n_0\,
      I1 => tx_state(2),
      I2 => tx_state(3),
      I3 => tx_state(1),
      I4 => tx_state(0),
      O => \tx_state__0\(1)
    );
\FSM_sequential_tx_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => time_tlock_max_reg_n_0,
      I2 => reset_time_out,
      O => \FSM_sequential_tx_state[1]_i_2_n_0\
    );
\FSM_sequential_tx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0055100055555555"
    )
        port map (
      I0 => tx_state(3),
      I1 => time_out_2ms_reg_n_0,
      I2 => tx_state(1),
      I3 => tx_state(0),
      I4 => tx_state(2),
      I5 => \FSM_sequential_tx_state[2]_i_2_n_0\,
      O => \FSM_sequential_tx_state[2]_i_1_n_0\
    );
\FSM_sequential_tx_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDDFDD"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      I2 => reset_time_out,
      I3 => time_tlock_max_reg_n_0,
      I4 => mmcm_lock_reclocked,
      O => \FSM_sequential_tx_state[2]_i_2_n_0\
    );
\FSM_sequential_tx_state[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => time_out_wait_bypass_s3,
      I1 => tx_state(3),
      I2 => \FSM_sequential_tx_state[3]_i_5_n_0\,
      O => \tx_state__0\(3)
    );
\FSM_sequential_tx_state[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      O => \FSM_sequential_tx_state[3]_i_4_n_0\
    );
\FSM_sequential_tx_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000B0000000"
    )
        port map (
      I0 => reset_time_out,
      I1 => time_out_500us_reg_n_0,
      I2 => tx_state(2),
      I3 => tx_state(1),
      I4 => tx_state(0),
      I5 => tx_state(3),
      O => \FSM_sequential_tx_state[3]_i_5_n_0\
    );
\FSM_sequential_tx_state[3]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_time_out,
      I1 => time_tlock_max_reg_n_0,
      O => \FSM_sequential_tx_state[3]_i_7_n_0\
    );
\FSM_sequential_tx_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_cplllock_n_0,
      D => \tx_state__0\(0),
      Q => tx_state(0),
      R => pma_reset
    );
\FSM_sequential_tx_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_cplllock_n_0,
      D => \tx_state__0\(1),
      Q => tx_state(1),
      R => pma_reset
    );
\FSM_sequential_tx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_cplllock_n_0,
      D => \FSM_sequential_tx_state[2]_i_1_n_0\,
      Q => tx_state(2),
      R => pma_reset
    );
\FSM_sequential_tx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => sync_cplllock_n_0,
      D => \tx_state__0\(3),
      Q => tx_state(3),
      R => pma_reset
    );
MMCM_RESET_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70004"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(0),
      I2 => tx_state(1),
      I3 => tx_state(3),
      I4 => \^mmcm_reset\,
      O => MMCM_RESET_i_1_n_0
    );
MMCM_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => MMCM_RESET_i_1_n_0,
      Q => \^mmcm_reset\,
      R => pma_reset
    );
TXUSERRDY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0080"
    )
        port map (
      I0 => tx_state(2),
      I1 => tx_state(1),
      I2 => tx_state(0),
      I3 => tx_state(3),
      I4 => \^gt0_txuserrdy_i\,
      O => TXUSERRDY_i_1_n_0
    );
TXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => TXUSERRDY_i_1_n_0,
      Q => \^gt0_txuserrdy_i\,
      R => pma_reset
    );
gttxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0002"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(2),
      I2 => tx_state(1),
      I3 => tx_state(3),
      I4 => gt0_gttxreset_t,
      O => gttxreset_i_i_1_n_0
    );
gttxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gttxreset_i_i_1_n_0,
      Q => gt0_gttxreset_t,
      R => pma_reset
    );
gtxe2_i_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => gt0_gttxreset_t,
      I1 => \^data_in\,
      I2 => gtxe2_i,
      O => gt0_gttxreset_gt
    );
\init_wait_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => init_wait_count_reg(0),
      O => \init_wait_count[0]_i_1_n_0\
    );
\init_wait_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => init_wait_count_reg(0),
      I1 => init_wait_count_reg(1),
      O => \p_0_in__1\(1)
    );
\init_wait_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => init_wait_count_reg(2),
      I1 => init_wait_count_reg(0),
      I2 => init_wait_count_reg(1),
      O => \p_0_in__1\(2)
    );
\init_wait_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => init_wait_count_reg(3),
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(2),
      O => \p_0_in__1\(3)
    );
\init_wait_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => init_wait_count_reg(4),
      I1 => init_wait_count_reg(2),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(1),
      I4 => init_wait_count_reg(3),
      O => \p_0_in__1\(4)
    );
\init_wait_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => init_wait_count_reg(3),
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(0),
      I3 => init_wait_count_reg(2),
      I4 => init_wait_count_reg(4),
      I5 => init_wait_count_reg(5),
      O => \p_0_in__1\(5)
    );
\init_wait_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => init_wait_count_reg(6),
      I1 => \init_wait_count[7]_i_4_n_0\,
      O => \p_0_in__1\(6)
    );
\init_wait_count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => init_wait_count_reg(7),
      I2 => init_wait_count_reg(4),
      I3 => init_wait_count_reg(3),
      I4 => init_wait_count_reg(2),
      O => init_wait_count
    );
\init_wait_count[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => init_wait_count_reg(7),
      I1 => \init_wait_count[7]_i_4_n_0\,
      I2 => init_wait_count_reg(6),
      O => \p_0_in__1\(7)
    );
\init_wait_count[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => init_wait_count_reg(6),
      I1 => init_wait_count_reg(1),
      I2 => init_wait_count_reg(5),
      I3 => init_wait_count_reg(0),
      O => \init_wait_count[7]_i_3_n_0\
    );
\init_wait_count[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => init_wait_count_reg(5),
      I1 => init_wait_count_reg(4),
      I2 => init_wait_count_reg(2),
      I3 => init_wait_count_reg(0),
      I4 => init_wait_count_reg(1),
      I5 => init_wait_count_reg(3),
      O => \init_wait_count[7]_i_4_n_0\
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \init_wait_count[0]_i_1_n_0\,
      Q => init_wait_count_reg(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(1),
      Q => init_wait_count_reg(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(2),
      Q => init_wait_count_reg(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(3),
      Q => init_wait_count_reg(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(4),
      Q => init_wait_count_reg(4)
    );
\init_wait_count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(5),
      Q => init_wait_count_reg(5)
    );
\init_wait_count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(6),
      Q => init_wait_count_reg(6)
    );
\init_wait_count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => init_wait_count,
      CLR => pma_reset,
      D => \p_0_in__1\(7),
      Q => init_wait_count_reg(7)
    );
init_wait_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF01000000"
    )
        port map (
      I0 => \init_wait_count[7]_i_3_n_0\,
      I1 => init_wait_count_reg(7),
      I2 => init_wait_count_reg(4),
      I3 => init_wait_count_reg(3),
      I4 => init_wait_count_reg(2),
      I5 => init_wait_done_reg_n_0,
      O => init_wait_done_i_1_n_0
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      CLR => pma_reset,
      D => init_wait_done_i_1_n_0,
      Q => init_wait_done_reg_n_0
    );
\mmcm_lock_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mmcm_lock_count_reg(0),
      O => \p_0_in__2\(0)
    );
\mmcm_lock_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mmcm_lock_count_reg(1),
      I1 => mmcm_lock_count_reg(0),
      O => \p_0_in__2\(1)
    );
\mmcm_lock_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => mmcm_lock_count_reg(2),
      I1 => mmcm_lock_count_reg(1),
      I2 => mmcm_lock_count_reg(0),
      O => \p_0_in__2\(2)
    );
\mmcm_lock_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => mmcm_lock_count_reg(3),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(2),
      O => \p_0_in__2\(3)
    );
\mmcm_lock_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => mmcm_lock_count_reg(4),
      I1 => mmcm_lock_count_reg(2),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(0),
      I4 => mmcm_lock_count_reg(3),
      O => \p_0_in__2\(4)
    );
\mmcm_lock_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => mmcm_lock_count_reg(3),
      I1 => mmcm_lock_count_reg(0),
      I2 => mmcm_lock_count_reg(1),
      I3 => mmcm_lock_count_reg(2),
      I4 => mmcm_lock_count_reg(4),
      I5 => mmcm_lock_count_reg(5),
      O => \p_0_in__2\(5)
    );
\mmcm_lock_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => mmcm_lock_count_reg(6),
      I1 => mmcm_lock_reclocked_i_2_n_0,
      O => \p_0_in__2\(6)
    );
\mmcm_lock_count[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => mmcm_lock_count_reg(6),
      I1 => mmcm_lock_reclocked_i_2_n_0,
      I2 => mmcm_lock_count_reg(7),
      O => \mmcm_lock_count[7]_i_2_n_0\
    );
\mmcm_lock_count[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => mmcm_lock_count_reg(7),
      I1 => mmcm_lock_reclocked_i_2_n_0,
      I2 => mmcm_lock_count_reg(6),
      O => \p_0_in__2\(7)
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(0),
      Q => mmcm_lock_count_reg(0),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(1),
      Q => mmcm_lock_count_reg(1),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(2),
      Q => mmcm_lock_count_reg(2),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(3),
      Q => mmcm_lock_count_reg(3),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(4),
      Q => mmcm_lock_count_reg(4),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(5),
      Q => mmcm_lock_count_reg(5),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(6),
      Q => mmcm_lock_count_reg(6),
      R => sync_mmcm_lock_reclocked_n_0
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => \mmcm_lock_count[7]_i_2_n_0\,
      D => \p_0_in__2\(7),
      Q => mmcm_lock_count_reg(7),
      R => sync_mmcm_lock_reclocked_n_0
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAA0000"
    )
        port map (
      I0 => mmcm_lock_reclocked,
      I1 => mmcm_lock_count_reg(7),
      I2 => mmcm_lock_reclocked_i_2_n_0,
      I3 => mmcm_lock_count_reg(6),
      I4 => mmcm_lock_i,
      O => mmcm_lock_reclocked_i_1_n_0
    );
mmcm_lock_reclocked_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => mmcm_lock_count_reg(5),
      I1 => mmcm_lock_count_reg(4),
      I2 => mmcm_lock_count_reg(2),
      I3 => mmcm_lock_count_reg(1),
      I4 => mmcm_lock_count_reg(0),
      I5 => mmcm_lock_count_reg(3),
      O => mmcm_lock_reclocked_i_2_n_0
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => mmcm_lock_reclocked_i_1_n_0,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
pll_reset_asserted_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB00BB00FF04FF44"
    )
        port map (
      I0 => tx_state(3),
      I1 => pll_reset_asserted_i_2_n_0,
      I2 => refclk_stable_reg_n_0,
      I3 => pll_reset_asserted_reg_n_0,
      I4 => gt0_cpllrefclklost_i,
      I5 => tx_state(1),
      O => pll_reset_asserted_i_1_n_0
    );
pll_reset_asserted_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(2),
      O => pll_reset_asserted_i_2_n_0
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => pll_reset_asserted_i_1_n_0,
      Q => pll_reset_asserted_reg_n_0,
      R => pma_reset
    );
\refclk_stable_count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \refclk_stable_count[0]_i_3_n_0\,
      I1 => refclk_stable_count_reg(4),
      I2 => refclk_stable_count_reg(8),
      I3 => refclk_stable_count_reg(5),
      I4 => refclk_stable_count_reg(17),
      I5 => \refclk_stable_count[0]_i_4_n_0\,
      O => refclk_stable_count
    );
\refclk_stable_count[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => refclk_stable_count_reg(2),
      I1 => refclk_stable_count_reg(15),
      I2 => refclk_stable_count_reg(0),
      I3 => refclk_stable_count_reg(11),
      I4 => \refclk_stable_count[0]_i_6_n_0\,
      I5 => \refclk_stable_count[0]_i_7_n_0\,
      O => \refclk_stable_count[0]_i_3_n_0\
    );
\refclk_stable_count[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => refclk_stable_count_reg(6),
      I1 => refclk_stable_count_reg(1),
      I2 => refclk_stable_count_reg(10),
      I3 => refclk_stable_count_reg(18),
      O => \refclk_stable_count[0]_i_4_n_0\
    );
\refclk_stable_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => refclk_stable_count_reg(0),
      O => \refclk_stable_count[0]_i_5_n_0\
    );
\refclk_stable_count[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => refclk_stable_count_reg(13),
      I1 => refclk_stable_count_reg(19),
      I2 => refclk_stable_count_reg(12),
      I3 => refclk_stable_count_reg(14),
      O => \refclk_stable_count[0]_i_6_n_0\
    );
\refclk_stable_count[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => refclk_stable_count_reg(16),
      I1 => refclk_stable_count_reg(7),
      I2 => refclk_stable_count_reg(9),
      I3 => refclk_stable_count_reg(3),
      O => \refclk_stable_count[0]_i_7_n_0\
    );
\refclk_stable_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[0]_i_2_n_7\,
      Q => refclk_stable_count_reg(0),
      R => '0'
    );
\refclk_stable_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \refclk_stable_count_reg[0]_i_2_n_0\,
      CO(2) => \refclk_stable_count_reg[0]_i_2_n_1\,
      CO(1) => \refclk_stable_count_reg[0]_i_2_n_2\,
      CO(0) => \refclk_stable_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \refclk_stable_count_reg[0]_i_2_n_4\,
      O(2) => \refclk_stable_count_reg[0]_i_2_n_5\,
      O(1) => \refclk_stable_count_reg[0]_i_2_n_6\,
      O(0) => \refclk_stable_count_reg[0]_i_2_n_7\,
      S(3 downto 1) => refclk_stable_count_reg(3 downto 1),
      S(0) => \refclk_stable_count[0]_i_5_n_0\
    );
\refclk_stable_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[8]_i_1_n_5\,
      Q => refclk_stable_count_reg(10),
      R => '0'
    );
\refclk_stable_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[8]_i_1_n_4\,
      Q => refclk_stable_count_reg(11),
      R => '0'
    );
\refclk_stable_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[12]_i_1_n_7\,
      Q => refclk_stable_count_reg(12),
      R => '0'
    );
\refclk_stable_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \refclk_stable_count_reg[8]_i_1_n_0\,
      CO(3) => \refclk_stable_count_reg[12]_i_1_n_0\,
      CO(2) => \refclk_stable_count_reg[12]_i_1_n_1\,
      CO(1) => \refclk_stable_count_reg[12]_i_1_n_2\,
      CO(0) => \refclk_stable_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \refclk_stable_count_reg[12]_i_1_n_4\,
      O(2) => \refclk_stable_count_reg[12]_i_1_n_5\,
      O(1) => \refclk_stable_count_reg[12]_i_1_n_6\,
      O(0) => \refclk_stable_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => refclk_stable_count_reg(15 downto 12)
    );
\refclk_stable_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[12]_i_1_n_6\,
      Q => refclk_stable_count_reg(13),
      R => '0'
    );
\refclk_stable_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[12]_i_1_n_5\,
      Q => refclk_stable_count_reg(14),
      R => '0'
    );
\refclk_stable_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[12]_i_1_n_4\,
      Q => refclk_stable_count_reg(15),
      R => '0'
    );
\refclk_stable_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[16]_i_1_n_7\,
      Q => refclk_stable_count_reg(16),
      R => '0'
    );
\refclk_stable_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \refclk_stable_count_reg[12]_i_1_n_0\,
      CO(3) => \NLW_refclk_stable_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \refclk_stable_count_reg[16]_i_1_n_1\,
      CO(1) => \refclk_stable_count_reg[16]_i_1_n_2\,
      CO(0) => \refclk_stable_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \refclk_stable_count_reg[16]_i_1_n_4\,
      O(2) => \refclk_stable_count_reg[16]_i_1_n_5\,
      O(1) => \refclk_stable_count_reg[16]_i_1_n_6\,
      O(0) => \refclk_stable_count_reg[16]_i_1_n_7\,
      S(3 downto 0) => refclk_stable_count_reg(19 downto 16)
    );
\refclk_stable_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[16]_i_1_n_6\,
      Q => refclk_stable_count_reg(17),
      R => '0'
    );
\refclk_stable_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[16]_i_1_n_5\,
      Q => refclk_stable_count_reg(18),
      R => '0'
    );
\refclk_stable_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[16]_i_1_n_4\,
      Q => refclk_stable_count_reg(19),
      R => '0'
    );
\refclk_stable_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[0]_i_2_n_6\,
      Q => refclk_stable_count_reg(1),
      R => '0'
    );
\refclk_stable_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[0]_i_2_n_5\,
      Q => refclk_stable_count_reg(2),
      R => '0'
    );
\refclk_stable_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[0]_i_2_n_4\,
      Q => refclk_stable_count_reg(3),
      R => '0'
    );
\refclk_stable_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[4]_i_1_n_7\,
      Q => refclk_stable_count_reg(4),
      R => '0'
    );
\refclk_stable_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \refclk_stable_count_reg[0]_i_2_n_0\,
      CO(3) => \refclk_stable_count_reg[4]_i_1_n_0\,
      CO(2) => \refclk_stable_count_reg[4]_i_1_n_1\,
      CO(1) => \refclk_stable_count_reg[4]_i_1_n_2\,
      CO(0) => \refclk_stable_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \refclk_stable_count_reg[4]_i_1_n_4\,
      O(2) => \refclk_stable_count_reg[4]_i_1_n_5\,
      O(1) => \refclk_stable_count_reg[4]_i_1_n_6\,
      O(0) => \refclk_stable_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => refclk_stable_count_reg(7 downto 4)
    );
\refclk_stable_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[4]_i_1_n_6\,
      Q => refclk_stable_count_reg(5),
      R => '0'
    );
\refclk_stable_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[4]_i_1_n_5\,
      Q => refclk_stable_count_reg(6),
      R => '0'
    );
\refclk_stable_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[4]_i_1_n_4\,
      Q => refclk_stable_count_reg(7),
      R => '0'
    );
\refclk_stable_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[8]_i_1_n_7\,
      Q => refclk_stable_count_reg(8),
      R => '0'
    );
\refclk_stable_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \refclk_stable_count_reg[4]_i_1_n_0\,
      CO(3) => \refclk_stable_count_reg[8]_i_1_n_0\,
      CO(2) => \refclk_stable_count_reg[8]_i_1_n_1\,
      CO(1) => \refclk_stable_count_reg[8]_i_1_n_2\,
      CO(0) => \refclk_stable_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \refclk_stable_count_reg[8]_i_1_n_4\,
      O(2) => \refclk_stable_count_reg[8]_i_1_n_5\,
      O(1) => \refclk_stable_count_reg[8]_i_1_n_6\,
      O(0) => \refclk_stable_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => refclk_stable_count_reg(11 downto 8)
    );
\refclk_stable_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => refclk_stable_count,
      D => \refclk_stable_count_reg[8]_i_1_n_6\,
      Q => refclk_stable_count_reg(9),
      R => '0'
    );
refclk_stable_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \refclk_stable_count[0]_i_4_n_0\,
      I1 => refclk_stable_count_reg(17),
      I2 => refclk_stable_count_reg(5),
      I3 => refclk_stable_count_reg(8),
      I4 => refclk_stable_count_reg(4),
      I5 => \refclk_stable_count[0]_i_3_n_0\,
      O => refclk_stable_i_1_n_0
    );
refclk_stable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => refclk_stable_i_1_n_0,
      Q => refclk_stable_reg_n_0,
      R => '0'
    );
reset_time_out_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4C7C"
    )
        port map (
      I0 => txresetdone_s3,
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => mmcm_lock_reclocked,
      O => reset_time_out_i_3_n_0
    );
reset_time_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => sync_cplllock_n_1,
      Q => reset_time_out,
      R => pma_reset
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEF0100"
    )
        port map (
      I0 => tx_state(1),
      I1 => tx_state(2),
      I2 => tx_state(0),
      I3 => tx_state(3),
      I4 => run_phase_alignment_int_reg_n_0,
      O => run_phase_alignment_int_i_1_n_0
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => run_phase_alignment_int_i_1_n_0,
      Q => run_phase_alignment_int_reg_n_0,
      R => pma_reset
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
sync_TXRESETDONE: entity work.gig_ethernet_pcs_pma_0_sync_block_4
     port map (
      data_out => txresetdone_s2,
      data_sync_reg1_0 => data_sync_reg1,
      independent_clock_bufg => independent_clock_bufg
    );
sync_cplllock: entity work.gig_ethernet_pcs_pma_0_sync_block_5
     port map (
      E(0) => sync_cplllock_n_0,
      \FSM_sequential_tx_state[3]_i_3_0\ => time_out_500us_reg_n_0,
      \FSM_sequential_tx_state[3]_i_3_1\ => time_out_2ms_reg_n_0,
      \FSM_sequential_tx_state[3]_i_3_2\ => pll_reset_asserted_reg_n_0,
      \FSM_sequential_tx_state[3]_i_3_3\ => refclk_stable_reg_n_0,
      \FSM_sequential_tx_state_reg[0]\ => init_wait_done_reg_n_0,
      \FSM_sequential_tx_state_reg[0]_0\ => \FSM_sequential_tx_state[3]_i_4_n_0\,
      \FSM_sequential_tx_state_reg[0]_1\ => \FSM_sequential_tx_state[3]_i_7_n_0\,
      \FSM_sequential_tx_state_reg[1]\ => sync_cplllock_n_1,
      Q(3 downto 0) => tx_state(3 downto 0),
      cplllock => cplllock,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_lock_reclocked => mmcm_lock_reclocked,
      reset_time_out => reset_time_out,
      reset_time_out_reg => reset_time_out_i_3_n_0,
      sel => sel,
      txresetdone_s3 => txresetdone_s3
    );
sync_mmcm_lock_reclocked: entity work.gig_ethernet_pcs_pma_0_sync_block_6
     port map (
      SR(0) => sync_mmcm_lock_reclocked_n_0,
      data_out => mmcm_lock_i,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked
    );
sync_run_phase_alignment_int: entity work.gig_ethernet_pcs_pma_0_sync_block_7
     port map (
      data_in => run_phase_alignment_int_reg_n_0,
      data_out => run_phase_alignment_int_s2,
      userclk => userclk
    );
sync_time_out_wait_bypass: entity work.gig_ethernet_pcs_pma_0_sync_block_8
     port map (
      data_in => time_out_wait_bypass_reg_n_0,
      data_out => time_out_wait_bypass_s2,
      independent_clock_bufg => independent_clock_bufg
    );
sync_tx_fsm_reset_done_int: entity work.gig_ethernet_pcs_pma_0_sync_block_9
     port map (
      data_in => \^data_in\,
      data_out => tx_fsm_reset_done_int_s2,
      userclk => userclk
    );
time_out_2ms_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => time_out_2ms_reg_n_0,
      I1 => time_out_2ms,
      I2 => reset_time_out,
      O => time_out_2ms_i_1_n_0
    );
\time_out_2ms_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => time_out_2ms_i_3_n_0,
      I1 => time_out_2ms_i_4_n_0,
      I2 => time_out_2ms_i_5_n_0,
      I3 => time_out_2ms_i_6_n_0,
      I4 => time_out_500us_i_3_n_0,
      O => time_out_2ms
    );
time_out_2ms_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      O => time_out_2ms_i_3_n_0
    );
time_out_2ms_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => time_out_counter_reg(3),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(9),
      I3 => time_out_counter_reg(10),
      O => time_out_2ms_i_4_n_0
    );
time_out_2ms_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(2),
      I2 => time_out_counter_reg(0),
      O => time_out_2ms_i_5_n_0
    );
time_out_2ms_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(4),
      I3 => time_out_counter_reg(18),
      I4 => time_out_counter_reg(11),
      I5 => time_out_counter_reg(17),
      O => time_out_2ms_i_6_n_0
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_2ms_i_1_n_0,
      Q => time_out_2ms_reg_n_0,
      R => '0'
    );
time_out_500us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAABAAA"
    )
        port map (
      I0 => time_out_500us_reg_n_0,
      I1 => time_out_500us_i_2_n_0,
      I2 => \time_tlock_max_i_3__0_n_0\,
      I3 => \time_tlock_max_i_2__0_n_0\,
      I4 => time_out_500us_i_3_n_0,
      I5 => reset_time_out,
      O => time_out_500us_i_1_n_0
    );
time_out_500us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF2FFFFFFFFFF"
    )
        port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(16),
      I4 => time_out_counter_reg(11),
      I5 => time_out_counter_reg(15),
      O => time_out_500us_i_2_n_0
    );
time_out_500us_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(8),
      I2 => time_out_counter_reg(6),
      I3 => time_out_counter_reg(7),
      I4 => time_out_counter_reg(14),
      O => time_out_500us_i_3_n_0
    );
time_out_500us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_500us_i_1_n_0,
      Q => time_out_500us_reg_n_0,
      R => '0'
    );
\time_out_counter[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_2ms,
      O => time_out_counter
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => time_out_counter_reg(0),
      O => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_7\,
      Q => time_out_counter_reg(0),
      R => reset_time_out
    );
\time_out_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \time_out_counter_reg[0]_i_2_n_0\,
      CO(2) => \time_out_counter_reg[0]_i_2_n_1\,
      CO(1) => \time_out_counter_reg[0]_i_2_n_2\,
      CO(0) => \time_out_counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \time_out_counter_reg[0]_i_2_n_4\,
      O(2) => \time_out_counter_reg[0]_i_2_n_5\,
      O(1) => \time_out_counter_reg[0]_i_2_n_6\,
      O(0) => \time_out_counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => time_out_counter_reg(3 downto 1),
      S(0) => \time_out_counter[0]_i_3_n_0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_5\,
      Q => time_out_counter_reg(10),
      R => reset_time_out
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_4\,
      Q => time_out_counter_reg(11),
      R => reset_time_out
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_7\,
      Q => time_out_counter_reg(12),
      R => reset_time_out
    );
\time_out_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[8]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[12]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[12]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[12]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[12]_i_1_n_4\,
      O(2) => \time_out_counter_reg[12]_i_1_n_5\,
      O(1) => \time_out_counter_reg[12]_i_1_n_6\,
      O(0) => \time_out_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(15 downto 12)
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_6\,
      Q => time_out_counter_reg(13),
      R => reset_time_out
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_5\,
      Q => time_out_counter_reg(14),
      R => reset_time_out
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[12]_i_1_n_4\,
      Q => time_out_counter_reg(15),
      R => reset_time_out
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_7\,
      Q => time_out_counter_reg(16),
      R => reset_time_out
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[12]_i_1_n_0\,
      CO(3 downto 2) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \time_out_counter_reg[16]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \time_out_counter_reg[16]_i_1_n_5\,
      O(1) => \time_out_counter_reg[16]_i_1_n_6\,
      O(0) => \time_out_counter_reg[16]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => time_out_counter_reg(18 downto 16)
    );
\time_out_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_6\,
      Q => time_out_counter_reg(17),
      R => reset_time_out
    );
\time_out_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[16]_i_1_n_5\,
      Q => time_out_counter_reg(18),
      R => reset_time_out
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_6\,
      Q => time_out_counter_reg(1),
      R => reset_time_out
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_5\,
      Q => time_out_counter_reg(2),
      R => reset_time_out
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[0]_i_2_n_4\,
      Q => time_out_counter_reg(3),
      R => reset_time_out
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_7\,
      Q => time_out_counter_reg(4),
      R => reset_time_out
    );
\time_out_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[0]_i_2_n_0\,
      CO(3) => \time_out_counter_reg[4]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[4]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[4]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[4]_i_1_n_4\,
      O(2) => \time_out_counter_reg[4]_i_1_n_5\,
      O(1) => \time_out_counter_reg[4]_i_1_n_6\,
      O(0) => \time_out_counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(7 downto 4)
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_6\,
      Q => time_out_counter_reg(5),
      R => reset_time_out
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_5\,
      Q => time_out_counter_reg(6),
      R => reset_time_out
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[4]_i_1_n_4\,
      Q => time_out_counter_reg(7),
      R => reset_time_out
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_7\,
      Q => time_out_counter_reg(8),
      R => reset_time_out
    );
\time_out_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \time_out_counter_reg[4]_i_1_n_0\,
      CO(3) => \time_out_counter_reg[8]_i_1_n_0\,
      CO(2) => \time_out_counter_reg[8]_i_1_n_1\,
      CO(1) => \time_out_counter_reg[8]_i_1_n_2\,
      CO(0) => \time_out_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \time_out_counter_reg[8]_i_1_n_4\,
      O(2) => \time_out_counter_reg[8]_i_1_n_5\,
      O(1) => \time_out_counter_reg[8]_i_1_n_6\,
      O(0) => \time_out_counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => time_out_counter_reg(11 downto 8)
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => time_out_counter,
      D => \time_out_counter_reg[8]_i_1_n_6\,
      Q => time_out_counter_reg(9),
      R => reset_time_out
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AB00"
    )
        port map (
      I0 => time_out_wait_bypass_reg_n_0,
      I1 => tx_fsm_reset_done_int_s3,
      I2 => time_out_wait_bypass_i_2_n_0,
      I3 => run_phase_alignment_int_s3,
      O => time_out_wait_bypass_i_1_n_0
    );
time_out_wait_bypass_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEFFFFFFFFF"
    )
        port map (
      I0 => time_out_wait_bypass_i_3_n_0,
      I1 => time_out_wait_bypass_i_4_n_0,
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(13),
      I4 => wait_bypass_count_reg(11),
      I5 => time_out_wait_bypass_i_5_n_0,
      O => time_out_wait_bypass_i_2_n_0
    );
time_out_wait_bypass_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => wait_bypass_count_reg(16),
      I1 => wait_bypass_count_reg(9),
      I2 => wait_bypass_count_reg(12),
      I3 => wait_bypass_count_reg(10),
      O => time_out_wait_bypass_i_3_n_0
    );
time_out_wait_bypass_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => wait_bypass_count_reg(4),
      I1 => wait_bypass_count_reg(15),
      I2 => wait_bypass_count_reg(6),
      I3 => wait_bypass_count_reg(0),
      O => time_out_wait_bypass_i_4_n_0
    );
time_out_wait_bypass_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => wait_bypass_count_reg(8),
      I1 => wait_bypass_count_reg(1),
      I2 => wait_bypass_count_reg(7),
      I3 => wait_bypass_count_reg(14),
      I4 => wait_bypass_count_reg(2),
      I5 => wait_bypass_count_reg(3),
      O => time_out_wait_bypass_i_5_n_0
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => time_out_wait_bypass_i_1_n_0,
      Q => time_out_wait_bypass_reg_n_0,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEAAA"
    )
        port map (
      I0 => time_tlock_max_reg_n_0,
      I1 => \time_tlock_max_i_2__0_n_0\,
      I2 => \time_tlock_max_i_3__0_n_0\,
      I3 => \time_tlock_max_i_4__0_n_0\,
      I4 => \time_tlock_max_i_5__0_n_0\,
      I5 => reset_time_out,
      O => time_tlock_max_i_1_n_0
    );
\time_tlock_max_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(2),
      I2 => time_out_counter_reg(1),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(5),
      I5 => time_out_counter_reg(3),
      O => \time_tlock_max_i_2__0_n_0\
    );
\time_tlock_max_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => time_out_counter_reg(17),
      I1 => time_out_counter_reg(9),
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(18),
      O => \time_tlock_max_i_3__0_n_0\
    );
\time_tlock_max_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(7),
      O => \time_tlock_max_i_4__0_n_0\
    );
\time_tlock_max_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFFF"
    )
        port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(15),
      I2 => time_out_counter_reg(14),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(8),
      I5 => time_out_counter_reg(13),
      O => \time_tlock_max_i_5__0_n_0\
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => time_tlock_max_i_1_n_0,
      Q => time_tlock_max_reg_n_0,
      R => '0'
    );
tx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0200"
    )
        port map (
      I0 => tx_state(0),
      I1 => tx_state(1),
      I2 => tx_state(2),
      I3 => tx_state(3),
      I4 => \^data_in\,
      O => tx_fsm_reset_done_int_i_1_n_0
    );
tx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => tx_fsm_reset_done_int_i_1_n_0,
      Q => \^data_in\,
      R => pma_reset
    );
tx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => tx_fsm_reset_done_int_s2,
      Q => tx_fsm_reset_done_int_s3,
      R => '0'
    );
txresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => txresetdone_s2,
      Q => txresetdone_s3,
      R => '0'
    );
\wait_bypass_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => run_phase_alignment_int_s3,
      O => clear
    );
\wait_bypass_count[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => time_out_wait_bypass_i_2_n_0,
      I1 => tx_fsm_reset_done_int_s3,
      O => \wait_bypass_count[0]_i_2_n_0\
    );
\wait_bypass_count[0]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_bypass_count_reg(0),
      O => \wait_bypass_count[0]_i_4__0_n_0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_7\,
      Q => wait_bypass_count_reg(0),
      R => clear
    );
\wait_bypass_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(2) => \wait_bypass_count_reg[0]_i_3_n_1\,
      CO(1) => \wait_bypass_count_reg[0]_i_3_n_2\,
      CO(0) => \wait_bypass_count_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wait_bypass_count_reg[0]_i_3_n_4\,
      O(2) => \wait_bypass_count_reg[0]_i_3_n_5\,
      O(1) => \wait_bypass_count_reg[0]_i_3_n_6\,
      O(0) => \wait_bypass_count_reg[0]_i_3_n_7\,
      S(3 downto 1) => wait_bypass_count_reg(3 downto 1),
      S(0) => \wait_bypass_count[0]_i_4__0_n_0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_5\,
      Q => wait_bypass_count_reg(10),
      R => clear
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_4\,
      Q => wait_bypass_count_reg(11),
      R => clear
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_7\,
      Q => wait_bypass_count_reg(12),
      R => clear
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[12]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[12]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[12]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[12]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[12]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[12]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(15 downto 12)
    );
\wait_bypass_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_6\,
      Q => wait_bypass_count_reg(13),
      R => clear
    );
\wait_bypass_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_5\,
      Q => wait_bypass_count_reg(14),
      R => clear
    );
\wait_bypass_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[12]_i_1_n_4\,
      Q => wait_bypass_count_reg(15),
      R => clear
    );
\wait_bypass_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[16]_i_1_n_7\,
      Q => wait_bypass_count_reg(16),
      R => clear
    );
\wait_bypass_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_wait_bypass_count_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \wait_bypass_count_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => wait_bypass_count_reg(16)
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_6\,
      Q => wait_bypass_count_reg(1),
      R => clear
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_5\,
      Q => wait_bypass_count_reg(2),
      R => clear
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[0]_i_3_n_4\,
      Q => wait_bypass_count_reg(3),
      R => clear
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_7\,
      Q => wait_bypass_count_reg(4),
      R => clear
    );
\wait_bypass_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[0]_i_3_n_0\,
      CO(3) => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[4]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[4]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[4]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[4]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[4]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[4]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(7 downto 4)
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_6\,
      Q => wait_bypass_count_reg(5),
      R => clear
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_5\,
      Q => wait_bypass_count_reg(6),
      R => clear
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[4]_i_1_n_4\,
      Q => wait_bypass_count_reg(7),
      R => clear
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_7\,
      Q => wait_bypass_count_reg(8),
      R => clear
    );
\wait_bypass_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_bypass_count_reg[4]_i_1_n_0\,
      CO(3) => \wait_bypass_count_reg[8]_i_1_n_0\,
      CO(2) => \wait_bypass_count_reg[8]_i_1_n_1\,
      CO(1) => \wait_bypass_count_reg[8]_i_1_n_2\,
      CO(0) => \wait_bypass_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wait_bypass_count_reg[8]_i_1_n_4\,
      O(2) => \wait_bypass_count_reg[8]_i_1_n_5\,
      O(1) => \wait_bypass_count_reg[8]_i_1_n_6\,
      O(0) => \wait_bypass_count_reg[8]_i_1_n_7\,
      S(3 downto 0) => wait_bypass_count_reg(11 downto 8)
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => \wait_bypass_count[0]_i_2_n_0\,
      D => \wait_bypass_count_reg[8]_i_1_n_6\,
      Q => wait_bypass_count_reg(9),
      R => clear
    );
\wait_time_cnt[0]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_10_n_0\
    );
\wait_time_cnt[0]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_11_n_0\
    );
\wait_time_cnt[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => tx_state(3),
      I1 => tx_state(0),
      I2 => tx_state(1),
      I3 => tx_state(2),
      O => wait_time_cnt0
    );
\wait_time_cnt[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \wait_time_cnt[0]_i_4_n_0\,
      I1 => \wait_time_cnt[0]_i_5_n_0\,
      I2 => \wait_time_cnt[0]_i_6_n_0\,
      I3 => \wait_time_cnt[0]_i_7_n_0\,
      O => sel
    );
\wait_time_cnt[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      I1 => wait_time_cnt_reg(4),
      I2 => wait_time_cnt_reg(7),
      I3 => wait_time_cnt_reg(0),
      O => \wait_time_cnt[0]_i_4_n_0\
    );
\wait_time_cnt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      I1 => wait_time_cnt_reg(10),
      I2 => wait_time_cnt_reg(3),
      I3 => wait_time_cnt_reg(1),
      O => \wait_time_cnt[0]_i_5_n_0\
    );
\wait_time_cnt[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      I1 => wait_time_cnt_reg(14),
      I2 => wait_time_cnt_reg(11),
      I3 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[0]_i_6_n_0\
    );
\wait_time_cnt[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      I1 => wait_time_cnt_reg(8),
      I2 => wait_time_cnt_reg(5),
      I3 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_7_n_0\
    );
\wait_time_cnt[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(3),
      O => \wait_time_cnt[0]_i_8_n_0\
    );
\wait_time_cnt[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(2),
      O => \wait_time_cnt[0]_i_9_n_0\
    );
\wait_time_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(15),
      O => \wait_time_cnt[12]_i_2_n_0\
    );
\wait_time_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(14),
      O => \wait_time_cnt[12]_i_3_n_0\
    );
\wait_time_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(13),
      O => \wait_time_cnt[12]_i_4_n_0\
    );
\wait_time_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(12),
      O => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(7),
      O => \wait_time_cnt[4]_i_2_n_0\
    );
\wait_time_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(6),
      O => \wait_time_cnt[4]_i_3_n_0\
    );
\wait_time_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(5),
      O => \wait_time_cnt[4]_i_4_n_0\
    );
\wait_time_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(4),
      O => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(11),
      O => \wait_time_cnt[8]_i_2_n_0\
    );
\wait_time_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(10),
      O => \wait_time_cnt[8]_i_3_n_0\
    );
\wait_time_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(9),
      O => \wait_time_cnt[8]_i_4_n_0\
    );
\wait_time_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_time_cnt_reg(8),
      O => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_7\,
      Q => wait_time_cnt_reg(0),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(2) => \wait_time_cnt_reg[0]_i_3_n_1\,
      CO(1) => \wait_time_cnt_reg[0]_i_3_n_2\,
      CO(0) => \wait_time_cnt_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[0]_i_3_n_4\,
      O(2) => \wait_time_cnt_reg[0]_i_3_n_5\,
      O(1) => \wait_time_cnt_reg[0]_i_3_n_6\,
      O(0) => \wait_time_cnt_reg[0]_i_3_n_7\,
      S(3) => \wait_time_cnt[0]_i_8_n_0\,
      S(2) => \wait_time_cnt[0]_i_9_n_0\,
      S(1) => \wait_time_cnt[0]_i_10_n_0\,
      S(0) => \wait_time_cnt[0]_i_11_n_0\
    );
\wait_time_cnt_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_5\,
      Q => wait_time_cnt_reg(10),
      S => wait_time_cnt0
    );
\wait_time_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_4\,
      Q => wait_time_cnt_reg(11),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_7\,
      Q => wait_time_cnt_reg(12),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(3) => \NLW_wait_time_cnt_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wait_time_cnt_reg[12]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[12]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3) => \wait_time_cnt_reg[12]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[12]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[12]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[12]_i_1_n_7\,
      S(3) => \wait_time_cnt[12]_i_2_n_0\,
      S(2) => \wait_time_cnt[12]_i_3_n_0\,
      S(1) => \wait_time_cnt[12]_i_4_n_0\,
      S(0) => \wait_time_cnt[12]_i_5_n_0\
    );
\wait_time_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_6\,
      Q => wait_time_cnt_reg(13),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_5\,
      Q => wait_time_cnt_reg(14),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[12]_i_1_n_4\,
      Q => wait_time_cnt_reg(15),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_6\,
      Q => wait_time_cnt_reg(1),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_5\,
      Q => wait_time_cnt_reg(2),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[0]_i_3_n_4\,
      Q => wait_time_cnt_reg(3),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_7\,
      Q => wait_time_cnt_reg(4),
      S => wait_time_cnt0
    );
\wait_time_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[0]_i_3_n_0\,
      CO(3) => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[4]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[4]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[4]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[4]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[4]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[4]_i_1_n_7\,
      S(3) => \wait_time_cnt[4]_i_2_n_0\,
      S(2) => \wait_time_cnt[4]_i_3_n_0\,
      S(1) => \wait_time_cnt[4]_i_4_n_0\,
      S(0) => \wait_time_cnt[4]_i_5_n_0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_6\,
      Q => wait_time_cnt_reg(5),
      R => wait_time_cnt0
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_5\,
      Q => wait_time_cnt_reg(6),
      S => wait_time_cnt0
    );
\wait_time_cnt_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[4]_i_1_n_4\,
      Q => wait_time_cnt_reg(7),
      S => wait_time_cnt0
    );
\wait_time_cnt_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_7\,
      Q => wait_time_cnt_reg(8),
      S => wait_time_cnt0
    );
\wait_time_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wait_time_cnt_reg[4]_i_1_n_0\,
      CO(3) => \wait_time_cnt_reg[8]_i_1_n_0\,
      CO(2) => \wait_time_cnt_reg[8]_i_1_n_1\,
      CO(1) => \wait_time_cnt_reg[8]_i_1_n_2\,
      CO(0) => \wait_time_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3) => \wait_time_cnt_reg[8]_i_1_n_4\,
      O(2) => \wait_time_cnt_reg[8]_i_1_n_5\,
      O(1) => \wait_time_cnt_reg[8]_i_1_n_6\,
      O(0) => \wait_time_cnt_reg[8]_i_1_n_7\,
      S(3) => \wait_time_cnt[8]_i_2_n_0\,
      S(2) => \wait_time_cnt[8]_i_3_n_0\,
      S(1) => \wait_time_cnt[8]_i_4_n_0\,
      S(0) => \wait_time_cnt[8]_i_5_n_0\
    );
\wait_time_cnt_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => independent_clock_bufg,
      CE => sel,
      D => \wait_time_cnt_reg[8]_i_1_n_6\,
      Q => wait_time_cnt_reg(9),
      S => wait_time_cnt0
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
XL0vCpwJkpY29C2iE4LPlf/odeUNPw9BVX/J5pEuKj2Daef6TwO4W44ER/rohRxort+oJ1FEnjTl
dO9suKxGx6l5qoEu601AYmdQx5qtrjpt5ZGKiDiqJHQu0sNZj2OpRSMBF2+xpK6q1k0YwWEsL2yM
Dk14qp/TPBMp5RE5dog=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Pk367+A7d85WWbWihXnmNhli57Ii8GCSlPvH8qHqwzR/ezoXFHJelkpzH2yVZqsPrfmk2NFaOsEs
M1axqfiNh0tU1KMP7/T8Z8SUUXEL8RHmFLGRFGDFU09+/htgWkyd52BTRgIK4xxqdNeHRvHuh9eO
Xoc91nJGkr5lyxxTROPFBa+JdoqRs9bDqyz3atfFQej6vJovFHG2okDG/vCx1XB1qvN+e1+epX31
2giRBGffUGfZdshykZtf0S0Kj1hobLe34cMhJaDdZ+jhjN6QiA9PF+Uhp/S/A8APv5yY2pLwZJi/
lx733RyXkWqUcnNtuuQXd+cbVvDu8Nkgy8Wrqg==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
PSDriSbxCGy1IkAQGX1Dpf4e+G70LYZYfQvHhkTdWu3f8dIzce38bnZUYwJ3PFkbLPD9xdrPHXpc
YHffwh/sskJmoWdc3xCXegJzAt03leKM0XeW0QDeuMElufJyRoPGciV0ISzDtCccOegxRPMnXkzI
kE04JwwijsIe2HS3mWA=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
mY+SycwdugcaAAgVirnNdFm8EBfn62CPaeo94BjJZ+vU9m28AxCSwDD3tD06N21maLpla50ThHcZ
2+106fXzJsWtL9Pz+RPRWduaY/aqQj9DI1lsK962ves+UJ55hZpmrK6XQ0LbTkTACnJ+rbn1XOr6
Sy6zYwJAJc8qnHmIgrQxv5S9PmPs3PD3w/KTPcknzXMtlxwEyfFFJv3qUPbJf4hQiKWId/2N0keC
yuxY3jIMroLsnWmLHYAHDH+KBlPKhm0T47WRfD7mAEUsdvMGdJJMQSAz7kZj14OUMXw4DFxp31LM
Mdw8lsakafIjy2kkFUJbghSGrmLhS9eejA4drA==

`protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
XD7l6Li/98UDd4ASpKYFRLL/Bm3DF1ctodfSWQQYkOkHw+iPJrP4dUeL4uxbw5cmd13HI9d/+bl7
flwuZn1ZsI8+fTLM3T0oYPyVEcleZHq0WhbH4/fAZVtG1KCzFHAkmPbLs7uv7CMumqjJdmtmn5+j
xPyobFsdk7JkDBGTpiw6sLLYNRajRDRO+TtCCooQg1oZ9mbnKEQn+ccjBbpltTTovGTXxvIys5QE
AyX9dO8uSwtGll4an6rSWFnl0uDG8mKULJjCoJCx5igXn5MfbZyoun9fmtC0oBi6/z70Bc7Ngf/X
BxC2PFv9du+wdtufsrRExX5CtLY6SrrVbYmgsg==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
NnkpyUpgSR1m9dLBiJuJuOGCGzGq+qYsW2dFPuHEdelcqcyBjCfhAHOxsPTg47uYbXrmZKPQT9oB
mF2IFSybwtNxfbYFoozuT0BNJ/5tM80X+LXJbFfCwvgBsytlBfwh0uSzLrHE/8Rj8J7mLWry0qh3
iJAr2rFe8K6RVUpdeiifjliMaSreWEgvFSdo2esnYOcHcjY+Hu8svZHAEUWDKh73U70IF7FdFvqF
XO1yYXuXJRiceHuJPwpgh+dKsPDerxr30wA8JeIZXlrJf9HlT+0dlKVBCNqzJaYEpnPDQJz729Ff
Z07YHgx5oCRnxKUnnjT955+n0UO5Bm0CbNM98g==

`protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
C8Tp/eDRRCMOwHxdxcUmbuASA2jQT5JtPZgfJpftbLH97GxlWZMNcwUflF51EUdAwd7Ir0jGS4SN
cr6Uva26gsckiDjhmtq68IVcUBq8iifyFtfwFTkAYsSR9t4iFExJQmqmJhRj/kjacbUMGJYAC6zR
h3ljNiQdmkYQpOt5jaSWP95maYRqXft/7eCGmAeaT/hsFmBP3RQOCK0k9gUhLLR1PO5xnTyZjGQJ
VCk/JVMUOSmN3A3j8uruhVvih7YMqPc9iQBC+HtbR5h4rhfWuy61XFdNoAJHjYVA1tYMqW+AEV+Q
1VtSSnB2mmxlGlAt5Neajfvuyy7rlpFsJ45pjQ==

`protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`protect key_block
xpgEYrMDyzTrppjK9pdbdERRVcGsOM1wehgNM05p7/GPYcE/Ldlf0NddSTOkeI7hjbtKJh5O+mOM
1DBGpPYqiLVAGGEkWOjemutvTwnFlOgFP/jBtscvT0xoJBauy19XM/qMu2zEdGpo+cTuJWzONd/i
3ghZO49KQIulbxfD2jQCC9rH6BOq1q57AbVoYFrWhtZyeWmQYWqoBBCoKhU0mW4HcQbiWcYymJHT
F7Wl3c/rvmZ19HaO7JHZa6PyhFnE8YeyhkUhNO5fcvZ7gFHlRumoJS365hjRroAoOu/CLJR/eLzy
ipT4tHFj/T7mhSJUeLz7A/6hK8fdFLzSZwEuZVstx+LDWxZ6pst0+57+uQ0enpOHMLlWG7IDZ9AV
vnJhH0UrMMbR196CYsdG3cIByN27DizesnW+jNkMQBaswtDLtVZnbdkXy8Zk9SXNXJvTwQegCw/a
5CAl8y//34XRWeFt4Wtkeso5A1iTLvpgBuH+GJMSKXA7KSxJoCnBU8Fi

`protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
PtXIj+hfSzAR7L3qE+PnK05Exl2JklQ0WEvqE/2UzQ6NMKlYocvT6ipW6HQPMOEIcQZ0yLsnPM3H
AJTKwnCXBrDf9LrsG68+NcVRqGYlmQxBA+B/Wz13Is/n6cNLZF0gc3NyuJtBtL2Uxe3MwscxIw7q
kdbu2/O6Cyl0g687jBXJycalF9NXdTP1rxdkEcnqKylZS7CE4cy54owMRjqGSecZkwM9W6KM/LnC
gXlHpN84ld6K+TZYDQX69vk5C2jSfvikiyv+hOQBT9MYZBs7WpN6ZB7rzEIftz7mRrfVTftis8ny
vl11eoBQKss+QRJIL8eXborkKe8di5p1yilcPQ==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 43712)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_GTWIZARD_init is
  port (
    cplllock : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    RXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtxe2_i : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmcm_reset : out STD_LOGIC;
    data_in : out STD_LOGIC;
    rx_fsm_reset_done_int_reg : out STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    gtrefclk : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    wtd_rxpcsreset_in : in STD_LOGIC;
    userclk : in STD_LOGIC;
    TXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    RXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_5 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_6 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    pma_reset : in STD_LOGIC;
    gtxe2_i_7 : in STD_LOGIC;
    gtxe2_i_8 : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    data_out : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_GTWIZARD_init;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_GTWIZARD_init is
  signal \^cplllock\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal gt0_cpllrefclklost_i : STD_LOGIC;
  signal gt0_cpllreset_i : STD_LOGIC;
  signal gt0_gtrxreset_gt : STD_LOGIC;
  signal gt0_gttxreset_gt : STD_LOGIC;
  signal gt0_rx_cdrlock_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \gt0_rx_cdrlock_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__2_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__2_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__2_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__3_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__3_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__3_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__3_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__4_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__4_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__4_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__4_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__5_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__5_n_1\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__5_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__5_n_3\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__6_n_2\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter0_carry__6_n_3\ : STD_LOGIC;
  signal gt0_rx_cdrlock_counter0_carry_n_0 : STD_LOGIC;
  signal gt0_rx_cdrlock_counter0_carry_n_1 : STD_LOGIC;
  signal gt0_rx_cdrlock_counter0_carry_n_2 : STD_LOGIC;
  signal gt0_rx_cdrlock_counter0_carry_n_3 : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_2_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_5_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \gt0_rx_cdrlock_counter[31]_i_9_n_0\ : STD_LOGIC;
  signal gt0_rx_cdrlock_counter_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal gt0_rx_cdrlocked_i_1_n_0 : STD_LOGIC;
  signal gt0_rx_cdrlocked_reg_n_0 : STD_LOGIC;
  signal gt0_rxuserrdy_i : STD_LOGIC;
  signal gt0_txuserrdy_i : STD_LOGIC;
  signal gtwizard_i_n_5 : STD_LOGIC;
  signal gtwizard_i_n_7 : STD_LOGIC;
  signal \NLW_gt0_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gt0_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of gt0_rx_cdrlock_counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \gt0_rx_cdrlock_counter0_carry__6\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[0]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[30]_i_1\ : label is "soft_lutpair118";
begin
  cplllock <= \^cplllock\;
gt0_rx_cdrlock_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => gt0_rx_cdrlock_counter0_carry_n_0,
      CO(2) => gt0_rx_cdrlock_counter0_carry_n_1,
      CO(1) => gt0_rx_cdrlock_counter0_carry_n_2,
      CO(0) => gt0_rx_cdrlock_counter0_carry_n_3,
      CYINIT => gt0_rx_cdrlock_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => gt0_rx_cdrlock_counter(4 downto 1)
    );
\gt0_rx_cdrlock_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => gt0_rx_cdrlock_counter0_carry_n_0,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__0_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__0_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__0_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => gt0_rx_cdrlock_counter(8 downto 5)
    );
\gt0_rx_cdrlock_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__0_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__1_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__1_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__1_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => gt0_rx_cdrlock_counter(12 downto 9)
    );
\gt0_rx_cdrlock_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__1_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__2_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__2_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__2_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => gt0_rx_cdrlock_counter(16 downto 13)
    );
\gt0_rx_cdrlock_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__2_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__3_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__3_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__3_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => gt0_rx_cdrlock_counter(20 downto 17)
    );
\gt0_rx_cdrlock_counter0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__3_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__4_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__4_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__4_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => gt0_rx_cdrlock_counter(24 downto 21)
    );
\gt0_rx_cdrlock_counter0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__4_n_0\,
      CO(3) => \gt0_rx_cdrlock_counter0_carry__5_n_0\,
      CO(2) => \gt0_rx_cdrlock_counter0_carry__5_n_1\,
      CO(1) => \gt0_rx_cdrlock_counter0_carry__5_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => gt0_rx_cdrlock_counter(28 downto 25)
    );
\gt0_rx_cdrlock_counter0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \gt0_rx_cdrlock_counter0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_gt0_rx_cdrlock_counter0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \gt0_rx_cdrlock_counter0_carry__6_n_2\,
      CO(0) => \gt0_rx_cdrlock_counter0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_gt0_rx_cdrlock_counter0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => gt0_rx_cdrlock_counter(31 downto 29)
    );
\gt0_rx_cdrlock_counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => gt0_rx_cdrlock_counter(0),
      O => gt0_rx_cdrlock_counter_0(0)
    );
\gt0_rx_cdrlock_counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(10),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(10)
    );
\gt0_rx_cdrlock_counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(11),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(11)
    );
\gt0_rx_cdrlock_counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(12),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(12)
    );
\gt0_rx_cdrlock_counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(13),
      O => gt0_rx_cdrlock_counter_0(13)
    );
\gt0_rx_cdrlock_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(14),
      O => gt0_rx_cdrlock_counter_0(14)
    );
\gt0_rx_cdrlock_counter[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(15),
      O => gt0_rx_cdrlock_counter_0(15)
    );
\gt0_rx_cdrlock_counter[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(16),
      O => gt0_rx_cdrlock_counter_0(16)
    );
\gt0_rx_cdrlock_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(17),
      O => gt0_rx_cdrlock_counter_0(17)
    );
\gt0_rx_cdrlock_counter[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(18),
      O => gt0_rx_cdrlock_counter_0(18)
    );
\gt0_rx_cdrlock_counter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(19),
      O => gt0_rx_cdrlock_counter_0(19)
    );
\gt0_rx_cdrlock_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(1),
      O => gt0_rx_cdrlock_counter_0(1)
    );
\gt0_rx_cdrlock_counter[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(20),
      O => gt0_rx_cdrlock_counter_0(20)
    );
\gt0_rx_cdrlock_counter[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(21),
      O => gt0_rx_cdrlock_counter_0(21)
    );
\gt0_rx_cdrlock_counter[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(22),
      O => gt0_rx_cdrlock_counter_0(22)
    );
\gt0_rx_cdrlock_counter[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(23),
      O => gt0_rx_cdrlock_counter_0(23)
    );
\gt0_rx_cdrlock_counter[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(24),
      O => gt0_rx_cdrlock_counter_0(24)
    );
\gt0_rx_cdrlock_counter[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(25),
      O => gt0_rx_cdrlock_counter_0(25)
    );
\gt0_rx_cdrlock_counter[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(26),
      O => gt0_rx_cdrlock_counter_0(26)
    );
\gt0_rx_cdrlock_counter[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(27),
      O => gt0_rx_cdrlock_counter_0(27)
    );
\gt0_rx_cdrlock_counter[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(28),
      O => gt0_rx_cdrlock_counter_0(28)
    );
\gt0_rx_cdrlock_counter[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(29),
      O => gt0_rx_cdrlock_counter_0(29)
    );
\gt0_rx_cdrlock_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(2),
      O => gt0_rx_cdrlock_counter_0(2)
    );
\gt0_rx_cdrlock_counter[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(30),
      O => gt0_rx_cdrlock_counter_0(30)
    );
\gt0_rx_cdrlock_counter[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(31),
      O => gt0_rx_cdrlock_counter_0(31)
    );
\gt0_rx_cdrlock_counter[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(13),
      I1 => gt0_rx_cdrlock_counter(12),
      I2 => gt0_rx_cdrlock_counter(10),
      I3 => gt0_rx_cdrlock_counter(11),
      I4 => \gt0_rx_cdrlock_counter[31]_i_5_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_2_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(4),
      I1 => gt0_rx_cdrlock_counter(5),
      I2 => gt0_rx_cdrlock_counter(2),
      I3 => gt0_rx_cdrlock_counter(3),
      I4 => \gt0_rx_cdrlock_counter[31]_i_6_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_3_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \gt0_rx_cdrlock_counter[31]_i_7_n_0\,
      I1 => \gt0_rx_cdrlock_counter[31]_i_8_n_0\,
      I2 => gt0_rx_cdrlock_counter(31),
      I3 => gt0_rx_cdrlock_counter(30),
      I4 => gt0_rx_cdrlock_counter(1),
      I5 => \gt0_rx_cdrlock_counter[31]_i_9_n_0\,
      O => \gt0_rx_cdrlock_counter[31]_i_4_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(15),
      I1 => gt0_rx_cdrlock_counter(14),
      I2 => gt0_rx_cdrlock_counter(17),
      I3 => gt0_rx_cdrlock_counter(16),
      O => \gt0_rx_cdrlock_counter[31]_i_5_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(6),
      I1 => gt0_rx_cdrlock_counter(7),
      I2 => gt0_rx_cdrlock_counter(9),
      I3 => gt0_rx_cdrlock_counter(8),
      O => \gt0_rx_cdrlock_counter[31]_i_6_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(23),
      I1 => gt0_rx_cdrlock_counter(22),
      I2 => gt0_rx_cdrlock_counter(25),
      I3 => gt0_rx_cdrlock_counter(24),
      O => \gt0_rx_cdrlock_counter[31]_i_7_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(19),
      I1 => gt0_rx_cdrlock_counter(18),
      I2 => gt0_rx_cdrlock_counter(21),
      I3 => gt0_rx_cdrlock_counter(20),
      O => \gt0_rx_cdrlock_counter[31]_i_8_n_0\
    );
\gt0_rx_cdrlock_counter[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(27),
      I1 => gt0_rx_cdrlock_counter(26),
      I2 => gt0_rx_cdrlock_counter(29),
      I3 => gt0_rx_cdrlock_counter(28),
      O => \gt0_rx_cdrlock_counter[31]_i_9_n_0\
    );
\gt0_rx_cdrlock_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(3),
      O => gt0_rx_cdrlock_counter_0(3)
    );
\gt0_rx_cdrlock_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(4),
      O => gt0_rx_cdrlock_counter_0(4)
    );
\gt0_rx_cdrlock_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(5),
      O => gt0_rx_cdrlock_counter_0(5)
    );
\gt0_rx_cdrlock_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(6),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(6)
    );
\gt0_rx_cdrlock_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => gt0_rx_cdrlock_counter(0),
      I1 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I2 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      I4 => data0(7),
      O => gt0_rx_cdrlock_counter_0(7)
    );
\gt0_rx_cdrlock_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(8),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(8)
    );
\gt0_rx_cdrlock_counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => data0(9),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlock_counter_0(9)
    );
\gt0_rx_cdrlock_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(0),
      Q => gt0_rx_cdrlock_counter(0),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(10),
      Q => gt0_rx_cdrlock_counter(10),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(11),
      Q => gt0_rx_cdrlock_counter(11),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(12),
      Q => gt0_rx_cdrlock_counter(12),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(13),
      Q => gt0_rx_cdrlock_counter(13),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(14),
      Q => gt0_rx_cdrlock_counter(14),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(15),
      Q => gt0_rx_cdrlock_counter(15),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(16),
      Q => gt0_rx_cdrlock_counter(16),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(17),
      Q => gt0_rx_cdrlock_counter(17),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(18),
      Q => gt0_rx_cdrlock_counter(18),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(19),
      Q => gt0_rx_cdrlock_counter(19),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(1),
      Q => gt0_rx_cdrlock_counter(1),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(20),
      Q => gt0_rx_cdrlock_counter(20),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(21),
      Q => gt0_rx_cdrlock_counter(21),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(22),
      Q => gt0_rx_cdrlock_counter(22),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(23),
      Q => gt0_rx_cdrlock_counter(23),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(24),
      Q => gt0_rx_cdrlock_counter(24),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(25),
      Q => gt0_rx_cdrlock_counter(25),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(26),
      Q => gt0_rx_cdrlock_counter(26),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(27),
      Q => gt0_rx_cdrlock_counter(27),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(28),
      Q => gt0_rx_cdrlock_counter(28),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(29),
      Q => gt0_rx_cdrlock_counter(29),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(2),
      Q => gt0_rx_cdrlock_counter(2),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(30),
      Q => gt0_rx_cdrlock_counter(30),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(31),
      Q => gt0_rx_cdrlock_counter(31),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(3),
      Q => gt0_rx_cdrlock_counter(3),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(4),
      Q => gt0_rx_cdrlock_counter(4),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(5),
      Q => gt0_rx_cdrlock_counter(5),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(6),
      Q => gt0_rx_cdrlock_counter(6),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(7),
      Q => gt0_rx_cdrlock_counter(7),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(8),
      Q => gt0_rx_cdrlock_counter(8),
      R => gt0_gtrxreset_gt
    );
\gt0_rx_cdrlock_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(9),
      Q => gt0_rx_cdrlock_counter(9),
      R => gt0_gtrxreset_gt
    );
gt0_rx_cdrlocked_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => gt0_rx_cdrlocked_reg_n_0,
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => \gt0_rx_cdrlock_counter[31]_i_2_n_0\,
      I3 => \gt0_rx_cdrlock_counter[31]_i_3_n_0\,
      I4 => \gt0_rx_cdrlock_counter[31]_i_4_n_0\,
      O => gt0_rx_cdrlocked_i_1_n_0
    );
gt0_rx_cdrlocked_reg: unisim.vcomponents.FDRE
     port map (
      C => independent_clock_bufg,
      CE => '1',
      D => gt0_rx_cdrlocked_i_1_n_0,
      Q => gt0_rx_cdrlocked_reg_n_0,
      R => gt0_gtrxreset_gt
    );
gt0_rxresetfsm_i: entity work.gig_ethernet_pcs_pma_0_RX_STARTUP_FSM
     port map (
      SR(0) => gt0_gtrxreset_gt,
      cplllock => \^cplllock\,
      data_in => rx_fsm_reset_done_int_reg,
      data_out => data_out,
      data_sync_reg1 => gtwizard_i_n_5,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gtxe2_i => gtxe2_i_7,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked,
      pma_reset => pma_reset,
      reset_time_out_reg_0 => gt0_rx_cdrlocked_reg_n_0,
      userclk => userclk
    );
gt0_txresetfsm_i: entity work.gig_ethernet_pcs_pma_0_TX_STARTUP_FSM
     port map (
      cplllock => \^cplllock\,
      data_in => data_in,
      data_sync_reg1 => gtwizard_i_n_7,
      gt0_cpllrefclklost_i => gt0_cpllrefclklost_i,
      gt0_cpllreset_i => gt0_cpllreset_i,
      gt0_gttxreset_gt => gt0_gttxreset_gt,
      gt0_txuserrdy_i => gt0_txuserrdy_i,
      gtxe2_i => gtxe2_i_8,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked,
      mmcm_reset => mmcm_reset,
      pma_reset => pma_reset,
      userclk => userclk
    );
gtwizard_i: entity work.gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt
     port map (
      D(1 downto 0) => D(1 downto 0),
      Q(15 downto 0) => Q(15 downto 0),
      RXBUFSTATUS(0) => RXBUFSTATUS(0),
      RXPD(0) => RXPD(0),
      SR(0) => gt0_gtrxreset_gt,
      TXBUFSTATUS(0) => TXBUFSTATUS(0),
      TXPD(0) => TXPD(0),
      cplllock => \^cplllock\,
      gt0_cpllrefclklost_i => gt0_cpllrefclklost_i,
      gt0_cpllreset_i => gt0_cpllreset_i,
      gt0_gttxreset_gt => gt0_gttxreset_gt,
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gt0_rxuserrdy_i => gt0_rxuserrdy_i,
      gt0_txuserrdy_i => gt0_txuserrdy_i,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      gtxe2_i => gtwizard_i_n_5,
      gtxe2_i_0 => gtwizard_i_n_7,
      gtxe2_i_1(15 downto 0) => gtxe2_i(15 downto 0),
      gtxe2_i_2(1 downto 0) => gtxe2_i_0(1 downto 0),
      gtxe2_i_3(1 downto 0) => gtxe2_i_1(1 downto 0),
      gtxe2_i_4(1 downto 0) => gtxe2_i_2(1 downto 0),
      gtxe2_i_5(1 downto 0) => gtxe2_i_3(1 downto 0),
      gtxe2_i_6(1 downto 0) => gtxe2_i_4(1 downto 0),
      gtxe2_i_7(1 downto 0) => gtxe2_i_5(1 downto 0),
      gtxe2_i_8(1 downto 0) => gtxe2_i_6(1 downto 0),
      independent_clock_bufg => independent_clock_bufg,
      reset_out => reset_out,
      rxn => rxn,
      rxoutclk => rxoutclk,
      rxp => rxp,
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      wtd_rxpcsreset_in => wtd_rxpcsreset_in
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
XL0vCpwJkpY29C2iE4LPlf/odeUNPw9BVX/J5pEuKj2Daef6TwO4W44ER/rohRxort+oJ1FEnjTl
dO9suKxGx6l5qoEu601AYmdQx5qtrjpt5ZGKiDiqJHQu0sNZj2OpRSMBF2+xpK6q1k0YwWEsL2yM
Dk14qp/TPBMp5RE5dog=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Pk367+A7d85WWbWihXnmNhli57Ii8GCSlPvH8qHqwzR/ezoXFHJelkpzH2yVZqsPrfmk2NFaOsEs
M1axqfiNh0tU1KMP7/T8Z8SUUXEL8RHmFLGRFGDFU09+/htgWkyd52BTRgIK4xxqdNeHRvHuh9eO
Xoc91nJGkr5lyxxTROPFBa+JdoqRs9bDqyz3atfFQej6vJovFHG2okDG/vCx1XB1qvN+e1+epX31
2giRBGffUGfZdshykZtf0S0Kj1hobLe34cMhJaDdZ+jhjN6QiA9PF+Uhp/S/A8APv5yY2pLwZJi/
lx733RyXkWqUcnNtuuQXd+cbVvDu8Nkgy8Wrqg==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
PSDriSbxCGy1IkAQGX1Dpf4e+G70LYZYfQvHhkTdWu3f8dIzce38bnZUYwJ3PFkbLPD9xdrPHXpc
YHffwh/sskJmoWdc3xCXegJzAt03leKM0XeW0QDeuMElufJyRoPGciV0ISzDtCccOegxRPMnXkzI
kE04JwwijsIe2HS3mWA=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
mY+SycwdugcaAAgVirnNdFm8EBfn62CPaeo94BjJZ+vU9m28AxCSwDD3tD06N21maLpla50ThHcZ
2+106fXzJsWtL9Pz+RPRWduaY/aqQj9DI1lsK962ves+UJ55hZpmrK6XQ0LbTkTACnJ+rbn1XOr6
Sy6zYwJAJc8qnHmIgrQxv5S9PmPs3PD3w/KTPcknzXMtlxwEyfFFJv3qUPbJf4hQiKWId/2N0keC
yuxY3jIMroLsnWmLHYAHDH+KBlPKhm0T47WRfD7mAEUsdvMGdJJMQSAz7kZj14OUMXw4DFxp31LM
Mdw8lsakafIjy2kkFUJbghSGrmLhS9eejA4drA==

`protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
XD7l6Li/98UDd4ASpKYFRLL/Bm3DF1ctodfSWQQYkOkHw+iPJrP4dUeL4uxbw5cmd13HI9d/+bl7
flwuZn1ZsI8+fTLM3T0oYPyVEcleZHq0WhbH4/fAZVtG1KCzFHAkmPbLs7uv7CMumqjJdmtmn5+j
xPyobFsdk7JkDBGTpiw6sLLYNRajRDRO+TtCCooQg1oZ9mbnKEQn+ccjBbpltTTovGTXxvIys5QE
AyX9dO8uSwtGll4an6rSWFnl0uDG8mKULJjCoJCx5igXn5MfbZyoun9fmtC0oBi6/z70Bc7Ngf/X
BxC2PFv9du+wdtufsrRExX5CtLY6SrrVbYmgsg==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
NnkpyUpgSR1m9dLBiJuJuOGCGzGq+qYsW2dFPuHEdelcqcyBjCfhAHOxsPTg47uYbXrmZKPQT9oB
mF2IFSybwtNxfbYFoozuT0BNJ/5tM80X+LXJbFfCwvgBsytlBfwh0uSzLrHE/8Rj8J7mLWry0qh3
iJAr2rFe8K6RVUpdeiifjliMaSreWEgvFSdo2esnYOcHcjY+Hu8svZHAEUWDKh73U70IF7FdFvqF
XO1yYXuXJRiceHuJPwpgh+dKsPDerxr30wA8JeIZXlrJf9HlT+0dlKVBCNqzJaYEpnPDQJz729Ff
Z07YHgx5oCRnxKUnnjT955+n0UO5Bm0CbNM98g==

`protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
C8Tp/eDRRCMOwHxdxcUmbuASA2jQT5JtPZgfJpftbLH97GxlWZMNcwUflF51EUdAwd7Ir0jGS4SN
cr6Uva26gsckiDjhmtq68IVcUBq8iifyFtfwFTkAYsSR9t4iFExJQmqmJhRj/kjacbUMGJYAC6zR
h3ljNiQdmkYQpOt5jaSWP95maYRqXft/7eCGmAeaT/hsFmBP3RQOCK0k9gUhLLR1PO5xnTyZjGQJ
VCk/JVMUOSmN3A3j8uruhVvih7YMqPc9iQBC+HtbR5h4rhfWuy61XFdNoAJHjYVA1tYMqW+AEV+Q
1VtSSnB2mmxlGlAt5Neajfvuyy7rlpFsJ45pjQ==

`protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`protect key_block
xpgEYrMDyzTrppjK9pdbdERRVcGsOM1wehgNM05p7/GPYcE/Ldlf0NddSTOkeI7hjbtKJh5O+mOM
1DBGpPYqiLVAGGEkWOjemutvTwnFlOgFP/jBtscvT0xoJBauy19XM/qMu2zEdGpo+cTuJWzONd/i
3ghZO49KQIulbxfD2jQCC9rH6BOq1q57AbVoYFrWhtZyeWmQYWqoBBCoKhU0mW4HcQbiWcYymJHT
F7Wl3c/rvmZ19HaO7JHZa6PyhFnE8YeyhkUhNO5fcvZ7gFHlRumoJS365hjRroAoOu/CLJR/eLzy
ipT4tHFj/T7mhSJUeLz7A/6hK8fdFLzSZwEuZVstx+LDWxZ6pst0+57+uQ0enpOHMLlWG7IDZ9AV
vnJhH0UrMMbR196CYsdG3cIByN27DizesnW+jNkMQBaswtDLtVZnbdkXy8Zk9SXNXJvTwQegCw/a
5CAl8y//34XRWeFt4Wtkeso5A1iTLvpgBuH+GJMSKXA7KSxJoCnBU8Fi

`protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
PtXIj+hfSzAR7L3qE+PnK05Exl2JklQ0WEvqE/2UzQ6NMKlYocvT6ipW6HQPMOEIcQZ0yLsnPM3H
AJTKwnCXBrDf9LrsG68+NcVRqGYlmQxBA+B/Wz13Is/n6cNLZF0gc3NyuJtBtL2Uxe3MwscxIw7q
kdbu2/O6Cyl0g687jBXJycalF9NXdTP1rxdkEcnqKylZS7CE4cy54owMRjqGSecZkwM9W6KM/LnC
gXlHpN84ld6K+TZYDQX69vk5C2jSfvikiyv+hOQBT9MYZBs7WpN6ZB7rzEIftz7mRrfVTftis8ny
vl11eoBQKss+QRJIL8eXborkKe8di5p1yilcPQ==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76496)
`protect data_block
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
3Ho=
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_GTWIZARD is
  port (
    cplllock : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    RXBUFSTATUS : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtxe2_i : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    mmcm_reset : out STD_LOGIC;
    data_in : out STD_LOGIC;
    rx_fsm_reset_done_int_reg : out STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    gtrefclk : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC;
    reset_out : in STD_LOGIC;
    wtd_rxpcsreset_in : in STD_LOGIC;
    userclk : in STD_LOGIC;
    TXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    RXPD : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtxe2_i_4 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_5 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gtxe2_i_6 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    pma_reset : in STD_LOGIC;
    gtxe2_i_7 : in STD_LOGIC;
    gtxe2_i_8 : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    data_out : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_GTWIZARD;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_GTWIZARD is
begin
inst: entity work.gig_ethernet_pcs_pma_0_GTWIZARD_init
     port map (
      D(1 downto 0) => D(1 downto 0),
      Q(15 downto 0) => Q(15 downto 0),
      RXBUFSTATUS(0) => RXBUFSTATUS(0),
      RXPD(0) => RXPD(0),
      TXBUFSTATUS(0) => TXBUFSTATUS(0),
      TXPD(0) => TXPD(0),
      cplllock => cplllock,
      data_in => data_in,
      data_out => data_out,
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      gtxe2_i(15 downto 0) => gtxe2_i(15 downto 0),
      gtxe2_i_0(1 downto 0) => gtxe2_i_0(1 downto 0),
      gtxe2_i_1(1 downto 0) => gtxe2_i_1(1 downto 0),
      gtxe2_i_2(1 downto 0) => gtxe2_i_2(1 downto 0),
      gtxe2_i_3(1 downto 0) => gtxe2_i_3(1 downto 0),
      gtxe2_i_4(1 downto 0) => gtxe2_i_4(1 downto 0),
      gtxe2_i_5(1 downto 0) => gtxe2_i_5(1 downto 0),
      gtxe2_i_6(1 downto 0) => gtxe2_i_6(1 downto 0),
      gtxe2_i_7 => gtxe2_i_7,
      gtxe2_i_8 => gtxe2_i_8,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked,
      mmcm_reset => mmcm_reset,
      pma_reset => pma_reset,
      reset_out => reset_out,
      rx_fsm_reset_done_int_reg => rx_fsm_reset_done_int_reg,
      rxn => rxn,
      rxoutclk => rxoutclk,
      rxp => rxp,
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      wtd_rxpcsreset_in => wtd_rxpcsreset_in
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
XL0vCpwJkpY29C2iE4LPlf/odeUNPw9BVX/J5pEuKj2Daef6TwO4W44ER/rohRxort+oJ1FEnjTl
dO9suKxGx6l5qoEu601AYmdQx5qtrjpt5ZGKiDiqJHQu0sNZj2OpRSMBF2+xpK6q1k0YwWEsL2yM
Dk14qp/TPBMp5RE5dog=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Pk367+A7d85WWbWihXnmNhli57Ii8GCSlPvH8qHqwzR/ezoXFHJelkpzH2yVZqsPrfmk2NFaOsEs
M1axqfiNh0tU1KMP7/T8Z8SUUXEL8RHmFLGRFGDFU09+/htgWkyd52BTRgIK4xxqdNeHRvHuh9eO
Xoc91nJGkr5lyxxTROPFBa+JdoqRs9bDqyz3atfFQej6vJovFHG2okDG/vCx1XB1qvN+e1+epX31
2giRBGffUGfZdshykZtf0S0Kj1hobLe34cMhJaDdZ+jhjN6QiA9PF+Uhp/S/A8APv5yY2pLwZJi/
lx733RyXkWqUcnNtuuQXd+cbVvDu8Nkgy8Wrqg==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
PSDriSbxCGy1IkAQGX1Dpf4e+G70LYZYfQvHhkTdWu3f8dIzce38bnZUYwJ3PFkbLPD9xdrPHXpc
YHffwh/sskJmoWdc3xCXegJzAt03leKM0XeW0QDeuMElufJyRoPGciV0ISzDtCccOegxRPMnXkzI
kE04JwwijsIe2HS3mWA=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
mY+SycwdugcaAAgVirnNdFm8EBfn62CPaeo94BjJZ+vU9m28AxCSwDD3tD06N21maLpla50ThHcZ
2+106fXzJsWtL9Pz+RPRWduaY/aqQj9DI1lsK962ves+UJ55hZpmrK6XQ0LbTkTACnJ+rbn1XOr6
Sy6zYwJAJc8qnHmIgrQxv5S9PmPs3PD3w/KTPcknzXMtlxwEyfFFJv3qUPbJf4hQiKWId/2N0keC
yuxY3jIMroLsnWmLHYAHDH+KBlPKhm0T47WRfD7mAEUsdvMGdJJMQSAz7kZj14OUMXw4DFxp31LM
Mdw8lsakafIjy2kkFUJbghSGrmLhS9eejA4drA==

`protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
XD7l6Li/98UDd4ASpKYFRLL/Bm3DF1ctodfSWQQYkOkHw+iPJrP4dUeL4uxbw5cmd13HI9d/+bl7
flwuZn1ZsI8+fTLM3T0oYPyVEcleZHq0WhbH4/fAZVtG1KCzFHAkmPbLs7uv7CMumqjJdmtmn5+j
xPyobFsdk7JkDBGTpiw6sLLYNRajRDRO+TtCCooQg1oZ9mbnKEQn+ccjBbpltTTovGTXxvIys5QE
AyX9dO8uSwtGll4an6rSWFnl0uDG8mKULJjCoJCx5igXn5MfbZyoun9fmtC0oBi6/z70Bc7Ngf/X
BxC2PFv9du+wdtufsrRExX5CtLY6SrrVbYmgsg==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
NnkpyUpgSR1m9dLBiJuJuOGCGzGq+qYsW2dFPuHEdelcqcyBjCfhAHOxsPTg47uYbXrmZKPQT9oB
mF2IFSybwtNxfbYFoozuT0BNJ/5tM80X+LXJbFfCwvgBsytlBfwh0uSzLrHE/8Rj8J7mLWry0qh3
iJAr2rFe8K6RVUpdeiifjliMaSreWEgvFSdo2esnYOcHcjY+Hu8svZHAEUWDKh73U70IF7FdFvqF
XO1yYXuXJRiceHuJPwpgh+dKsPDerxr30wA8JeIZXlrJf9HlT+0dlKVBCNqzJaYEpnPDQJz729Ff
Z07YHgx5oCRnxKUnnjT955+n0UO5Bm0CbNM98g==

`protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
C8Tp/eDRRCMOwHxdxcUmbuASA2jQT5JtPZgfJpftbLH97GxlWZMNcwUflF51EUdAwd7Ir0jGS4SN
cr6Uva26gsckiDjhmtq68IVcUBq8iifyFtfwFTkAYsSR9t4iFExJQmqmJhRj/kjacbUMGJYAC6zR
h3ljNiQdmkYQpOt5jaSWP95maYRqXft/7eCGmAeaT/hsFmBP3RQOCK0k9gUhLLR1PO5xnTyZjGQJ
VCk/JVMUOSmN3A3j8uruhVvih7YMqPc9iQBC+HtbR5h4rhfWuy61XFdNoAJHjYVA1tYMqW+AEV+Q
1VtSSnB2mmxlGlAt5Neajfvuyy7rlpFsJ45pjQ==

`protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`protect key_block
xpgEYrMDyzTrppjK9pdbdERRVcGsOM1wehgNM05p7/GPYcE/Ldlf0NddSTOkeI7hjbtKJh5O+mOM
1DBGpPYqiLVAGGEkWOjemutvTwnFlOgFP/jBtscvT0xoJBauy19XM/qMu2zEdGpo+cTuJWzONd/i
3ghZO49KQIulbxfD2jQCC9rH6BOq1q57AbVoYFrWhtZyeWmQYWqoBBCoKhU0mW4HcQbiWcYymJHT
F7Wl3c/rvmZ19HaO7JHZa6PyhFnE8YeyhkUhNO5fcvZ7gFHlRumoJS365hjRroAoOu/CLJR/eLzy
ipT4tHFj/T7mhSJUeLz7A/6hK8fdFLzSZwEuZVstx+LDWxZ6pst0+57+uQ0enpOHMLlWG7IDZ9AV
vnJhH0UrMMbR196CYsdG3cIByN27DizesnW+jNkMQBaswtDLtVZnbdkXy8Zk9SXNXJvTwQegCw/a
5CAl8y//34XRWeFt4Wtkeso5A1iTLvpgBuH+GJMSKXA7KSxJoCnBU8Fi

`protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
PtXIj+hfSzAR7L3qE+PnK05Exl2JklQ0WEvqE/2UzQ6NMKlYocvT6ipW6HQPMOEIcQZ0yLsnPM3H
AJTKwnCXBrDf9LrsG68+NcVRqGYlmQxBA+B/Wz13Is/n6cNLZF0gc3NyuJtBtL2Uxe3MwscxIw7q
kdbu2/O6Cyl0g687jBXJycalF9NXdTP1rxdkEcnqKylZS7CE4cy54owMRjqGSecZkwM9W6KM/LnC
gXlHpN84ld6K+TZYDQX69vk5C2jSfvikiyv+hOQBT9MYZBs7WpN6ZB7rzEIftz7mRrfVTftis8ny
vl11eoBQKss+QRJIL8eXborkKe8di5p1yilcPQ==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18272)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_transceiver is
  port (
    cplllock : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    data_in : out STD_LOGIC;
    rx_fsm_reset_done_int_reg : out STD_LOGIC;
    rxchariscomma : out STD_LOGIC;
    rxcharisk : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \rxdata_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdisperr : out STD_LOGIC;
    rxnotintable : out STD_LOGIC;
    rxbuferr : out STD_LOGIC;
    txbuferr : out STD_LOGIC;
    mmcm_reset : out STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    status_vector : in STD_LOGIC_VECTOR ( 0 to 0 );
    independent_clock_bufg : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    enablealign : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_sync5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC;
    userclk : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    powerdown : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    txchardispval_reg_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    \txdata_reg_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txcharisk_reg_reg_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end gig_ethernet_pcs_pma_0_transceiver;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_transceiver is
  signal data_valid_reg2 : STD_LOGIC;
  signal encommaalign_int : STD_LOGIC;
  signal gtwizard_inst_n_7 : STD_LOGIC;
  signal gtwizard_inst_n_8 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_1_in__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_1_in__1\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_1_in__2\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rxchariscomma_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxchariscomma_i_1_n_0 : STD_LOGIC;
  signal rxchariscomma_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxchariscomma_reg__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxcharisk_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxcharisk_i_1_n_0 : STD_LOGIC;
  signal rxcharisk_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxcharisk_reg__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxclkcorcnt_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxclkcorcnt_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxclkcorcnt_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rxdata[7]_i_1_n_0\ : STD_LOGIC;
  signal rxdata_double : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rxdata_int : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rxdata_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rxdisperr_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxdisperr_i_1_n_0 : STD_LOGIC;
  signal rxdisperr_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxdisperr_reg__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxnotintable_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxnotintable_i_1_n_0 : STD_LOGIC;
  signal rxnotintable_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rxnotintable_reg__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxpowerdown : STD_LOGIC;
  signal rxpowerdown_double : STD_LOGIC;
  signal \rxpowerdown_reg__0\ : STD_LOGIC;
  signal rxreset_int : STD_LOGIC;
  signal toggle : STD_LOGIC;
  signal toggle_i_1_n_0 : STD_LOGIC;
  signal txbufstatus_reg : STD_LOGIC_VECTOR ( 1 to 1 );
  signal txchardispmode_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txchardispmode_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txchardispval_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txchardispval_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txcharisk_double : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txcharisk_int : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal txdata_double : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal txdata_int : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal txpowerdown : STD_LOGIC;
  signal txpowerdown_double : STD_LOGIC;
  signal \txpowerdown_reg__0\ : STD_LOGIC;
  signal txreset_int : STD_LOGIC;
  signal wtd_rxpcsreset_in : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of rxchariscomma_i_1 : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of rxcharisk_i_1 : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \rxdata[0]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \rxdata[1]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \rxdata[2]_i_1\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \rxdata[3]_i_1\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \rxdata[4]_i_1\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \rxdata[5]_i_1\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \rxdata[6]_i_1\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \rxdata[7]_i_1\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of rxdisperr_i_1 : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of rxnotintable_i_1 : label is "soft_lutpair126";
begin
gtwizard_inst: entity work.gig_ethernet_pcs_pma_0_GTWIZARD
     port map (
      D(1 downto 0) => rxclkcorcnt_int(1 downto 0),
      Q(15 downto 0) => txdata_int(15 downto 0),
      RXBUFSTATUS(0) => gtwizard_inst_n_8,
      RXPD(0) => rxpowerdown,
      TXBUFSTATUS(0) => gtwizard_inst_n_7,
      TXPD(0) => txpowerdown,
      cplllock => cplllock,
      data_in => data_in,
      data_out => data_valid_reg2,
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      gtxe2_i(15 downto 0) => rxdata_int(15 downto 0),
      gtxe2_i_0(1 downto 0) => rxchariscomma_int(1 downto 0),
      gtxe2_i_1(1 downto 0) => rxcharisk_int(1 downto 0),
      gtxe2_i_2(1 downto 0) => rxdisperr_int(1 downto 0),
      gtxe2_i_3(1 downto 0) => rxnotintable_int(1 downto 0),
      gtxe2_i_4(1 downto 0) => txchardispmode_int(1 downto 0),
      gtxe2_i_5(1 downto 0) => txchardispval_int(1 downto 0),
      gtxe2_i_6(1 downto 0) => txcharisk_int(1 downto 0),
      gtxe2_i_7 => rxreset_int,
      gtxe2_i_8 => txreset_int,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked,
      mmcm_reset => mmcm_reset,
      pma_reset => pma_reset,
      reset_out => encommaalign_int,
      rx_fsm_reset_done_int_reg => rx_fsm_reset_done_int_reg,
      rxn => rxn,
      rxoutclk => rxoutclk,
      rxp => rxp,
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      wtd_rxpcsreset_in => wtd_rxpcsreset_in
    );
reclock_encommaalign: entity work.gig_ethernet_pcs_pma_0_reset_sync
     port map (
      enablealign => enablealign,
      reset_out => encommaalign_int,
      userclk2 => userclk2
    );
reclock_rxreset: entity work.gig_ethernet_pcs_pma_0_reset_sync_1
     port map (
      independent_clock_bufg => independent_clock_bufg,
      reset_out => rxreset_int,
      reset_sync5_0(0) => reset_sync5(0)
    );
reclock_txreset: entity work.gig_ethernet_pcs_pma_0_reset_sync_2
     port map (
      SR(0) => SR(0),
      independent_clock_bufg => independent_clock_bufg,
      reset_out => txreset_int
    );
reset_wtd_timer: entity work.gig_ethernet_pcs_pma_0_reset_wtd_timer
     port map (
      data_out => data_valid_reg2,
      independent_clock_bufg => independent_clock_bufg,
      wtd_rxpcsreset_in => wtd_rxpcsreset_in
    );
rxbuferr_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => p_0_in,
      Q => rxbuferr,
      R => '0'
    );
\rxbufstatus_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => gtwizard_inst_n_8,
      Q => p_0_in,
      R => '0'
    );
\rxchariscomma_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxchariscomma_reg__0\(0),
      Q => rxchariscomma_double(0),
      R => reset_sync5(0)
    );
\rxchariscomma_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxchariscomma_reg__0\(1),
      Q => rxchariscomma_double(1),
      R => reset_sync5(0)
    );
rxchariscomma_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxchariscomma_double(1),
      I1 => toggle,
      I2 => rxchariscomma_double(0),
      O => rxchariscomma_i_1_n_0
    );
rxchariscomma_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxchariscomma_i_1_n_0,
      Q => rxchariscomma,
      R => reset_sync5(0)
    );
\rxchariscomma_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxchariscomma_int(0),
      Q => \rxchariscomma_reg__0\(0),
      R => '0'
    );
\rxchariscomma_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxchariscomma_int(1),
      Q => \rxchariscomma_reg__0\(1),
      R => '0'
    );
\rxcharisk_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxcharisk_reg__0\(0),
      Q => rxcharisk_double(0),
      R => reset_sync5(0)
    );
\rxcharisk_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxcharisk_reg__0\(1),
      Q => rxcharisk_double(1),
      R => reset_sync5(0)
    );
rxcharisk_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxcharisk_double(1),
      I1 => toggle,
      I2 => rxcharisk_double(0),
      O => rxcharisk_i_1_n_0
    );
rxcharisk_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxcharisk_i_1_n_0,
      Q => rxcharisk,
      R => reset_sync5(0)
    );
\rxcharisk_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxcharisk_int(0),
      Q => \rxcharisk_reg__0\(0),
      R => '0'
    );
\rxcharisk_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxcharisk_int(1),
      Q => \rxcharisk_reg__0\(1),
      R => '0'
    );
\rxclkcorcnt_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxclkcorcnt_reg(0),
      Q => rxclkcorcnt_double(0),
      R => reset_sync5(0)
    );
\rxclkcorcnt_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxclkcorcnt_reg(1),
      Q => rxclkcorcnt_double(1),
      R => reset_sync5(0)
    );
\rxclkcorcnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxclkcorcnt_double(0),
      Q => Q(0),
      R => reset_sync5(0)
    );
\rxclkcorcnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxclkcorcnt_double(1),
      Q => Q(1),
      R => reset_sync5(0)
    );
\rxclkcorcnt_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxclkcorcnt_int(0),
      Q => rxclkcorcnt_reg(0),
      R => '0'
    );
\rxclkcorcnt_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxclkcorcnt_int(1),
      Q => rxclkcorcnt_reg(1),
      R => '0'
    );
\rxdata[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(8),
      I1 => toggle,
      I2 => rxdata_double(0),
      O => \rxdata[0]_i_1_n_0\
    );
\rxdata[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(9),
      I1 => toggle,
      I2 => rxdata_double(1),
      O => \rxdata[1]_i_1_n_0\
    );
\rxdata[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(10),
      I1 => toggle,
      I2 => rxdata_double(2),
      O => \rxdata[2]_i_1_n_0\
    );
\rxdata[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(11),
      I1 => toggle,
      I2 => rxdata_double(3),
      O => \rxdata[3]_i_1_n_0\
    );
\rxdata[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(12),
      I1 => toggle,
      I2 => rxdata_double(4),
      O => \rxdata[4]_i_1_n_0\
    );
\rxdata[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(13),
      I1 => toggle,
      I2 => rxdata_double(5),
      O => \rxdata[5]_i_1_n_0\
    );
\rxdata[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(14),
      I1 => toggle,
      I2 => rxdata_double(6),
      O => \rxdata[6]_i_1_n_0\
    );
\rxdata[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdata_double(15),
      I1 => toggle,
      I2 => rxdata_double(7),
      O => \rxdata[7]_i_1_n_0\
    );
\rxdata_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(0),
      Q => rxdata_double(0),
      R => reset_sync5(0)
    );
\rxdata_double_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(10),
      Q => rxdata_double(10),
      R => reset_sync5(0)
    );
\rxdata_double_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(11),
      Q => rxdata_double(11),
      R => reset_sync5(0)
    );
\rxdata_double_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(12),
      Q => rxdata_double(12),
      R => reset_sync5(0)
    );
\rxdata_double_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(13),
      Q => rxdata_double(13),
      R => reset_sync5(0)
    );
\rxdata_double_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(14),
      Q => rxdata_double(14),
      R => reset_sync5(0)
    );
\rxdata_double_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(15),
      Q => rxdata_double(15),
      R => reset_sync5(0)
    );
\rxdata_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(1),
      Q => rxdata_double(1),
      R => reset_sync5(0)
    );
\rxdata_double_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(2),
      Q => rxdata_double(2),
      R => reset_sync5(0)
    );
\rxdata_double_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(3),
      Q => rxdata_double(3),
      R => reset_sync5(0)
    );
\rxdata_double_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(4),
      Q => rxdata_double(4),
      R => reset_sync5(0)
    );
\rxdata_double_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(5),
      Q => rxdata_double(5),
      R => reset_sync5(0)
    );
\rxdata_double_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(6),
      Q => rxdata_double(6),
      R => reset_sync5(0)
    );
\rxdata_double_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(7),
      Q => rxdata_double(7),
      R => reset_sync5(0)
    );
\rxdata_double_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(8),
      Q => rxdata_double(8),
      R => reset_sync5(0)
    );
\rxdata_double_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => rxdata_reg(9),
      Q => rxdata_double(9),
      R => reset_sync5(0)
    );
\rxdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[0]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(0),
      R => reset_sync5(0)
    );
\rxdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[1]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(1),
      R => reset_sync5(0)
    );
\rxdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[2]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(2),
      R => reset_sync5(0)
    );
\rxdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[3]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(3),
      R => reset_sync5(0)
    );
\rxdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[4]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(4),
      R => reset_sync5(0)
    );
\rxdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[5]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(5),
      R => reset_sync5(0)
    );
\rxdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[6]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(6),
      R => reset_sync5(0)
    );
\rxdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \rxdata[7]_i_1_n_0\,
      Q => \rxdata_reg[7]_0\(7),
      R => reset_sync5(0)
    );
\rxdata_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(0),
      Q => rxdata_reg(0),
      R => '0'
    );
\rxdata_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(10),
      Q => rxdata_reg(10),
      R => '0'
    );
\rxdata_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(11),
      Q => rxdata_reg(11),
      R => '0'
    );
\rxdata_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(12),
      Q => rxdata_reg(12),
      R => '0'
    );
\rxdata_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(13),
      Q => rxdata_reg(13),
      R => '0'
    );
\rxdata_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(14),
      Q => rxdata_reg(14),
      R => '0'
    );
\rxdata_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(15),
      Q => rxdata_reg(15),
      R => '0'
    );
\rxdata_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(1),
      Q => rxdata_reg(1),
      R => '0'
    );
\rxdata_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(2),
      Q => rxdata_reg(2),
      R => '0'
    );
\rxdata_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(3),
      Q => rxdata_reg(3),
      R => '0'
    );
\rxdata_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(4),
      Q => rxdata_reg(4),
      R => '0'
    );
\rxdata_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(5),
      Q => rxdata_reg(5),
      R => '0'
    );
\rxdata_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(6),
      Q => rxdata_reg(6),
      R => '0'
    );
\rxdata_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(7),
      Q => rxdata_reg(7),
      R => '0'
    );
\rxdata_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(8),
      Q => rxdata_reg(8),
      R => '0'
    );
\rxdata_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdata_int(9),
      Q => rxdata_reg(9),
      R => '0'
    );
\rxdisperr_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxdisperr_reg__0\(0),
      Q => rxdisperr_double(0),
      R => reset_sync5(0)
    );
\rxdisperr_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxdisperr_reg__0\(1),
      Q => rxdisperr_double(1),
      R => reset_sync5(0)
    );
rxdisperr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxdisperr_double(1),
      I1 => toggle,
      I2 => rxdisperr_double(0),
      O => rxdisperr_i_1_n_0
    );
rxdisperr_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxdisperr_i_1_n_0,
      Q => rxdisperr,
      R => reset_sync5(0)
    );
\rxdisperr_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdisperr_int(0),
      Q => \rxdisperr_reg__0\(0),
      R => '0'
    );
\rxdisperr_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxdisperr_int(1),
      Q => \rxdisperr_reg__0\(1),
      R => '0'
    );
\rxnotintable_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxnotintable_reg__0\(0),
      Q => rxnotintable_double(0),
      R => reset_sync5(0)
    );
\rxnotintable_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle,
      D => \rxnotintable_reg__0\(1),
      Q => rxnotintable_double(1),
      R => reset_sync5(0)
    );
rxnotintable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rxnotintable_double(1),
      I1 => toggle,
      I2 => rxnotintable_double(0),
      O => rxnotintable_i_1_n_0
    );
rxnotintable_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => rxnotintable_i_1_n_0,
      Q => rxnotintable,
      R => reset_sync5(0)
    );
\rxnotintable_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxnotintable_int(0),
      Q => \rxnotintable_reg__0\(0),
      R => '0'
    );
\rxnotintable_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => rxnotintable_int(1),
      Q => \rxnotintable_reg__0\(1),
      R => '0'
    );
rxpowerdown_double_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => powerdown,
      Q => rxpowerdown_double,
      R => '0'
    );
rxpowerdown_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => \rxpowerdown_reg__0\,
      Q => rxpowerdown,
      R => '0'
    );
rxpowerdown_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => rxpowerdown_double,
      Q => \rxpowerdown_reg__0\,
      R => reset_sync5(0)
    );
sync_block_data_valid: entity work.gig_ethernet_pcs_pma_0_sync_block_3
     port map (
      data_out => data_valid_reg2,
      independent_clock_bufg => independent_clock_bufg,
      status_vector(0) => status_vector(0)
    );
toggle_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => toggle,
      O => toggle_i_1_n_0
    );
toggle_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => toggle_i_1_n_0,
      Q => toggle,
      R => SR(0)
    );
txbuferr_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => txbufstatus_reg(1),
      Q => txbuferr,
      R => '0'
    );
\txbufstatus_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => gtwizard_inst_n_7,
      Q => txbufstatus_reg(1),
      R => '0'
    );
\txchardispmode_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => p_1_in(0),
      Q => txchardispmode_double(0),
      R => SR(0)
    );
\txchardispmode_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => D(0),
      Q => txchardispmode_double(1),
      R => SR(0)
    );
\txchardispmode_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txchardispmode_double(0),
      Q => txchardispmode_int(0),
      R => '0'
    );
\txchardispmode_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txchardispmode_double(1),
      Q => txchardispmode_int(1),
      R => '0'
    );
txchardispmode_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => D(0),
      Q => p_1_in(0),
      R => SR(0)
    );
\txchardispval_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__0\(0),
      Q => txchardispval_double(0),
      R => SR(0)
    );
\txchardispval_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => txchardispval_reg_reg_0(0),
      Q => txchardispval_double(1),
      R => SR(0)
    );
\txchardispval_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txchardispval_double(0),
      Q => txchardispval_int(0),
      R => '0'
    );
\txchardispval_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txchardispval_double(1),
      Q => txchardispval_int(1),
      R => '0'
    );
txchardispval_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => txchardispval_reg_reg_0(0),
      Q => \p_1_in__0\(0),
      R => SR(0)
    );
\txcharisk_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__2\(0),
      Q => txcharisk_double(0),
      R => SR(0)
    );
\txcharisk_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => txcharisk_reg_reg_0(0),
      Q => txcharisk_double(1),
      R => SR(0)
    );
\txcharisk_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txcharisk_double(0),
      Q => txcharisk_int(0),
      R => '0'
    );
\txcharisk_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txcharisk_double(1),
      Q => txcharisk_int(1),
      R => '0'
    );
txcharisk_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => txcharisk_reg_reg_0(0),
      Q => \p_1_in__2\(0),
      R => SR(0)
    );
\txdata_double_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(0),
      Q => txdata_double(0),
      R => SR(0)
    );
\txdata_double_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(2),
      Q => txdata_double(10),
      R => SR(0)
    );
\txdata_double_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(3),
      Q => txdata_double(11),
      R => SR(0)
    );
\txdata_double_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(4),
      Q => txdata_double(12),
      R => SR(0)
    );
\txdata_double_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(5),
      Q => txdata_double(13),
      R => SR(0)
    );
\txdata_double_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(6),
      Q => txdata_double(14),
      R => SR(0)
    );
\txdata_double_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(7),
      Q => txdata_double(15),
      R => SR(0)
    );
\txdata_double_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(1),
      Q => txdata_double(1),
      R => SR(0)
    );
\txdata_double_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(2),
      Q => txdata_double(2),
      R => SR(0)
    );
\txdata_double_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(3),
      Q => txdata_double(3),
      R => SR(0)
    );
\txdata_double_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(4),
      Q => txdata_double(4),
      R => SR(0)
    );
\txdata_double_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(5),
      Q => txdata_double(5),
      R => SR(0)
    );
\txdata_double_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(6),
      Q => txdata_double(6),
      R => SR(0)
    );
\txdata_double_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \p_1_in__1\(7),
      Q => txdata_double(7),
      R => SR(0)
    );
\txdata_double_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(0),
      Q => txdata_double(8),
      R => SR(0)
    );
\txdata_double_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => toggle_i_1_n_0,
      D => \txdata_reg_reg[7]_0\(1),
      Q => txdata_double(9),
      R => SR(0)
    );
\txdata_int_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(0),
      Q => txdata_int(0),
      R => '0'
    );
\txdata_int_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(10),
      Q => txdata_int(10),
      R => '0'
    );
\txdata_int_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(11),
      Q => txdata_int(11),
      R => '0'
    );
\txdata_int_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(12),
      Q => txdata_int(12),
      R => '0'
    );
\txdata_int_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(13),
      Q => txdata_int(13),
      R => '0'
    );
\txdata_int_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(14),
      Q => txdata_int(14),
      R => '0'
    );
\txdata_int_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(15),
      Q => txdata_int(15),
      R => '0'
    );
\txdata_int_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(1),
      Q => txdata_int(1),
      R => '0'
    );
\txdata_int_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(2),
      Q => txdata_int(2),
      R => '0'
    );
\txdata_int_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(3),
      Q => txdata_int(3),
      R => '0'
    );
\txdata_int_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(4),
      Q => txdata_int(4),
      R => '0'
    );
\txdata_int_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(5),
      Q => txdata_int(5),
      R => '0'
    );
\txdata_int_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(6),
      Q => txdata_int(6),
      R => '0'
    );
\txdata_int_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(7),
      Q => txdata_int(7),
      R => '0'
    );
\txdata_int_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(8),
      Q => txdata_int(8),
      R => '0'
    );
\txdata_int_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => userclk,
      CE => '1',
      D => txdata_double(9),
      Q => txdata_int(9),
      R => '0'
    );
\txdata_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(0),
      Q => \p_1_in__1\(0),
      R => SR(0)
    );
\txdata_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(1),
      Q => \p_1_in__1\(1),
      R => SR(0)
    );
\txdata_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(2),
      Q => \p_1_in__1\(2),
      R => SR(0)
    );
\txdata_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(3),
      Q => \p_1_in__1\(3),
      R => SR(0)
    );
\txdata_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(4),
      Q => \p_1_in__1\(4),
      R => SR(0)
    );
\txdata_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(5),
      Q => \p_1_in__1\(5),
      R => SR(0)
    );
\txdata_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(6),
      Q => \p_1_in__1\(6),
      R => SR(0)
    );
\txdata_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => userclk2,
      CE => '1',
      D => \txdata_reg_reg[7]_0\(7),
      Q => \p_1_in__1\(7),
      R => SR(0)
    );
txpowerdown_double_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => \txpowerdown_reg__0\,
      Q => txpowerdown_double,
      R => SR(0)
    );
txpowerdown_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk,
      CE => '1',
      D => txpowerdown_double,
      Q => txpowerdown,
      R => '0'
    );
txpowerdown_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => userclk2,
      CE => '1',
      D => powerdown,
      Q => \txpowerdown_reg__0\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_block is
  port (
    gtrefclk : in STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txoutclk : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    resetdone : out STD_LOGIC;
    cplllock : out STD_LOGIC;
    mmcm_reset : out STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    userclk : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    rxuserclk : in STD_LOGIC;
    rxuserclk2 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : out STD_LOGIC;
    gmii_rx_er : out STD_LOGIC;
    gmii_isolate : out STD_LOGIC;
    mdc : in STD_LOGIC;
    mdio_i : in STD_LOGIC;
    mdio_o : out STD_LOGIC;
    mdio_t : out STD_LOGIC;
    phyaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : in STD_LOGIC;
    an_interrupt : out STD_LOGIC;
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : in STD_LOGIC;
    an_restart_config : in STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC
  );
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0_block : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0_block : entity is 0;
end gig_ethernet_pcs_pma_0_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_block is
  signal \<const0>\ : STD_LOGIC;
  signal enablealign : STD_LOGIC;
  signal mgt_rx_reset : STD_LOGIC;
  signal mgt_tx_reset : STD_LOGIC;
  signal powerdown : STD_LOGIC;
  signal \^resetdone\ : STD_LOGIC;
  signal rxbufstatus : STD_LOGIC_VECTOR ( 1 to 1 );
  signal rxchariscomma : STD_LOGIC;
  signal rxcharisk : STD_LOGIC;
  signal rxclkcorcnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rxdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rxdisperr : STD_LOGIC;
  signal rxnotintable : STD_LOGIC;
  signal \^status_vector\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal transceiver_inst_n_5 : STD_LOGIC;
  signal transceiver_inst_n_6 : STD_LOGIC;
  signal tx_reset_done_i : STD_LOGIC;
  signal txbuferr : STD_LOGIC;
  signal txchardispmode : STD_LOGIC;
  signal txchardispval : STD_LOGIC;
  signal txcharisk : STD_LOGIC;
  signal txdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 7 );
  signal NLW_gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute B_SHIFTER_ADDR : string;
  attribute B_SHIFTER_ADDR of gig_ethernet_pcs_pma_0_core : label is "10'b0101001110";
  attribute C_1588 : integer;
  attribute C_1588 of gig_ethernet_pcs_pma_0_core : label is 0;
  attribute C_2_5G : string;
  attribute C_2_5G of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_COMPONENT_NAME : string;
  attribute C_COMPONENT_NAME of gig_ethernet_pcs_pma_0_core : label is "gig_ethernet_pcs_pma_0";
  attribute C_DYNAMIC_SWITCHING : string;
  attribute C_DYNAMIC_SWITCHING of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_ELABORATION_TRANSIENT_DIR : string;
  attribute C_ELABORATION_TRANSIENT_DIR of gig_ethernet_pcs_pma_0_core : label is "BlankString";
  attribute C_FAMILY : string;
  attribute C_FAMILY of gig_ethernet_pcs_pma_0_core : label is "kintex7";
  attribute C_HAS_AN : string;
  attribute C_HAS_AN of gig_ethernet_pcs_pma_0_core : label is "TRUE";
  attribute C_HAS_AXIL : string;
  attribute C_HAS_AXIL of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_HAS_MDIO : string;
  attribute C_HAS_MDIO of gig_ethernet_pcs_pma_0_core : label is "TRUE";
  attribute C_HAS_TEMAC : string;
  attribute C_HAS_TEMAC of gig_ethernet_pcs_pma_0_core : label is "TRUE";
  attribute C_IS_SGMII : string;
  attribute C_IS_SGMII of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_RX_GMII_CLK : string;
  attribute C_RX_GMII_CLK of gig_ethernet_pcs_pma_0_core : label is "TXOUTCLK";
  attribute C_SGMII_FABRIC_BUFFER : string;
  attribute C_SGMII_FABRIC_BUFFER of gig_ethernet_pcs_pma_0_core : label is "TRUE";
  attribute C_SGMII_PHY_MODE : string;
  attribute C_SGMII_PHY_MODE of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_USE_LVDS : string;
  attribute C_USE_LVDS of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_USE_TBI : string;
  attribute C_USE_TBI of gig_ethernet_pcs_pma_0_core : label is "FALSE";
  attribute C_USE_TRANSCEIVER : string;
  attribute C_USE_TRANSCEIVER of gig_ethernet_pcs_pma_0_core : label is "TRUE";
  attribute GT_RX_BYTE_WIDTH : integer;
  attribute GT_RX_BYTE_WIDTH of gig_ethernet_pcs_pma_0_core : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of gig_ethernet_pcs_pma_0_core : label is "soft";
  attribute downgradeipidentifiedwarnings of gig_ethernet_pcs_pma_0_core : label is "yes";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of gig_ethernet_pcs_pma_0_core : label is "true";
begin
  resetdone <= \^resetdone\;
  status_vector(15 downto 12) <= \^status_vector\(15 downto 12);
  status_vector(11) <= \<const0>\;
  status_vector(10) <= \<const0>\;
  status_vector(9 downto 8) <= \^status_vector\(9 downto 8);
  status_vector(7) <= \<const0>\;
  status_vector(6 downto 0) <= \^status_vector\(6 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
gig_ethernet_pcs_pma_0_core: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_v16_2_8
     port map (
      an_adv_config_val => an_adv_config_val,
      an_adv_config_vector(15) => an_adv_config_vector(15),
      an_adv_config_vector(14) => '0',
      an_adv_config_vector(13 downto 12) => an_adv_config_vector(13 downto 12),
      an_adv_config_vector(11 downto 9) => B"000",
      an_adv_config_vector(8 downto 7) => an_adv_config_vector(8 downto 7),
      an_adv_config_vector(6) => '0',
      an_adv_config_vector(5) => an_adv_config_vector(5),
      an_adv_config_vector(4 downto 0) => B"00000",
      an_enable => NLW_gig_ethernet_pcs_pma_0_core_an_enable_UNCONNECTED,
      an_interrupt => an_interrupt,
      an_restart_config => an_restart_config,
      basex_or_sgmii => '0',
      configuration_valid => configuration_valid,
      configuration_vector(4 downto 0) => configuration_vector(4 downto 0),
      correction_timer(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      dcm_locked => mmcm_locked,
      drp_daddr(9 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_drp_daddr_UNCONNECTED(9 downto 0),
      drp_dclk => '0',
      drp_den => NLW_gig_ethernet_pcs_pma_0_core_drp_den_UNCONNECTED,
      drp_di(15 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_drp_di_UNCONNECTED(15 downto 0),
      drp_do(15 downto 0) => B"0000000000000000",
      drp_drdy => '0',
      drp_dwe => NLW_gig_ethernet_pcs_pma_0_core_drp_dwe_UNCONNECTED,
      drp_gnt => '0',
      drp_req => NLW_gig_ethernet_pcs_pma_0_core_drp_req_UNCONNECTED,
      en_cdet => NLW_gig_ethernet_pcs_pma_0_core_en_cdet_UNCONNECTED,
      enablealign => enablealign,
      ewrap => NLW_gig_ethernet_pcs_pma_0_core_ewrap_UNCONNECTED,
      gmii_isolate => gmii_isolate,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      gmii_rxd(7 downto 0) => gmii_rxd(7 downto 0),
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_txd(7 downto 0) => gmii_txd(7 downto 0),
      gtx_clk => '0',
      link_timer_basex(9 downto 0) => B"0000000000",
      link_timer_sgmii(9 downto 0) => B"0000000000",
      link_timer_value(9 downto 0) => B"0100111101",
      loc_ref => NLW_gig_ethernet_pcs_pma_0_core_loc_ref_UNCONNECTED,
      mdc => mdc,
      mdio_in => mdio_i,
      mdio_out => mdio_o,
      mdio_tri => mdio_t,
      mgt_rx_reset => mgt_rx_reset,
      mgt_tx_reset => mgt_tx_reset,
      phyad(4 downto 0) => phyaddr(4 downto 0),
      pma_rx_clk0 => '0',
      pma_rx_clk1 => '0',
      powerdown => powerdown,
      reset => reset,
      reset_done => \^resetdone\,
      rx_code_group0(9 downto 0) => B"0000000000",
      rx_code_group1(9 downto 0) => B"0000000000",
      rx_gt_nominal_latency(15 downto 0) => B"0000000011111000",
      rxbufstatus(1) => rxbufstatus(1),
      rxbufstatus(0) => '0',
      rxchariscomma(0) => rxchariscomma,
      rxcharisk(0) => rxcharisk,
      rxclkcorcnt(2) => '0',
      rxclkcorcnt(1 downto 0) => rxclkcorcnt(1 downto 0),
      rxdata(7 downto 0) => rxdata(7 downto 0),
      rxdisperr(0) => rxdisperr,
      rxnotintable(0) => rxnotintable,
      rxphy_correction_timer(63 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_rxphy_correction_timer_UNCONNECTED(63 downto 0),
      rxphy_ns_field(31 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_rxphy_ns_field_UNCONNECTED(31 downto 0),
      rxphy_s_field(47 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_rxphy_s_field_UNCONNECTED(47 downto 0),
      rxrecclk => '0',
      rxrundisp(0) => '0',
      s_axi_aclk => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arready => NLW_gig_ethernet_pcs_pma_0_core_s_axi_arready_UNCONNECTED,
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awready => NLW_gig_ethernet_pcs_pma_0_core_s_axi_awready_UNCONNECTED,
      s_axi_awvalid => '0',
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_gig_ethernet_pcs_pma_0_core_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(31 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_s_axi_rdata_UNCONNECTED(31 downto 0),
      s_axi_resetn => '0',
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_gig_ethernet_pcs_pma_0_core_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wready => NLW_gig_ethernet_pcs_pma_0_core_s_axi_wready_UNCONNECTED,
      s_axi_wvalid => '0',
      signal_detect => signal_detect,
      speed_is_100 => '0',
      speed_is_10_100 => '0',
      speed_selection(1 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_speed_selection_UNCONNECTED(1 downto 0),
      status_vector(15 downto 12) => \^status_vector\(15 downto 12),
      status_vector(11 downto 10) => NLW_gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED(11 downto 10),
      status_vector(9 downto 8) => \^status_vector\(9 downto 8),
      status_vector(7) => NLW_gig_ethernet_pcs_pma_0_core_status_vector_UNCONNECTED(7),
      status_vector(6 downto 0) => \^status_vector\(6 downto 0),
      systemtimer_ns_field(31 downto 0) => B"00000000000000000000000000000000",
      systemtimer_s_field(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      tx_code_group(9 downto 0) => NLW_gig_ethernet_pcs_pma_0_core_tx_code_group_UNCONNECTED(9 downto 0),
      txbuferr => txbuferr,
      txchardispmode => txchardispmode,
      txchardispval => txchardispval,
      txcharisk => txcharisk,
      txdata(7 downto 0) => txdata(7 downto 0),
      userclk => '0',
      userclk2 => userclk2
    );
sync_block_rx_reset_done: entity work.gig_ethernet_pcs_pma_0_sync_block
     port map (
      data_in => transceiver_inst_n_6,
      data_out => tx_reset_done_i,
      resetdone => \^resetdone\,
      userclk2 => userclk2
    );
sync_block_tx_reset_done: entity work.gig_ethernet_pcs_pma_0_sync_block_0
     port map (
      data_in => transceiver_inst_n_5,
      data_out => tx_reset_done_i,
      userclk2 => userclk2
    );
transceiver_inst: entity work.gig_ethernet_pcs_pma_0_transceiver
     port map (
      D(0) => txchardispmode,
      Q(1 downto 0) => rxclkcorcnt(1 downto 0),
      SR(0) => mgt_tx_reset,
      cplllock => cplllock,
      data_in => transceiver_inst_n_5,
      enablealign => enablealign,
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked,
      mmcm_reset => mmcm_reset,
      pma_reset => pma_reset,
      powerdown => powerdown,
      reset_sync5(0) => mgt_rx_reset,
      rx_fsm_reset_done_int_reg => transceiver_inst_n_6,
      rxbuferr => rxbufstatus(1),
      rxchariscomma => rxchariscomma,
      rxcharisk => rxcharisk,
      \rxdata_reg[7]_0\(7 downto 0) => rxdata(7 downto 0),
      rxdisperr => rxdisperr,
      rxn => rxn,
      rxnotintable => rxnotintable,
      rxoutclk => rxoutclk,
      rxp => rxp,
      status_vector(0) => \^status_vector\(1),
      txbuferr => txbuferr,
      txchardispval_reg_reg_0(0) => txchardispval,
      txcharisk_reg_reg_0(0) => txcharisk,
      \txdata_reg_reg[7]_0\(7 downto 0) => txdata(7 downto 0),
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      userclk2 => userclk2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0 is
  port (
    gtrefclk : in STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    resetdone : out STD_LOGIC;
    cplllock : out STD_LOGIC;
    mmcm_reset : out STD_LOGIC;
    txoutclk : out STD_LOGIC;
    rxoutclk : out STD_LOGIC;
    userclk : in STD_LOGIC;
    userclk2 : in STD_LOGIC;
    rxuserclk : in STD_LOGIC;
    rxuserclk2 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    pma_reset : in STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : out STD_LOGIC;
    gmii_rx_er : out STD_LOGIC;
    gmii_isolate : out STD_LOGIC;
    mdc : in STD_LOGIC;
    mdio_i : in STD_LOGIC;
    mdio_o : out STD_LOGIC;
    mdio_t : out STD_LOGIC;
    phyaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : in STD_LOGIC;
    an_interrupt : out STD_LOGIC;
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : in STD_LOGIC;
    an_restart_config : in STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    gt0_qplloutclk_in : in STD_LOGIC;
    gt0_qplloutrefclk_in : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gig_ethernet_pcs_pma_0 : entity is true;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0 : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0 : entity is 0;
end gig_ethernet_pcs_pma_0;

architecture STRUCTURE of gig_ethernet_pcs_pma_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^status_vector\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_inst_status_vector_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 7 );
  attribute EXAMPLE_SIMULATION of inst : label is 0;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of inst : label is "gig_ethernet_pcs_pma_v16_2_8,Vivado 2022.1";
  attribute downgradeipidentifiedwarnings of inst : label is "yes";
begin
  status_vector(15 downto 12) <= \^status_vector\(15 downto 12);
  status_vector(11) <= \<const1>\;
  status_vector(10) <= \<const0>\;
  status_vector(9 downto 8) <= \^status_vector\(9 downto 8);
  status_vector(7) <= \<const0>\;
  status_vector(6 downto 0) <= \^status_vector\(6 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.gig_ethernet_pcs_pma_0_block
     port map (
      an_adv_config_val => an_adv_config_val,
      an_adv_config_vector(15) => an_adv_config_vector(15),
      an_adv_config_vector(14) => '0',
      an_adv_config_vector(13 downto 12) => an_adv_config_vector(13 downto 12),
      an_adv_config_vector(11 downto 9) => B"000",
      an_adv_config_vector(8 downto 7) => an_adv_config_vector(8 downto 7),
      an_adv_config_vector(6) => '0',
      an_adv_config_vector(5) => an_adv_config_vector(5),
      an_adv_config_vector(4 downto 0) => B"00000",
      an_interrupt => an_interrupt,
      an_restart_config => an_restart_config,
      configuration_valid => configuration_valid,
      configuration_vector(4 downto 0) => configuration_vector(4 downto 0),
      cplllock => cplllock,
      gmii_isolate => gmii_isolate,
      gmii_rx_dv => gmii_rx_dv,
      gmii_rx_er => gmii_rx_er,
      gmii_rxd(7 downto 0) => gmii_rxd(7 downto 0),
      gmii_tx_en => gmii_tx_en,
      gmii_tx_er => gmii_tx_er,
      gmii_txd(7 downto 0) => gmii_txd(7 downto 0),
      gt0_qplloutclk_in => gt0_qplloutclk_in,
      gt0_qplloutrefclk_in => gt0_qplloutrefclk_in,
      gtrefclk => gtrefclk,
      gtrefclk_bufg => gtrefclk_bufg,
      independent_clock_bufg => independent_clock_bufg,
      mdc => mdc,
      mdio_i => mdio_i,
      mdio_o => mdio_o,
      mdio_t => mdio_t,
      mmcm_locked => mmcm_locked,
      mmcm_reset => mmcm_reset,
      phyaddr(4 downto 0) => phyaddr(4 downto 0),
      pma_reset => pma_reset,
      reset => reset,
      resetdone => resetdone,
      rxn => rxn,
      rxoutclk => rxoutclk,
      rxp => rxp,
      rxuserclk => '0',
      rxuserclk2 => '0',
      signal_detect => signal_detect,
      status_vector(15 downto 12) => \^status_vector\(15 downto 12),
      status_vector(11 downto 10) => NLW_inst_status_vector_UNCONNECTED(11 downto 10),
      status_vector(9 downto 8) => \^status_vector\(9 downto 8),
      status_vector(7) => NLW_inst_status_vector_UNCONNECTED(7),
      status_vector(6 downto 0) => \^status_vector\(6 downto 0),
      txn => txn,
      txoutclk => txoutclk,
      txp => txp,
      userclk => userclk,
      userclk2 => userclk2
    );
end STRUCTURE;
