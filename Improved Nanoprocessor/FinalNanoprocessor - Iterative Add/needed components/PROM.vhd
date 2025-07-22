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
"00100110000010", --MOVI R3,2
    "00101110000011", --MOVI R7,3
    "00101100000001", --MOVI R6, 1
    "01101100000000", --NEG R6
    "00001110110000", --ADD R7, R3
    "00000111100000", --ADD R3, R6
    "00110110000110", --JZR R3, 7
    "00110000000100", --JZR R0, 5
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000", --FILLED IN WITH NOP
    "10010000000000" --FILLED IN WITH NOP



        );

begin

O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;