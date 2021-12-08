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

entity s_box_5 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_5;

architecture Behavioral of s_box_5 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[5] table
box(0)  <= "1111";	-- box[0]  15
box(1)  <= "0101";	-- box[1]  5
box(2)  <= "0010";	-- box[2]  2
box(3)  <= "1011";	-- box[3]  11
box(4)  <= "0100";	-- box[4]  4
box(5)  <= "1010";	-- box[5]  10
box(6)  <= "1001";	-- box[6]  9
box(7)  <= "1100";	-- box[7]  12
box(8)  <= "0000";	-- box[8]  0
box(9)  <= "0011";	-- box[9]  3
box(10) <= "1110";	-- box[10] 14
box(11) <= "1000";	-- box[11] 8
box(12) <= "1101";	-- box[12] 13
box(13) <= "0110";	-- box[13] 6
box(14) <= "0111";	-- box[14] 7
box(15) <= "0001";	-- box[15] 1

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;