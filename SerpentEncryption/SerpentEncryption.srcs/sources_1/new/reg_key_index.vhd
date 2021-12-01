----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2021 02:53:39 PM
-- Design Name: 
-- Module Name: reg_key_index - Behavioral
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

entity reg_key_index is
    Port ( i_clk : in STD_LOGIC;
           i_reset : in STD_LOGIC;
           i_key_index : in STD_LOGIC_VECTOR (1 downto 0);
           o_key_index : out STD_LOGIC_VECTOR (1 downto 0));
end reg_key_index;

architecture Behavioral of reg_key_index is

begin

process (i_reset, i_clk, i_key_index) begin
    if i_reset = '1' then
        o_key_index <= "00";
    elsif rising_edge(i_clk) then
        o_key_index <= i_key_index;
    end if;
end process;

end Behavioral;
