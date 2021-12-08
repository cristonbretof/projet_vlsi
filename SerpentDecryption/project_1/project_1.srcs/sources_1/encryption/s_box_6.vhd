----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2021 03:01:44 PM
-- Design Name: 
-- Module Name: s_box_1 - Behavioral
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
use ieee.NUMERIC_STD.all;

entity s_box_6 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_6;

architecture Behavioral of s_box_6 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[6] table
box(0)  <= "0111";	-- box[0]  7
box(1)  <= "0010";	-- box[1]  2
box(2)  <= "1100";	-- box[2]  12
box(3)  <= "0101";	-- box[3]  5
box(4)  <= "1000";	-- box[4]  8
box(5)  <= "0100";	-- box[5]  4
box(6)  <= "0110";	-- box[6]  6
box(7)  <= "1011";	-- box[7]  11
box(8)  <= "1110";	-- box[8]  14
box(9)  <= "1001";	-- box[9]  9
box(10) <= "0001";	-- box[10] 1
box(11) <= "1111";	-- box[11] 15
box(12) <= "1101";	-- box[12] 13
box(13) <= "0011";	-- box[13] 3
box(14) <= "1010";	-- box[14] 10
box(15) <= "0000";	-- box[15] 0

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;