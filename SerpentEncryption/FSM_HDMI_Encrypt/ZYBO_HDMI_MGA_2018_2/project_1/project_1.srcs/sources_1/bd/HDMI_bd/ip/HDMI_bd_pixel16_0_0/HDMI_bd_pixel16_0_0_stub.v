// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2.1 (win64) Build 2288692 Thu Jul 26 18:24:02 MDT 2018
// Date        : Sat Dec  4 19:00:22 2021
// Host        : pcetu-131 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/dabou538/Documents/GitHub/projet_vlsi/SerpentEncryption/FSM_HDMI_Encrypt/ZYBO_HDMI_MGA_2018_2/project_1/project_1.srcs/sources_1/bd/HDMI_bd/ip/HDMI_bd_pixel16_0_0/HDMI_bd_pixel16_0_0_stub.v
// Design      : HDMI_bd_pixel16_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "pixel16,Vivado 2018.2.1" *)
module HDMI_bd_pixel16_0_0(RGB_IN, VSYNC_IN, HSYNC_IN, VDE_IN, CLK, RESET, 
  RGB_OUT, VSYNC_OUT, HSYNC_OUT, VDE_OUT)
/* synthesis syn_black_box black_box_pad_pin="RGB_IN[23:0],VSYNC_IN,HSYNC_IN,VDE_IN,CLK,RESET,RGB_OUT[23:0],VSYNC_OUT,HSYNC_OUT,VDE_OUT" */;
  input [23:0]RGB_IN;
  input VSYNC_IN;
  input HSYNC_IN;
  input VDE_IN;
  input CLK;
  input RESET;
  output [23:0]RGB_OUT;
  output VSYNC_OUT;
  output HSYNC_OUT;
  output VDE_OUT;
endmodule
