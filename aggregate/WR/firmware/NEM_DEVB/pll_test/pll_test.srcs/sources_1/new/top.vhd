----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/10/23 15:15:49
-- Design Name: 
-- Module Name: top - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
 Port (
    CLK_62M5_DMTD         : in    std_logic;
    
    MGTREFCLK0_P : in STD_LOGIC;
    MGTREFCLK0_N : in STD_LOGIC;
    -- AD9516 SPI
    PLL_CS                : out   std_logic;
    PLL_REFSEL            : out   std_logic;
    PLL_RESET             : out   std_logic;
    PLL_SCLK              : out   std_logic;
    PLL_SDO               : in   std_logic;
    PLL_SYNC              : out   std_logic;
    PLL_LOCK              : in    std_logic;
    PLL_SDI               : out    std_logic;
    PLL_STAT              : in    std_logic;
    test_o : out std_logic_vector(7 downto 0)
 );
end top;

architecture Behavioral of top is
signal clk_free,GTREFCLK0 : std_logic;
begin
    Inst_ibuf:BUFG
    port map(
        I => CLK_62M5_DMTD,
        O => clk_free
    );
    PLL_RESET            <= '1';
        PLL_REFSEL           <= '0'; -- ref1 (signal low) , ref2 (signal high)
        PLL_SYNC             <= '1';
        cmp_pll_ctrl:entity work.wr_pll_ctrl
        generic map (
            g_project_name => "NORMAL",
            g_spi_clk_freq => x"00000004" -- 1 for 25M, 4 for 62.5M
        )
        port map (
            clk_i        => clk_free,
            rst_n_i      => '1',
            pll_lock_i   => PLL_LOCK,
            pll_status_i => PLL_STAT,
            pll_cs_n_o   => PLL_CS,
            pll_sck_o    => PLL_SCLK,
            pll_mosi_o   => PLL_SDI,
            pll_miso_i   => PLL_SDO,
            -- spi controller status
            done_o       => open
        );

        Inst_gtref:IBUFDS_GTE2
        port map (
            O     => GTREFCLK0,
            ODIV2 => open,
            CEB   => '0',
            I     => MGTREFCLK0_P,
            IB    => MGTREFCLK0_N);
    
    test_o(0) <= GTREFCLK0;
    test_o(7 downto 1) <= (others => '0');
end Behavioral;
