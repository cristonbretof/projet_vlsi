-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HDMI_bd_Main_Encryption_Modu_0_0 is
  Port ( 
    RGB_IN : in STD_LOGIC_VECTOR ( 23 downto 0 );
    HSYNC_IN : in STD_LOGIC;
    VSYNC_IN : in STD_LOGIC;
    VDE_IN : in STD_LOGIC;
    RESET : in STD_LOGIC;
    CLK : in STD_LOGIC;
    RGB_OUT : out STD_LOGIC_VECTOR ( 23 downto 0 );
    HSYNC_OUT : out STD_LOGIC;
    VSYNC_OUT : out STD_LOGIC;
    VDE_OUT : out STD_LOGIC
  );

end HDMI_bd_Main_Encryption_Modu_0_0;

architecture stub of HDMI_bd_Main_Encryption_Modu_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "Main_Encryption_Module,Vivado 2018.2.1";
begin
end;
