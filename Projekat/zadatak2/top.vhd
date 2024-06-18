library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    Port (
        sig   : in  std_logic;
        level : in  std_logic;
        timee : out unsigned(31 downto 0);
        bflag : in  std_logic;
        eflag : out std_logic;
        fclk  : in  std_logic
    );
end top;

architecture Behavioral of top is
    signal brojac : unsigned(31 downto 0) := (others => '0');
    signal mjerenje : std_logic := '0';
begin
    process(fclk)
    begin
        if rising_edge(fclk) then
            if bflag = '1' and mjerenje = '0' then
                brojac <= (others => '0');
                mjerenje <= '1';
                eflag <= '0';
            elsif mjerenje = '1' then
                if sig = level then
                    brojac <= brojac + 1;
                else
                    mjerenje <= '0';
                    timee <= brojac;
                    eflag <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
