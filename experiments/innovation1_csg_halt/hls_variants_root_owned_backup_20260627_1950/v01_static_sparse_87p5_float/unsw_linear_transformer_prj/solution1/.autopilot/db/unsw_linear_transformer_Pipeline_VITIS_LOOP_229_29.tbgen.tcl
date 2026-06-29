set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_229_29
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_229_29}
set C_modelType { void 0 }
set C_modelArgList {
	{ normalized_output_load float 32 regular  }
	{ normalized_output_load_1 float 32 regular  }
	{ normalized_output_load_2 float 32 regular  }
	{ normalized_output_load_3 float 32 regular  }
	{ normalized_output_load_4 float 32 regular  }
	{ normalized_output_load_5 float 32 regular  }
	{ normalized_output_load_6 float 32 regular  }
	{ normalized_output_load_7 float 32 regular  }
	{ normalized_output_load_8 float 32 regular  }
	{ normalized_output_load_9 float 32 regular  }
	{ normalized_output_load_10 float 32 regular  }
	{ normalized_output_load_11 float 32 regular  }
	{ normalized_output_load_12 float 32 regular  }
	{ normalized_output_load_13 float 32 regular  }
	{ normalized_output_load_14 float 32 regular  }
	{ normalized_output_load_15 float 32 regular  }
	{ logits int 32 regular {array 2 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "normalized_output_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_14", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output_load_15", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "logits", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 170
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ normalized_output_load sc_in sc_lv 32 signal 0 } 
	{ normalized_output_load_1 sc_in sc_lv 32 signal 1 } 
	{ normalized_output_load_2 sc_in sc_lv 32 signal 2 } 
	{ normalized_output_load_3 sc_in sc_lv 32 signal 3 } 
	{ normalized_output_load_4 sc_in sc_lv 32 signal 4 } 
	{ normalized_output_load_5 sc_in sc_lv 32 signal 5 } 
	{ normalized_output_load_6 sc_in sc_lv 32 signal 6 } 
	{ normalized_output_load_7 sc_in sc_lv 32 signal 7 } 
	{ normalized_output_load_8 sc_in sc_lv 32 signal 8 } 
	{ normalized_output_load_9 sc_in sc_lv 32 signal 9 } 
	{ normalized_output_load_10 sc_in sc_lv 32 signal 10 } 
	{ normalized_output_load_11 sc_in sc_lv 32 signal 11 } 
	{ normalized_output_load_12 sc_in sc_lv 32 signal 12 } 
	{ normalized_output_load_13 sc_in sc_lv 32 signal 13 } 
	{ normalized_output_load_14 sc_in sc_lv 32 signal 14 } 
	{ normalized_output_load_15 sc_in sc_lv 32 signal 15 } 
	{ logits_address0 sc_out sc_lv 1 signal 16 } 
	{ logits_ce0 sc_out sc_logic 1 signal 16 } 
	{ logits_we0 sc_out sc_logic 1 signal 16 } 
	{ logits_d0 sc_out sc_lv 32 signal 16 } 
	{ grp_fu_1206_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1206_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1874_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1874_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1878_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1878_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1886_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1886_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1890_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1890_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1894_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1894_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1898_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1898_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1902_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1902_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1906_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1906_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1906_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1906_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1906_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1910_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1910_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1910_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1910_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1910_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1914_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1914_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1914_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1914_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1914_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1918_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1918_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1918_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1918_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1918_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1922_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1922_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1922_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1922_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1922_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1926_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1926_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1926_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1926_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1926_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1930_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1930_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1930_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1930_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1930_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1934_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1934_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1934_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1934_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1934_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1211_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1882_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1942_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1942_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1942_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1942_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1946_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1946_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1946_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1946_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1950_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1950_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1950_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1950_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1954_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1954_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1954_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1954_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1958_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1958_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1958_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1958_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1962_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1962_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1962_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1962_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1966_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1966_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1966_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1966_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1970_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1970_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1970_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1970_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1974_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1974_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1974_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1974_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1978_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1978_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1978_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1978_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1982_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1982_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1982_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1982_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1986_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1986_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1986_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1986_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1990_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1990_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1990_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1990_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1994_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1994_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1994_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1994_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "normalized_output_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load", "role": "default" }} , 
 	{ "name": "normalized_output_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_1", "role": "default" }} , 
 	{ "name": "normalized_output_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_2", "role": "default" }} , 
 	{ "name": "normalized_output_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_3", "role": "default" }} , 
 	{ "name": "normalized_output_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_4", "role": "default" }} , 
 	{ "name": "normalized_output_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_5", "role": "default" }} , 
 	{ "name": "normalized_output_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_6", "role": "default" }} , 
 	{ "name": "normalized_output_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_7", "role": "default" }} , 
 	{ "name": "normalized_output_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_8", "role": "default" }} , 
 	{ "name": "normalized_output_load_9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_9", "role": "default" }} , 
 	{ "name": "normalized_output_load_10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_10", "role": "default" }} , 
 	{ "name": "normalized_output_load_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_11", "role": "default" }} , 
 	{ "name": "normalized_output_load_12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_12", "role": "default" }} , 
 	{ "name": "normalized_output_load_13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_13", "role": "default" }} , 
 	{ "name": "normalized_output_load_14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_14", "role": "default" }} , 
 	{ "name": "normalized_output_load_15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized_output_load_15", "role": "default" }} , 
 	{ "name": "logits_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "address0" }} , 
 	{ "name": "logits_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "ce0" }} , 
 	{ "name": "logits_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "we0" }} , 
 	{ "name": "logits_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logits", "role": "d0" }} , 
 	{ "name": "grp_fu_1206_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1874_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1874_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1878_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1878_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1886_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1886_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1890_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1890_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1894_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1894_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1898_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1898_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1902_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1902_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1906_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1906_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1906_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1906_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1906_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1906_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1906_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1906_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1906_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1906_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1910_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1910_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1910_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1910_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1910_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1910_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1910_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1910_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1910_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1910_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1914_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1914_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1914_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1914_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1914_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1914_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1914_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1914_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1914_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1914_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1918_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1918_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1918_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1918_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1918_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1918_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1918_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1918_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1918_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1918_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1922_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1922_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1922_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1922_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1922_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1922_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1922_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1922_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1922_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1922_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1926_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1926_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1926_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1926_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1926_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1926_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1926_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1926_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1926_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1926_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1930_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1930_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1930_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1930_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1930_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1930_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1930_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1930_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1930_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1930_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1934_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1934_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1934_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1934_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1934_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1934_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1934_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1934_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1934_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1934_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1211_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1882_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1942_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1942_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1942_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1942_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1942_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1942_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1942_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1942_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1946_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1946_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1946_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1946_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1946_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1946_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1946_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1946_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1950_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1950_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1950_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1950_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1950_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1950_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1950_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1950_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1954_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1954_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1954_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1954_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1954_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1954_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1954_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1954_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1958_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1958_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1958_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1958_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1958_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1958_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1958_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1958_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1962_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1962_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1962_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1962_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1962_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1962_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1962_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1962_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1966_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1966_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1966_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1966_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1966_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1966_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1966_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1966_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1970_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1970_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1970_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1970_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1970_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1970_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1970_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1970_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1974_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1974_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1974_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1974_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1974_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1974_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1974_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1974_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1978_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1978_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1978_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1978_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1978_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1978_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1978_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1978_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1982_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1982_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1982_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1982_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1982_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1982_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1982_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1982_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1986_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1986_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1986_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1986_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1986_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1986_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1986_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1986_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1990_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1990_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1990_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1990_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1990_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1990_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1990_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1990_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1994_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1994_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1994_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1994_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1994_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1994_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1994_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1994_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_229_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "87", "EstimateLatencyMax" : "87",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized_output_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_229_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter84", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter84", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_229_29 {
		normalized_output_load {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_1 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_2 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_3 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_4 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_5 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_6 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_7 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_8 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_9 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_10 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_11 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_12 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_13 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_14 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_15 {Type I LastRead 0 FirstWrite -1}
		logits {Type O LastRead -1 FirstWrite 84}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "87", "Max" : "87"}
	, {"Name" : "Interval", "Min" : "87", "Max" : "87"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	normalized_output_load { ap_none {  { normalized_output_load in_data 0 32 } } }
	normalized_output_load_1 { ap_none {  { normalized_output_load_1 in_data 0 32 } } }
	normalized_output_load_2 { ap_none {  { normalized_output_load_2 in_data 0 32 } } }
	normalized_output_load_3 { ap_none {  { normalized_output_load_3 in_data 0 32 } } }
	normalized_output_load_4 { ap_none {  { normalized_output_load_4 in_data 0 32 } } }
	normalized_output_load_5 { ap_none {  { normalized_output_load_5 in_data 0 32 } } }
	normalized_output_load_6 { ap_none {  { normalized_output_load_6 in_data 0 32 } } }
	normalized_output_load_7 { ap_none {  { normalized_output_load_7 in_data 0 32 } } }
	normalized_output_load_8 { ap_none {  { normalized_output_load_8 in_data 0 32 } } }
	normalized_output_load_9 { ap_none {  { normalized_output_load_9 in_data 0 32 } } }
	normalized_output_load_10 { ap_none {  { normalized_output_load_10 in_data 0 32 } } }
	normalized_output_load_11 { ap_none {  { normalized_output_load_11 in_data 0 32 } } }
	normalized_output_load_12 { ap_none {  { normalized_output_load_12 in_data 0 32 } } }
	normalized_output_load_13 { ap_none {  { normalized_output_load_13 in_data 0 32 } } }
	normalized_output_load_14 { ap_none {  { normalized_output_load_14 in_data 0 32 } } }
	normalized_output_load_15 { ap_none {  { normalized_output_load_15 in_data 0 32 } } }
	logits { ap_memory {  { logits_address0 mem_address 1 1 }  { logits_ce0 mem_ce 1 1 }  { logits_we0 mem_we 1 1 }  { logits_d0 mem_din 1 32 } } }
}
