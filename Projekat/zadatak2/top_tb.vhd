library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
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
    -- Instantiate the Unit Under Test (UUT)
    uut: top
        Port map (
            sig => sig,
            level => level,
            timee => timee,
            bflag => bflag,
            eflag => eflag,
            fclk => fclk
        );

    -- Clock process definitions
    clk_process :process
    begin
        fclk <= '0';
        wait for clk_period/2;
        fclk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        sig <= '0';
        level <= '0';
        bflag <= '0';
        wait for 20 ns;

        -- Start measurement for level '0'
        bflag <= '1';
        wait for clk_period;
        bflag <= '0';

        -- Test signal pattern as shown in the image
        wait for 100 ns; -- Signal remains 0 for 100 ns
        sig <= '1';
        wait for 50 ns;  -- Signal remains 1 for 50 ns
        sig <= '0';
        wait for 50 ns;  -- Signal remains 0 for 50 ns

        -- Wait for the end of measurement
        wait for 50 ns;

        -- Start measurement for level '1'
        level <= '1';
        bflag <= '1';
        wait for clk_period;
        bflag <= '0';

        -- Repeat the same test signal pattern for level '1' measurement
        wait for 100 ns; -- Signal remains 0 for 100 ns
        sig <= '1';
        wait for 50 ns;  -- Signal remains 1 for 50 ns
        sig <= '0';
        wait for 50 ns;  -- Signal remains 0 for 50 ns

        -- Wait for the end of measurement
        wait for 50 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
