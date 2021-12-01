library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_4 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_4;

architecture Behavioral of inv_sbox_4 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[4] table
box(0)  <= "0101";	-- box[0]  5
box(1)  <= "0000";	-- box[1]  0
box(2)  <= "1000";	-- box[2]  8
box(3)  <= "0011";	-- box[3]  3
box(4)  <= "1010";	-- box[4]  10
box(5)  <= "1001";	-- box[5]  9
box(6)  <= "0111";	-- box[6]  7
box(7)  <= "1110";	-- box[7]  14
box(8)  <= "0010";	-- box[8]  2
box(9)  <= "1100";	-- box[9]  12
box(10) <= "1011";	-- box[10] 11
box(11) <= "0110";	-- box[11] 6
box(12) <= "0100";	-- box[12] 4
box(13) <= "1111";	-- box[13] 15
box(14) <= "1101";	-- box[14] 13
box(15) <= "0001";	-- box[15] 1

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;