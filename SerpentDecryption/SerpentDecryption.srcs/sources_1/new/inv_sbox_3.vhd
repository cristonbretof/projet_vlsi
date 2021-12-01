library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_3 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_3;

architecture Behavioral of inv_sbox_3 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[3] table
box(0)  <= "0000";	-- box[0]  0
box(1)  <= "1001";	-- box[1]  9
box(2)  <= "1010";	-- box[2]  10
box(3)  <= "0111";	-- box[3]  7
box(4)  <= "1011";	-- box[4]  11
box(5)  <= "1110";	-- box[5]  14
box(6)  <= "0110";	-- box[6]  6
box(7)  <= "1011";	-- box[7]  13
box(8)  <= "0011";	-- box[8]  3
box(9)  <= "0101";	-- box[9]  5
box(10) <= "1100";	-- box[10] 12
box(11) <= "0010";	-- box[11] 2
box(12) <= "0100";	-- box[12] 4
box(13) <= "1000";	-- box[13] 8
box(14) <= "1111";	-- box[14] 15
box(15) <= "0001";	-- box[15] 1

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;