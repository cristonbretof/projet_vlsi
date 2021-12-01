----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2021 11:35:50 AM
-- Design Name: 
-- Module Name: top_level - Behavioral
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
library sequential;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use keyschedule.all;
use sequential.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_encryption is
    Port ( i_key : in std_logic_vector(127 downto 0);
           i_iv : in std_logic_vector(127 downto 0);
           i_px_clk : in std_logic;
           i_reset : in std_logic;
           i_plaintext : in std_logic_vector(127 downto 0);
           o_ciphertext : out std_logic_vector(127 downto 0));
end top_level_encryption;

architecture Behavioral of top_level_encryption is

signal padded_key : std_logic_vector(255 downto 0);
signal expanded_key : std_logic_vector(4223 downto 0);

signal prev_key_index : std_logic_vector(1 downto 0);
signal next_key_index : std_logic_vector(1 downto 0);

signal input_vector : std_logic_vector(127 downto 0);

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

begin

keypad : entity keyschedule.key_padding
    Port Map ( i_key => i_key,
               o_pad_key => padded_key);
               
keyexpansion : entity keyschedule.key_expansion
    Port Map ( i_pad_key => padded_key,
               o_expand_key => expanded_key);
               
encrypter : serpent_encryption_block
    Port Map ( i_px_clk => i_px_clk,
               i_reset => i_reset,
               i_key_index => next_key_index,
               i_plaintext => intermediate_message,
               i_key => expanded_key,
               o_ciphertext => output_message);
               
key_register : entity sequential.reg_key_index
    Port Map ( i_clk => i_px_clk,
               i_reset => i_reset,
               i_key_index => prev_key_index,
               o_key_index => next_key_index);
              
intermediate_message <= input_message xor i_iv;

process (i_px_clk, i_reset, i_key, i_plaintext) begin
    if i_reset = '1' then
        input_vector <= i_iv;
        input_message <= i_plaintext;
        prev_key_index <= "00";
        
    elsif rising_edge(i_px_clk) then
        if next_key_index = "11" then
            prev_key_index <= "00";
            o_ciphertext <= output_message; -- S'en va vers le buffer
        else
            prev_key_index <= prev_key_index + 1;
        end if;
    end if;
end process;


end Behavioral;
