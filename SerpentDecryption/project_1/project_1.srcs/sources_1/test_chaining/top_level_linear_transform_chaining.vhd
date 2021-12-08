----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2021 01:48:12 PM
-- Design Name: 
-- Module Name: top_level_linear_transform_chaining - Behavioral
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
library transforms;
use IEEE.STD_LOGIC_1164.ALL;
use transforms.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_linear_transform_chaining is
    Port ( input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0));
end top_level_linear_transform_chaining;

architecture Behavioral of top_level_linear_transform_chaining is

signal linear_transform_output : STD_LOGIC_VECTOR(127 downto 0);
signal inv_linear_transform_output :  STD_LOGIC_VECTOR(127 downto 0);

begin
linear_transform : entity transforms.linear_transform
    Port Map( i_X => input,
           o_Bk => linear_transform_output);
           
           
inv_linear_transform : entity transforms.inv_linear_transform
    Port Map( i_Bk => linear_transform_output,
           o_X => inv_linear_transform_output);
           
           
end Behavioral;
