----------------------------------------------------------------------------------
-- Module Name: counter - Behavioral
-- Description: Clock divider. Produces a one-cycle 'tick' pulse every MAX_COUNT
--              clock cycles to control the LED shift speed.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    generic (
        MAX_COUNT : integer := 5000000   -- e.g. 100 MHz / 5e6 = 20 Hz
    );
    Port (
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        tick : out STD_LOGIC
    );
end counter;

architecture Behavioral of counter is
    signal cnt : unsigned(31 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                cnt  <= (others => '0');
                tick <= '0';
            elsif cnt = to_unsigned(MAX_COUNT - 1, cnt'length) then
                cnt  <= (others => '0');
                tick <= '1';
            else
                cnt  <= cnt + 1;
                tick <= '0';
            end if;
        end if;
    end process;
end Behavioral;