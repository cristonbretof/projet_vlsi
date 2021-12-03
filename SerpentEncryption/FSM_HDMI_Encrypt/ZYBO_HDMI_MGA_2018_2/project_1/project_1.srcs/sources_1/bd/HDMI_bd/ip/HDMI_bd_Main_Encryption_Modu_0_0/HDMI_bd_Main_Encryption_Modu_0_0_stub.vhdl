-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2.1 (win64) Build 2288692 Thu Jul 26 18:24:02 MDT 2018
-- Date        : Thu Dec  2 20:31:00 2021
-- Host        : pcetu-136 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/chbre42/Documents/projet_vlsi/SerpentEncryption/FSM_HDMI_Encrypt/ZYBO_HDMI_MGA_2018_2/project_1/project_1.srcs/sources_1/bd/HDMI_bd/ip/HDMI_bd_Main_Encryption_Modu_0_0/HDMI_bd_Main_Encryption_Modu_0_0_stub.vhdl
-- Design      : HDMI_bd_Main_Encryption_Modu_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
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
attribute black_box_pad_pin of stub : architecture is "RGB_IN[23:0],HSYNC_IN,VSYNC_IN,VDE_IN,RESET,CLK,RGB_OUT[23:0],HSYNC_OUT,VSYNC_OUT,VDE_OUT";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "Main_Encryption_Module,Vivado 2018.2.1";
begin
end;
