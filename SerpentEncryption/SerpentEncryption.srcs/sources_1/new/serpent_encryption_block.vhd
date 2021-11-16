----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2021 12:19:12 PM
-- Design Name: 
-- Module Name: serpent_encryption_block - Behavioral
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
library sboxes;
library transforms;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity serpent_encryption_block is
    Generic (  i_key : std_logic_vector(127 downto 0) := x"7A325381289586773B8F48986B4BB9AF");
    Port ( i_plaintext : in std_logic_vector(127 downto 0);
           o_ciphertext : out std_logic_vector(127 downto 0) );
end serpent_encryption_block;

architecture Behavioral of serpent_encryption_block is

-- Tableau de signaux pour les it�rations
type iteration is array (31 downto 0) of std_logic_vector(127 downto 0);
signal B : iteration;
signal B_int : iteration;
signal B_sbox : iteration;
signal K : iteration;

-- Signaux pour la derni�re it�ration
signal B32 : std_logic_vector(127 downto 0);
signal K32 : std_logic_vector(127 downto 0);

begin

-- Permutation initiale
ip : entity transforms.ip
    Port Map ( i_plaintext => i_plaintext,
               o_B0 => B(0));

-- Rounds pour le Sbox0
gen_sbox0_rounds : for i in 0 to 3 generate
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

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
    -- Keyscheduler

    B_int(i*8+7) <= B(i*8+7) xor K(i*8+7);
    
    top_sbox7 : entity sboxes.top_para_sbox_7
        Port Map ( i_para_box_data => B_int(i*8+7),
                   o_para_box_data => B_sbox(i*8+7));
                   
    linear_transform6 : entity transforms.linear_transform
        Port Map ( i_X => B_sbox(i*8+7),
                   o_Bk => B(i*8+8) );
end generate gen_sbox7_rounds;                   

-- Keyscheduler

-- Dernier keyschedule
B32 <= B_sbox(31) xor K32;

-- Permutation finale
fp : entity transforms.inverse_ip
    Port Map ( i_B32 => B32,
               o_ciphertext => o_ciphertext);

end Behavioral;