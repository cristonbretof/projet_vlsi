----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2021 02:17:42 PM
-- Design Name: 
-- Module Name: serpent_decryption_block - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
library inv_sbox;
library transforms;
library keyschedule;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use transforms.all;
use inv_sbox.all;
use keyschedule.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity serpent_decryption_block is
 Port (    i_px_clk     : in  std_logic;
           i_reset      : in  std_logic;
           i_key_index  : in  std_logic_vector(1    downto 0);
           i_ciphertext  : in  std_logic_vector(127  downto 0);
           i_key        : in  std_logic_vector(4223 downto 0);
           o_plaintext : out std_logic_vector(127  downto 0));
           
end serpent_decryption_block;

architecture Behavioral of serpent_decryption_block is
signal B_in : std_logic_vector(127 downto 0);



-- Signaux pour les rounds inverse sboxes
signal B_inv_sbox_7 : std_logic_vector(127 downto 0);
signal B_inv_sbox_6 : std_logic_vector(127 downto 0);
signal B_inv_sbox_5 : std_logic_vector(127 downto 0);
signal B_inv_sbox_4 : std_logic_vector(127 downto 0);
signal B_inv_sbox_3 : std_logic_vector(127 downto 0);
signal B_inv_sbox_2 : std_logic_vector(127 downto 0);
signal B_inv_sbox_1 : std_logic_vector(127 downto 0);
signal B_inv_sbox_0 : std_logic_vector(127 downto 0);

-- Signaux pour après application des clés
signal B_key_7: std_logic_vector(127 downto 0);
signal B_key_6 : std_logic_vector(127 downto 0);
signal B_key_5 : std_logic_vector(127 downto 0);
signal B_key_4 : std_logic_vector(127 downto 0);
signal B_key_3 : std_logic_vector(127 downto 0);
signal B_key_2 : std_logic_vector(127 downto 0);
signal B_key_1 : std_logic_vector(127 downto 0);
signal B_key_0 : std_logic_vector(127 downto 0);

-- Signaux pour les rounds transformation linéaire inverse
signal B_inv_lin_7 : std_logic_vector(127 downto 0);
signal B_inv_lin_6 : std_logic_vector(127 downto 0);
signal B_inv_lin_5 : std_logic_vector(127 downto 0);
signal B_inv_lin_4 : std_logic_vector(127 downto 0);
signal B_inv_lin_3 : std_logic_vector(127 downto 0);
signal B_inv_lin_2 : std_logic_vector(127 downto 0);
signal B_inv_lin_1 : std_logic_vector(127 downto 0);
signal B_inv_lin_0 : std_logic_vector(127 downto 0);

-- Tableau de signaux pour les clés utilisées pour les rounds
type RoundKeys is array (32 downto 0) of std_logic_vector(127 downto 0);
signal K : RoundKeys;

begin
B_in <= (i_ciphertext xor K(32)) when i_key_index = "11" else
         B_inv_lin_7;


-- Génération de toutes les clés à partir de 4224 bits
gen_all_keys : for i in 0 to 32 generate
    K(i) <= i_key(128*i+127 downto 128*i);
end generate gen_all_keys;

-- 8 Modules de transformations linéaires inverses en parallèle (7 à 0)
linear_transform7 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => i_ciphertext,
                   o_X => B_inv_lin_7 );
linear_transform6 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_7,
                   o_X => B_inv_lin_6 );
linear_transform5 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_6,
                   o_X => B_inv_lin_5 );
linear_transform4 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_5,
                   o_X => B_inv_lin_4 );
linear_transform3 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_4,
                   o_X => B_inv_lin_3 );
linear_transform2 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_3,
                   o_X =>B_inv_lin_2 );
linear_transform1 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_2,
                   o_X => B_inv_lin_1 );
linear_transform0 : entity transforms.inv_linear_transform
        Port Map ( i_Bk => B_key_1,
                   o_X => B_inv_lin_0);


-- 8x32  inverse S-Boxes en parallèle (7 à 0)
top_sbox7 : entity inv_sbox.inv_parallel_sbox_7
        Port Map ( i_para_box_data => B_in,
                   o_para_box_data => B_inv_sbox_7);
top_sbox6 : entity inv_sbox.inv_parallel_sbox_6
        Port Map ( i_para_box_data => B_inv_lin_6,
                   o_para_box_data => B_inv_sbox_6);
top_sbox5 : entity inv_sbox.inv_parallel_sbox_5
        Port Map ( i_para_box_data => B_inv_lin_5,
                   o_para_box_data => B_inv_sbox_5);
top_sbox4 : entity inv_sbox.inv_parallel_sbox_4
        Port Map ( i_para_box_data => B_inv_lin_4,
                   o_para_box_data => B_inv_sbox_4);
top_sbox3 : entity inv_sbox.inv_parallel_sbox_3
        Port Map ( i_para_box_data => B_inv_lin_3,
                   o_para_box_data => B_inv_sbox_3);
top_sbox2 : entity inv_sbox.inv_parallel_sbox_2
        Port Map ( i_para_box_data => B_inv_lin_2,
                   o_para_box_data => B_inv_sbox_2);
top_sbox1 : entity inv_sbox.inv_parallel_sbox_1
        Port Map ( i_para_box_data => B_inv_lin_1,
                   o_para_box_data => B_inv_sbox_1);
top_sbox0 : entity inv_sbox.inv_parallel_sbox_0
        Port Map ( i_para_box_data => B_inv_lin_0,
                   o_para_box_data => B_inv_sbox_0);
                   
                   
B_key_7 <= B_inv_sbox_7 xor K(to_integer(unsigned(i_key_index))*8 + 7);
B_key_6 <= B_inv_sbox_6 xor K(to_integer(unsigned(i_key_index))*8 + 6);
B_key_5 <= B_inv_sbox_5 xor K(to_integer(unsigned(i_key_index))*8 + 5);
B_key_4 <= B_inv_sbox_4 xor K(to_integer(unsigned(i_key_index))*8 + 4);
B_key_3 <= B_inv_sbox_3 xor K(to_integer(unsigned(i_key_index))*8 + 3);
B_key_2 <= B_inv_sbox_2 xor K(to_integer(unsigned(i_key_index))*8 + 2);
B_key_1 <= B_inv_sbox_1 xor K(to_integer(unsigned(i_key_index))*8 + 1);
o_plaintext <= B_inv_sbox_0 xor K(to_integer(unsigned(i_key_index))*8);



end Behavioral;
