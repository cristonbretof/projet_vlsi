// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Mon Oct 14 01:55:04 2019
// Host        : mathieu-Inspiron-17-7779 running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/mathieu/ZYBO_HDMI_MGA_2018_2/project_1/project_1.srcs/sources_1/bd/HDMI_bd/ip/HDMI_bd_dvi2rgb_0_0/HDMI_bd_dvi2rgb_0_0_stub.v
// Design      : HDMI_bd_dvi2rgb_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dvi2rgb,Vivado 2018.2" *)
module HDMI_bd_dvi2rgb_0_0(TMDS_Clk_p, TMDS_Clk_n, TMDS_Data_p, 
  TMDS_Data_n, RefClk, aRst, vid_pData, vid_pVDE, vid_pHSync, vid_pVSync, PixelClk, aPixelClkLckd, 
  SDA_I, SDA_O, SDA_T, SCL_I, SCL_O, SCL_T, pRst)
/* synthesis syn_black_box black_box_pad_pin="TMDS_Clk_p,TMDS_Clk_n,TMDS_Data_p[2:0],TMDS_Data_n[2:0],RefClk,aRst,vid_pData[23:0],vid_pVDE,vid_pHSync,vid_pVSync,PixelClk,aPixelClkLckd,SDA_I,SDA_O,SDA_T,SCL_I,SCL_O,SCL_T,pRst" */;
  input TMDS_Clk_p;
  input TMDS_Clk_n;
  input [2:0]TMDS_Data_p;
  input [2:0]TMDS_Data_n;
  input RefClk;
  input aRst;
  output [23:0]vid_pData;
  output vid_pVDE;
  output vid_pHSync;
  output vid_pVSync;
  output PixelClk;
  output aPixelClkLckd;
  input SDA_I;
  output SDA_O;
  output SDA_T;
  input SCL_I;
  output SCL_O;
  output SCL_T;
  input pRst;
endmodule
