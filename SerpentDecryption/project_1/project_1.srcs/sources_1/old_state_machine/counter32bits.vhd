----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 05:10:08 PM
-- Design Name: 
-- Module Name: counter32bits - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter32bits is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           TIM : out STD_LOGIC_VECTOR (31 downto 0));
end counter32bits;

architecture Behavioral of counter32bits is

signal timer_int : STD_LOGIC_VECTOR(31 downto 0);

begin

process (CLK, RST, EN) begin
    if RST = '1' then
        timer_int <= (others =>'0');
    elsif (CLK'event and CLK = '1') then
        if EN = '1' then
        timer_int <= timer_int + 1;
        end if;
    end if;
end process;


end Behavioral;
