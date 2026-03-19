----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2023/09/12 15:53:05
-- Design Name: 
-- Module Name: MD10_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity MD10_top is
    Port (
------------------------------------------
-- WR-NEM
    WRNEM_VER             : in std_logic_vector(2 downto 0);
    ONE_WIRE              : inout std_logic;
    CLK_62M5_DMTD         : in    std_logic;
    
    DAC_LDAC_N            : out   std_logic;
    DAC_SCLK              : out   std_logic;
    DAC_SYNC_N            : out   std_logic;
    DAC_SDI               : out   std_logic;
    DAC_SDO               : in    std_logic;

    DAC_DMTD_LDAC_N       : out   std_logic;
    DAC_DMTD_SCLK         : out   std_logic;
    DAC_DMTD_SYNC_N       : out   std_logic;
    DAC_DMTD_SDI          : out   std_logic;
    DAC_DMTD_SDO          : in    std_logic;
    
    DELAY_EN              : out   std_logic;
    DELAY_SCLK            : out   std_logic;
    DELAY_SLOAD           : out   std_logic;
    DELAY_SDIN            : out   std_logic;
    -- AD9516 SPI
    PLL_CS                : out   std_logic;
    PLL_REFSEL            : out   std_logic;
    PLL_RESET             : out   std_logic;
    PLL_SCLK              : out   std_logic;
    PLL_SDO               : out   std_logic;
    PLL_SYNC              : out   std_logic;
    PLL_LOCK              : in    std_logic;
    PLL_SDI               : in    std_logic;
    PLL_STAT              : in    std_logic;
-----------------------------------------
    -- SFP
    SFP_DISABLE_O         : out   std_logic_vector(0 downto 0);
    SFP_O_N               : out   std_logic_vector(0 downto 0);
    SFP_O_P               : out   std_logic_vector(0 downto 0);
    SFP_I_N               : in    std_logic_vector(0 downto 0);
    SFP_I_P               : in    std_logic_vector(0 downto 0);
    SFP_FAULT_I           : in    std_logic_vector(0 downto 0);
    SFP_LOS_I             : in    std_logic_vector(0 downto 0);
    SFP_MOD_DEF0_I        : in    std_logic_vector(0 downto 0);
    SFP_MOD_DEF1_IO       : inout std_logic_vector(0 downto 0);
    SFP_MOD_DEF2_IO       : inout std_logic_vector(0 downto 0);
    
    MGTREFCLK0_P          : in    std_logic;
    MGTREFCLK0_N          : in    std_logic;
--    MGTREFCLK1_P          : in    std_logic;
--    MGTREFCLK1_N          : in    std_logic;
    
    FPGA_CLK_P            : in std_logic;
    FPGA_CLK_N            : in std_logic;
    BAK_CLK_P            : in std_logic;
    BAK_CLK_N            : in std_logic;
    BAK2_CLK_P            : in std_logic;
    BAK2_CLK_N            : in std_logic;
    
    AUX0_P            : out std_logic;
    AUX0_N            : out std_logic;    
    testaux0          : out std_logic;    
    testsysclk        : out std_logic;
    testgtrefclk : out std_logic;
    testfpgaclk : out std_logic;
    
    QSPI_CS               : out   std_logic;
    QSPI_DQ0              : out   std_logic;
    QSPI_DQ1              : in    std_logic;
    --QSPI_DQ2              : in    std_logic
    --QSPI_DQ3              : in    std_logic
    
    UART_TX             : out std_logic;
    UART_RX             : in std_logic;
    
    LED : out std_logic_vector(1 downto 0)
    );
end MD10_top;

architecture Behavioral of MD10_top is

    signal clk_sys           : std_logic;
    signal mgtrefclk,mgtrefclk_bufg : std_logic;
    signal pps,ppsd1 : std_logic;
    signal tm_time_valid : std_logic;
    signal tm_tai : std_logic_vector(39 downto 0);
    signal tm_cycles : std_logic_vector(27 downto 0);
    signal link_ok,link_act : std_logic;
    signal mac_clk,rst_mac_clk : std_logic;
    signal mac_tx_data,mac_rx_data : std_logic_vector(7 downto 0);
    signal mac_tx_valid,mac_tx_last,mac_tx_ready,mac_tx_error : std_logic;
    signal mac_rx_error,mac_rx_last,mac_rx_valid : std_logic;
    signal my_mac_addr : std_logic_vector(47 downto 0);
    signal my_ip_addr : std_logic_vector(31 downto 0);
    signal gmii_clk_o,rst_gmii_o : std_logic;
    signal gmii_txd,gmii_rxd : std_logic_vector(7 downto 0);
    signal gmii_tx_en,gmii_tx_er,gmii_rx_dv,gmii_rx_er : std_logic;
    signal fpga_clk : std_logic;

    
begin
    Inst_wr_nem: entity work.wr_nem_core_k7
    port map(
    WRNEM_VER => WRNEM_VER,
    ONE_WIRE => ONE_WIRE,
    CLK_62M5_DMTD => CLK_62M5_DMTD,
    DAC_LDAC_N         => DAC_LDAC_N,
    DAC_SCLK           => DAC_SCLK,
    DAC_SYNC_N         => DAC_SYNC_N,
    DAC_SDI            => DAC_SDI,
    DAC_SDO            => DAC_SDO,

    DAC_DMTD_LDAC_N    => DAC_DMTD_LDAC_N,
    DAC_DMTD_SCLK      => DAC_DMTD_SCLK,
    DAC_DMTD_SYNC_N    => DAC_DMTD_SYNC_N,
    DAC_DMTD_SDI       => DAC_DMTD_SDI,
    DAC_DMTD_SDO       => DAC_DMTD_SDO,
    
    DELAY_EN           => DELAY_EN,
    DELAY_SCLK         => DELAY_SCLK,
    DELAY_SLOAD        => DELAY_SLOAD,
    DELAY_SDIN         => DELAY_SDIN,
    -- AD9516 SPI
    PLL_CS             => PLL_CS,
    PLL_REFSEL         => PLL_REFSEL,
    PLL_RESET          => PLL_RESET,
    PLL_SCLK           => PLL_SCLK,
    PLL_SDO            => PLL_SDO,
    PLL_SYNC           => PLL_SYNC,
    PLL_LOCK           => PLL_LOCK,
    PLL_SDI            => PLL_SDI,
    PLL_STAT           => PLL_STAT,
-----------------------------------------
    -- SFP
    -- SFP_DISABLE_O      => SFP_DISABLE_O,
    -- SFP_O_N            => SFP_O_N,
    -- SFP_O_P            => SFP_O_P,
    -- SFP_I_N            => SFP_I_N,
    -- SFP_I_P            => SFP_I_P,
    -- SFP_FAULT_I        => SFP_FAULT_I,
    -- SFP_LOS_I          => SFP_LOS_I,
    -- SFP_MOD_DEF0_I     => SFP_MOD_DEF0_I,
    -- SFP_MOD_DEF1_IO    => SFP_MOD_DEF1_IO,
    -- SFP_MOD_DEF2_IO    => SFP_MOD_DEF2_IO,
    SFP_DISABLE_O      => SFP_DISABLE_O,
    SFP_O_N            => SFP_O_N,
    SFP_O_P            => SFP_O_P,
    SFP_I_N            => SFP_I_N,
    SFP_I_P            => SFP_I_P,
    SFP_FAULT_I        => SFP_FAULT_I,
    SFP_LOS_I          => SFP_LOS_I,
    SFP_MOD_DEF0_I     => SFP_MOD_DEF0_I,
    SFP_MOD_DEF1_IO    => SFP_MOD_DEF1_IO,
    SFP_MOD_DEF2_IO    => SFP_MOD_DEF2_IO,
    MGTREFCLK0_P       => MGTREFCLK0_P,
    MGTREFCLK0_N       => MGTREFCLK0_N,

    QSPI_CS            => QSPI_CS,
    QSPI_DQ0           => QSPI_DQ0,
    QSPI_DQ1           => QSPI_DQ1,
    --QSPI_DQ2              : in    std_logic
    --QSPI_DQ3              : in    std_logic
    
    UART_TX            => UART_TX,
    UART_RX            => UART_RX,
---- signals
    mgtrefclk_o        => mgtrefclk,
    mgtrefclk_bufg_o   => mgtrefclk_bufg,
    -- wr signals
    clk_sys_o          => clk_sys,
    pps_o              => pps,
    tm_tai_o           => tm_tai,
    tm_cycles_o        => tm_cycles,
    tm_time_valid_o    => tm_time_valid,
    link_ok_o          => link_ok,
    link_act_o         => link_act,
    --------
    qspi_sck_i => '0',
    qspi_arb_i => '0',
    rst_n_i => '1',
    -- MAC interface
    -- mac_clk_o          => mac_clk,
    -- rst_mac_clk_o      => rst_mac_clk,
    -- mac_tx_data        => X"00",
    -- mac_rx_data        => mac_rx_data,
    -- mac_tx_valid       => '0',
    -- mac_tx_last        => '0',
    -- mac_tx_error       => '0',
    -- mac_tx_ready       => mac_tx_ready,
    -- mac_rx_valid       => mac_rx_valid,
    -- mac_rx_last        => mac_rx_last,
    -- mac_rx_error       => mac_rx_error,
    -- my_mac_addr_o => my_mac_addr,
    -- my_ip_addr_o => my_ip_addr
    gmii_clk_o          => gmii_clk_o,
    rst_gmii_o      => rst_gmii_o,
    gmii_txd        => gmii_rxd,
    gmii_tx_en        => gmii_rx_dv,
    gmii_tx_er       => gmii_rx_er,
    gmii_rxd        => x"00",
    gmii_rx_dv       => '0',
    gmii_rx_er       => '0',
    my_mac_addr_o => my_mac_addr,
    my_ip_addr_o => my_ip_addr
    );

  SYNC_DATA_0_OBUF : OBUFDS
  port map(
    O  => AUX0_P,
    OB => AUX0_N,
    I  => tm_time_valid);
  
    
    LED(0) <= link_ok;
    LED(1)  <= link_act;
    	
  testaux0 <= pps;  	
--   testaux0 <= ppsd1;
  -- Inst_ila:entity work.ila_0
  -- port map(
  --   clk => clk_sys,
  --   probe0 => tm_time_valid & pps,
  --   probe1 => tm_tai,
  --   probe2 => tm_cycles,
  --   probe3 => my_ip_addr,
  --   probe4 => my_mac_addr
  -- );
  Inst_bufg: IBUFGDS
  generic map(
    DIFF_TERM => false
  )
  port map(
    I => FPGA_CLK_P,
    IB => FPGA_CLK_N,
    O => fpga_clk
  );
--   p_dff: process(clk_sys)
--   begin
--     if rising_edge(clk_sys) then    
--       ppsd1 <= pps;		                
--     end if;  
--   end process;     	
  testsysclk <= clk_sys;
  testgtrefclk <= mgtrefclk_bufg;
  testfpgaclk <= fpga_clk;
  --  ODDR_sysclk : ODDR
  --  generic map(
  --     DDR_CLK_EDGE => "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
  --     INIT => '0',   -- Initial value for Q port ('1' or '0')
  --     SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
  --  port map (
  --     Q => testsysclk,   -- 1-bit DDR output
  --     C => clk_sys,    -- 1-bit clock input
  --     CE => '1',  -- 1-bit clock enable input
  --     D1 => '0',  -- 1-bit data input (positive edge)
  --     D2 => '1',  -- 1-bit data input (negative edge)
  --     R => '0',    -- 1-bit reset input
  --     S => '0'     -- 1-bit set input
  --  );    	
    	


end Behavioral;
