library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_2 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_2;

architecture Behavioral of inv_sbox_2 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[2] table
box(0)  <= "1100";	-- box[0]  12
box(1)  <= "1001";	-- box[1]  9
box(2)  <= "1111";	-- box[2]  15
box(3)  <= "0100";	-- box[3]  4
box(4)  <= "1011";	-- box[4]  11
box(5)  <= "1110";	-- box[5]  14
box(6)  <= "0001";	-- box[6]  1
box(7)  <= "0010";	-- box[7]  2
box(8)  <= "0000";	-- box[8]  0
box(9)  <= "0011";	-- box[9]  3
box(10) <= "0110";	-- box[10] 6
box(11) <= "1101";	-- box[11] 13
box(12) <= "0101";	-- box[12] 5
box(13) <= "1000";	-- box[13] 8
box(14) <= "1010";	-- box[14] 10
box(15) <= "0111";	-- box[15] 7

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;