library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter_TB is
end ProgramCounter_TB;

architecture Behavioral of ProgramCounter_TB is

    constant CLK_PERIOD : time := 10 ns;  -- Clock period definition

    signal Clk : std_logic := '0';  -- Clock signal
    signal Res : std_logic := '0';  -- Reset signal
    signal I : std_logic_vector(3 downto 0) := (others => '0');  -- Input signal
    signal Y : std_logic_vector(3 downto 0);  -- Output signal

begin

    -- Instantiate the ProgramCounter entity
    UUT: entity work.ProgramCounter
        port map(
            Clk => Clk,
            Res => Res,
            I => I,
            Y => Y
        );

    -- Clock process (10 ns period)
    clk_process: process
    begin
        while now < 100 ns loop
            Clk <= '0';
            wait for CLK_PERIOD / 2;
            Clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Reset process
    reset_process: process
    begin
        Res <= '1';  -- Assert reset
        wait for 20 ns;
        Res <= '0';  -- De-assert reset
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        wait for 30 ns;
        I <= "0001";  -- Example input value
        wait for 20 ns;
        I <= "0010";  -- Example input value
        wait for 20 ns;
        -- Continue with more test cases as needed
        wait;
    end process;

end Behavioral;
