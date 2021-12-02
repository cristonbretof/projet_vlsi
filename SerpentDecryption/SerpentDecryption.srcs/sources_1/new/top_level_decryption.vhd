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
           i_plaintext : in std_logic_vector(127 downto 0);
           o_data_ready : out std_logic;
           o_ciphertext : out std_logic_vector(127 downto 0));
end top_level_decryption;

architecture Behavioral of top_level_decryption is
signal delay : std_logic;

signal padded_key : std_logic_vector(255 downto 0);
signal expanded_key : std_logic_vector(4223 downto 0);

signal key_index : STD_LOGIC_VECTOR(1 downto 0);

signal input_vector : std_logic_vector(127 downto 0);

signal input_message : std_logic_vector(127 downto 0);
signal intermediate_message : std_logic_vector(127 downto 0);
signal output_message : std_logic_vector(127 downto 0);

signal reg_input : std_logic_vector(127 downto 0);
signal reg_output: std_logic_vector(127 downto 0);

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
               i_ciphertext => intermediate_message,
               i_key => expanded_key,
               o_plaintext => output_message);
               
reg128bit: entity sequential.regNbits 
    generic map (n => 128)
    port Map( i_data => reg_input,
               i_init => (others=> '0'),
               i_reset => i_reset,
               i_clk  => i_pixel_clk,
               o_data => reg_output);             

process (i_pixel_clk, i_reset)
begin
    if i_reset = '1' then
        state <= attente;
        o_data_ready <= '0';
        o_ciphertext <= (others=>'0');
        key_index <= "11";
        reg_input <= (others=>'0');
        delay <= '0';
        
    elsif rising_edge(i_pixel_clk) then
        case state is
            when attente =>
                o_data_ready <= '0';
                o_ciphertext <= (others=>'0');
                reg_input <= i_plaintext;
                key_index <= "11";
                intermediate_message <= reg_output;
                delay <= '1';
                if (i_start = '1' and delay = '1') then
                    state <= round1;
                    delay <= '0';
                end if;
            
            when round1 =>
                intermediate_message <= reg_output;
                reg_input <= output_message;
                delay <= '1';
                if delay = '1' then
                    state <= round2;
                    delay <= '0';
                end if;
                
            when round2 =>
                reg_input <= output_message;
                intermediate_message <= reg_output;
                key_index <= "10";
                delay <= '1';
                if delay = '1' then
                    state <= round3;
                    delay <= '0';
                end if;
                
            when round3 =>
                reg_input <= output_message;
                intermediate_message <= reg_output;
                key_index <= "01";
                delay <= '1';
                if delay = '1' then
                    state <= round4;
                    delay <= '0';
                end if;
                
            when round4 =>
                intermediate_message <= reg_output;
                reg_input <= output_message;
                key_index <= "00";
                delay <= '1';
                if delay = '1' then
                    state <= data_ready;
                    delay <= '0';
                    o_data_ready <= '1';
                    o_ciphertext <= output_message;
                end if;
                
            when data_ready =>
                if i_start = '1' then
                    state <= attente;
                end if;
            end case;
    end if;    
end process;


end Behavioral;
