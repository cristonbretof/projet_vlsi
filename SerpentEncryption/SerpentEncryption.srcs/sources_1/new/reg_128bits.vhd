----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 12:42:04 PM
-- Design Name: 
-- Module Name: reg_128bits - Behavioral
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

entity reg_128bits is
    Port ( i_data : in STD_LOGIC_VECTOR(127 downto 0);
           i_init : in STD_LOGIC_VECTOR(127 downto 0);
           i_reset : in STD_LOGIC;
           i_clk : in STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR(127 downto 0));
end reg_128bits;

architecture Behavioral of reg_128bits is

begin

process (i_data, i_reset, i_clk) begin
    if i_reset = '1' then
        o_data <= i_init;
    elsif rising_edge(i_clk) then
        o_data <= i_data;
    end if;
end process;


end Behavioral;
