// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2.1 (win64) Build 2288692 Thu Jul 26 18:24:02 MDT 2018
// Date        : Thu Dec  2 19:14:33 2021
// Host        : pcetu-136 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/chbre42/Documents/projet_vlsi/SerpentEncryption/FSM_HDMI_Encrypt/ZYBO_HDMI_MGA_2018_2/project_1/project_1.srcs/sources_1/bd/HDMI_bd/ip/HDMI_bd_Main_Encryption_Modu_0_0/HDMI_bd_Main_Encryption_Modu_0_0_stub.v
// Design      : HDMI_bd_Main_Encryption_Modu_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "Main_Encryption_Module,Vivado 2018.2.1" *)
module HDMI_bd_Main_Encryption_Modu_0_0(RGB_IN, HSYNC_IN, VSYNC_IN, VDE_IN, RESET, CLK, 
  RGB_OUT, HSYNC_OUT, VSYNC_OUT, VDE_OUT)
/* synthesis syn_black_box black_box_pad_pin="RGB_IN[23:0],HSYNC_IN,VSYNC_IN,VDE_IN,RESET,CLK,RGB_OUT[23:0],HSYNC_OUT,VSYNC_OUT,VDE_OUT" */;
  input [23:0]RGB_IN;
  input HSYNC_IN;
  input VSYNC_IN;
  input VDE_IN;
  input RESET;
  input CLK;
  output [23:0]RGB_OUT;
  output HSYNC_OUT;
  output VSYNC_OUT;
  output VDE_OUT;
endmodule
