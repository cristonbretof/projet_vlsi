library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_7 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_7;

architecture Behavioral of inv_sbox_7 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[7] table
box(0)  <= "0011";	-- box[0]  3
box(1)  <= "0000";	-- box[1]  0
box(2)  <= "0110";	-- box[2]  6
box(3)  <= "1101";	-- box[3]  13
box(4)  <= "1001";	-- box[4]  9
box(5)  <= "1110";	-- box[5]  14
box(6)  <= "1111";	-- box[6]  15
box(7)  <= "1000";	-- box[7]  8
box(8)  <= "0101";	-- box[8]  5
box(9)  <= "1100";	-- box[9]  12
box(10) <= "1011";	-- box[10] 11
box(11) <= "0111";	-- box[11] 7
box(12) <= "1010";	-- box[12] 10
box(13) <= "0001";	-- box[13] 1
box(14) <= "0100";	-- box[14] 4
box(15) <= "0010";	-- box[15] 2

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;