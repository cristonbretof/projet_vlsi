library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity key_expansion is
    Port ( i_pad_key : in STD_LOGIC_VECTOR (255 downto 0);
           o_expand_key : out STD_LOGIC_VECTOR(4223 downto 0));
end key_expansion;

architecture Behavioral of key_expansion is

type Prekey is array (131 downto 0) of std_logic_vector(31 downto 0);
type Subkey is array (7 downto 0) of std_logic_vector(31 downto 0);
signal W : Prekey;
signal K : Subkey;

constant Phi : std_logic_vector(31 downto 0):= x"9e3779b9";

begin

-- Divide key in smaller blocks
gen_initial_key : for j in 0 to 7 generate
    K(j) <= i_pad_key(32*j+31 downto j*32);
end generate gen_initial_key;

-- Assign first key to 
W(0) <= std_logic_vector(rotate_left(unsigned(K(0) xor K(3) xor K(5) xor K(7) xor Phi xor x"00000000"), 11));
W(1) <= std_logic_vector(rotate_left(unsigned(K(1) xor K(4) xor K(6) xor W(0) xor Phi xor x"00000001"), 11));
W(2) <= std_logic_vector(rotate_left(unsigned(K(2) xor K(5) xor K(7) xor W(1) xor Phi xor x"00000002"), 11));
W(3) <= std_logic_vector(rotate_left(unsigned(K(3) xor K(6) xor W(0) xor W(2) xor Phi xor x"00000003"), 11));
W(4) <= std_logic_vector(rotate_left(unsigned(K(4) xor K(7) xor W(1) xor W(3) xor Phi xor x"00000004"), 11));
W(5) <= std_logic_vector(rotate_left(unsigned(K(5) xor K(0) xor W(2) xor W(4) xor Phi xor x"00000005"), 11));
W(6) <= std_logic_vector(rotate_left(unsigned(K(6) xor W(1) xor W(3) xor W(5) xor Phi xor x"00000006"), 11));
W(7) <= std_logic_vector(rotate_left(unsigned(K(7) xor W(2) xor W(4) xor W(6) xor Phi xor x"00000007"), 11));

-- Pipeline Wi to remaining values of 132 word table
gen_prekey_key : for i in 8 to 131 generate
    W(i) <= std_logic_vector(rotate_left(unsigned(W(i-8) xor W(i-5) xor W(i-3) xor W(i-1) xor Phi xor std_logic_vector(to_unsigned(i, 32))), 11));
end generate gen_prekey_key;

--gen_expanded_key : for i in 0 to 128

end Behavioral;
