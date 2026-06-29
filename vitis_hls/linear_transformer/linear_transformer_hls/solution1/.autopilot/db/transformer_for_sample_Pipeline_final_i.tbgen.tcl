set moduleName transformer_for_sample_Pipeline_final_i
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
set C_modelName {transformer_for_sample_Pipeline_final_i}
set C_modelType { void 0 }
set C_modelArgList {
	{ encoder_out float 32 regular {array 64 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ final_out float 32 regular {array 8 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "encoder_out", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "final_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 111
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ encoder_out_address0 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce0 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q0 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address1 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce1 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q1 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address2 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce2 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q2 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address3 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce3 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q3 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address4 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce4 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q4 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address5 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce5 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q5 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address6 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce6 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q6 sc_in sc_lv 32 signal 0 } 
	{ encoder_out_address7 sc_out sc_lv 6 signal 0 } 
	{ encoder_out_ce7 sc_out sc_logic 1 signal 0 } 
	{ encoder_out_q7 sc_in sc_lv 32 signal 0 } 
	{ final_out_address0 sc_out sc_lv 3 signal 1 } 
	{ final_out_ce0 sc_out sc_logic 1 signal 1 } 
	{ final_out_we0 sc_out sc_logic 1 signal 1 } 
	{ final_out_d0 sc_out sc_lv 32 signal 1 } 
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
 	{ "name": "encoder_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address0" }} , 
 	{ "name": "encoder_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce0" }} , 
 	{ "name": "encoder_out_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q0" }} , 
 	{ "name": "encoder_out_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address1" }} , 
 	{ "name": "encoder_out_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce1" }} , 
 	{ "name": "encoder_out_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q1" }} , 
 	{ "name": "encoder_out_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address2" }} , 
 	{ "name": "encoder_out_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce2" }} , 
 	{ "name": "encoder_out_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q2" }} , 
 	{ "name": "encoder_out_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address3" }} , 
 	{ "name": "encoder_out_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce3" }} , 
 	{ "name": "encoder_out_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q3" }} , 
 	{ "name": "encoder_out_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address4" }} , 
 	{ "name": "encoder_out_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce4" }} , 
 	{ "name": "encoder_out_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q4" }} , 
 	{ "name": "encoder_out_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address5" }} , 
 	{ "name": "encoder_out_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce5" }} , 
 	{ "name": "encoder_out_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q5" }} , 
 	{ "name": "encoder_out_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address6" }} , 
 	{ "name": "encoder_out_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce6" }} , 
 	{ "name": "encoder_out_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q6" }} , 
 	{ "name": "encoder_out_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address7" }} , 
 	{ "name": "encoder_out_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce7" }} , 
 	{ "name": "encoder_out_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "q7" }} , 
 	{ "name": "final_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "final_out", "role": "address0" }} , 
 	{ "name": "final_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_out", "role": "ce0" }} , 
 	{ "name": "final_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_out", "role": "we0" }} , 
 	{ "name": "final_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "final_out", "role": "d0" }} , 
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
		"CDFG" : "transformer_for_sample_Pipeline_final_i",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "60", "EstimateLatencyMax" : "60",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "encoder_out", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "final_out", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "final_i", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter51", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter51", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	transformer_for_sample_Pipeline_final_i {
		encoder_out {Type I LastRead 1 FirstWrite -1}
		final_out {Type O LastRead -1 FirstWrite 51}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "60", "Max" : "60"}
	, {"Name" : "Interval", "Min" : "60", "Max" : "60"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	encoder_out { ap_memory {  { encoder_out_address0 mem_address 1 6 }  { encoder_out_ce0 mem_ce 1 1 }  { encoder_out_q0 mem_dout 0 32 }  { encoder_out_address1 MemPortADDR2 1 6 }  { encoder_out_ce1 MemPortCE2 1 1 }  { encoder_out_q1 MemPortDOUT2 0 32 }  { encoder_out_address2 MemPortADDR2 1 6 }  { encoder_out_ce2 MemPortCE2 1 1 }  { encoder_out_q2 MemPortDOUT2 0 32 }  { encoder_out_address3 MemPortADDR2 1 6 }  { encoder_out_ce3 MemPortCE2 1 1 }  { encoder_out_q3 MemPortDOUT2 0 32 }  { encoder_out_address4 MemPortADDR2 1 6 }  { encoder_out_ce4 MemPortCE2 1 1 }  { encoder_out_q4 MemPortDOUT2 0 32 }  { encoder_out_address5 MemPortADDR2 1 6 }  { encoder_out_ce5 MemPortCE2 1 1 }  { encoder_out_q5 MemPortDOUT2 0 32 }  { encoder_out_address6 MemPortADDR2 1 6 }  { encoder_out_ce6 MemPortCE2 1 1 }  { encoder_out_q6 MemPortDOUT2 0 32 }  { encoder_out_address7 MemPortADDR2 1 6 }  { encoder_out_ce7 MemPortCE2 1 1 }  { encoder_out_q7 MemPortDOUT2 0 32 } } }
	final_out { ap_memory {  { final_out_address0 mem_address 1 3 }  { final_out_ce0 mem_ce 1 1 }  { final_out_we0 mem_we 1 1 }  { final_out_d0 mem_din 1 32 } } }
}
