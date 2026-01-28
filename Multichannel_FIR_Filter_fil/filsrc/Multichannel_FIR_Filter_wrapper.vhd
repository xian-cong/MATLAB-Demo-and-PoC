
-- ----------------------------------------------
-- File Name: Multichannel_FIR_Filter_wrapper.vhd
-- Created:   2026-01-14 09:07:47
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
      dout                            : OUT std_logic_vector(87 DOWNTO 0)
);
END Multichannel_FIR_Filter_wrapper;

ARCHITECTURE rtl of Multichannel_FIR_Filter_wrapper IS

COMPONENT Multichannel_FIR_Filter IS 
PORT (
      reset                           : IN  std_logic;
      in1_1                           : IN  std_logic_vector(15 DOWNTO 0);
      in1_0                           : IN  std_logic_vector(15 DOWNTO 0);
      clk_enable                      : IN  std_logic;
      clk                             : IN  std_logic;
      out1_0                          : OUT std_logic_vector(37 DOWNTO 0);
      out1_1                          : OUT std_logic_vector(37 DOWNTO 0);
      ce_out                          : OUT std_logic
);
END COMPONENT;

  SIGNAL in1_0                            : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL in1_0_tmp                        : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL in1_1                            : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL in1_1_tmp                        : std_logic_vector(15 DOWNTO 0); -- std16
  SIGNAL ce_out                           : std_logic; -- boolean
  SIGNAL ce_out_tmp                       : std_logic; -- boolean
  SIGNAL zero0                            : std_logic_vector(6 DOWNTO 0); -- std7
  SIGNAL out1_0                           : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL out1_0_tmp                       : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL zero1                            : std_logic_vector(1 DOWNTO 0); -- std2
  SIGNAL out1_1                           : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL out1_1_tmp                       : std_logic_vector(37 DOWNTO 0); -- std38
  SIGNAL zero2                            : std_logic_vector(1 DOWNTO 0); -- std2
  SIGNAL tmpconcat                        : std_logic_vector(87 DOWNTO 0); -- std88

BEGIN

u_Multichannel_FIR_Filter: Multichannel_FIR_Filter 
PORT MAP(
        out1_0               => out1_0,
        reset                => reset,
        in1_1                => in1_1,
        in1_0                => in1_0,
        clk_enable           => enb,
        clk                  => clk,
        out1_1               => out1_1,
        ce_out               => ce_out
);

in1_0 <= in1_0_tmp;
in1_0_tmp <= din(15 DOWNTO 0);
in1_1 <= in1_1_tmp;
in1_1_tmp <= din(31 DOWNTO 16);
ce_out_tmp <= ce_out;

ce_out_tmp <= ce_out;

zero0 <= (others => '0');
out1_0_tmp <= out1_0;
out1_0_tmp <= out1_0;
zero1 <= (others => '0');
out1_1_tmp <= out1_1;
out1_1_tmp <= out1_1;
zero2 <= (others => '0');
dout <= zero2 & out1_1_tmp & zero1 & out1_0_tmp & zero0 & ce_out_tmp;

END;
