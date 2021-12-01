----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2021 05:34:23 PM
-- Design Name: 
-- Module Name: top_level_sbox_chaining - Behavioral
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
library inv_sbox;
use inv_sbox.ALL;
library sboxes;
use sboxes.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_sbox_chaining is
    Port ( input : in STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0));
end top_level_sbox_chaining;

architecture Behavioral of top_level_sbox_chaining is

component inv_parallel_sbox_0 is
    Port ( i_para_box_data : in STD_LOGIC_VECTOR (127 downto 0);
           o_para_box_data : out STD_LOGIC_VECTOR (127 downto 0));
           
           
end component;
signal outputsbox0: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox1: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox2: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox3: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox4: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox5: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox6: STD_LOGIC_VECTOR(127 downto 0);
signal outputsbox7: STD_LOGIC_VECTOR(127 downto 0);

signal outputinvsbox0: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox1: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox2: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox3: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox4: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox5: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox6: STD_LOGIC_VECTOR(127 downto 0);
signal outputinvsbox7: STD_LOGIC_VECTOR(127 downto 0);


begin

sbox0 : entity sboxes.top_para_sbox_0
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox0);
 
inv_sbox0 : entity inv_sbox.inv_parallel_sbox_0
    Port Map(  i_para_box_data => outputsbox0,
           o_para_box_data => outputinvsbox0);


sbox1 : entity sboxes.top_para_sbox_1
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox1);
 
inv_sbox1 : entity inv_sbox.inv_parallel_sbox_1
    Port Map(  i_para_box_data => outputsbox1,
           o_para_box_data => outputinvsbox1);
           
sbox2 : entity sboxes.top_para_sbox_2
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox2);
 
inv_sbox2 : entity inv_sbox.inv_parallel_sbox_2
    Port Map(  i_para_box_data => outputsbox2,
           o_para_box_data => outputinvsbox2);
           
           
sbox3 : entity sboxes.top_para_sbox_3
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox3);
 
inv_sbox3 : entity inv_sbox.inv_parallel_sbox_3
    Port Map(  i_para_box_data => outputsbox3,
           o_para_box_data => outputinvsbox3);
           
           
sbox4 : entity sboxes.top_para_sbox_4
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox4);
 
inv_sbox4 : entity inv_sbox.inv_parallel_sbox_4
    Port Map(  i_para_box_data => outputsbox4,
           o_para_box_data => outputinvsbox4);
           
sbox5 : entity sboxes.top_para_sbox_5
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox5);
 
inv_sbox5 : entity inv_sbox.inv_parallel_sbox_5
    Port Map(  i_para_box_data => outputsbox5,
           o_para_box_data => outputinvsbox5);
           
           
sbox6 : entity sboxes.top_para_sbox_6
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox6);
 
inv_sbox6 : entity inv_sbox.inv_parallel_sbox_6
    Port Map(  i_para_box_data => outputsbox6,
           o_para_box_data => outputinvsbox6);
           
           
sbox7 : entity sboxes.top_para_sbox_7
    Port Map(  i_para_box_data => input,
           o_para_box_data => outputsbox7);
 
inv_sbox7 : entity inv_sbox.inv_parallel_sbox_7
    Port Map(  i_para_box_data => outputsbox7,
           o_para_box_data => outputinvsbox7);

end Behavioral;
