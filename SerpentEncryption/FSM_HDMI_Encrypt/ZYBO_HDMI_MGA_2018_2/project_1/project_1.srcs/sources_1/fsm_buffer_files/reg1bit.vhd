----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 04:35:24 PM
-- Design Name: 
-- Module Name: reg1bitWL - Behavioral
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

entity reg1bit is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end reg1bit;

architecture Behavioral of reg1bit is

begin

process (CLK, RST, EN, D) begin
    if RST = '1' then
        Q <= '0';
    elsif (CLK'event and CLK = '1') then
        if EN = '1' then
        Q <= D;
        end if;
    end if;
end process;

end Behavioral;