library IEEE;
library sboxes;
library transforms;
library keyschedule;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use transforms.all;
use sboxes.all;
use keyschedule.all;

entity serpent_encryption_block is
    Port ( i_plaintext  : in std_logic_vector(127 downto 0);
           i_key        : in std_logic_vector(127 downto 0);
           o_ciphertext : out std_logic_vector(127 downto 0) );
end serpent_encryption_block;

architecture Behavioral of serpent_encryption_block is

-- Tableau de signaux pour les itérations
type iteration is array (31 downto 0) of std_logic_vector(127 downto 0);
signal B : iteration;
signal B_int : iteration;
signal B_sbox : iteration;
signal K : iteration;

-- Padded key
signal padded_key : std_logic_vector(255 downto 0);

-- Remainder from key scheduling operation (concatenated keys)
signal K_bunch : std_logic_vector(4223 downto 0);

-- Signaux pour la dernière itération
signal B32 : std_logic_vector(127 downto 0);
signal K32 : std_logic_vector(127 downto 0);

begin

-- Algorithme d'expansion de la clé (padding)
keypad : entity keyschedule.key_padding
    Port Map ( i_key     => i_key,
               o_pad_key => padded_key );

-- Génération des clés pour chaque rounds (round keys)
keysched : entity keyschedule.key_expansion
    Port Map ( i_pad_key    => padded_key,
               o_expand_key => K_bunch );

-- Génération de toutes les clés à partir de 4224 bits
gen_all_keys : for i in 0 to 31 generate
    K(i) <= K_bunch(128*i+127 downto 128*i);
end generate gen_all_keys;

-- 33ieme clé
K32 <= K_bunch(4223 downto 4096);

-- Le premier bloc est le plaintext
B(0) <= i_plaintext;

-- Rounds pour le Sbox0
gen_sbox0_rounds : for i in 0 to 3 generate

    B_int(i*8) <= B(i*8) xor K(i*8);
    
    top_sbox0 : entity sboxes.top_para_sbox_0
        Port Map ( i_para_box_data => B_int(i*8),
                   o_para_box_data => B_sbox(i*8));
                   
    linear_transform0 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8),
                   o_Bk => B(i*8+1) );
end generate gen_sbox0_rounds;

-- Rounds pour le Sbox1
gen_sbox1_rounds : for i in 0 to 3 generate

    B_int(i*8+1) <= B(i*8+1) xor K(i*8+1);
    
    top_sbox1 : entity sboxes.top_para_sbox_1
        Port Map ( i_para_box_data => B_int(i*8+1),
                   o_para_box_data => B_sbox(i*8+1));
                   
    linear_transform1 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+1),
                   o_Bk => B(i*8+2) );
end generate gen_sbox1_rounds;

-- Rounds pour le Sbox2
gen_sbox2_rounds : for i in 0 to 3 generate

    B_int(i*8+2) <= B(i*8+2) xor K(i*8+2);
    
    top_sbox2 : entity sboxes.top_para_sbox_2
        Port Map ( i_para_box_data => B_int(i*8+2),
                   o_para_box_data => B_sbox(i*8+2));
                   
    linear_transform2 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+2),
                   o_Bk => B(i*8+3) );
end generate gen_sbox2_rounds;

-- Rounds pour le Sbox3
gen_sbox3_rounds : for i in 0 to 3 generate

    B_int(i*8+3) <= B(i*8+3) xor K(i*8+3);
    
    top_sbox3 : entity sboxes.top_para_sbox_3
        Port Map ( i_para_box_data => B_int(i*8+3),
                   o_para_box_data => B_sbox(i*8+3));
                   
    linear_transform3 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+3),
                   o_Bk => B(i*8+4) );
end generate gen_sbox3_rounds;

-- Rounds pour le Sbox4
gen_sbox4_rounds : for i in 0 to 3 generate

    B_int(i*8+4) <= B(i*8+4) xor K(i*8+4);
    
    top_sbox4 : entity sboxes.top_para_sbox_4
        Port Map ( i_para_box_data => B_int(i*8+4),
                   o_para_box_data => B_sbox(i*8+4));
                   
    linear_transform4 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+4),
                   o_Bk => B(i*8+5) );
end generate gen_sbox4_rounds;

-- Rounds pour le Sbox5
gen_sbox5_rounds : for i in 0 to 3 generate

    B_int(i*8+5) <= B(i*8+5) xor K(i*8+5);
    
    top_sbox5 : entity sboxes.top_para_sbox_5
        Port Map ( i_para_box_data => B_int(i*8+5),
                   o_para_box_data => B_sbox(i*8+5));
                   
    linear_transform5 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+5),
                   o_Bk => B(i*8+6) );
end generate gen_sbox5_rounds;

-- Rounds pour le Sbox6
gen_sbox6_rounds : for i in 0 to 3 generate

    B_int(i*8+6) <= B(i*8+6) xor K(i*8+6);
    
    top_sbox6 : entity sboxes.top_para_sbox_6
        Port Map ( i_para_box_data => B_int(i*8+6),
                   o_para_box_data => B_sbox(i*8+6));
                   
    linear_transform6 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+6),
                   o_Bk => B(i*8+7) );
end generate gen_sbox6_rounds;

-- Rounds pour le Sbox7
gen_sbox7_rounds : for i in 0 to 2 generate

    B_int(i*8+7) <= B(i*8+7) xor K(i*8+7);
    
    top_sbox7 : entity sboxes.top_para_sbox_7
        Port Map ( i_para_box_data => B_int(i*8+7),
                   o_para_box_data => B_sbox(i*8+7));

    linear_transform6 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+7),
                   o_Bk => B(i*8+8) );
end generate gen_sbox7_rounds;

-- Dernière itération en parallèle
B_int(31) <= B(31) xor K(31);

-- Dernier Sbox pour le 31 ième round
top_sbox7 : entity sboxes.top_para_sbox_7
    Port Map ( i_para_box_data => B_int(31),
               o_para_box_data => B_sbox(31));

-- Dernier keyschedule
o_ciphertext <= B_sbox(31) xor K32;
               
end Behavioral;
