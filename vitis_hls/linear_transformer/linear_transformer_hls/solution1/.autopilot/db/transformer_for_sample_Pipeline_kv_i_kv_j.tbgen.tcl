set moduleName transformer_for_sample_Pipeline_kv_i_kv_j
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
set C_modelName {transformer_for_sample_Pipeline_kv_i_kv_j}
set C_modelType { void 0 }
set C_modelArgList {
	{ key float 32 regular {array 64 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ value_t float 32 regular {array 64 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ kv float 32 regular {array 64 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "value_t", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kv", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 130
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_address0 sc_out sc_lv 6 signal 0 } 
	{ key_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_q0 sc_in sc_lv 32 signal 0 } 
	{ key_address1 sc_out sc_lv 6 signal 0 } 
	{ key_ce1 sc_out sc_logic 1 signal 0 } 
	{ key_q1 sc_in sc_lv 32 signal 0 } 
	{ key_address2 sc_out sc_lv 6 signal 0 } 
	{ key_ce2 sc_out sc_logic 1 signal 0 } 
	{ key_q2 sc_in sc_lv 32 signal 0 } 
	{ key_address3 sc_out sc_lv 6 signal 0 } 
	{ key_ce3 sc_out sc_logic 1 signal 0 } 
	{ key_q3 sc_in sc_lv 32 signal 0 } 
	{ key_address4 sc_out sc_lv 6 signal 0 } 
	{ key_ce4 sc_out sc_logic 1 signal 0 } 
	{ key_q4 sc_in sc_lv 32 signal 0 } 
	{ key_address5 sc_out sc_lv 6 signal 0 } 
	{ key_ce5 sc_out sc_logic 1 signal 0 } 
	{ key_q5 sc_in sc_lv 32 signal 0 } 
	{ key_address6 sc_out sc_lv 6 signal 0 } 
	{ key_ce6 sc_out sc_logic 1 signal 0 } 
	{ key_q6 sc_in sc_lv 32 signal 0 } 
	{ key_address7 sc_out sc_lv 6 signal 0 } 
	{ key_ce7 sc_out sc_logic 1 signal 0 } 
	{ key_q7 sc_in sc_lv 32 signal 0 } 
	{ value_t_address0 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce0 sc_out sc_logic 1 signal 1 } 
	{ value_t_q0 sc_in sc_lv 32 signal 1 } 
	{ value_t_address1 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce1 sc_out sc_logic 1 signal 1 } 
	{ value_t_q1 sc_in sc_lv 32 signal 1 } 
	{ value_t_address2 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce2 sc_out sc_logic 1 signal 1 } 
	{ value_t_q2 sc_in sc_lv 32 signal 1 } 
	{ value_t_address3 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce3 sc_out sc_logic 1 signal 1 } 
	{ value_t_q3 sc_in sc_lv 32 signal 1 } 
	{ value_t_address4 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce4 sc_out sc_logic 1 signal 1 } 
	{ value_t_q4 sc_in sc_lv 32 signal 1 } 
	{ value_t_address5 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce5 sc_out sc_logic 1 signal 1 } 
	{ value_t_q5 sc_in sc_lv 32 signal 1 } 
	{ value_t_address6 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce6 sc_out sc_logic 1 signal 1 } 
	{ value_t_q6 sc_in sc_lv 32 signal 1 } 
	{ value_t_address7 sc_out sc_lv 6 signal 1 } 
	{ value_t_ce7 sc_out sc_logic 1 signal 1 } 
	{ value_t_q7 sc_in sc_lv 32 signal 1 } 
	{ kv_address0 sc_out sc_lv 6 signal 2 } 
	{ kv_ce0 sc_out sc_logic 1 signal 2 } 
	{ kv_we0 sc_out sc_logic 1 signal 2 } 
	{ kv_d0 sc_out sc_lv 32 signal 2 } 
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
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address0" }} , 
 	{ "name": "key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce0" }} , 
 	{ "name": "key_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q0" }} , 
 	{ "name": "key_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address1" }} , 
 	{ "name": "key_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce1" }} , 
 	{ "name": "key_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q1" }} , 
 	{ "name": "key_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address2" }} , 
 	{ "name": "key_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce2" }} , 
 	{ "name": "key_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q2" }} , 
 	{ "name": "key_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address3" }} , 
 	{ "name": "key_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce3" }} , 
 	{ "name": "key_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q3" }} , 
 	{ "name": "key_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address4" }} , 
 	{ "name": "key_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce4" }} , 
 	{ "name": "key_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q4" }} , 
 	{ "name": "key_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address5" }} , 
 	{ "name": "key_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce5" }} , 
 	{ "name": "key_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q5" }} , 
 	{ "name": "key_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address6" }} , 
 	{ "name": "key_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce6" }} , 
 	{ "name": "key_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q6" }} , 
 	{ "name": "key_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key", "role": "address7" }} , 
 	{ "name": "key_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce7" }} , 
 	{ "name": "key_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q7" }} , 
 	{ "name": "value_t_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address0" }} , 
 	{ "name": "value_t_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce0" }} , 
 	{ "name": "value_t_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q0" }} , 
 	{ "name": "value_t_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address1" }} , 
 	{ "name": "value_t_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce1" }} , 
 	{ "name": "value_t_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q1" }} , 
 	{ "name": "value_t_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address2" }} , 
 	{ "name": "value_t_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce2" }} , 
 	{ "name": "value_t_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q2" }} , 
 	{ "name": "value_t_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address3" }} , 
 	{ "name": "value_t_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce3" }} , 
 	{ "name": "value_t_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q3" }} , 
 	{ "name": "value_t_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address4" }} , 
 	{ "name": "value_t_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce4" }} , 
 	{ "name": "value_t_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q4" }} , 
 	{ "name": "value_t_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address5" }} , 
 	{ "name": "value_t_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce5" }} , 
 	{ "name": "value_t_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q5" }} , 
 	{ "name": "value_t_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address6" }} , 
 	{ "name": "value_t_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce6" }} , 
 	{ "name": "value_t_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q6" }} , 
 	{ "name": "value_t_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_t", "role": "address7" }} , 
 	{ "name": "value_t_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_t", "role": "ce7" }} , 
 	{ "name": "value_t_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_t", "role": "q7" }} , 
 	{ "name": "kv_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "kv", "role": "address0" }} , 
 	{ "name": "kv_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "kv", "role": "ce0" }} , 
 	{ "name": "kv_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "kv", "role": "we0" }} , 
 	{ "name": "kv_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kv", "role": "d0" }} , 
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
 	{ "name": "grp_fu_2170_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2170_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "transformer_for_sample_Pipeline_kv_i_kv_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "111", "EstimateLatencyMax" : "111",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_t", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "kv", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "kv_i_kv_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter46", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter46", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	transformer_for_sample_Pipeline_kv_i_kv_j {
		key {Type I LastRead 1 FirstWrite -1}
		value_t {Type I LastRead 2 FirstWrite -1}
		kv {Type O LastRead -1 FirstWrite 46}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "111", "Max" : "111"}
	, {"Name" : "Interval", "Min" : "111", "Max" : "111"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	key { ap_memory {  { key_address0 mem_address 1 6 }  { key_ce0 mem_ce 1 1 }  { key_q0 mem_dout 0 32 }  { key_address1 MemPortADDR2 1 6 }  { key_ce1 MemPortCE2 1 1 }  { key_q1 MemPortDOUT2 0 32 }  { key_address2 MemPortADDR2 1 6 }  { key_ce2 MemPortCE2 1 1 }  { key_q2 MemPortDOUT2 0 32 }  { key_address3 MemPortADDR2 1 6 }  { key_ce3 MemPortCE2 1 1 }  { key_q3 MemPortDOUT2 0 32 }  { key_address4 MemPortADDR2 1 6 }  { key_ce4 MemPortCE2 1 1 }  { key_q4 MemPortDOUT2 0 32 }  { key_address5 MemPortADDR2 1 6 }  { key_ce5 MemPortCE2 1 1 }  { key_q5 MemPortDOUT2 0 32 }  { key_address6 MemPortADDR2 1 6 }  { key_ce6 MemPortCE2 1 1 }  { key_q6 MemPortDOUT2 0 32 }  { key_address7 MemPortADDR2 1 6 }  { key_ce7 MemPortCE2 1 1 }  { key_q7 MemPortDOUT2 0 32 } } }
	value_t { ap_memory {  { value_t_address0 mem_address 1 6 }  { value_t_ce0 mem_ce 1 1 }  { value_t_q0 mem_dout 0 32 }  { value_t_address1 MemPortADDR2 1 6 }  { value_t_ce1 MemPortCE2 1 1 }  { value_t_q1 MemPortDOUT2 0 32 }  { value_t_address2 MemPortADDR2 1 6 }  { value_t_ce2 MemPortCE2 1 1 }  { value_t_q2 MemPortDOUT2 0 32 }  { value_t_address3 MemPortADDR2 1 6 }  { value_t_ce3 MemPortCE2 1 1 }  { value_t_q3 MemPortDOUT2 0 32 }  { value_t_address4 MemPortADDR2 1 6 }  { value_t_ce4 MemPortCE2 1 1 }  { value_t_q4 MemPortDOUT2 0 32 }  { value_t_address5 MemPortADDR2 1 6 }  { value_t_ce5 MemPortCE2 1 1 }  { value_t_q5 MemPortDOUT2 0 32 }  { value_t_address6 MemPortADDR2 1 6 }  { value_t_ce6 MemPortCE2 1 1 }  { value_t_q6 MemPortDOUT2 0 32 }  { value_t_address7 MemPortADDR2 1 6 }  { value_t_ce7 MemPortCE2 1 1 }  { value_t_q7 MemPortDOUT2 0 32 } } }
	kv { ap_memory {  { kv_address0 mem_address 1 6 }  { kv_ce0 mem_ce 1 1 }  { kv_we0 mem_we 1 1 }  { kv_d0 mem_din 1 32 } } }
}
