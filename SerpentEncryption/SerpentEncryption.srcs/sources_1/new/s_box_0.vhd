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

entity s_box_0 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_0;

architecture Behavioral of s_box_0 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[0] table
box(0)  <= "0011";	 -- 3
box(1)  <= "1000";	 -- 8
box(2)  <= "1111";	 -- 15
box(3)  <= "0001";	 -- 1
box(4)  <= "1010";	 -- 10
box(5)  <= "0110";	 -- 6
box(6)  <= "0101";	 -- 5
box(7)  <= "1011";	 -- 11
box(8)  <= "1110";	 -- 14
box(9)  <= "1101";	 -- 13
box(10) <= "0100";   -- 4
box(11) <= "0010";   -- 2
box(12) <= "0111";   -- 7
box(13) <= "0000";   -- 0
box(14) <= "1001";   -- 9
box(15) <= "1100";   -- 12

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;