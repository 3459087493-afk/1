// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Mon May 18 15:57:20 2026
// Host        : cym-HP-OmniBook-7-Laptop-16-az0xxx running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ transformer_design_transformer_0_0_stub.v
// Design      : transformer_design_transformer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "transformer,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_control_AWADDR, 
  s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_BRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_ARADDR, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_RVALID, 
  s_axi_control_RREADY, ap_clk, ap_rst_n, interrupt, m_axi_axi_ports_AWID, 
  m_axi_axi_ports_AWADDR, m_axi_axi_ports_AWLEN, m_axi_axi_ports_AWSIZE, 
  m_axi_axi_ports_AWBURST, m_axi_axi_ports_AWLOCK, m_axi_axi_ports_AWREGION, 
  m_axi_axi_ports_AWCACHE, m_axi_axi_ports_AWPROT, m_axi_axi_ports_AWQOS, 
  m_axi_axi_ports_AWVALID, m_axi_axi_ports_AWREADY, m_axi_axi_ports_WID, 
  m_axi_axi_ports_WDATA, m_axi_axi_ports_WSTRB, m_axi_axi_ports_WLAST, 
  m_axi_axi_ports_WVALID, m_axi_axi_ports_WREADY, m_axi_axi_ports_BID, 
  m_axi_axi_ports_BRESP, m_axi_axi_ports_BVALID, m_axi_axi_ports_BREADY, 
  m_axi_axi_ports_ARID, m_axi_axi_ports_ARADDR, m_axi_axi_ports_ARLEN, 
  m_axi_axi_ports_ARSIZE, m_axi_axi_ports_ARBURST, m_axi_axi_ports_ARLOCK, 
  m_axi_axi_ports_ARREGION, m_axi_axi_ports_ARCACHE, m_axi_axi_ports_ARPROT, 
  m_axi_axi_ports_ARQOS, m_axi_axi_ports_ARVALID, m_axi_axi_ports_ARREADY, 
  m_axi_axi_ports_RID, m_axi_axi_ports_RDATA, m_axi_axi_ports_RRESP, 
  m_axi_axi_ports_RLAST, m_axi_axi_ports_RVALID, m_axi_axi_ports_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_AWADDR[5:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[5:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_axi_ports_AWID[0:0],m_axi_axi_ports_AWADDR[63:0],m_axi_axi_ports_AWLEN[7:0],m_axi_axi_ports_AWSIZE[2:0],m_axi_axi_ports_AWBURST[1:0],m_axi_axi_ports_AWLOCK[1:0],m_axi_axi_ports_AWREGION[3:0],m_axi_axi_ports_AWCACHE[3:0],m_axi_axi_ports_AWPROT[2:0],m_axi_axi_ports_AWQOS[3:0],m_axi_axi_ports_AWVALID,m_axi_axi_ports_AWREADY,m_axi_axi_ports_WID[0:0],m_axi_axi_ports_WDATA[31:0],m_axi_axi_ports_WSTRB[3:0],m_axi_axi_ports_WLAST,m_axi_axi_ports_WVALID,m_axi_axi_ports_WREADY,m_axi_axi_ports_BID[0:0],m_axi_axi_ports_BRESP[1:0],m_axi_axi_ports_BVALID,m_axi_axi_ports_BREADY,m_axi_axi_ports_ARID[0:0],m_axi_axi_ports_ARADDR[63:0],m_axi_axi_ports_ARLEN[7:0],m_axi_axi_ports_ARSIZE[2:0],m_axi_axi_ports_ARBURST[1:0],m_axi_axi_ports_ARLOCK[1:0],m_axi_axi_ports_ARREGION[3:0],m_axi_axi_ports_ARCACHE[3:0],m_axi_axi_ports_ARPROT[2:0],m_axi_axi_ports_ARQOS[3:0],m_axi_axi_ports_ARVALID,m_axi_axi_ports_ARREADY,m_axi_axi_ports_RID[0:0],m_axi_axi_ports_RDATA[31:0],m_axi_axi_ports_RRESP[1:0],m_axi_axi_ports_RLAST,m_axi_axi_ports_RVALID,m_axi_axi_ports_RREADY" */;
  input [5:0]s_axi_control_AWADDR;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  output [1:0]s_axi_control_BRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  input [5:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  output [0:0]m_axi_axi_ports_AWID;
  output [63:0]m_axi_axi_ports_AWADDR;
  output [7:0]m_axi_axi_ports_AWLEN;
  output [2:0]m_axi_axi_ports_AWSIZE;
  output [1:0]m_axi_axi_ports_AWBURST;
  output [1:0]m_axi_axi_ports_AWLOCK;
  output [3:0]m_axi_axi_ports_AWREGION;
  output [3:0]m_axi_axi_ports_AWCACHE;
  output [2:0]m_axi_axi_ports_AWPROT;
  output [3:0]m_axi_axi_ports_AWQOS;
  output m_axi_axi_ports_AWVALID;
  input m_axi_axi_ports_AWREADY;
  output [0:0]m_axi_axi_ports_WID;
  output [31:0]m_axi_axi_ports_WDATA;
  output [3:0]m_axi_axi_ports_WSTRB;
  output m_axi_axi_ports_WLAST;
  output m_axi_axi_ports_WVALID;
  input m_axi_axi_ports_WREADY;
  input [0:0]m_axi_axi_ports_BID;
  input [1:0]m_axi_axi_ports_BRESP;
  input m_axi_axi_ports_BVALID;
  output m_axi_axi_ports_BREADY;
  output [0:0]m_axi_axi_ports_ARID;
  output [63:0]m_axi_axi_ports_ARADDR;
  output [7:0]m_axi_axi_ports_ARLEN;
  output [2:0]m_axi_axi_ports_ARSIZE;
  output [1:0]m_axi_axi_ports_ARBURST;
  output [1:0]m_axi_axi_ports_ARLOCK;
  output [3:0]m_axi_axi_ports_ARREGION;
  output [3:0]m_axi_axi_ports_ARCACHE;
  output [2:0]m_axi_axi_ports_ARPROT;
  output [3:0]m_axi_axi_ports_ARQOS;
  output m_axi_axi_ports_ARVALID;
  input m_axi_axi_ports_ARREADY;
  input [0:0]m_axi_axi_ports_RID;
  input [31:0]m_axi_axi_ports_RDATA;
  input [1:0]m_axi_axi_ports_RRESP;
  input m_axi_axi_ports_RLAST;
  input m_axi_axi_ports_RVALID;
  output m_axi_axi_ports_RREADY;
endmodule
