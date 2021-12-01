library IEEE;
library sboxes;
library transforms;
library keyschedule;
library sequential;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use transforms.all;
use sboxes.all;
use keyschedule.all;
use sequential.all;

entity serpent_encryption_block is
    Port ( i_px_clk     : in  std_logic;
           i_reset      : in  std_logic;
           i_key_index  : in  std_logic_vector(1    downto 0);
           i_plaintext  : in  std_logic_vector(127  downto 0);
           i_key        : in  std_logic_vector(4223 downto 0);
           o_ciphertext : out std_logic_vector(127  downto 0));
end serpent_encryption_block;

architecture Behavioral of serpent_encryption_block is

signal intermediate_message : std_logic_vector(127 downto 0);

-- Signal d'entré pour les rounds
signal B_in : std_logic_vector(127 downto 0);

-- Signaux pour les rounds (intermédiaires)
signal B_sbox_0 : std_logic_vector(127 downto 0);
signal B_sbox_1 : std_logic_vector(127 downto 0);
signal B_sbox_2 : std_logic_vector(127 downto 0);
signal B_sbox_3 : std_logic_vector(127 downto 0);
signal B_sbox_4 : std_logic_vector(127 downto 0);
signal B_sbox_5 : std_logic_vector(127 downto 0);
signal B_sbox_6 : std_logic_vector(127 downto 0);
signal B_sbox_7 : std_logic_vector(127 downto 0);

-- Signaux pour l'application des clés
signal B_key_0 : std_logic_vector(127 downto 0);
signal B_key_1 : std_logic_vector(127 downto 0);
signal B_key_2 : std_logic_vector(127 downto 0);
signal B_key_3 : std_logic_vector(127 downto 0);
signal B_key_4 : std_logic_vector(127 downto 0);
signal B_key_5 : std_logic_vector(127 downto 0);
signal B_key_6 : std_logic_vector(127 downto 0);
signal B_key_7 : std_logic_vector(127 downto 0);

-- Signaux pour les rounds (sorties)
signal B_out_0 : std_logic_vector(127 downto 0);
signal B_out_1 : std_logic_vector(127 downto 0);
signal B_out_2 : std_logic_vector(127 downto 0);
signal B_out_3 : std_logic_vector(127 downto 0);
signal B_out_4 : std_logic_vector(127 downto 0);
signal B_out_5 : std_logic_vector(127 downto 0);
signal B_out_6 : std_logic_vector(127 downto 0);
signal B_out_7 : std_logic_vector(127 downto 0);

-- Tableau de signaux pour les clés utilisées pour les rounds
type RoundKeys is array (32 downto 0) of std_logic_vector(127 downto 0);
signal K : RoundKeys;

begin

-- Génération de toutes les clés à partir de 4224 bits
gen_all_keys : for i in 0 to 32 generate
    K(i) <= i_key(128*i+127 downto 128*i);
end generate gen_all_keys;

-- 8x32 S-Boxes en parallèle (0 à 7)
top_sbox0 : entity sboxes.top_para_sbox_0
        Port Map ( i_para_box_data => B_key_0,
                   o_para_box_data => B_sbox_0);
top_sbox1 : entity sboxes.top_para_sbox_1
        Port Map ( i_para_box_data => B_key_1,
                   o_para_box_data => B_sbox_1);
top_sbox2 : entity sboxes.top_para_sbox_2
        Port Map ( i_para_box_data => B_key_2,
                   o_para_box_data => B_sbox_2);
top_sbox3 : entity sboxes.top_para_sbox_3
        Port Map ( i_para_box_data => B_key_3,
                   o_para_box_data => B_sbox_3);
top_sbox4 : entity sboxes.top_para_sbox_4
        Port Map ( i_para_box_data => B_key_4,
                   o_para_box_data => B_sbox_4);
top_sbox5 : entity sboxes.top_para_sbox_5
        Port Map ( i_para_box_data => B_key_5,
                   o_para_box_data => B_sbox_5);
top_sbox6 : entity sboxes.top_para_sbox_6
        Port Map ( i_para_box_data => B_key_6,
                   o_para_box_data => B_sbox_6);
top_sbox7 : entity sboxes.top_para_sbox_7
        Port Map ( i_para_box_data => B_key_7,
                   o_para_box_data => B_sbox_7);

-- Appliquer la clé sur la sortie des S-Boxes
B_key_0 <= i_plaintext xor K(to_integer(unsigned(i_key_index))*8);
B_key_1 <= B_out_0 xor K(to_integer(unsigned(i_key_index))*8 + 1);
B_key_2 <= B_out_1 xor K(to_integer(unsigned(i_key_index))*8 + 2);
B_key_3 <= B_out_2 xor K(to_integer(unsigned(i_key_index))*8 + 3);
B_key_4 <= B_out_3 xor K(to_integer(unsigned(i_key_index))*8 + 4);
B_key_5 <= B_out_4 xor K(to_integer(unsigned(i_key_index))*8 + 5);
B_key_6 <= B_out_5 xor K(to_integer(unsigned(i_key_index))*8 + 6);
B_key_7 <= B_out_6 xor K(to_integer(unsigned(i_key_index))*8 + 7);

-- 8 Modules de transformations linéaires en parallèle (0 à 7)
linear_transform0 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_0,
                   o_Bk => B_out_0 );
linear_transform1 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_1,
                   o_Bk => B_out_1 );
linear_transform2 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_2,
                   o_Bk => B_out_2 );
linear_transform3 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_3,
                   o_Bk => B_out_3 );
linear_transform4 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_4,
                   o_Bk => B_out_4 );
linear_transform5 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_5,
                   o_Bk => B_out_5 );
linear_transform6 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_6,
                   o_Bk => B_out_6 );
linear_transform7 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox_7,
                   o_Bk => B_out_7 );
                   
-- Divise les 32 rounds en 4 groupes de 8 rounds
process (i_reset, i_px_clk) begin
    if i_reset = '1' then
        o_ciphertext <= (others => '0');
    elsif rising_edge(i_px_clk) then
        if i_key_index = "11" then
            -- Il faut potentiellement inversé
            o_ciphertext <= B_sbox_7 xor K(32);
        else
            o_ciphertext <= B_out_7;
        end if;
    end if;
end process;

end Behavioral;
