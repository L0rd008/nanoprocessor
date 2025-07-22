----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 10:49:55 PM
-- Design Name: 
-- Module Name: PROM - Behavioral
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
use ieee.numeric_std.all; 


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROM is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (13 downto 0));
end PROM;

architecture Behavioral of PROM is

type rom_type is array (0 to 15) of std_logic_vector (13 downto 0);
    signal Program_ROM : rom_type :=(
"00100110000011", --MOVI R3, 3
    "00101110000101", --MOVI R7, 5
    "00101000000101", --MOVI R4, 5
    "10101110110110", --IFAG R7, R3, 7
    "10111110111001", --IFE R7, R3, 10
    "10010000000000", --NOP
    "01011110100000", --DEC R7
    "00110000000011", --JZR R0, 4
    "10010000000000", --NOP
    "01001110010000", --INC R7
    "11001111001001", --IFNE R7, R4, 10
    "10111111001101", --IFE R7, R4, 14
    "10010000000000", --NOP
    "01000110010000", --INC R3
    "10111110111110", --IFE R7, R3, 15
    "11001110110011" --IFNE R7, R3, 4




        );

begin

O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;