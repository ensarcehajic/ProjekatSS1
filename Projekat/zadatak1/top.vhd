LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity top is
Port(
rgbin : in std_logic_vector (15 downto 0);
rgbout : out std_logic_vector (23 downto 0);
fclk : in std_logic
);
end top;

architecture Behavioral of top is
begin
    process (fclk)
    begin
        if rising_edge (fclk) then
            rgbout (23 downto 16) <= rgbin (15 downto 11) & rgbin (15 downto 13);
            rgbout (15 downto 8) <= rgbin (10 downto 5) & rgbin (10 downto 9);
            rgbout (7 downto 0) <= rgbin (4 downto 0) & rgbin (3 downto 1);
        end if;
    end process;
end Behavioral;