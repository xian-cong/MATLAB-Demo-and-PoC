
-- ----------------------------------------------
-- File Name: FILCore.vhd
-- Created:   2026-01-14 09:45:09
-- Copyright  2026 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY FILCore IS 
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
END FILCore;

ARCHITECTURE rtl of FILCore IS

COMPONENT FILCommLayer IS 
PORT (
      clk                             : IN  std_logic;
      reset                           : IN  std_logic;
      txclk_en                        : IN  std_logic;
      rxclk_en                        : IN  std_logic;
      dut_dinrdy                      : IN  std_logic;
      dut_dout                        : IN  std_logic_vector(7 DOWNTO 0);
      dut_doutvld                     : IN  std_logic;
      gmii_rxd                        : IN  std_logic_vector(7 DOWNTO 0);
      gmii_rx_dv                      : IN  std_logic;
      gmii_col                        : IN  std_logic;
      gmii_rx_er                      : IN  std_logic;
      gmii_rx_clk                     : IN  std_logic;
      gmii_tx_clk                     : IN  std_logic;
      gmii_crs                        : IN  std_logic;
      dut_rst                         : OUT std_logic;
      dut_din                         : OUT std_logic_vector(7 DOWNTO 0);
      dut_dinvld                      : OUT std_logic;
      simcycle                        : OUT std_logic_vector(15 DOWNTO 0);
      dut_doutrdy                     : OUT std_logic;
      gmii_txd                        : OUT std_logic_vector(7 DOWNTO 0);
      gmii_tx_en                      : OUT std_logic;
      gmii_tx_er                      : OUT std_logic
);
END COMPONENT;

COMPONENT mwfil_chiftop IS 
PORT (
      clk                             : IN  std_logic;
      reset                           : IN  std_logic;
      din                             : IN  std_logic_vector(7 DOWNTO 0);
      din_valid                       : IN  std_logic;
      dout_ready                      : IN  std_logic;
      simcycle                        : IN  std_logic_vector(15 DOWNTO 0);
      din_ready                       : OUT std_logic;
      dout                            : OUT std_logic_vector(7 DOWNTO 0);
      dout_valid                      : OUT std_logic
);
END COMPONENT;

  SIGNAL dut_rst                          : std_logic; -- boolean
  SIGNAL dut_din                          : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL dut_dinvld                       : std_logic; -- boolean
  SIGNAL dut_dinrdy                       : std_logic; -- boolean
  SIGNAL simcycle                         : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL dut_dout                         : std_logic_vector(7 DOWNTO 0); -- std8
  SIGNAL dut_doutvld                      : std_logic; -- boolean
  SIGNAL dut_doutrdy                      : std_logic; -- boolean

BEGIN

u_FILCommLayer: FILCommLayer 
PORT MAP(
        clk                  => clk,
        reset                => reset,
        txclk_en             => txclk_en,
        rxclk_en             => rxclk_en,
        dut_rst              => dut_rst,
        dut_din              => dut_din,
        dut_dinvld           => dut_dinvld,
        dut_dinrdy           => dut_dinrdy,
        simcycle             => simcycle,
        dut_dout             => dut_dout,
        dut_doutvld          => dut_doutvld,
        dut_doutrdy          => dut_doutrdy,
        gmii_txd             => gmii_txd,
        gmii_tx_en           => gmii_tx_en,
        gmii_rxd             => gmii_rxd,
        gmii_rx_dv           => gmii_rx_dv,
        gmii_col             => gmii_col,
        gmii_tx_er           => gmii_tx_er,
        gmii_rx_er           => gmii_rx_er,
        gmii_rx_clk          => gmii_rx_clk,
        gmii_tx_clk          => gmii_tx_clk,
        gmii_crs             => gmii_crs
);

u_mwfil_chiftop: mwfil_chiftop 
PORT MAP(
        clk                  => clk,
        reset                => dut_rst,
        din                  => dut_din,
        din_valid            => dut_dinvld,
        din_ready            => dut_dinrdy,
        dout                 => dut_dout,
        dout_valid           => dut_doutvld,
        dout_ready           => dut_doutrdy,
        simcycle             => simcycle
);


END;
