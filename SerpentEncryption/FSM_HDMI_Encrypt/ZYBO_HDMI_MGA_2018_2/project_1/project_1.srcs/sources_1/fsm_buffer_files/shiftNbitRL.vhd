----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 04:41:38 PM
-- Design Name: 
-- Module Name: regNbitWL - Behavioral
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

entity shiftNbitRL is
    generic (N : integer := 8);
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           D : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (N-1 downto 0);
           Q : out STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (N-1 downto 0));
end shiftNbitRL;

architecture Behavioral of shiftNbitRL is

component reg1bit is
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

signal D_int : STD_LOGIC_VECTOR (N-1 downto 0);
signal Q_int : STD_LOGIC_VECTOR (N-1 downto 0);

begin

D_int <= (D & Q_int(N-1 downto 1)) when LOAD = '0' else DATA_IN;
Q <= Q_int(0);
DATA_OUT <= Q_int;

NbitReg : 
    for i in N-1 downto 0 generate
    NbitRegX : reg1bit
        Port Map (  
            RST => RST,
            CLK => CLK,
            EN => EN,
            D => D_int(i),
            Q => Q_int(i));
    end generate NbitReg;

  
    



end Behavioral;

