----------------------------------------------------------------------------------
-- Module Name: flash_led_top_tb - Behavioral
-- Description: Testbench for flash_led_top. Uses a small MAX_COUNT so the LED
--              shift is observable quickly in simulation.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flash_led_top_tb is
--  Port ( );
end flash_led_top_tb;

architecture Behavioral of flash_led_top_tb is

    component flash_led_top is
        generic (
            MAX_COUNT : integer;
            NUM_LEDS  : integer
        );
        Port (
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            led : out STD_LOGIC_VECTOR(NUM_LEDS - 1 downto 0)
        );
    end component;

    -- Small values so simulation runs fast
    constant MAX_COUNT_TB : integer := 5;
    constant NUM_LEDS_TB  : integer := 8;
    constant CLK_PERIOD   : time    := 10 ns;   -- 100 MHz

    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal led : STD_LOGIC_VECTOR(NUM_LEDS_TB - 1 downto 0);

begin

    -- Device under test
    uut : flash_led_top
        generic map (
            MAX_COUNT => MAX_COUNT_TB,
            NUM_LEDS  => NUM_LEDS_TB
        )
        port map (
            clk => clk,
            rst => rst,
            led => led
        );

    -- Clock generation
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus
    stim_process : process
    begin
        -- Apply reset
        rst <= '1';
        wait for CLK_PERIOD * 3;
        rst <= '0';

        -- Let it run through several shifts (enough to wrap around)
        wait for CLK_PERIOD * MAX_COUNT_TB * (NUM_LEDS_TB + 2);

        -- Mid-run reset to check it returns to the initial pattern
        rst <= '1';
        wait for CLK_PERIOD * 3;
        rst <= '0';

        wait for CLK_PERIOD * MAX_COUNT_TB * NUM_LEDS_TB;

        -- End simulation
        report "Simulation finished successfully." severity note;
        wait;
    end process;

end Behavioral;