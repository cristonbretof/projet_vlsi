----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2021 04:39:40 PM
-- Design Name: 
-- Module Name: regNbit - Behavioral
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

entity regNbit is
    generic (N : integer := 8);
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (N-1 downto 0);
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end regNbit;

architecture Behavioral of regNbit is

component reg1bit is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin

regNbit : 
    for i in N-1 downto 0 generate
    regNbitX : reg1bit
        Port Map (  
            RST => RST,
            CLK => CLK,
            EN => EN,
            D => D(i),
            Q => Q(i));
    end generate regNbit;
    
end Behavioral;
