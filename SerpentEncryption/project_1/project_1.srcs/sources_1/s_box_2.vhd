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

entity s_box_2 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_2;

architecture Behavioral of s_box_2 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[2] table
box(0)  <= "1000";	-- box[0]  8
box(1)  <= "0110";	-- box[1]  6
box(2)  <= "0111";	-- box[2]  7
box(3)  <= "1001";	-- box[3]  9
box(4)  <= "0011";	-- box[4]  3
box(5)  <= "1100";	-- box[5]  12
box(6)  <= "1010";	-- box[6]  10
box(7)  <= "1111";	-- box[7]  15
box(8)  <= "1101";	-- box[8]  13
box(9)  <= "0001";	-- box[9]  1
box(10) <= "1110";  -- box[10] 14
box(11) <= "0100";  -- box[11] 4
box(12) <= "0000";  -- box[12] 0
box(13) <= "1011";  -- box[13] 11
box(14) <= "0101";  -- box[14] 5
box(15) <= "0010";  -- box[15] 2

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;