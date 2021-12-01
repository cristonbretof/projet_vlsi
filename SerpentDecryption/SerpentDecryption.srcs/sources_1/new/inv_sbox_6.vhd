library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_6 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_6;

architecture Behavioral of inv_sbox_6 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[6] table
box(0)  <= "1111";	-- box[0]  15
box(1)  <= "1010";	-- box[1]  10
box(2)  <= "0001";	-- box[2]  1
box(3)  <= "1101";	-- box[3]  13
box(4)  <= "0101";	-- box[4]  5
box(5)  <= "0011";	-- box[5]  3
box(6)  <= "0110";	-- box[6]  6
box(7)  <= "0000";	-- box[7]  0
box(8)  <= "0100";	-- box[8]  4
box(9)  <= "1001";	-- box[9]  9
box(10) <= "1110";	-- box[10] 14
box(11) <= "0111";	-- box[11] 7
box(12) <= "0010";	-- box[12] 2
box(13) <= "1100";	-- box[13] 12
box(14) <= "1000";	-- box[14] 8
box(15) <= "1011";	-- box[15] 11

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;