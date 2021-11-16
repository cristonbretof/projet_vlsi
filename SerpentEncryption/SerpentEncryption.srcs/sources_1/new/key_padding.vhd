----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 06:42:46 PM
-- Design Name: 
-- Module Name: key_padding - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_padding is
    Port ( i_key : in STD_LOGIC_VECTOR (127 downto 0);
           o_pad_key : out STD_LOGIC_VECTOR (255 downto 0));
end key_padding;

architecture Behavioral of key_padding is

begin

-- Padding avec des '0' sauf pour le 129ieme bit
o_pad_key(255 downto 129) <= (others => '0');
o_pad_key(128) <= '1';
o_pad_key(127 downto 0) <= i_key;

end Behavioral;
