set moduleName imgds_linear_small_b
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {imgds_linear_small_b}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 16 regular {axi_master 0}  }
	{ gmem1 int 16 regular {axi_master 1}  }
	{ input_r int 64 regular {axi_slave 0}  }
	{ logits int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "input_r","offset": { "type": "dynamic","port_name": "input_r","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "logits","offset": { "type": "dynamic","port_name": "logits","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "input_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "logits", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"imgds_linear_small_b","role":"start","value":"0","valid_bit":"0"},{"name":"imgds_linear_small_b","role":"continue","value":"0","valid_bit":"4"},{"name":"imgds_linear_small_b","role":"auto_start","value":"0","valid_bit":"7"},{"name":"input_r","role":"data","value":"16"},{"name":"logits","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"imgds_linear_small_b","role":"start","value":"0","valid_bit":"0"},{"name":"imgds_linear_small_b","role":"done","value":"0","valid_bit":"1"},{"name":"imgds_linear_small_b","role":"idle","value":"0","valid_bit":"2"},{"name":"imgds_linear_small_b","role":"ready","value":"0","valid_bit":"3"},{"name":"imgds_linear_small_b","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "m_axi_gmem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WID" }} , 
 	{ "name": "m_axi_gmem1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RID" }} , 
 	{ "name": "m_axi_gmem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BID" }} , 
 	{ "name": "m_axi_gmem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "44", "48", "79", "110", "114", "116", "120", "122", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156"],
		"CDFG" : "imgds_linear_small_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30843", "EstimateLatencyMax" : "30843",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501", "Port" : "gmem0", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_projection_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_embedding_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501", "Port" : "input_projection_weight_V", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_small_b_fu_486", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_small_b_fu_486", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_small_b_fu_486", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_small_b_fu_486", "Port" : "layers_0_attention_output_bias_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_small_b_fu_486", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "grp_layer_norm_small_b_fu_561", "Port" : "output_norm_weight_V", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "122", "SubInstance" : "grp_layer_norm_small_b_fu_561", "Port" : "output_norm_bias_V", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "layers_0_feedforward_0_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_fu_526", "Port" : "layers_0_feedforward_0_weight_V", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "layers_0_feedforward_3_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "116", "SubInstance" : "grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_fu_544", "Port" : "layers_0_feedforward_3_weight_V", "Inst_start_state" : "23", "Inst_end_state" : "24"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_160_1_VITIS_LOOP_161_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "49", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_126_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "49", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state15"], "PostState" : ["ap_ST_fsm_state21"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_137_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "49", "FirstState" : "ap_ST_fsm_state21", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state21"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_124_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "49", "FirstState" : "ap_ST_fsm_state15", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state15"], "PreState" : ["ap_ST_fsm_state14"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_projection_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_embedding_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_0_bias_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_3_bias_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hidden_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ff_out_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486", "Parent" : "0", "Child" : ["10", "11", "12", "13", "14", "15", "16", "17", "20", "28", "30", "33", "37", "41", "42", "43"],
		"CDFG" : "linear_attention_small_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9835", "EstimateLatencyMax" : "9835",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "37", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380", "Port" : "x", "Inst_start_state" : "58", "Inst_end_state" : "59"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "58", "Inst_end_state" : "59"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_45_1_VITIS_LOOP_46_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "59", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_76_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "59", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_105_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "59", "FirstState" : "ap_ST_fsm_state57", "LastState" : ["ap_ST_fsm_state59"], "QuitState" : ["ap_ST_fsm_state57"], "PreState" : ["ap_ST_fsm_state56"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_86_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "59", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state57"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.layers_0_attention_output_bias_V_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.Q_V_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.K_V_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.V_V_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.KV_V_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.K_sum_V_U", "Parent" : "9"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.attended_V_U", "Parent" : "9"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s_fu_332", "Parent" : "9", "Child" : ["18", "19"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "1031",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s_fu_332.mac_muladd_16s_16s_30ns_30_4_1_U25", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s_fu_332.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339", "Parent" : "9", "Child" : ["21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_48_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln50", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_V_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "phi_ln818_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.layers_0_attention_query_weight_V_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.layers_0_attention_key_weight_V_U", "Parent" : "20"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.layers_0_attention_value_weight_V_U", "Parent" : "20"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.mul_mul_12s_16s_28_4_1_U11", "Parent" : "20"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.mul_mul_11s_16s_27_4_1_U12", "Parent" : "20"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.mul_mul_11s_16s_27_4_1_U13", "Parent" : "20"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_48_3_fu_339.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_78_8_fu_356", "Parent" : "9", "Child" : ["29"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_78_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln76", "Type" : "None", "Direction" : "I"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_78_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_78_8_fu_356.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_88_10_fu_363", "Parent" : "9", "Child" : ["31", "32"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_88_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_88_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_88_10_fu_363.mac_muladd_16s_16s_30ns_30_4_1_U33", "Parent" : "30"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_88_10_fu_363.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12_fu_371", "Parent" : "9", "Child" : ["34", "35", "36"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73", "EstimateLatencyMax" : "73",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1270_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_96_11_VITIS_LOOP_98_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12_fu_371.mac_muladd_16s_16s_30ns_30_4_1_U38", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12_fu_371.mul_mul_24s_16s_30_4_1_U39", "Parent" : "33"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12_fu_371.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380", "Parent" : "9", "Child" : ["38", "39", "40"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_107_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln106", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln813_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_107_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380.layers_0_attention_output_weight_V_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380.mul_mul_11s_16s_27_4_1_U46", "Parent" : "37"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.grp_linear_attention_small_b_Pipeline_VITIS_LOOP_107_14_fu_380.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.fpext_32ns_64_2_no_dsp_1_U55", "Parent" : "9"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.fexp_32ns_32ns_32_10_full_dsp_1_U56", "Parent" : "9"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_small_b_fu_486.fexp_32ns_32ns_32_10_full_dsp_1_U57", "Parent" : "9"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501", "Parent" : "0", "Child" : ["45", "46", "47"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "71", "EstimateLatencyMax" : "71",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln162", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln167_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln160", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_163_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501.input_projection_weight_V_U", "Parent" : "44"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501.mul_mul_9s_16s_25_4_1_U1", "Parent" : "44"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3_fu_501.flow_control_loop_pipe_sequential_init_U", "Parent" : "44"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516", "Parent" : "0", "Child" : ["49", "78"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1170", "EstimateLatencyMax" : "1170",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "49", "SubInstance" : "grp_layer_norm_small_b_1_fu_64", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "74"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_176_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "73", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64", "Parent" : "48", "Child" : ["50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77"],
		"CDFG" : "layer_norm_small_b_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "73",
		"VariableLatency" : "0", "ExactLatency" : "72", "EstimateLatencyMin" : "72", "EstimateLatencyMax" : "72",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "49"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.fdiv_32ns_32ns_32_16_no_dsp_1_U66", "Parent" : "49"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.fpext_32ns_64_2_no_dsp_1_U67", "Parent" : "49"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.fsqrt_32ns_32ns_32_16_no_dsp_1_U68", "Parent" : "49"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mul_mul_16s_16s_30_4_1_U69", "Parent" : "49"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U70", "Parent" : "49"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U71", "Parent" : "49"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U72", "Parent" : "49"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U73", "Parent" : "49"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "49"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "49"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "49"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U77", "Parent" : "49"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U78", "Parent" : "49"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U79", "Parent" : "49"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U80", "Parent" : "49"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U81", "Parent" : "49"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U82", "Parent" : "49"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U83", "Parent" : "49"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U84", "Parent" : "49"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U85", "Parent" : "49"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U86", "Parent" : "49"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U87", "Parent" : "49"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U88", "Parent" : "49"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17s_26_4_1_U89", "Parent" : "49"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17ns_26_4_1_U90", "Parent" : "49"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17s_26_4_1_U91", "Parent" : "49"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U92", "Parent" : "49"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4_fu_516.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521", "Parent" : "0", "Child" : ["80", "109"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1170", "EstimateLatencyMax" : "1170",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "80", "SubInstance" : "grp_layer_norm_small_b_1_fu_64", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "74"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_179_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "73", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64", "Parent" : "79", "Child" : ["81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108"],
		"CDFG" : "layer_norm_small_b_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "73",
		"VariableLatency" : "0", "ExactLatency" : "72", "EstimateLatencyMin" : "72", "EstimateLatencyMax" : "72",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "80"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.fdiv_32ns_32ns_32_16_no_dsp_1_U66", "Parent" : "80"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.fpext_32ns_64_2_no_dsp_1_U67", "Parent" : "80"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.fsqrt_32ns_32ns_32_16_no_dsp_1_U68", "Parent" : "80"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mul_mul_16s_16s_30_4_1_U69", "Parent" : "80"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U70", "Parent" : "80"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U71", "Parent" : "80"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U72", "Parent" : "80"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U73", "Parent" : "80"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "80"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "80"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "80"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U77", "Parent" : "80"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U78", "Parent" : "80"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U79", "Parent" : "80"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U80", "Parent" : "80"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U81", "Parent" : "80"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U82", "Parent" : "80"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U83", "Parent" : "80"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U84", "Parent" : "80"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U85", "Parent" : "80"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U86", "Parent" : "80"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U87", "Parent" : "80"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U88", "Parent" : "80"},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17s_26_4_1_U89", "Parent" : "80"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17ns_26_4_1_U90", "Parent" : "80"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17s_26_4_1_U91", "Parent" : "80"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U92", "Parent" : "80"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5_fu_521.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_fu_526", "Parent" : "0", "Child" : ["111", "112", "113"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln127", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln1271_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln818_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_128_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_fu_526.layers_0_feedforward_0_weight_V_U", "Parent" : "110"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_fu_526.mul_mul_11s_16s_27_4_1_U121", "Parent" : "110"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3_fu_526.flow_control_loop_pipe_sequential_init_U", "Parent" : "110"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6_fu_537", "Parent" : "0", "Child" : ["115"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln1271_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_146_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6_fu_537.flow_control_loop_pipe_sequential_init_U", "Parent" : "114"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_fu_544", "Parent" : "0", "Child" : ["117", "118", "119"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "21", "EstimateLatencyMax" : "21",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln138", "Type" : "None", "Direction" : "I"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln137", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_70", "Type" : "None", "Direction" : "I"},
			{"Name" : "hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_139_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_fu_544.layers_0_feedforward_3_weight_V_U", "Parent" : "116"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_fu_544.mul_mul_11s_15ns_26_4_1_U128", "Parent" : "116"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5_fu_544.flow_control_loop_pipe_sequential_init_U", "Parent" : "116"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7_fu_555", "Parent" : "0", "Child" : ["121"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133", "EstimateLatencyMax" : "133",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pooled_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_183_6_VITIS_LOOP_185_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7_fu_555.flow_control_loop_pipe_sequential_init_U", "Parent" : "120"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561", "Parent" : "0", "Child" : ["123", "125", "128", "134", "135"],
		"CDFG" : "layer_norm_small_b",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "90", "EstimateLatencyMax" : "90",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165", "Port" : "x", "Inst_start_state" : "51", "Inst_end_state" : "52"},
					{"ID" : "125", "SubInstance" : "grp_layer_norm_small_b_Pipeline_VITIS_LOOP_22_2_fu_157", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "123", "SubInstance" : "grp_layer_norm_small_b_Pipeline_VITIS_LOOP_19_1_fu_150", "Port" : "x", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165", "Port" : "output_norm_weight_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165", "Port" : "output_norm_bias_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]}]},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_19_1_fu_150", "Parent" : "122", "Child" : ["124"],
		"CDFG" : "layer_norm_small_b_Pipeline_VITIS_LOOP_19_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_19_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_19_1_fu_150.flow_control_loop_pipe_sequential_init_U", "Parent" : "123"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_22_2_fu_157", "Parent" : "122", "Child" : ["126", "127"],
		"CDFG" : "layer_norm_small_b_Pipeline_VITIS_LOOP_22_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean", "Type" : "None", "Direction" : "I"},
			{"Name" : "var_sum_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_22_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_22_2_fu_157.mac_muladd_16s_16s_30ns_30_4_1_U144", "Parent" : "125"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_22_2_fu_157.flow_control_loop_pipe_sequential_init_U", "Parent" : "125"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165", "Parent" : "122", "Child" : ["129", "130", "131", "132", "133"],
		"CDFG" : "layer_norm_small_b_Pipeline_VITIS_LOOP_27_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "16",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1270", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_27_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165.output_norm_weight_V_U", "Parent" : "128"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165.output_norm_bias_V_U", "Parent" : "128"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165.am_submul_16s_16s_16s_26_4_1_U148", "Parent" : "128"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165.mac_muladd_16s_11ns_19s_26_4_1_U149", "Parent" : "128"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.grp_layer_norm_small_b_Pipeline_VITIS_LOOP_27_3_fu_165.flow_control_loop_pipe_sequential_init_U", "Parent" : "128"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.fadd_32ns_32ns_32_5_full_dsp_1_U156", "Parent" : "122"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_fu_561.fsqrt_32ns_32ns_32_16_no_dsp_1_U159", "Parent" : "122"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem0_m_axi_U", "Parent" : "0"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem1_m_axi_U", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_20s_25_4_1_U161", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_19s_24_4_1_U162", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_25s_26_4_1_U163", "Parent" : "0"},
	{"ID" : "142", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8s_24s_25_4_1_U164", "Parent" : "0"},
	{"ID" : "143", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U165", "Parent" : "0"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_25s_26_4_1_U166", "Parent" : "0"},
	{"ID" : "145", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U167", "Parent" : "0"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11s_26ns_26_4_1_U168", "Parent" : "0"},
	{"ID" : "147", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_26s_26_4_1_U169", "Parent" : "0"},
	{"ID" : "148", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U170", "Parent" : "0"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_6ns_26s_26_4_1_U171", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U172", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U173", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11s_26ns_26_4_1_U174", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8s_26s_26_4_1_U175", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U176", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U177", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U178", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_small_b {
		gmem0 {Type I LastRead 2 FirstWrite -1}
		gmem1 {Type O LastRead 25 FirstWrite 23}
		input_r {Type I LastRead 0 FirstWrite -1}
		logits {Type I LastRead 0 FirstWrite -1}
		input_projection_bias_V {Type I LastRead -1 FirstWrite -1}
		position_embedding_V {Type I LastRead -1 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_small_b {
		x {Type IO LastRead 3 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_63_4_VITIS_LOOP_64_5_VITIS_LOOP_66_s {
		KV_V {Type O LastRead -1 FirstWrite 6}
		K_V {Type I LastRead 2 FirstWrite -1}
		V_V {Type I LastRead 2 FirstWrite -1}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_48_3 {
		zext_ln50 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_4 {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		x_V_1_out {Type O LastRead -1 FirstWrite 3}
		phi_ln818_2_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_78_8 {
		zext_ln76 {Type I LastRead 0 FirstWrite -1}
		K_V {Type I LastRead 0 FirstWrite -1}
		s_V_out {Type O LastRead -1 FirstWrite 1}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_88_10 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 0 FirstWrite -1}
		K_sum_V {Type I LastRead 0 FirstWrite -1}
		p_normalizer_V_2_out {Type O LastRead -1 FirstWrite 3}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		KV_V {Type I LastRead 1 FirstWrite -1}
		sext_ln1270_2 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 8}}
	linear_attention_small_b_Pipeline_VITIS_LOOP_107_14 {
		sext_ln106 {Type I LastRead 0 FirstWrite -1}
		x {Type IO LastRead 3 FirstWrite 5}
		add_ln813_4 {Type I LastRead 0 FirstWrite -1}
		tmp_17 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_163_3 {
		sext_ln162 {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 1 FirstWrite -1}
		x_V {Type O LastRead -1 FirstWrite 6}
		add_ln167_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln160 {Type I LastRead 0 FirstWrite -1}
		tmp_47 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4 {
		x_V {Type IO LastRead 4 FirstWrite 69}}
	layer_norm_small_b_1 {
		x {Type IO LastRead 4 FirstWrite 69}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 66 FirstWrite -1}
		p_read1 {Type I LastRead 66 FirstWrite -1}
		p_read2 {Type I LastRead 67 FirstWrite -1}
		p_read3 {Type I LastRead 67 FirstWrite -1}
		p_read4 {Type I LastRead 68 FirstWrite -1}
		p_read5 {Type I LastRead 68 FirstWrite -1}
		p_read6 {Type I LastRead 69 FirstWrite -1}
		p_read7 {Type I LastRead 69 FirstWrite -1}
		p_read8 {Type I LastRead 68 FirstWrite -1}
		p_read9 {Type I LastRead 68 FirstWrite -1}
		p_read10 {Type I LastRead 69 FirstWrite -1}
		p_read11 {Type I LastRead 69 FirstWrite -1}
		p_read12 {Type I LastRead 70 FirstWrite -1}
		p_read13 {Type I LastRead 70 FirstWrite -1}
		p_read14 {Type I LastRead 71 FirstWrite -1}
		p_read15 {Type I LastRead 71 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_179_5 {
		x_V {Type IO LastRead 4 FirstWrite 69}}
	layer_norm_small_b_1 {
		x {Type IO LastRead 4 FirstWrite 69}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 66 FirstWrite -1}
		p_read1 {Type I LastRead 66 FirstWrite -1}
		p_read2 {Type I LastRead 67 FirstWrite -1}
		p_read3 {Type I LastRead 67 FirstWrite -1}
		p_read4 {Type I LastRead 68 FirstWrite -1}
		p_read5 {Type I LastRead 68 FirstWrite -1}
		p_read6 {Type I LastRead 69 FirstWrite -1}
		p_read7 {Type I LastRead 69 FirstWrite -1}
		p_read8 {Type I LastRead 68 FirstWrite -1}
		p_read9 {Type I LastRead 68 FirstWrite -1}
		p_read10 {Type I LastRead 69 FirstWrite -1}
		p_read11 {Type I LastRead 69 FirstWrite -1}
		p_read12 {Type I LastRead 70 FirstWrite -1}
		p_read13 {Type I LastRead 70 FirstWrite -1}
		p_read14 {Type I LastRead 71 FirstWrite -1}
		p_read15 {Type I LastRead 71 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_128_3 {
		sext_ln127 {Type I LastRead 0 FirstWrite -1}
		zext_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		x_V {Type I LastRead 0 FirstWrite -1}
		tmp_51 {Type I LastRead 0 FirstWrite -1}
		phi_ln818_out {Type O LastRead -1 FirstWrite 3}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_146_6 {
		zext_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		x_V {Type IO LastRead 0 FirstWrite 2}
		ff_out_V {Type I LastRead 0 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_139_5 {
		sext_ln138 {Type I LastRead 0 FirstWrite -1}
		ff_out_V {Type O LastRead -1 FirstWrite 4}
		zext_ln137 {Type I LastRead 0 FirstWrite -1}
		tmp_70 {Type I LastRead 0 FirstWrite -1}
		hidden_V {Type I LastRead 0 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_small_b_Pipeline_VITIS_LOOP_183_6_VITIS_LOOP_185_7 {
		x_V {Type I LastRead 1 FirstWrite -1}
		pooled_V {Type O LastRead -1 FirstWrite 4}}
	layer_norm_small_b {
		x {Type IO LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_small_b_Pipeline_VITIS_LOOP_19_1 {
		x {Type I LastRead 0 FirstWrite -1}
		sum_V_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_small_b_Pipeline_VITIS_LOOP_22_2 {
		x {Type I LastRead 0 FirstWrite -1}
		mean {Type I LastRead 0 FirstWrite -1}
		var_sum_V_2_out {Type O LastRead -1 FirstWrite 3}}
	layer_norm_small_b_Pipeline_VITIS_LOOP_27_3 {
		x {Type IO LastRead 0 FirstWrite 7}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		sext_ln1270 {Type I LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "30843", "Max" : "30843"}
	, {"Name" : "Interval", "Min" : "30844", "Max" : "30844"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem0 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 8 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 8 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	gmem1 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 8 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 32 }  { m_axi_gmem1_WSTRB STRB 1 4 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 8 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 32 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict gmem0 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict gmem1 {NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem0 1 }
	{ gmem1 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem0 1 }
	{ gmem1 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
