----------------------------------------------------------------------------------
-- Module Name: flash_led_ctl - Behavioral
-- Description: Running-light controller. On each 'tick' the single lit LED
--              shifts one position, wrapping around at the end.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity flash_led_ctl is
    generic (
        NUM_LEDS : integer := 8
    );
    Port (
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        tick : in  STD_LOGIC;
        led  : out STD_LOGIC_VECTOR(NUM_LEDS - 1 downto 0)
    );
end flash_led_ctl;

architecture Behavioral of flash_led_ctl is
    signal pattern : std_logic_vector(NUM_LEDS - 1 downto 0) := (0 => '1', others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                pattern <= (0 => '1', others => '0');
            elsif tick = '1' then
                -- rotate left: MSB wraps back to LSB
                pattern <= pattern(NUM_LEDS - 2 downto 0) & pattern(NUM_LEDS - 1);
            end if;
        end if;
    end process;

    led <= pattern;
end Behavioral;