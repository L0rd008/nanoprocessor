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
        while now < 600 ns loop
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
        
        wait for 20 ns;
        Res <= '0';  -- De-assert reset
        while now < 600 ns loop
            Res <= '1';
            wait for CLK_PERIOD * 8;  -- Wait for 10 clock cycles
            Res <= '0';  -- Re-assert reset (optional)
            wait for CLK_PERIOD * 8;  -- Wait for 10 clock cycles
        end loop;
        wait;
    end process;



    -- Stimulus process
    stimulus_process: process
    begin
        -- Test Case 1: Reset Test
        --wait for 10 ns;
        --Res <= '0';
        --wait for 20 ns;
        --Res <= '1';
        
        -- Test Case 2: All Zeros Test
        wait for 10 ns;
        I <= "0000";
        wait for 10 ns;
        --Res <= '0';
        wait for 10 ns;
        I <= "0000";
        wait for 50 ns;
    
        -- Test Case 3: Increment Overflow Test
        wait for 10 ns;
        I <= "1111";
        wait for 50 ns;
    
        -- Test Case 4: Random Input Test
        wait for 10 ns;
        I <= "1010";
        wait for 20 ns;
        I <= "0110";
        wait for 20 ns;
    
        -- Test Case 4: Max Value Test
        wait for 10 ns;
        I <= "1111";
        wait for 50 ns;
    
        -- Test Case 5: Specific Sequence Test
        wait for 10 ns;
        I <= "0001";
        wait for 20 ns;
        I <= "0010";
        wait for 20 ns;
        I <= "0100";
        wait for 20 ns;
        I <= "1000";
        wait for 20 ns;
        
        -- Test Case 1: Reset Test
        --wait for 10 ns;
        --Res <= '0';
        --wait for 20 ns;
        --Res <= '1';
        wait;
    end process;

end Behavioral;
