
-- ----------------------------------------------
-- File Name: Multichannel_FIR_Filter_fil.vhd
-- Created:   2026-01-14 09:45:09
-- Copyright  2026 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY UNISIM;
USE UNISIM.VComponents.all;
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY Multichannel_FIR_Filter_fil IS 
PORT (
      ETH_TXCLK                       : IN  std_logic;
      ETH_COL                         : IN  std_logic;
      ETH_RXCLK                       : IN  std_logic;
      ETH_CRS                         : IN  std_logic;
      sysclk                          : IN  std_logic;
      ETH_RXDV                        : IN  std_logic;
      ETH_RXER                        : IN  std_logic;
      ETH_RXD                         : IN  std_logic_vector(3 DOWNTO 0);
      ETH_MDC                         : OUT std_logic;
      ETH_TXD                         : OUT std_logic_vector(3 DOWNTO 0);
      ETH_TXER                        : OUT std_logic;
      ETH_RESET_n                     : OUT std_logic;
      ETH_CLK25                       : OUT std_logic;
      ETH_TXEN                        : OUT std_logic;
      ETH_MDIO                        : INOUT std_logic
);
END Multichannel_FIR_Filter_fil;

ARCHITECTURE rtl of Multichannel_FIR_Filter_fil IS

COMPONENT MWClkMgr IS 
PORT (
      RXCLK_IN                        : IN  std_logic;
      CLK_IN                          : IN  std_logic;
      TXCLK_IN                        : IN  std_logic;
      RESET_IN                        : IN  std_logic;
      CLK25                           : OUT std_logic;
      TXCLK_OUT                       : OUT std_logic;
      RESET_OUT                       : OUT std_logic;
      RXCLK_OUT                       : OUT std_logic;
      DUTCLK                          : OUT std_logic
);
END COMPONENT;

COMPONENT MWMII2GMII IS 
PORT (
      rxclk                           : IN  std_logic;
      txclk                           : IN  std_logic;
      reset                           : IN  std_logic;
      mii_rxdv                        : IN  std_logic;
      mii_rxer                        : IN  std_logic;
      mii_col                         : IN  std_logic;
      mii_crs                         : IN  std_logic;
      mii_rxd                         : IN  std_logic_vector(3 DOWNTO 0);
      txerror                         : IN  std_logic;
      txen                            : IN  std_logic;
      txd                             : IN  std_logic_vector(7 DOWNTO 0);
      mii_txd                         : OUT std_logic_vector(3 DOWNTO 0);
      mii_txen                        : OUT std_logic;
      mii_txer                        : OUT std_logic;
      rxdvld                          : OUT std_logic;
      rxerror                         : OUT std_logic;
      rxd                             : OUT std_logic_vector(7 DOWNTO 0);
      col                             : OUT std_logic;
      crs                             : OUT std_logic;
      txclk_en                        : OUT std_logic;
      rxclk_en                        : OUT std_logic
);
END COMPONENT;

COMPONENT FILCore IS 
PORT (
      clk                             : IN  std_logic;
      reset                           : IN  std_logic;
      txclk_en                        : IN  std_logic;
      rxclk_en                        : IN  std_logic;
      gmii_rxd                        : IN  std_logic_vector(7 DOWNTO 0);
      gmii_rx_dv                      : IN  std_logic;
      gmii_col                        : IN  std_logic;
      gmii_rx_er                      : IN  std_logic;
      gmii_rx_clk                     : IN  std_logic;
      gmii_tx_clk                     : IN  std_logic;
      gmii_crs                        : IN  std_logic;
      gmii_txd                        : OUT std_logic_vector(7 DOWNTO 0);
      gmii_tx_en                      : OUT std_logic;
      gmii_tx_er                      : OUT std_logic
);
END COMPONENT;

COMPONENT MWMdioBasic IS 
PORT (
      RESET_IN                        : IN  std_logic;
      ETH_RESET_n                     : OUT std_logic;
      ETH_MDC                         : OUT std_logic;
      ETH_MDIO                        : INOUT std_logic
);
END COMPONENT;

  SIGNAL dutClk                           : std_logic; -- boolean
  SIGNAL rst                              : std_logic; -- boolean
  SIGNAL ClkIn                            : std_logic; -- boolean
  SIGNAL rxclk                            : std_logic; -- boolean
  SIGNAL txclk                            : std_logic; -- boolean
  SIGNAL rxd                              : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL txd                              : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL txclk_en                         : std_logic; -- boolean
  SIGNAL rxclk_en                         : std_logic; -- boolean
  SIGNAL dcm_reset                        : std_logic; -- boolean
  SIGNAL BitZero                          : std_logic; -- boolean
  SIGNAL rxdvld                           : std_logic; -- boolean
  SIGNAL rxerror                          : std_logic; -- boolean
  SIGNAL txen                             : std_logic; -- boolean
  SIGNAL txerror                          : std_logic; -- boolean
  SIGNAL col                              : std_logic; -- boolean
  SIGNAL crs                              : std_logic; -- boolean
  SIGNAL rst_n                            : std_logic; -- boolean

BEGIN

u_IBUFG: IBUFG 
PORT MAP(
        O                    => ClkIn,
        I                    => sysclk
);

u_ClockManager: MWClkMgr 
PORT MAP(
        RXCLK_IN             => ETH_RXCLK,
        CLK25                => ETH_CLK25,
        CLK_IN               => ClkIn,
        TXCLK_OUT            => txclk,
        RESET_OUT            => rst,
        RXCLK_OUT            => rxclk,
        DUTCLK               => dutClk,
        TXCLK_IN             => ETH_TXCLK,
        RESET_IN             => dcm_reset
);

u_mii2gmii: MWMII2GMII 
PORT MAP(
        rxclk                => rxclk,
        txclk                => txclk,
        reset                => rst,
        mii_rxdv             => ETH_RXDV,
        mii_rxer             => ETH_RXER,
        mii_col              => ETH_COL,
        mii_crs              => ETH_CRS,
        mii_rxd              => ETH_RXD,
        mii_txd              => ETH_TXD,
        mii_txen             => ETH_TXEN,
        mii_txer             => ETH_TXER,
        rxdvld               => rxdvld,
        rxerror              => rxerror,
        txerror              => txerror,
        txen                 => txen,
        txd                  => txd,
        rxd                  => rxd,
        col                  => col,
        crs                  => crs,
        txclk_en             => txclk_en,
        rxclk_en             => rxclk_en
);

u_FILCore: FILCore 
PORT MAP(
        clk                  => dutClk,
        reset                => rst,
        txclk_en             => txclk_en,
        rxclk_en             => rxclk_en,
        gmii_txd             => txd,
        gmii_tx_en           => txen,
        gmii_rxd             => rxd,
        gmii_rx_dv           => rxdvld,
        gmii_col             => col,
        gmii_tx_er           => txerror,
        gmii_rx_er           => rxerror,
        gmii_rx_clk          => rxclk,
        gmii_tx_clk          => txclk,
        gmii_crs             => crs
);

u_MWMdioAdv: MWMdioBasic 
PORT MAP(
        RESET_IN             => rst,
        ETH_RESET_n          => ETH_RESET_n,
        ETH_MDIO             => ETH_MDIO,
        ETH_MDC              => ETH_MDC
);

dcm_reset <= BitZero;

BitZero <= '0';

END;
