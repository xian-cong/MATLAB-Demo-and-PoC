
-- ----------------------------------------------
-- File Name: Multichannel_FIR_Filter_wrapper.vhd
-- Created:   2026-01-14 11:17:58
-- Copyright  2026 MathWorks, Inc.
-- ----------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


ENTITY Multichannel_FIR_Filter_wrapper IS 
PORT (
      clk                             : IN  std_logic;
      enb                             : IN  std_logic;
      reset                           : IN  std_logic;
      din                             : IN  std_logic_vector(31 DOWNTO 0);
      dout                            : OUT std_logic_vector(79 DOWNTO 0)
);
END Multichannel_FIR_Filter_wrapper;

ARCHITECTURE rtl of Multichannel_FIR_Filter_wrapper IS

COMPONENT Multichannel_FIR_Filter IS 
PORT (
      reset                           : IN  std_logic;
      In1_1                           : IN  std_logic_vector(15 DOWNTO 0);
      clk_enable                      : IN  std_logic;
      clk                             : IN  std_logic;
      In1_0                           : IN  std_logic_vector(15 DOWNTO 0);
      Out1_0                          : OUT std_logic_vector(37 DOWNTO 0);
      Out1_1                          : OUT std_logic_vector(37 DOWNTO 0)
);
END COMPONENT;

  SIGNAL In1_0                            : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL In1_0_tmp                        : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL In1_1                            : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL In1_1_tmp                        : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL Out1_0                           : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL Out1_0_tmp                       : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL zero0                            : std_logic_vector(1 DOWNTO 0); -- std2
  SIGNAL Out1_1                           : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL Out1_1_tmp                       : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL zero1                            : std_logic_vector(1 DOWNTO 0); -- std2
  SIGNAL tmpconcat                        : std_logic_vector(79 DOWNTO 0); -- std80

BEGIN

u_Multichannel_FIR_Filter: Multichannel_FIR_Filter 
PORT MAP(
        Out1_0               => Out1_0,
        reset                => reset,
        Out1_1               => Out1_1,
        In1_1                => In1_1,
        clk_enable           => enb,
        clk                  => clk,
        In1_0                => In1_0
);

In1_0 <= In1_0_tmp;
In1_0_tmp <= din(15 DOWNTO 0);
In1_1 <= In1_1_tmp;
In1_1_tmp <= din(31 DOWNTO 16);
Out1_0_tmp <= Out1_0;
Out1_0_tmp <= Out1_0;
zero0 <= (others => '0');
Out1_1_tmp <= Out1_1;
Out1_1_tmp <= Out1_1;
zero1 <= (others => '0');
dout <= zero1 & Out1_1_tmp & zero0 & Out1_0_tmp;

END;
