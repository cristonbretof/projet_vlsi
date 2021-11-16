----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 04:27:46 PM
-- Design Name: 
-- Module Name: parallel_s_box_7 - Behavioral
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
library sboxes;
use IEEE.STD_LOGIC_1164.ALL;
use sboxes.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parallel_s_box_5 is
    Port ( i_box_data : in STD_LOGIC_VECTOR (3 downto 0);
           o_box_data : out STD_LOGIC_VECTOR (3 downto 0));
end parallel_s_box_5;

architecture Behavioral of parallel_s_box_5 is

begin

sbox0 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(31 downto 28),
               o_data => o_box_data(31 downto 28));
sbox1 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(27 downto 24),
               o_data => o_box_data(27 downto 24));
sbox2 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(23 downto 20),
               o_data => o_box_data(23 downto 20));
sbox3 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(19 downto 16),
               o_data => o_box_data(19 downto 16));
sbox4 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(15 downto 12),
               o_data => o_box_data(15 downto 12));
sbox5 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(11 downto 8),
               o_data => o_box_data(11 downto 8));
sbox6 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(7 downto 4),
               o_data => o_box_data(7 downto 4));
sbox7 : entity sboxes.s_box_5
    Port Map ( i_data => i_box_data(3 downto 0),
               o_data => o_box_data(3 downto 0));

end Behavioral;