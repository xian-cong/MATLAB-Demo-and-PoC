----------------------------------------------------------------------------------
-- Module Name: flash_led_top - Behavioral
-- Description: Top level. Instantiates the counter (speed control) and the
--              flash_led_ctl (running-light pattern) and connects them.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flash_led_top is
    generic (
        MAX_COUNT : integer := 5000000;
        NUM_LEDS  : integer := 8
    );
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        led : out STD_LOGIC_VECTOR(NUM_LEDS - 1 downto 0)
    );
end flash_led_top;

architecture Behavioral of flash_led_top is

    component counter is
        generic ( MAX_COUNT : integer );
        Port (
            clk  : in  STD_LOGIC;
            rst  : in  STD_LOGIC;
            tick : out STD_LOGIC
        );
    end component;

    component flash_led_ctl is
        generic ( NUM_LEDS : integer );
        Port (
            clk  : in  STD_LOGIC;
            rst  : in  STD_LOGIC;
            tick : in  STD_LOGIC;
            led  : out STD_LOGIC_VECTOR(NUM_LEDS - 1 downto 0)
        );
    end component;

    signal tick_s : STD_LOGIC;

begin

    u_counter : counter
        generic map ( MAX_COUNT => MAX_COUNT )
        port map (
            clk  => clk,
            rst  => rst,
            tick => tick_s
        );

    u_ctl : flash_led_ctl
        generic map ( NUM_LEDS => NUM_LEDS )
        port map (
            clk  => clk,
            rst  => rst,
            tick => tick_s,
            led  => led
        );

end Behavioral;