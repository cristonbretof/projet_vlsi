----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2021 03:05:16 PM
-- Design Name: 
-- Module Name: top_level_encryption_decryption_chaining - Behavioral
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
library keyschedule;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use keyschedule.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_encryption_decryption_chaining is
  Port (   i_key : in std_logic_vector(127 downto 0);
           i_px_clk : in std_logic;
           i_reset : in std_logic;
           i_message : in std_logic_vector(127 downto 0);
           o_message : out std_logic_vector(127 downto 0));
end top_level_encryption_decryption_chaining;

architecture Behavioral of top_level_encryption_decryption_chaining is

signal padded_key : std_logic_vector(255 downto 0);
signal expanded_key : std_logic_vector(4223 downto 0);
signal key_index : std_logic_vector(1 downto 0);
signal inv_key_index : std_logic_vector(1 downto 0);
signal input_message : std_logic_vector(127 downto 0);
signal intermediate_message : std_logic_vector(127 downto 0);
signal output_message : std_logic_vector(127 downto 0);

component serpent_encryption_block is
    Port ( i_px_clk     : in  std_logic;
           i_reset      : in  std_logic;
           i_key_index  : in  std_logic_vector(1    downto 0);
           i_plaintext  : in  std_logic_vector(127  downto 0);
           i_key        : in  std_logic_vector(4223 downto 0);
           o_ciphertext : out std_logic_vector(127  downto 0));
end component;

component serpent_decryption_block is
    Port ( i_px_clk     : in  std_logic;
           i_reset      : in  std_logic;
           i_key_index  : in  std_logic_vector(1    downto 0);
           i_ciphertext  : in  std_logic_vector(127  downto 0);
           i_key        : in  std_logic_vector(4223 downto 0);
           o_plaintext : out std_logic_vector(127  downto 0));
end component;

begin

key_index <= "00";
inv_key_index <= "00";

keypad : entity keyschedule.key_padding
    Port Map ( i_key => i_key,
               o_pad_key => padded_key);
               
keyexpansion : entity keyschedule.key_expansion
    Port Map ( i_pad_key => padded_key,
               o_expand_key => expanded_key);
               
encrypter : serpent_encryption_block
    Port Map ( i_px_clk => i_px_clk,
               i_reset => i_reset,
               i_key_index => key_index,
               i_plaintext => i_message,
               i_key => expanded_key,
               o_ciphertext => intermediate_message);
   
  
        
decrypter : serpent_decryption_block
    Port Map ( i_px_clk => i_px_clk,
               i_reset => i_reset,
               i_key_index => inv_key_index,
               i_ciphertext => intermediate_message,
               i_key => expanded_key,
               o_plaintext => o_message);               

end Behavioral;
