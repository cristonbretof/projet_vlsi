-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2.1 (win64) Build 2288692 Thu Jul 26 18:24:02 MDT 2018
-- Date        : Sat Dec  4 19:00:19 2021
-- Host        : pcetu-131 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ HDMI_bd_pixel16_0_0_stub.vhdl
-- Design      : HDMI_bd_pixel16_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    RGB_IN : in STD_LOGIC_VECTOR ( 23 downto 0 );
    VSYNC_IN : in STD_LOGIC;
    HSYNC_IN : in STD_LOGIC;
    VDE_IN : in STD_LOGIC;
    CLK : in STD_LOGIC;
    RESET : in STD_LOGIC;
    RGB_OUT : out STD_LOGIC_VECTOR ( 23 downto 0 );
    VSYNC_OUT : out STD_LOGIC;
    HSYNC_OUT : out STD_LOGIC;
    VDE_OUT : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "RGB_IN[23:0],VSYNC_IN,HSYNC_IN,VDE_IN,CLK,RESET,RGB_OUT[23:0],VSYNC_OUT,HSYNC_OUT,VDE_OUT";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "pixel16,Vivado 2018.2.1";
begin
end;
