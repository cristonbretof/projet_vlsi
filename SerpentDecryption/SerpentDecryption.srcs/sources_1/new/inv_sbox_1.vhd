library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_1 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_1;

architecture Behavioral of inv_sbox_1 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[1] table
box(0)  <= "0101";	-- box[0]  5
box(1)  <= "1000";	-- box[1]  8
box(2)  <= "0010";	-- box[2]  2
box(3)  <= "1110";	-- box[3]  14
box(4)  <= "1111";	-- box[4]  15
box(5)  <= "0110";	-- box[5]  6
box(6)  <= "1100";	-- box[6]  12
box(7)  <= "0011";	-- box[7]  3
box(8)  <= "1011";	-- box[8]  11
box(9)  <= "0100";	-- box[9]  4
box(10) <= "0111";	-- box[10] 7
box(11) <= "1001";	-- box[11] 9
box(12) <= "0001";	-- box[12] 1
box(13) <= "1101";	-- box[13] 13
box(14) <= "1010";	-- box[14] 10
box(15) <= "0000";	-- box[15] 0

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;