----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 06:56:01 PM
-- Design Name: 
-- Module Name: key_expansion - Behavioral
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

entity key_expansion is
    Port ( i_pad_key : in STD_LOGIC_VECTOR (255 downto 0);
           o_expand_key : out STD_LOGIC);
end key_expansion;

architecture Behavioral of key_expansion is

type W is array () 

constant Phi : std_logic_vector(31 downto 0):= x"9e3779b9";

begin

-- 
gen_expanded_key : for i in 8 to 139 generate
    
end generate;

end Behavioral;
