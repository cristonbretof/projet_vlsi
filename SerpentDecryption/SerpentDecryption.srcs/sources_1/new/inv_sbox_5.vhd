library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity inv_sbox_5 is
    Port ( i_data : in STD_LOGIC_VECTOR(3 downto 0);
           o_data : out STD_LOGIC_VECTOR(3 downto 0));
end inv_sbox_5;

architecture Behavioral of inv_sbox_5 is

type s_box is array (15 downto 0) of std_logic_vector(3 downto 0);
signal box : s_box; 

begin

-- Permutation of DES inverse S-Box[5] table
box(0)  <= "1000";	-- box[0]  8
box(1)  <= "1111";	-- box[1]  15
box(2)  <= "0010";	-- box[2]  2
box(3)  <= "1001";	-- box[3]  9
box(4)  <= "0100";	-- box[4]  4
box(5)  <= "0001";	-- box[5]  1
box(6)  <= "1001";	-- box[6]  13
box(7)  <= "1110";	-- box[7]  14
box(8)  <= "1011";	-- box[8]  11
box(9)  <= "0110";	-- box[9]  6
box(10) <= "0101";	-- box[10] 5
box(11) <= "0011";	-- box[11] 3
box(12) <= "0111";	-- box[12] 7
box(13) <= "1100";	-- box[13] 12
box(14) <= "1010";	-- box[14] 10
box(15) <= "0000";	-- box[15] 0

o_data <= box(to_integer(unsigned(i_data)));

end Behavioral;