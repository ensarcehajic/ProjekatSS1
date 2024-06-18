library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
    component top
        Port (
            sig   : in  std_logic;
            level : in  std_logic;
            timee : out unsigned(31 downto 0);
            bflag : in  std_logic;
            eflag : out std_logic;
            fclk  : in  std_logic
        );
    end component;

    signal sig   : std_logic := '0';
    signal level : std_logic := '0';
    signal timee : unsigned(31 downto 0);
    signal bflag : std_logic := '0';
    signal eflag : std_logic := '0';
    signal fclk  : std_logic := '0';

    constant clk_period : time := 10 ns;
begin
    uut: top
        Port map (
            sig => sig,
            level => level,
            timee => timee,
            bflag => bflag,
            eflag => eflag,
            fclk => fclk
        );

    clk_process :process
    begin
        fclk <= '0';
        wait for clk_period/2;
        fclk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        
        wait for 20 ns;


        level <= '0';
        bflag <= '1';
        wait for clk_period;
        bflag <= '0';

        
        sig <= '0';
        wait for 100 ns;
    
        sig <= '1';
        wait for 50 ns;
       
        sig <= '0';
        wait for 30 ns;

     
        wait for 50 ns;

       
        level <= '1';
        bflag <= '1';
        wait for clk_period;
        bflag <= '0';

       
        sig <= '1';
        wait for 50 ns;
      
        sig <= '0';
        wait for 50 ns;

       
        wait for 50 ns;

    
        wait;
    end process;

end Behavioral;
