set moduleName transformer_for_sample_Pipeline_ff2_i_ff2_j
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
set C_modelName {transformer_for_sample_Pipeline_ff2_i_ff2_j}
set C_modelType { void 0 }
set C_modelArgList {
	{ ff1 float 32 regular {array 128 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ attn_residual float 32 regular {array 64 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ encoder_out float 32 regular {array 64 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ff1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "attn_residual", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "encoder_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 215
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ff1_address0 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce0 sc_out sc_logic 1 signal 0 } 
	{ ff1_q0 sc_in sc_lv 32 signal 0 } 
	{ ff1_address1 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce1 sc_out sc_logic 1 signal 0 } 
	{ ff1_q1 sc_in sc_lv 32 signal 0 } 
	{ ff1_address2 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce2 sc_out sc_logic 1 signal 0 } 
	{ ff1_q2 sc_in sc_lv 32 signal 0 } 
	{ ff1_address3 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce3 sc_out sc_logic 1 signal 0 } 
	{ ff1_q3 sc_in sc_lv 32 signal 0 } 
	{ ff1_address4 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce4 sc_out sc_logic 1 signal 0 } 
	{ ff1_q4 sc_in sc_lv 32 signal 0 } 
	{ ff1_address5 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce5 sc_out sc_logic 1 signal 0 } 
	{ ff1_q5 sc_in sc_lv 32 signal 0 } 
	{ ff1_address6 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce6 sc_out sc_logic 1 signal 0 } 
	{ ff1_q6 sc_in sc_lv 32 signal 0 } 
	{ ff1_address7 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce7 sc_out sc_logic 1 signal 0 } 
	{ ff1_q7 sc_in sc_lv 32 signal 0 } 
	{ ff1_address8 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce8 sc_out sc_logic 1 signal 0 } 
	{ ff1_q8 sc_in sc_lv 32 signal 0 } 
	{ ff1_address9 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce9 sc_out sc_logic 1 signal 0 } 
	{ ff1_q9 sc_in sc_lv 32 signal 0 } 
	{ ff1_address10 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce10 sc_out sc_logic 1 signal 0 } 
	{ ff1_q10 sc_in sc_lv 32 signal 0 } 
	{ ff1_address11 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce11 sc_out sc_logic 1 signal 0 } 
	{ ff1_q11 sc_in sc_lv 32 signal 0 } 
	{ ff1_address12 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce12 sc_out sc_logic 1 signal 0 } 
	{ ff1_q12 sc_in sc_lv 32 signal 0 } 
	{ ff1_address13 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce13 sc_out sc_logic 1 signal 0 } 
	{ ff1_q13 sc_in sc_lv 32 signal 0 } 
	{ ff1_address14 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce14 sc_out sc_logic 1 signal 0 } 
	{ ff1_q14 sc_in sc_lv 32 signal 0 } 
	{ ff1_address15 sc_out sc_lv 7 signal 0 } 
	{ ff1_ce15 sc_out sc_logic 1 signal 0 } 
	{ ff1_q15 sc_in sc_lv 32 signal 0 } 
	{ attn_residual_address0 sc_out sc_lv 6 signal 1 } 
	{ attn_residual_ce0 sc_out sc_logic 1 signal 1 } 
	{ attn_residual_q0 sc_in sc_lv 32 signal 1 } 
	{ encoder_out_address0 sc_out sc_lv 6 signal 2 } 
	{ encoder_out_ce0 sc_out sc_logic 1 signal 2 } 
	{ encoder_out_we0 sc_out sc_logic 1 signal 2 } 
	{ encoder_out_d0 sc_out sc_lv 32 signal 2 } 
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
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ff1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address0" }} , 
 	{ "name": "ff1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce0" }} , 
 	{ "name": "ff1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q0" }} , 
 	{ "name": "ff1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address1" }} , 
 	{ "name": "ff1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce1" }} , 
 	{ "name": "ff1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q1" }} , 
 	{ "name": "ff1_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address2" }} , 
 	{ "name": "ff1_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce2" }} , 
 	{ "name": "ff1_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q2" }} , 
 	{ "name": "ff1_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address3" }} , 
 	{ "name": "ff1_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce3" }} , 
 	{ "name": "ff1_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q3" }} , 
 	{ "name": "ff1_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address4" }} , 
 	{ "name": "ff1_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce4" }} , 
 	{ "name": "ff1_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q4" }} , 
 	{ "name": "ff1_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address5" }} , 
 	{ "name": "ff1_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce5" }} , 
 	{ "name": "ff1_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q5" }} , 
 	{ "name": "ff1_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address6" }} , 
 	{ "name": "ff1_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce6" }} , 
 	{ "name": "ff1_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q6" }} , 
 	{ "name": "ff1_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address7" }} , 
 	{ "name": "ff1_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce7" }} , 
 	{ "name": "ff1_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q7" }} , 
 	{ "name": "ff1_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address8" }} , 
 	{ "name": "ff1_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce8" }} , 
 	{ "name": "ff1_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q8" }} , 
 	{ "name": "ff1_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address9" }} , 
 	{ "name": "ff1_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce9" }} , 
 	{ "name": "ff1_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q9" }} , 
 	{ "name": "ff1_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address10" }} , 
 	{ "name": "ff1_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce10" }} , 
 	{ "name": "ff1_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q10" }} , 
 	{ "name": "ff1_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address11" }} , 
 	{ "name": "ff1_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce11" }} , 
 	{ "name": "ff1_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q11" }} , 
 	{ "name": "ff1_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address12" }} , 
 	{ "name": "ff1_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce12" }} , 
 	{ "name": "ff1_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q12" }} , 
 	{ "name": "ff1_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address13" }} , 
 	{ "name": "ff1_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce13" }} , 
 	{ "name": "ff1_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q13" }} , 
 	{ "name": "ff1_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address14" }} , 
 	{ "name": "ff1_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce14" }} , 
 	{ "name": "ff1_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q14" }} , 
 	{ "name": "ff1_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "ff1", "role": "address15" }} , 
 	{ "name": "ff1_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff1", "role": "ce15" }} , 
 	{ "name": "ff1_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ff1", "role": "q15" }} , 
 	{ "name": "attn_residual_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "attn_residual", "role": "address0" }} , 
 	{ "name": "attn_residual_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attn_residual", "role": "ce0" }} , 
 	{ "name": "attn_residual_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attn_residual", "role": "q0" }} , 
 	{ "name": "encoder_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "encoder_out", "role": "address0" }} , 
 	{ "name": "encoder_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "ce0" }} , 
 	{ "name": "encoder_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "encoder_out", "role": "we0" }} , 
 	{ "name": "encoder_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "encoder_out", "role": "d0" }} , 
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
 	{ "name": "grp_fu_2202_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2202_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "transformer_for_sample_Pipeline_ff2_i_ff2_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "161", "EstimateLatencyMax" : "161",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ff1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "attn_residual", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "encoder_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ff2_i_ff2_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter96", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter96", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	transformer_for_sample_Pipeline_ff2_i_ff2_j {
		ff1 {Type I LastRead 1 FirstWrite -1}
		attn_residual {Type I LastRead 1 FirstWrite -1}
		encoder_out {Type O LastRead -1 FirstWrite 96}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "161", "Max" : "161"}
	, {"Name" : "Interval", "Min" : "161", "Max" : "161"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ff1 { ap_memory {  { ff1_address0 mem_address 1 7 }  { ff1_ce0 mem_ce 1 1 }  { ff1_q0 mem_dout 0 32 }  { ff1_address1 MemPortADDR2 1 7 }  { ff1_ce1 MemPortCE2 1 1 }  { ff1_q1 MemPortDOUT2 0 32 }  { ff1_address2 MemPortADDR2 1 7 }  { ff1_ce2 MemPortCE2 1 1 }  { ff1_q2 MemPortDOUT2 0 32 }  { ff1_address3 MemPortADDR2 1 7 }  { ff1_ce3 MemPortCE2 1 1 }  { ff1_q3 MemPortDOUT2 0 32 }  { ff1_address4 MemPortADDR2 1 7 }  { ff1_ce4 MemPortCE2 1 1 }  { ff1_q4 MemPortDOUT2 0 32 }  { ff1_address5 MemPortADDR2 1 7 }  { ff1_ce5 MemPortCE2 1 1 }  { ff1_q5 MemPortDOUT2 0 32 }  { ff1_address6 MemPortADDR2 1 7 }  { ff1_ce6 MemPortCE2 1 1 }  { ff1_q6 MemPortDOUT2 0 32 }  { ff1_address7 MemPortADDR2 1 7 }  { ff1_ce7 MemPortCE2 1 1 }  { ff1_q7 MemPortDOUT2 0 32 }  { ff1_address8 MemPortADDR2 1 7 }  { ff1_ce8 MemPortCE2 1 1 }  { ff1_q8 MemPortDOUT2 0 32 }  { ff1_address9 MemPortADDR2 1 7 }  { ff1_ce9 MemPortCE2 1 1 }  { ff1_q9 MemPortDOUT2 0 32 }  { ff1_address10 MemPortADDR2 1 7 }  { ff1_ce10 MemPortCE2 1 1 }  { ff1_q10 MemPortDOUT2 0 32 }  { ff1_address11 MemPortADDR2 1 7 }  { ff1_ce11 MemPortCE2 1 1 }  { ff1_q11 MemPortDOUT2 0 32 }  { ff1_address12 MemPortADDR2 1 7 }  { ff1_ce12 MemPortCE2 1 1 }  { ff1_q12 MemPortDOUT2 0 32 }  { ff1_address13 MemPortADDR2 1 7 }  { ff1_ce13 MemPortCE2 1 1 }  { ff1_q13 MemPortDOUT2 0 32 }  { ff1_address14 MemPortADDR2 1 7 }  { ff1_ce14 MemPortCE2 1 1 }  { ff1_q14 MemPortDOUT2 0 32 }  { ff1_address15 MemPortADDR2 1 7 }  { ff1_ce15 MemPortCE2 1 1 }  { ff1_q15 MemPortDOUT2 0 32 } } }
	attn_residual { ap_memory {  { attn_residual_address0 mem_address 1 6 }  { attn_residual_ce0 mem_ce 1 1 }  { attn_residual_q0 mem_dout 0 32 } } }
	encoder_out { ap_memory {  { encoder_out_address0 mem_address 1 6 }  { encoder_out_ce0 mem_ce 1 1 }  { encoder_out_we0 mem_we 1 1 }  { encoder_out_d0 mem_din 1 32 } } }
}
