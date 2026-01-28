
-- ----------------------------------------------
-- File Name: MWClkMgr.vhd
-- Created:   2026-01-14 09:27:54
-- Copyright  2026 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY UNISIM;
USE UNISIM.VComponents.all;
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY MWClkMgr IS 
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
END MWClkMgr;

ARCHITECTURE rtl of MWClkMgr IS

  SIGNAL clk0                             : std_logic; -- boolean
  SIGNAL clkfb0                           : std_logic; -- boolean
  SIGNAL LOCKED                           : std_logic; -- boolean
  SIGNAL notLocked                        : std_logic; -- boolean

BEGIN

u_dcm: MMCM_BASE 
GENERIC MAP (BANDWIDTH => "OPTIMIZED",
CLOCK_HOLD => FALSE,
STARTUP_WAIT => FALSE,
DIVCLK_DIVIDE => 1,
CLKFBOUT_MULT_F => 10.000,
CLKFBOUT_PHASE => 0.000,
CLKOUT0_DIVIDE_F => 40.000,
CLKOUT0_PHASE => 0.000,
CLKOUT0_DUTY_CYCLE => 0.500,
CLKOUT1_DIVIDE => 40,
CLKOUT1_PHASE => 0.000,
CLKOUT1_DUTY_CYCLE => 0.500,
CLKIN1_PERIOD => 10.000,
REF_JITTER1 => 0.010
)
PORT MAP(
        CLKOUT3B             => OPEN,
        LOCKED               => LOCKED,
        CLKFBIN              => clkfb0,
        CLKOUT2B             => OPEN,
        CLKOUT4              => OPEN,
        CLKFBOUTB            => OPEN,
        CLKOUT1B             => OPEN,
        CLKFBOUT             => clk0,
        CLKOUT1              => CLK25,
        RST                  => RESET_IN,
        CLKIN1               => CLK_IN,
        CLKOUT6              => OPEN,
        PWRDWN               => '0',
        CLKOUT5              => OPEN,
        CLKOUT0B             => OPEN,
        CLKOUT3              => OPEN,
        CLKOUT2              => OPEN,
        CLKOUT0              => DUTCLK
);

u_BUFG: BUFG 
PORT MAP(
        O                    => clkfb0,
        I                    => clk0
);

u_IBUFG: IBUFG 
PORT MAP(
        O                    => TXCLK_OUT,
        I                    => TXCLK_IN
);

u_IBUFG_inst1: IBUFG 
PORT MAP(
        O                    => RXCLK_OUT,
        I                    => RXCLK_IN
);

RESET_OUT <=  NOT LOCKED;

END;
