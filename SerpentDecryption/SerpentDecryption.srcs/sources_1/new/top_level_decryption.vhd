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

entity top_level_decryption is
    Port ( i_key : in std_logic_vector(127 downto 0);
           i_reset : in std_logic;
           i_start: in std_logic;
           i_pixel_clk : in std_logic;
           i_ciphertext : in std_logic_vector(127 downto 0);
           o_data_ready : out std_logic;
           o_plaintext : out std_logic_vector(127 downto 0));
end top_level_decryption;

architecture Behavioral of top_level_decryption is
signal delay : std_logic;

signal padded_key : std_logic_vector(255 downto 0);
signal expanded_key : std_logic_vector(4223 downto 0);

signal key_index : STD_LOGIC_VECTOR(1 downto 0);

signal input_vector : std_logic_vector(127 downto 0);

signal ciphertext_decrypter : std_logic_vector(127 downto 0);
signal plaintext_decrypter : std_logic_vector(127 downto 0);

signal input_message : std_logic_vector(127 downto 0);
signal intermediate_message_1 : std_logic_vector(127 downto 0);
signal intermediate_message_2 : std_logic_vector(127 downto 0);
signal intermediate_message_3 : std_logic_vector(127 downto 0);

component serpent_decryption_block is
    Port ( i_pixel_clk     : in  std_logic;
           i_key_index  : in  std_logic_vector(1    downto 0);
           i_ciphertext  : in  std_logic_vector(127  downto 0);
           i_key        : in  std_logic_vector(4223 downto 0);
           o_plaintext : out std_logic_vector(127  downto 0));
end component;

type roundState is (attente, round1, round2, round3, round4, data_ready);
signal state : roundState; 

begin

keypad : entity keyschedule.key_padding
    Port Map ( i_key => i_key,
               o_pad_key => padded_key);
               
keyexpansion : entity keyschedule.key_expansion
    Port Map ( i_pad_key => padded_key,
               o_expand_key => expanded_key);
               
decrypter : serpent_decryption_block
    Port Map ( i_pixel_clk => i_pixel_clk,
               i_key_index => key_index,
               i_ciphertext => ciphertext_decrypter,
               i_key => expanded_key,
               o_plaintext => plaintext_decrypter);
               
input_message <= i_ciphertext;

process (i_pixel_clk, i_reset)
begin
    if i_reset = '1' then
        state <= attente;
        o_data_ready <= '0';
        o_plaintext <= (others=>'0');
        key_index <= "00";
        delay <= '0';
        
    elsif rising_edge(i_pixel_clk) then
        case state is
            when attente =>
                o_data_ready <= '0';
                o_plaintext <= (others=>'0');
                key_index <= "11";
                delay <= '1';
                if (i_start = '1' and delay = '1') then
                    ciphertext_decrypter <= input_message;
                    intermediate_message_1 <= plaintext_decrypter;
                    state <= round1;
                    delay <= '0';
                end if;
            
            when round1 =>
                ciphertext_decrypter <= input_message;
                intermediate_message_1 <= plaintext_decrypter;
                delay <= '1';
                if delay = '1' then
                    ciphertext_decrypter <= intermediate_message_1;
                    intermediate_message_2 <= plaintext_decrypter;
                    key_index <= "10";
                    state <= round2;
                    delay <= '0';
                end if;
                
            when round2 =>
                ciphertext_decrypter <= intermediate_message_1;
                intermediate_message_2 <= plaintext_decrypter;
                delay <= '1';
                if delay = '1' then
                    ciphertext_decrypter <= intermediate_message_2;
                    intermediate_message_3 <= plaintext_decrypter;
                    key_index <= "01";
                    state <= round3;
                    delay <= '0';
                end if;
                
            when round3 =>
                ciphertext_decrypter <= intermediate_message_2;
                intermediate_message_3 <= plaintext_decrypter;
                delay <= '1';
                if delay = '1' then
                    ciphertext_decrypter <= intermediate_message_3;
                    key_index <= "00";
                    state <= round4;
                    delay <= '0';
                end if;
                
            when round4 =>
                ciphertext_decrypter <= intermediate_message_3;
                o_plaintext <= plaintext_decrypter;
                o_data_ready <= '1';
                delay <= '1';
                if delay = '1' then
                    state <= data_ready;
                    delay <= '0';
                    o_data_ready <= '1';
                    o_plaintext <= plaintext_decrypter;
                end if;
                
            when data_ready =>
                o_data_ready <= '1';
                o_plaintext <= plaintext_decrypter;
                if i_start = '1' then
                    state <= attente;
                end if;
            end case;
    end if;    
end process;


end Behavioral;
