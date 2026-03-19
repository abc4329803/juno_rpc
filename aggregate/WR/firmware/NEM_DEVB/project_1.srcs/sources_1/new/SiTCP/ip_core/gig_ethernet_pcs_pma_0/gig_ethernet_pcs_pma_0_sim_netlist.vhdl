-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Sun Aug 20 16:08:34 2023
-- Host        : DESKTOP-PTU6AJN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top gig_ethernet_pcs_pma_0 -prefix
--               gig_ethernet_pcs_pma_0_ gig_ethernet_pcs_pma_0_sim_netlist.vhdl
-- Design      : gig_ethernet_pcs_pma_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k410tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing is
  port (
    gt0_cpllpd_i : out STD_LOGIC;
    gt0_cpllreset_i_0 : out STD_LOGIC;
    gtrefclk_bufg : in STD_LOGIC;
    gt0_cpllreset_i : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync is
  port (
    reset_out : out STD_LOGIC;
    userclk2 : in STD_LOGIC;
    enablealign : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1 is
  port (
    reset_out : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    reset_sync5_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2 is
  port (
    reset_out : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2 : entity is "gig_ethernet_pcs_pma_0_reset_sync";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer is
  port (
    wtd_rxpcsreset_in : out STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    data_out : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block is
  port (
    resetdone : out STD_LOGIC;
    data_out : in STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk2 : in STD_LOGIC
  );
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 is
  port (
    data_out : out STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 is
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
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 is
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
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3 is
  port (
    data_out : out STD_LOGIC;
    status_vector : in STD_LOGIC_VECTOR ( 0 to 0 );
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4 is
  port (
    data_out : out STD_LOGIC;
    data_sync_reg1_0 : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5 is
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
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6 is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out : out STD_LOGIC;
    mmcm_locked : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8 is
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    userclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 : entity is "gig_ethernet_pcs_pma_0_sync_block";
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9 is
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
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 272496)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt is
  signal gt0_cpllpd_i : STD_LOGIC;
  signal gt0_cpllreset_i_0 : STD_LOGIC;
begin
cpll_railing0_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_cpll_railing
     port map (
      gt0_cpllpd_i => gt0_cpllpd_i,
      gt0_cpllreset_i => gt0_cpllreset_i,
      gt0_cpllreset_i_0 => gt0_cpllreset_i_0,
      gtrefclk_bufg => gtrefclk_bufg
    );
gt0_GTWIZARD_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_GT
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM is
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
sync_RXRESETDONE: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_10
     port map (
      data_out => rxresetdone_s2,
      data_sync_reg1_0 => data_sync_reg1,
      independent_clock_bufg => independent_clock_bufg
    );
sync_cplllock: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_11
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
sync_data_valid: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_12
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
sync_mmcm_lock_reclocked: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_13
     port map (
      SR(0) => sync_mmcm_lock_reclocked_n_0,
      data_out => mmcm_lock_i,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked
    );
sync_run_phase_alignment_int: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_14
     port map (
      data_in => run_phase_alignment_int_reg_n_0,
      data_out => run_phase_alignment_int_s2,
      userclk => userclk
    );
sync_rx_fsm_reset_done_int: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_15
     port map (
      data_in => \^data_in\,
      data_out => rx_fsm_reset_done_int_s2,
      userclk => userclk
    );
sync_time_out_wait_bypass: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_16
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM is
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
sync_TXRESETDONE: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_4
     port map (
      data_out => txresetdone_s2,
      data_sync_reg1_0 => data_sync_reg1,
      independent_clock_bufg => independent_clock_bufg
    );
sync_cplllock: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_5
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
sync_mmcm_lock_reclocked: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_6
     port map (
      SR(0) => sync_mmcm_lock_reclocked_n_0,
      data_out => mmcm_lock_i,
      independent_clock_bufg => independent_clock_bufg,
      mmcm_locked => mmcm_locked
    );
sync_run_phase_alignment_int: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_7
     port map (
      data_in => run_phase_alignment_int_reg_n_0,
      data_out => run_phase_alignment_int_s2,
      userclk => userclk
    );
sync_time_out_wait_bypass: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_8
     port map (
      data_in => time_out_wait_bypass_reg_n_0,
      data_out => time_out_wait_bypass_s2,
      independent_clock_bufg => independent_clock_bufg
    );
sync_tx_fsm_reset_done_int: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_9
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
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 43584)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init is
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
gt0_rxresetfsm_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_RX_STARTUP_FSM
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
gt0_txresetfsm_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_TX_STARTUP_FSM
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
gtwizard_i: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_multi_gt
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
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76368)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD is
begin
inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD_init
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
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18112)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver is
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
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver is
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
gtwizard_inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_GTWIZARD
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
reclock_encommaalign: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync
     port map (
      enablealign => enablealign,
      reset_out => encommaalign_int,
      userclk2 => userclk2
    );
reclock_rxreset: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_1
     port map (
      independent_clock_bufg => independent_clock_bufg,
      reset_out => rxreset_int,
      reset_sync5_0(0) => reset_sync5(0)
    );
reclock_txreset: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_sync_2
     port map (
      SR(0) => SR(0),
      independent_clock_bufg => independent_clock_bufg,
      reset_out => txreset_int
    );
reset_wtd_timer: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_reset_wtd_timer
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
sync_block_data_valid: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_3
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
entity gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block is
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
  attribute DowngradeIPIdentifiedWarnings of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block : entity is "yes";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block : entity is 0;
end gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block;

architecture STRUCTURE of gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block is
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
sync_block_rx_reset_done: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block
     port map (
      data_in => transceiver_inst_n_6,
      data_out => tx_reset_done_i,
      resetdone => \^resetdone\,
      userclk2 => userclk2
    );
sync_block_tx_reset_done: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_sync_block_0
     port map (
      data_in => transceiver_inst_n_5,
      data_out => tx_reset_done_i,
      userclk2 => userclk2
    );
transceiver_inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_transceiver
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
inst: entity work.gig_ethernet_pcs_pma_0_gig_ethernet_pcs_pma_0_block
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
