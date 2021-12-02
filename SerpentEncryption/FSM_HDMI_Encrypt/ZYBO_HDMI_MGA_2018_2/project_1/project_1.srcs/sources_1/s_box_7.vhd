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

entity s_box_7 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_7;

architecture Behavioral of s_box_7 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[7] table
box(0)  <= "0001";	-- box[0]  1
box(1)  <= "1101";	-- box[1]  13
box(2)  <= "1111";	-- box[2]  15
box(3)  <= "0000";	-- box[3]  0
box(4)  <= "1110";	-- box[4]  14
box(5)  <= "1000";	-- box[5]  8
box(6)  <= "0010";	-- box[6]  2
box(7)  <= "1011";	-- box[7]  11
box(8)  <= "0111";	-- box[8]  7
box(9)  <= "0100";	-- box[9]  4
box(10) <= "1100";	-- box[10] 12
box(11) <= "1010";	-- box[11] 10
box(12) <= "1001";	-- box[12] 9
box(13) <= "0011";	-- box[13] 3
box(14) <= "0101";	-- box[14] 5
box(15) <= "0110";	-- box[15] 6

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;