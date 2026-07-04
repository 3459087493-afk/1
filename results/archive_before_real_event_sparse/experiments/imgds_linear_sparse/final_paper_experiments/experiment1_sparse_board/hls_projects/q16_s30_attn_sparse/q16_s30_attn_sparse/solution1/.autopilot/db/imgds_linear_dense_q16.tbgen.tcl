set moduleName imgds_linear_dense_q16
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
set C_modelName {imgds_linear_dense_q16}
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
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"imgds_linear_dense_q16","role":"start","value":"0","valid_bit":"0"},{"name":"imgds_linear_dense_q16","role":"continue","value":"0","valid_bit":"4"},{"name":"imgds_linear_dense_q16","role":"auto_start","value":"0","valid_bit":"7"},{"name":"input_r","role":"data","value":"16"},{"name":"logits","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"imgds_linear_dense_q16","role":"start","value":"0","valid_bit":"0"},{"name":"imgds_linear_dense_q16","role":"done","value":"0","valid_bit":"1"},{"name":"imgds_linear_dense_q16","role":"idle","value":"0","valid_bit":"2"},{"name":"imgds_linear_dense_q16","role":"ready","value":"0","valid_bit":"3"},{"name":"imgds_linear_dense_q16","role":"auto_start","value":"0","valid_bit":"7"}] },
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "47", "51", "106", "161", "165", "167", "171", "173", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217"],
		"CDFG" : "imgds_linear_dense_q16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73832", "EstimateLatencyMax" : "73832",
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
					{"ID" : "47", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619", "Port" : "gmem0", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
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
					{"ID" : "47", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619", "Port" : "input_projection_weight_V", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "layers_0_attention_output_bias_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_sparse_fu_602", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "12"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "173", "SubInstance" : "grp_layer_norm_q16_fu_679", "Port" : "output_norm_weight_V", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "173", "SubInstance" : "grp_layer_norm_q16_fu_679", "Port" : "output_norm_bias_V", "Inst_start_state" : "29", "Inst_end_state" : "30"}]},
			{"Name" : "layers_0_feedforward_0_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_fu_644", "Port" : "layers_0_feedforward_0_weight_V", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "layers_0_feedforward_3_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "167", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_fu_662", "Port" : "layers_0_feedforward_3_weight_V", "Inst_start_state" : "23", "Inst_end_state" : "24"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_245_1_VITIS_LOOP_246_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state12"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_197_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state15"], "PostState" : ["ap_ST_fsm_state21"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_209_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state21", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state21"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_194_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "57", "FirstState" : "ap_ST_fsm_state15", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state15"], "PreState" : ["ap_ST_fsm_state14"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_projection_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_embedding_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_0_bias_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_3_bias_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hidden_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ff_out_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602", "Parent" : "0", "Child" : ["10", "11", "12", "13", "14", "15", "16", "17", "18", "22", "25", "31", "33", "36", "40", "44", "45", "46"],
		"CDFG" : "linear_attention_q16_sparse",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "25624", "EstimateLatencyMax" : "25624",
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
					{"ID" : "40", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396", "Port" : "x", "Inst_start_state" : "63", "Inst_end_state" : "64"},
					{"ID" : "18", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "25", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353", "Port" : "x", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12_fu_375", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "33", "Inst_end_state" : "34"},
					{"ID" : "36", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14_fu_385", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "59", "Inst_end_state" : "60"},
					{"ID" : "22", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO_fu_344", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "2", "Inst_end_state" : "28"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "63", "Inst_end_state" : "64"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_107_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "64", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state27"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_96_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "64", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state28"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_137_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "64", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state32"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state28"], "PostState" : ["ap_ST_fsm_state33"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_172_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "64", "FirstState" : "ap_ST_fsm_state61", "LastState" : ["ap_ST_fsm_state64"], "QuitState" : ["ap_ST_fsm_state61"], "PreState" : ["ap_ST_fsm_state60"], "PostState" : ["ap_ST_fsm_state33"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_148_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "64", "FirstState" : "ap_ST_fsm_state33", "LastState" : ["ap_ST_fsm_state61"], "QuitState" : ["ap_ST_fsm_state33"], "PreState" : ["ap_ST_fsm_state29"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.ACTIVE_CHANNELS_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.layers_0_attention_output_bias_V_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.Q_V_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.K_V_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.V_V_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.KV_V_U", "Parent" : "9"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.K_sum_V_U", "Parent" : "9"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.attended_V_U", "Parent" : "9"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334", "Parent" : "9", "Child" : ["19", "20", "21"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "263", "EstimateLatencyMax" : "263",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln1271_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_98_2_VITIS_LOOP_100_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334.layers_0_attention_value_weight_V_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334.mul_mul_10s_16s_26_4_1_U11", "Parent" : "18"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3_fu_334.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO_fu_344", "Parent" : "9", "Child" : ["23", "24"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2823", "EstimateLatencyMax" : "2823",
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
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOOP_127_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO_fu_344.mac_muladd_16s_16s_30ns_30_4_1_U28", "Parent" : "22"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO_fu_344.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353", "Parent" : "9", "Child" : ["26", "27", "28", "29", "30"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5",
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
			{"Name" : "zext_ln1271_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mul", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_V_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_110_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353.layers_0_attention_query_weight_V_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353.layers_0_attention_key_weight_V_U", "Parent" : "25"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353.mul_mul_12s_16s_28_4_1_U17", "Parent" : "25"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353.mul_mul_11s_16s_27_4_1_U18", "Parent" : "25"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5_fu_353.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10_fu_367", "Parent" : "9", "Child" : ["32"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10",
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
			{"Name" : "d_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_140_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10_fu_367.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12_fu_375", "Parent" : "9", "Child" : ["34", "35"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_151_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12_fu_375.mac_muladd_16s_16s_30ns_30_4_1_U37", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12_fu_375.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14_fu_385", "Parent" : "9", "Child" : ["37", "38", "39"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "186", "EstimateLatencyMax" : "186",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1270_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_161_13_VITIS_LOOP_163_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14_fu_385.mac_muladd_16s_16s_30ns_30_4_1_U43", "Parent" : "36"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14_fu_385.mul_mul_24s_16s_30_4_1_U44", "Parent" : "36"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14_fu_385.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396", "Parent" : "9", "Child" : ["41", "42", "43"],
		"CDFG" : "linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22", "EstimateLatencyMax" : "22",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln173", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln813_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396.layers_0_attention_output_weight_V_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396.mul_mul_10s_16s_26_4_1_U52", "Parent" : "40"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.grp_linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16_fu_396.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.fpext_32ns_64_2_no_dsp_1_U61", "Parent" : "9"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.fexp_32ns_32ns_32_10_full_dsp_1_U62", "Parent" : "9"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_sparse_fu_602.fexp_32ns_32ns_32_10_full_dsp_1_U63", "Parent" : "9"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619", "Parent" : "0", "Child" : ["48", "49", "50"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3",
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
			{"Name" : "sext_ln247", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln252_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln245", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_66", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_248_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619.input_projection_weight_V_U", "Parent" : "47"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619.mul_mul_9s_16s_25_4_1_U1", "Parent" : "47"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3_fu_619.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634", "Parent" : "0", "Child" : ["52", "105"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1442", "EstimateLatencyMax" : "1442",
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
					{"ID" : "52", "SubInstance" : "grp_layer_norm_q16_1_fu_92", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "91"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_268_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "90", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92", "Parent" : "51", "Child" : ["53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104"],
		"CDFG" : "layer_norm_q16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "90",
		"VariableLatency" : "0", "ExactLatency" : "89", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
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
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read31", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.fadd_32ns_32ns_32_5_full_dsp_1_U71", "Parent" : "52"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.fdiv_32ns_32ns_32_16_no_dsp_1_U72", "Parent" : "52"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.fpext_32ns_64_2_no_dsp_1_U73", "Parent" : "52"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.fsqrt_32ns_32ns_32_16_no_dsp_1_U74", "Parent" : "52"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mul_mul_16s_16s_30_4_1_U75", "Parent" : "52"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "52"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U77", "Parent" : "52"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U78", "Parent" : "52"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U79", "Parent" : "52"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U80", "Parent" : "52"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U81", "Parent" : "52"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U82", "Parent" : "52"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U83", "Parent" : "52"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U84", "Parent" : "52"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U85", "Parent" : "52"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U86", "Parent" : "52"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U87", "Parent" : "52"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U88", "Parent" : "52"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U89", "Parent" : "52"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U90", "Parent" : "52"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U91", "Parent" : "52"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U92", "Parent" : "52"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U93", "Parent" : "52"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U94", "Parent" : "52"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U95", "Parent" : "52"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U96", "Parent" : "52"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U97", "Parent" : "52"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U98", "Parent" : "52"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U99", "Parent" : "52"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U100", "Parent" : "52"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U101", "Parent" : "52"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U102", "Parent" : "52"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U103", "Parent" : "52"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U104", "Parent" : "52"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U105", "Parent" : "52"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U106", "Parent" : "52"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15s_26_4_1_U107", "Parent" : "52"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U108", "Parent" : "52"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U109", "Parent" : "52"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U110", "Parent" : "52"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U111", "Parent" : "52"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U112", "Parent" : "52"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16ns_26_4_1_U113", "Parent" : "52"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U114", "Parent" : "52"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_18s_26_4_1_U115", "Parent" : "52"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U116", "Parent" : "52"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U117", "Parent" : "52"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U118", "Parent" : "52"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U119", "Parent" : "52"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U120", "Parent" : "52"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U121", "Parent" : "52"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_18s_26_4_1_U122", "Parent" : "52"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4_fu_634.flow_control_loop_pipe_sequential_init_U", "Parent" : "51"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639", "Parent" : "0", "Child" : ["107", "160"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1442", "EstimateLatencyMax" : "1442",
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
					{"ID" : "107", "SubInstance" : "grp_layer_norm_q16_1_fu_92", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "91"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_281_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "90", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92", "Parent" : "106", "Child" : ["108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159"],
		"CDFG" : "layer_norm_q16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "90",
		"VariableLatency" : "0", "ExactLatency" : "89", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
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
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read31", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.fadd_32ns_32ns_32_5_full_dsp_1_U71", "Parent" : "107"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.fdiv_32ns_32ns_32_16_no_dsp_1_U72", "Parent" : "107"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.fpext_32ns_64_2_no_dsp_1_U73", "Parent" : "107"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.fsqrt_32ns_32ns_32_16_no_dsp_1_U74", "Parent" : "107"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mul_mul_16s_16s_30_4_1_U75", "Parent" : "107"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "107"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U77", "Parent" : "107"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U78", "Parent" : "107"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U79", "Parent" : "107"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U80", "Parent" : "107"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U81", "Parent" : "107"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U82", "Parent" : "107"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U83", "Parent" : "107"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U84", "Parent" : "107"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U85", "Parent" : "107"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U86", "Parent" : "107"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U87", "Parent" : "107"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U88", "Parent" : "107"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U89", "Parent" : "107"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U90", "Parent" : "107"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U91", "Parent" : "107"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U92", "Parent" : "107"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U93", "Parent" : "107"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U94", "Parent" : "107"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U95", "Parent" : "107"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U96", "Parent" : "107"},
	{"ID" : "134", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U97", "Parent" : "107"},
	{"ID" : "135", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U98", "Parent" : "107"},
	{"ID" : "136", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U99", "Parent" : "107"},
	{"ID" : "137", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U100", "Parent" : "107"},
	{"ID" : "138", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U101", "Parent" : "107"},
	{"ID" : "139", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U102", "Parent" : "107"},
	{"ID" : "140", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U103", "Parent" : "107"},
	{"ID" : "141", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U104", "Parent" : "107"},
	{"ID" : "142", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U105", "Parent" : "107"},
	{"ID" : "143", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U106", "Parent" : "107"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15s_26_4_1_U107", "Parent" : "107"},
	{"ID" : "145", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U108", "Parent" : "107"},
	{"ID" : "146", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U109", "Parent" : "107"},
	{"ID" : "147", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U110", "Parent" : "107"},
	{"ID" : "148", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U111", "Parent" : "107"},
	{"ID" : "149", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U112", "Parent" : "107"},
	{"ID" : "150", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16ns_26_4_1_U113", "Parent" : "107"},
	{"ID" : "151", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U114", "Parent" : "107"},
	{"ID" : "152", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_18s_26_4_1_U115", "Parent" : "107"},
	{"ID" : "153", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U116", "Parent" : "107"},
	{"ID" : "154", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U117", "Parent" : "107"},
	{"ID" : "155", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U118", "Parent" : "107"},
	{"ID" : "156", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U119", "Parent" : "107"},
	{"ID" : "157", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U120", "Parent" : "107"},
	{"ID" : "158", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U121", "Parent" : "107"},
	{"ID" : "159", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_18s_26_4_1_U122", "Parent" : "107"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5_fu_639.flow_control_loop_pipe_sequential_init_U", "Parent" : "106"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_fu_644", "Parent" : "0", "Child" : ["162", "163", "164"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3",
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
			{"Name" : "sext_ln198", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln1271_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_70", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln818_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_199_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_fu_644.layers_0_feedforward_0_weight_V_U", "Parent" : "161"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_fu_644.mul_mul_11s_16s_27_4_1_U171", "Parent" : "161"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3_fu_644.flow_control_loop_pipe_sequential_init_U", "Parent" : "161"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6_fu_655", "Parent" : "0", "Child" : ["166"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6",
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
			{"Name" : "zext_ln1271_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_219_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6_fu_655.flow_control_loop_pipe_sequential_init_U", "Parent" : "165"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_fu_662", "Parent" : "0", "Child" : ["168", "169", "170"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "37", "EstimateLatencyMax" : "37",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln210", "Type" : "None", "Direction" : "I"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln209", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_104", "Type" : "None", "Direction" : "I"},
			{"Name" : "hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_211_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_fu_662.layers_0_feedforward_3_weight_V_U", "Parent" : "167"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_fu_662.mul_mul_10s_15ns_25_4_1_U178", "Parent" : "167"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5_fu_662.flow_control_loop_pipe_sequential_init_U", "Parent" : "167"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7_fu_673", "Parent" : "0", "Child" : ["172"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "261", "EstimateLatencyMax" : "261",
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
			{"Name" : "VITIS_LOOP_286_6_VITIS_LOOP_288_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7_fu_673.flow_control_loop_pipe_sequential_init_U", "Parent" : "171"},
	{"ID" : "173", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679", "Parent" : "0", "Child" : ["174", "176", "179", "185", "186"],
		"CDFG" : "layer_norm_q16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "114", "EstimateLatencyMax" : "114",
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
					{"ID" : "174", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_47_1_fu_144", "Port" : "x", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "176", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_53_2_fu_151", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "179", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159", "Port" : "x", "Inst_start_state" : "51", "Inst_end_state" : "52"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "179", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159", "Port" : "output_norm_weight_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "179", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159", "Port" : "output_norm_bias_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]}]},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_47_1_fu_144", "Parent" : "173", "Child" : ["175"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_47_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "18",
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
			{"Name" : "VITIS_LOOP_47_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "175", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_47_1_fu_144.flow_control_loop_pipe_sequential_init_U", "Parent" : "174"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_53_2_fu_151", "Parent" : "173", "Child" : ["177", "178"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_53_2",
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
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean", "Type" : "None", "Direction" : "I"},
			{"Name" : "var_sum_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "177", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_53_2_fu_151.mac_muladd_16s_16s_30ns_30_4_1_U194", "Parent" : "176"},
	{"ID" : "178", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_53_2_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "176"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159", "Parent" : "173", "Child" : ["180", "181", "182", "183", "184"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_65_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
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
			{"Name" : "VITIS_LOOP_65_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "180", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159.output_norm_weight_V_U", "Parent" : "179"},
	{"ID" : "181", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159.output_norm_bias_V_U", "Parent" : "179"},
	{"ID" : "182", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159.am_submul_16s_16s_16s_26_4_1_U198", "Parent" : "179"},
	{"ID" : "183", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159.mac_muladd_16s_11ns_18s_26_4_1_U199", "Parent" : "179"},
	{"ID" : "184", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.grp_layer_norm_q16_Pipeline_VITIS_LOOP_65_3_fu_159.flow_control_loop_pipe_sequential_init_U", "Parent" : "179"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.fadd_32ns_32ns_32_5_full_dsp_1_U205", "Parent" : "173"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_679.fsqrt_32ns_32ns_32_16_no_dsp_1_U208", "Parent" : "173"},
	{"ID" : "187", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem0_m_axi_U", "Parent" : "0"},
	{"ID" : "189", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem1_m_axi_U", "Parent" : "0"},
	{"ID" : "190", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_19s_24_4_1_U210", "Parent" : "0"},
	{"ID" : "191", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_18s_25_4_1_U211", "Parent" : "0"},
	{"ID" : "192", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_24s_25_4_1_U212", "Parent" : "0"},
	{"ID" : "193", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_25s_26_4_1_U213", "Parent" : "0"},
	{"ID" : "194", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_25s_26_4_1_U214", "Parent" : "0"},
	{"ID" : "195", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_26s_26_4_1_U215", "Parent" : "0"},
	{"ID" : "196", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U216", "Parent" : "0"},
	{"ID" : "197", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_26s_26_4_1_U217", "Parent" : "0"},
	{"ID" : "198", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U218", "Parent" : "0"},
	{"ID" : "199", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U219", "Parent" : "0"},
	{"ID" : "200", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U220", "Parent" : "0"},
	{"ID" : "201", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U221", "Parent" : "0"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U222", "Parent" : "0"},
	{"ID" : "203", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U223", "Parent" : "0"},
	{"ID" : "204", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U224", "Parent" : "0"},
	{"ID" : "205", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U225", "Parent" : "0"},
	{"ID" : "206", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_26ns_26_4_1_U226", "Parent" : "0"},
	{"ID" : "207", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U227", "Parent" : "0"},
	{"ID" : "208", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U228", "Parent" : "0"},
	{"ID" : "209", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8s_26s_26_4_1_U229", "Parent" : "0"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U230", "Parent" : "0"},
	{"ID" : "211", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U231", "Parent" : "0"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U232", "Parent" : "0"},
	{"ID" : "213", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U233", "Parent" : "0"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U234", "Parent" : "0"},
	{"ID" : "215", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U235", "Parent" : "0"},
	{"ID" : "216", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U236", "Parent" : "0"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U237", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_dense_q16 {
		gmem0 {Type I LastRead 2 FirstWrite -1}
		gmem1 {Type O LastRead 33 FirstWrite 31}
		input_r {Type I LastRead 0 FirstWrite -1}
		logits {Type I LastRead 0 FirstWrite -1}
		input_projection_bias_V {Type I LastRead -1 FirstWrite -1}
		position_embedding_V {Type I LastRead -1 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}
		ACTIVE_CHANNELS {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_sparse {
		x {Type IO LastRead 3 FirstWrite -1}
		ACTIVE_CHANNELS {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_98_2_VITIS_LOOP_100_3 {
		zext_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		V_V {Type O LastRead -1 FirstWrite 6}
		x {Type I LastRead 1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_123_6_VITIS_LOOP_125_7_VITIS_LOO {
		KV_V {Type O LastRead -1 FirstWrite 6}
		K_V {Type I LastRead 2 FirstWrite -1}
		V_V {Type I LastRead 2 FirstWrite -1}
		ACTIVE_CHANNELS {Type I LastRead 1 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_110_5 {
		zext_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		mul {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		x_V_1_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_140_10 {
		d_1 {Type I LastRead 0 FirstWrite -1}
		K_V {Type I LastRead 0 FirstWrite -1}
		s_V_out {Type O LastRead -1 FirstWrite 1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_151_12 {
		pos_r {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		K_sum_V {Type I LastRead 1 FirstWrite -1}
		p_normalizer_V_2_out {Type O LastRead -1 FirstWrite 4}
		ACTIVE_CHANNELS {Type I LastRead 0 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_161_13_VITIS_LOOP_163_14 {
		pos_r {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 2 FirstWrite -1}
		KV_V {Type I LastRead 2 FirstWrite -1}
		sext_ln1270_3 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 9}
		ACTIVE_CHANNELS {Type I LastRead 0 FirstWrite -1}}
	linear_attention_q16_sparse_Pipeline_VITIS_LOOP_174_16 {
		sext_ln173 {Type I LastRead 0 FirstWrite -1}
		x {Type IO LastRead 3 FirstWrite 5}
		add_ln813_4 {Type I LastRead 0 FirstWrite -1}
		tmp_20 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_248_3 {
		sext_ln247 {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 1 FirstWrite -1}
		x_V {Type O LastRead -1 FirstWrite 6}
		add_ln252_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln245 {Type I LastRead 0 FirstWrite -1}
		tmp_66 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_268_4 {
		x_V {Type IO LastRead 8 FirstWrite 82}}
	layer_norm_q16_1 {
		x {Type IO LastRead 8 FirstWrite 82}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 79 FirstWrite -1}
		p_read1 {Type I LastRead 79 FirstWrite -1}
		p_read2 {Type I LastRead 80 FirstWrite -1}
		p_read3 {Type I LastRead 80 FirstWrite -1}
		p_read4 {Type I LastRead 80 FirstWrite -1}
		p_read5 {Type I LastRead 81 FirstWrite -1}
		p_read6 {Type I LastRead 81 FirstWrite -1}
		p_read7 {Type I LastRead 81 FirstWrite -1}
		p_read8 {Type I LastRead 82 FirstWrite -1}
		p_read9 {Type I LastRead 82 FirstWrite -1}
		p_read10 {Type I LastRead 82 FirstWrite -1}
		p_read11 {Type I LastRead 83 FirstWrite -1}
		p_read12 {Type I LastRead 83 FirstWrite -1}
		p_read13 {Type I LastRead 83 FirstWrite -1}
		p_read14 {Type I LastRead 84 FirstWrite -1}
		p_read15 {Type I LastRead 84 FirstWrite -1}
		p_read16 {Type I LastRead 81 FirstWrite -1}
		p_read17 {Type I LastRead 81 FirstWrite -1}
		p_read18 {Type I LastRead 82 FirstWrite -1}
		p_read19 {Type I LastRead 82 FirstWrite -1}
		p_read20 {Type I LastRead 82 FirstWrite -1}
		p_read21 {Type I LastRead 83 FirstWrite -1}
		p_read22 {Type I LastRead 83 FirstWrite -1}
		p_read23 {Type I LastRead 83 FirstWrite -1}
		p_read24 {Type I LastRead 84 FirstWrite -1}
		p_read25 {Type I LastRead 84 FirstWrite -1}
		p_read26 {Type I LastRead 84 FirstWrite -1}
		p_read27 {Type I LastRead 85 FirstWrite -1}
		p_read28 {Type I LastRead 85 FirstWrite -1}
		p_read29 {Type I LastRead 85 FirstWrite -1}
		p_read30 {Type I LastRead 86 FirstWrite -1}
		p_read31 {Type I LastRead 86 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_281_5 {
		x_V {Type IO LastRead 8 FirstWrite 82}}
	layer_norm_q16_1 {
		x {Type IO LastRead 8 FirstWrite 82}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 79 FirstWrite -1}
		p_read1 {Type I LastRead 79 FirstWrite -1}
		p_read2 {Type I LastRead 80 FirstWrite -1}
		p_read3 {Type I LastRead 80 FirstWrite -1}
		p_read4 {Type I LastRead 80 FirstWrite -1}
		p_read5 {Type I LastRead 81 FirstWrite -1}
		p_read6 {Type I LastRead 81 FirstWrite -1}
		p_read7 {Type I LastRead 81 FirstWrite -1}
		p_read8 {Type I LastRead 82 FirstWrite -1}
		p_read9 {Type I LastRead 82 FirstWrite -1}
		p_read10 {Type I LastRead 82 FirstWrite -1}
		p_read11 {Type I LastRead 83 FirstWrite -1}
		p_read12 {Type I LastRead 83 FirstWrite -1}
		p_read13 {Type I LastRead 83 FirstWrite -1}
		p_read14 {Type I LastRead 84 FirstWrite -1}
		p_read15 {Type I LastRead 84 FirstWrite -1}
		p_read16 {Type I LastRead 81 FirstWrite -1}
		p_read17 {Type I LastRead 81 FirstWrite -1}
		p_read18 {Type I LastRead 82 FirstWrite -1}
		p_read19 {Type I LastRead 82 FirstWrite -1}
		p_read20 {Type I LastRead 82 FirstWrite -1}
		p_read21 {Type I LastRead 83 FirstWrite -1}
		p_read22 {Type I LastRead 83 FirstWrite -1}
		p_read23 {Type I LastRead 83 FirstWrite -1}
		p_read24 {Type I LastRead 84 FirstWrite -1}
		p_read25 {Type I LastRead 84 FirstWrite -1}
		p_read26 {Type I LastRead 84 FirstWrite -1}
		p_read27 {Type I LastRead 85 FirstWrite -1}
		p_read28 {Type I LastRead 85 FirstWrite -1}
		p_read29 {Type I LastRead 85 FirstWrite -1}
		p_read30 {Type I LastRead 86 FirstWrite -1}
		p_read31 {Type I LastRead 86 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_199_3 {
		sext_ln198 {Type I LastRead 0 FirstWrite -1}
		zext_ln1271_8 {Type I LastRead 0 FirstWrite -1}
		x_V {Type I LastRead 0 FirstWrite -1}
		tmp_70 {Type I LastRead 0 FirstWrite -1}
		phi_ln818_out {Type O LastRead -1 FirstWrite 3}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_219_6 {
		zext_ln1271_8 {Type I LastRead 0 FirstWrite -1}
		x_V {Type IO LastRead 0 FirstWrite 2}
		ff_out_V {Type I LastRead 0 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5 {
		sext_ln210 {Type I LastRead 0 FirstWrite -1}
		ff_out_V {Type O LastRead -1 FirstWrite 4}
		zext_ln209 {Type I LastRead 0 FirstWrite -1}
		tmp_104 {Type I LastRead 0 FirstWrite -1}
		hidden_V {Type I LastRead 0 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_286_6_VITIS_LOOP_288_7 {
		x_V {Type I LastRead 1 FirstWrite -1}
		pooled_V {Type O LastRead -1 FirstWrite 4}}
	layer_norm_q16 {
		x {Type IO LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_q16_Pipeline_VITIS_LOOP_47_1 {
		x {Type I LastRead 0 FirstWrite -1}
		sum_V_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_q16_Pipeline_VITIS_LOOP_53_2 {
		x {Type I LastRead 0 FirstWrite -1}
		mean {Type I LastRead 0 FirstWrite -1}
		var_sum_V_2_out {Type O LastRead -1 FirstWrite 3}}
	layer_norm_q16_Pipeline_VITIS_LOOP_65_3 {
		x {Type IO LastRead 0 FirstWrite 7}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		sext_ln1270 {Type I LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "73832", "Max" : "73832"}
	, {"Name" : "Interval", "Min" : "73833", "Max" : "73833"}
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
