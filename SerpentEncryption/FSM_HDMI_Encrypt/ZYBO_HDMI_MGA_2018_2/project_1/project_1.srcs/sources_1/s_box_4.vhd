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

entity s_box_4 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_4;

architecture Behavioral of s_box_4 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[4] table
box(0)  <= "0001";	-- box[0] 1
box(1)  <= "1111";	-- box[1] 15
box(2)  <= "1000";	-- box[2] 8
box(3)  <= "0011";	-- box[3] 3
box(4)  <= "1100";	-- box[4] 12
box(5)  <= "0000";	-- box[5] 0
box(6)  <= "1011";	-- box[6] 11
box(7)  <= "0110";	-- box[7] 6
box(8)  <= "0010";	-- box[8] 2
box(9)  <= "0101";	-- box[9] 5
box(10) <= "0100";	-- box[10] 4
box(11) <= "1010";	-- box[11] 10
box(12) <= "1001";	-- box[12] 9
box(13) <= "1110";	-- box[13] 14
box(14) <= "0111";	-- box[14] 7
box(15) <= "1101";	-- box[15] 13

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;