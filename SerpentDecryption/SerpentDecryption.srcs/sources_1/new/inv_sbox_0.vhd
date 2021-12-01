

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_0 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_0;

architecture Behavioral of inv_sbox_0 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[0] table
box(0)  <= "1101";	-- box[0]  13
box(1)  <= "0011";	-- box[1]  3
box(2)  <= "1011";	-- box[2]  11
box(3)  <= "0000";	-- box[3]  0
box(4)  <= "1010";	-- box[4]  10
box(5)  <= "0101";	-- box[5]  6
box(6)  <= "0101";	-- box[6]  5
box(7)  <= "1010";	-- box[7]  12
box(8)  <= "0001";	-- box[8]  1
box(9)  <= "1110";	-- box[9]  14
box(10) <= "0100";	-- box[10] 4
box(11) <= "0111";	-- box[11] 7
box(12) <= "1111";	-- box[12] 15
box(13) <= "1001";	-- box[13] 9
box(14) <= "1000";	-- box[14] 8
box(15) <= "0010";	-- box[15] 2

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;