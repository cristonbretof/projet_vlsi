----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 05:19:29 PM
-- Design Name: 
-- Module Name: top_para_sbox_4 - Behavioral
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

entity top_para_sbox_4 is
    Port ( i_para_box_data : in STD_LOGIC_VECTOR (127 downto 0);
           o_para_box_data : out STD_LOGIC_VECTOR (127 downto 0));
end top_para_sbox_4;

architecture Behavioral of top_para_sbox_4 is

begin

para_box0 : entity sboxes.parallel_s_box_4
    Port Map ( i_box_data => i_para_box_data(127 downto 96),
               o_box_data => o_para_box_data(127 downto 96));
para_box1 : entity sboxes.parallel_s_box_4
    Port Map ( i_box_data => i_para_box_data(95 downto 64),
               o_box_data => o_para_box_data(95 downto 64));
para_box2 : entity sboxes.parallel_s_box_4
    Port Map ( i_box_data => i_para_box_data(63 downto 32),
               o_box_data => o_para_box_data(63 downto 32));
para_box3 : entity sboxes.parallel_s_box_4
    Port Map ( i_box_data => i_para_box_data(31 downto 0),
               o_box_data => o_para_box_data(31 downto 0));

end Behavioral;
