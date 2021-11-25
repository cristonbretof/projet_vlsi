library IEEE;
library sboxes;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use sboxes.all;

entity key_expansion is
    Port ( i_pad_key : in STD_LOGIC_VECTOR (255 downto 0);
           o_expand_key : out STD_LOGIC_VECTOR(4223 downto 0));
end key_expansion;

architecture Behavioral of key_expansion is

type Prekey is array (139 downto 0) of std_logic_vector(31 downto 0);
type Subkey is array (7 downto 0) of std_logic_vector(31 downto 0);
signal W : Prekey;
signal K : Subkey;

type Key is array (32 downto 0) of std_logic_vector(127 downto 0);
signal in_Key_int : Key;
signal out_Key_int : Key;

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
gen_prekey_key : for i in 8 to 139 generate
    W(i) <= std_logic_vector(rotate_left(unsigned(W(i-8) xor W(i-5) xor W(i-3) xor W(i-1) xor Phi xor std_logic_vector(to_unsigned(i, 32))), 11));
end generate gen_prekey_key;

gen_intermediate_keys : for i in 0 to 32 generate
    in_Key_int(i) <= W(4*i) & W(4*i+1) & W(4*i+2) & W(4*i+3);
end generate gen_intermediate_keys;

gen_round_keys : for i in 0 to 3 generate
    s_box0 : entity sboxes.top_para_sbox_0
        Port Map ( i_para_box_data => in_Key_int(i*8+3),
                   o_para_box_data => out_Key_int(i*8+3));
    s_box1 : entity sboxes.top_para_sbox_1
        Port Map ( i_para_box_data => in_Key_int(i*8+2),
                   o_para_box_data => out_Key_int(i*8+2));
    s_box2 : entity sboxes.top_para_sbox_2
        Port Map ( i_para_box_data => in_Key_int(i*8+1),
                   o_para_box_data => out_Key_int(i*8+1));
    s_box3 : entity sboxes.top_para_sbox_3
        Port Map ( i_para_box_data => in_Key_int(i*8),
                   o_para_box_data => out_Key_int(i*8));
    s_box4 : entity sboxes.top_para_sbox_4
        Port Map ( i_para_box_data => in_Key_int(i*8+7),
                   o_para_box_data => out_Key_int(i*8+7));
    s_box5 : entity sboxes.top_para_sbox_5
        Port Map ( i_para_box_data => in_Key_int(i*8+6),
                   o_para_box_data => out_Key_int(i*8+6));
    s_box6 : entity sboxes.top_para_sbox_6
        Port Map ( i_para_box_data => in_Key_int(i*8+5),
                   o_para_box_data => out_Key_int(i*8+5));
    s_box7 : entity sboxes.top_para_sbox_7
        Port Map ( i_para_box_data => in_Key_int(i*8+4),
                   o_para_box_data => out_Key_int(i*8+4));
end generate gen_round_keys;

s_box3 : entity sboxes.top_para_sbox_3
    Port Map ( i_para_box_data => in_Key_int(32),
               o_para_box_data => out_Key_int(32));

gen_expanded_key : for i in 0 to 32 generate
    o_expand_key(128*i+127 downto 128*i) <= out_Key_int(i);
end generate gen_expanded_key;

end Behavioral;
