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

entity s_box_1 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end s_box_1;

architecture Behavioral of s_box_1 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES S-Box[1] table
box(0)  <= "1111";	-- box[0] 15
box(1)  <= "1100";	-- box[1] 12
box(2)  <= "0010";	-- box[2] 2
box(3)  <= "0111";	-- box[3] 7
box(4)  <= "1001";	-- box[4] 9
box(5)  <= "0000";	-- box[5] 0
box(6)  <= "0101";	-- box[6] 5
box(7)  <= "1010";	-- box[7] 10
box(8)  <= "0001";	-- box[8] 1
box(9)  <= "1011";	-- box[9] 11
box(10) <= "1110";	-- box[10] 14
box(11) <= "1000";	-- box[11] 8
box(12) <= "0110";	-- box[12] 6
box(13) <= "1101";	-- box[13] 13
box(14) <= "0011";	-- box[14] 3
box(15) <= "0100";	-- box[15] 4

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;