set moduleName transformer_for_sample_Pipeline_qkv_i_qkv_j
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
set C_modelName {transformer_for_sample_Pipeline_qkv_i_qkv_j}
set C_modelType { void 0 }
set C_modelArgList {
	{ front float 32 regular {array 64 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ query float 32 regular {array 64 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ key float 32 regular {array 64 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ value_r float 32 regular {array 64 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "front", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "key", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value_r", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 209
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ front_address0 sc_out sc_lv 6 signal 0 } 
	{ front_ce0 sc_out sc_logic 1 signal 0 } 
	{ front_q0 sc_in sc_lv 32 signal 0 } 
	{ front_address1 sc_out sc_lv 6 signal 0 } 
	{ front_ce1 sc_out sc_logic 1 signal 0 } 
	{ front_q1 sc_in sc_lv 32 signal 0 } 
	{ front_address2 sc_out sc_lv 6 signal 0 } 
	{ front_ce2 sc_out sc_logic 1 signal 0 } 
	{ front_q2 sc_in sc_lv 32 signal 0 } 
	{ front_address3 sc_out sc_lv 6 signal 0 } 
	{ front_ce3 sc_out sc_logic 1 signal 0 } 
	{ front_q3 sc_in sc_lv 32 signal 0 } 
	{ front_address4 sc_out sc_lv 6 signal 0 } 
	{ front_ce4 sc_out sc_logic 1 signal 0 } 
	{ front_q4 sc_in sc_lv 32 signal 0 } 
	{ front_address5 sc_out sc_lv 6 signal 0 } 
	{ front_ce5 sc_out sc_logic 1 signal 0 } 
	{ front_q5 sc_in sc_lv 32 signal 0 } 
	{ front_address6 sc_out sc_lv 6 signal 0 } 
	{ front_ce6 sc_out sc_logic 1 signal 0 } 
	{ front_q6 sc_in sc_lv 32 signal 0 } 
	{ front_address7 sc_out sc_lv 6 signal 0 } 
	{ front_ce7 sc_out sc_logic 1 signal 0 } 
	{ front_q7 sc_in sc_lv 32 signal 0 } 
	{ query_address0 sc_out sc_lv 6 signal 1 } 
	{ query_ce0 sc_out sc_logic 1 signal 1 } 
	{ query_we0 sc_out sc_logic 1 signal 1 } 
	{ query_d0 sc_out sc_lv 32 signal 1 } 
	{ key_address0 sc_out sc_lv 6 signal 2 } 
	{ key_ce0 sc_out sc_logic 1 signal 2 } 
	{ key_we0 sc_out sc_logic 1 signal 2 } 
	{ key_d0 sc_out sc_lv 32 signal 2 } 
	{ value_r_address0 sc_out sc_lv 6 signal 3 } 
	{ value_r_ce0 sc_out sc_logic 1 signal 3 } 
	{ value_r_we0 sc_out sc_logic 1 signal 3 } 
	{ value_r_d0 sc_out sc_lv 32 signal 3 } 
	{ grp_fu_2070_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2070_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2070_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2070_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2070_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2074_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2074_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2074_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2074_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2074_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2082_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2082_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2082_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2082_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2082_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2086_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2086_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2086_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2086_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2086_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2090_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2090_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2090_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2090_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2090_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2094_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2094_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2094_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2094_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2094_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2098_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2098_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2098_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2098_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2098_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2102_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2102_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2102_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2102_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2102_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2106_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2106_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2106_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2106_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2106_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2110_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2110_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2110_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2110_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2110_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2114_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2114_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2114_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2114_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2114_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2118_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2118_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2118_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2118_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2118_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2122_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2122_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2122_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2122_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2122_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2126_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2126_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2126_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2126_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2126_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2130_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2130_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2130_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2130_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2130_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2134_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2134_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2134_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2134_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2134_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2138_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2138_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2138_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2138_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2138_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2142_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2142_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2142_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_2142_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2142_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2078_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2078_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2078_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2078_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2146_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2146_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2146_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2146_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2150_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2150_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2150_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2150_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2154_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2154_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2154_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2154_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2158_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2158_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2158_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2158_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2162_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2162_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2162_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2162_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2166_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2166_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2166_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2166_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2170_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2170_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2170_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2170_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2174_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2174_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2174_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2174_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2178_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2178_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2178_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2178_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2182_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2182_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2182_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2182_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2186_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2186_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2186_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2186_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2190_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2190_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2190_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2190_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2194_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2194_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2194_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2194_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2198_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2198_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2198_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2198_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2202_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2202_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2202_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2202_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2206_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2206_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2206_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2206_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2210_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2210_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2210_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2210_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2214_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2214_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2214_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_2214_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_2214_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "front_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address0" }} , 
 	{ "name": "front_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce0" }} , 
 	{ "name": "front_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q0" }} , 
 	{ "name": "front_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address1" }} , 
 	{ "name": "front_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce1" }} , 
 	{ "name": "front_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q1" }} , 
 	{ "name": "front_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address2" }} , 
 	{ "name": "front_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce2" }} , 
 	{ "name": "front_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q2" }} , 
 	{ "name": "front_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address3" }} , 
 	{ "name": "front_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce3" }} , 
 	{ "name": "front_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q3" }} , 
 	{ "name": "front_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address4" }} , 
 	{ "name": "front_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce4" }} , 
 	{ "name": "front_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q4" }} , 
 	{ "name": "front_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address5" }} , 
 	{ "name": "front_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce5" }} , 
 	{ "name": "front_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q5" }} , 
 	{ "name": "front_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address6" }} , 
 	{ "name": "front_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce6" }} , 
 	{ "name": "front_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q6" }} , 
 	{ "name": "front_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "front", "role": "address7" }} , 
 	{ "name": "front_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "front", "role": "ce7" }} , 
 	{ "name": "front_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "front", "role": "q7" }} , 
 	{ "name": "query_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "query", "role": "address0" }} , 
 	{ "name": "query_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query", "role": "ce0" }} , 
 	{ "name": "query_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query", "role": "we0" }} , 
 	{ "name": "query_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query", "role": "d0" }} , 
 	{ "name": "key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address0" }} , 
 	{ "name": "key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce0" }} , 
 	{ "name": "key_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "we0" }} , 
 	{ "name": "key_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "d0" }} , 
 	{ "name": "value_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_r", "role": "address0" }} , 
 	{ "name": "value_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce0" }} , 
 	{ "name": "value_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "we0" }} , 
 	{ "name": "value_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "d0" }} , 
 	{ "name": "grp_fu_2070_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2070_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2070_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2070_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2070_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2070_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2070_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2070_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2070_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2070_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2074_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2074_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2074_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2074_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2074_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2074_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2074_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2074_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2074_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2074_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2082_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2082_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2082_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2082_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2082_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2082_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2082_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2082_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2082_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2082_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2086_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2086_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2086_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2086_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2086_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2086_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2086_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2086_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2086_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2086_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2090_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2090_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2090_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2090_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2090_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2090_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2090_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2090_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2090_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2090_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2094_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2094_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2094_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2094_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2094_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2094_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2094_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2094_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2094_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2094_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2098_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2098_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2098_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2098_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2098_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2098_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2098_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2098_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2098_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2098_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2102_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2102_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2102_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2102_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2102_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2102_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2102_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2102_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2102_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2102_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2106_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2106_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2106_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2106_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2106_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2106_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2106_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2106_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2106_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2106_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2110_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2110_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2110_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2110_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2110_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2110_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2110_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2110_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2110_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2110_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2114_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2114_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2114_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2114_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2114_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2114_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2114_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2114_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2114_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2114_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2118_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2118_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2118_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2118_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2118_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2118_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2118_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2118_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2118_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2118_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2122_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2122_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2122_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2122_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2122_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2122_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2122_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2122_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2122_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2122_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2126_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2126_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2126_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2126_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2126_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2126_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2126_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2126_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2126_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2126_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2130_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2130_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2130_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2130_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2130_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2130_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2130_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2130_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2130_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2130_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2134_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2134_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2134_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2134_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2134_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2134_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2134_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2134_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2134_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2134_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2138_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2138_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2138_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2138_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2138_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2138_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2138_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2138_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2138_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2138_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2142_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2142_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2142_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2142_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2142_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_2142_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2142_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2142_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2142_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2142_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2078_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2078_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2078_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2078_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2078_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2078_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2078_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2078_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2146_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2146_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2146_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2146_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2146_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2146_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2146_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2146_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2150_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2150_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2150_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2150_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2150_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2150_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2150_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2150_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2154_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2154_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2154_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2154_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2154_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2154_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2154_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2154_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2158_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2158_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2158_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2158_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2158_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2158_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2158_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2158_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2162_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2162_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2162_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2162_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2162_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2162_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2162_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2162_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2166_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2166_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2166_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2166_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2166_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2166_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2166_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2166_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2170_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2170_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2170_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2170_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2170_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2170_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2170_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2170_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2174_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2174_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2174_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2174_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2174_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2174_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2174_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2174_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2178_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2178_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2178_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2178_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2178_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2178_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2178_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2178_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2182_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2182_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2182_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2182_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2182_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2182_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2182_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2182_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2186_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2186_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2186_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2186_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2186_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2186_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2186_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2186_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2190_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2190_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2190_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2190_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2190_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2190_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2190_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2190_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2194_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2194_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2194_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2194_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2194_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2194_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2194_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2194_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2198_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2198_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2198_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2198_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2198_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2198_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2198_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2198_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2202_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2202_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2202_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2202_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2202_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2202_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2202_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2202_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2206_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2206_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2206_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2206_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2206_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2206_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2206_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2206_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2210_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2210_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2210_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2210_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2210_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2210_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2210_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2210_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2214_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2214_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2214_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2214_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2214_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_2214_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_2214_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2214_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2214_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2214_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"],
		"CDFG" : "transformer_for_sample_Pipeline_qkv_i_qkv_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "121", "EstimateLatencyMax" : "121",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "front", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "qkv_i_qkv_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter56", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter56", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U41", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U42", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U43", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U44", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U45", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U46", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U47", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U48", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U67", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U68", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U69", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U70", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U71", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U72", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U74", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U75", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U76", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	transformer_for_sample_Pipeline_qkv_i_qkv_j {
		front {Type I LastRead 1 FirstWrite -1}
		query {Type O LastRead -1 FirstWrite 56}
		key {Type O LastRead -1 FirstWrite 56}
		value_r {Type O LastRead -1 FirstWrite 46}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "121", "Max" : "121"}
	, {"Name" : "Interval", "Min" : "121", "Max" : "121"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	front { ap_memory {  { front_address0 mem_address 1 6 }  { front_ce0 mem_ce 1 1 }  { front_q0 mem_dout 0 32 }  { front_address1 MemPortADDR2 1 6 }  { front_ce1 MemPortCE2 1 1 }  { front_q1 MemPortDOUT2 0 32 }  { front_address2 MemPortADDR2 1 6 }  { front_ce2 MemPortCE2 1 1 }  { front_q2 MemPortDOUT2 0 32 }  { front_address3 MemPortADDR2 1 6 }  { front_ce3 MemPortCE2 1 1 }  { front_q3 MemPortDOUT2 0 32 }  { front_address4 MemPortADDR2 1 6 }  { front_ce4 MemPortCE2 1 1 }  { front_q4 MemPortDOUT2 0 32 }  { front_address5 MemPortADDR2 1 6 }  { front_ce5 MemPortCE2 1 1 }  { front_q5 MemPortDOUT2 0 32 }  { front_address6 MemPortADDR2 1 6 }  { front_ce6 MemPortCE2 1 1 }  { front_q6 MemPortDOUT2 0 32 }  { front_address7 MemPortADDR2 1 6 }  { front_ce7 MemPortCE2 1 1 }  { front_q7 MemPortDOUT2 0 32 } } }
	query { ap_memory {  { query_address0 mem_address 1 6 }  { query_ce0 mem_ce 1 1 }  { query_we0 mem_we 1 1 }  { query_d0 mem_din 1 32 } } }
	key { ap_memory {  { key_address0 mem_address 1 6 }  { key_ce0 mem_ce 1 1 }  { key_we0 mem_we 1 1 }  { key_d0 mem_din 1 32 } } }
	value_r { ap_memory {  { value_r_address0 mem_address 1 6 }  { value_r_ce0 mem_ce 1 1 }  { value_r_we0 mem_we 1 1 }  { value_r_d0 mem_din 1 32 } } }
}
