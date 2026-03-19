-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Dec 18 16:18:52 2023
-- Host        : ch-virtual-machine running 64-bit Ubuntu 16.04.7 LTS
-- Command     : write_vhdl -mode synth_stub -force wr_nem_core.vhd
-- Design      : wr_nem_core
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wr_nem_core is
  Port ( 
    WRNEM_VER : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ONE_WIRE : inout STD_LOGIC;
    CLK_62M5_DMTD : in STD_LOGIC;
    DAC_LDAC_N : out STD_LOGIC;
    DAC_SCLK : out STD_LOGIC;
    DAC_SYNC_N : out STD_LOGIC;
    DAC_SDI : out STD_LOGIC;
    DAC_SDO : in STD_LOGIC;
    DAC_DMTD_LDAC_N : out STD_LOGIC;
    DAC_DMTD_SCLK : out STD_LOGIC;
    DAC_DMTD_SYNC_N : out STD_LOGIC;
    DAC_DMTD_SDI : out STD_LOGIC;
    DAC_DMTD_SDO : in STD_LOGIC;
    DELAY_EN : out STD_LOGIC;
    DELAY_SCLK : out STD_LOGIC;
    DELAY_SLOAD : out STD_LOGIC;
    DELAY_SDIN : out STD_LOGIC;
    PLL_CS : out STD_LOGIC;
    PLL_REFSEL : out STD_LOGIC;
    PLL_RESET : out STD_LOGIC;
    PLL_SCLK : out STD_LOGIC;
    PLL_SDO : out STD_LOGIC;
    PLL_SYNC : out STD_LOGIC;
    PLL_LOCK : in STD_LOGIC;
    PLL_SDI : in STD_LOGIC;
    PLL_STAT : in STD_LOGIC;
    SFP_DISABLE_O : out STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_O_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_O_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_I_N : in STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_I_P : in STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_FAULT_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_LOS_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_MOD_DEF0_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_MOD_DEF1_IO : inout STD_LOGIC_VECTOR ( 0 to 0 );
    SFP_MOD_DEF2_IO : inout STD_LOGIC_VECTOR ( 0 to 0 );
    MGTREFCLK0_P : in STD_LOGIC;
    MGTREFCLK0_N : in STD_LOGIC;
    QSPI_CS : out STD_LOGIC;
    QSPI_DQ0 : out STD_LOGIC;
    QSPI_DQ1 : in STD_LOGIC;
    UART_TX : out STD_LOGIC;
    UART_RX : in STD_LOGIC;
    mgtrefclk_o : out STD_LOGIC;
    mgtrefclk_bufg_o : out STD_LOGIC;
    clk_sys_o : out STD_LOGIC;
    clk_125_o : out STD_LOGIC;
    pps_o : out STD_LOGIC;
    tm_tai_o : out STD_LOGIC_VECTOR ( 39 downto 0 );
    tm_cycles_o : out STD_LOGIC_VECTOR ( 27 downto 0 );
    tm_time_valid_o : out STD_LOGIC;
    link_ok_o : out STD_LOGIC;
    link_act_o : out STD_LOGIC;
    mac_clk_o : out STD_LOGIC;
    rst_mac_clk_o : out STD_LOGIC;
    mac_tx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mac_rx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    mac_tx_valid : in STD_LOGIC;
    mac_tx_last : in STD_LOGIC;
    mac_tx_error : in STD_LOGIC;
    mac_tx_ready : out STD_LOGIC;
    mac_rx_valid : out STD_LOGIC;
    mac_rx_last : out STD_LOGIC;
    mac_rx_error : out STD_LOGIC;
    my_mac_addr_o : out STD_LOGIC_VECTOR ( 47 downto 0 );
    my_ip_addr_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end wr_nem_core;

architecture stub of wr_nem_core is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "WRNEM_VER[2:0],ONE_WIRE,CLK_62M5_DMTD,DAC_LDAC_N,DAC_SCLK,DAC_SYNC_N,DAC_SDI,DAC_SDO,DAC_DMTD_LDAC_N,DAC_DMTD_SCLK,DAC_DMTD_SYNC_N,DAC_DMTD_SDI,DAC_DMTD_SDO,DELAY_EN,DELAY_SCLK,DELAY_SLOAD,DELAY_SDIN,PLL_CS,PLL_REFSEL,PLL_RESET,PLL_SCLK,PLL_SDO,PLL_SYNC,PLL_LOCK,PLL_SDI,PLL_STAT,SFP_DISABLE_O[0:0],SFP_O_N[0:0],SFP_O_P[0:0],SFP_I_N[0:0],SFP_I_P[0:0],SFP_FAULT_I[0:0],SFP_LOS_I[0:0],SFP_MOD_DEF0_I[0:0],SFP_MOD_DEF1_IO[0:0],SFP_MOD_DEF2_IO[0:0],MGTREFCLK0_P,MGTREFCLK0_N,QSPI_CS,QSPI_DQ0,QSPI_DQ1,UART_TX,UART_RX,mgtrefclk_o,mgtrefclk_bufg_o,clk_sys_o,clk_125_o,pps_o,tm_tai_o[39:0],tm_cycles_o[27:0],tm_time_valid_o,link_ok_o,link_act_o,mac_clk_o,rst_mac_clk_o,mac_tx_data[7:0],mac_rx_data[7:0],mac_tx_valid,mac_tx_last,mac_tx_error,mac_tx_ready,mac_rx_valid,mac_rx_last,mac_rx_error,my_mac_addr_o[47:0],my_ip_addr_o[31:0]";
begin
end;
