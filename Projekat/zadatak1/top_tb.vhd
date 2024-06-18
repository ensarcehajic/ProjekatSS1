LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is

    component top is
        Port (
            rgbin : in std_logic_vector(15 downto 0);
            rgbout : out std_logic_vector(23 downto 0);
            fclk : in std_logic
        );
    end component;

    signal rgbin : std_logic_vector(15 downto 0);
    signal rgbout : std_logic_vector(23 downto 0);
    signal fclk : std_logic := '0';
    constant fclk_period : time := 10 ns;

begin

    uut: top 
        port map (
            rgbin => rgbin,
            rgbout => rgbout,
            fclk => fclk
        );

    fclk_process: process
    begin
        fclk <= '0';
        wait for fclk_period / 2;
        fclk <= '1';
        wait for fclk_period / 2;
    end process;

    simulation: process
    begin
        rgbin <= X"2425";
        wait for fclk_period;

        rgbin <= X"DEAD";
        wait for fclk_period;

        rgbin <= X"FADE";
        wait for fclk_period;
        wait for fclk_period * 2;
        wait;
    end process;

end Behavioral;
