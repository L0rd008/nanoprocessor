----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2024 09:40:43 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is

component ProgramCounter
port(Clk : in STD_LOGIC;
    Res : in std_logic;
           I : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clk : std_logic := '0';
signal Res : std_logic;
signal I, Y : std_Logic_vector(3 downto 0);

begin

UUT : ProgramCounter
port map(
Clk => Clk,
    Res => Res,
           I => I,
           Y => Y);
           
           

clk_process: process
begin
while now < 1000 ns loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
end process;

process begin

Res <='1';
I <= "0000";
wait for 100 ns;

Res<='0';
wait for 100 ns;

I <= "0010";

wait for 97 ns;

I <= "0100";

wait for 100 ns;

I <= "1000";

wait;

end process;

end Behavioral;
