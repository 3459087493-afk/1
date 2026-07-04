set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7}
set C_modelType { void 0 }
set C_modelArgList {
	{ embedded_V int 16 regular {array 128 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ query_V int 16 regular {array 128 { 0 3 } 0 1 }  }
	{ key_V int 16 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ value_V int 16 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "embedded_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "query_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "key_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 69
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ embedded_V_address0 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q0 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address1 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q1 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address2 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q2 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address3 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q3 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address4 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q4 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address5 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q5 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address6 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q6 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address7 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q7 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address8 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce8 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q8 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address9 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce9 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q9 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address10 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce10 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q10 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address11 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce11 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q11 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address12 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce12 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q12 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address13 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce13 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q13 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address14 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce14 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q14 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address15 sc_out sc_lv 7 signal 0 } 
	{ embedded_V_ce15 sc_out sc_logic 1 signal 0 } 
	{ embedded_V_q15 sc_in sc_lv 16 signal 0 } 
	{ query_V_address0 sc_out sc_lv 7 signal 1 } 
	{ query_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ query_V_we0 sc_out sc_logic 1 signal 1 } 
	{ query_V_d0 sc_out sc_lv 16 signal 1 } 
	{ key_V_address0 sc_out sc_lv 7 signal 2 } 
	{ key_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ key_V_we0 sc_out sc_logic 1 signal 2 } 
	{ key_V_d0 sc_out sc_lv 16 signal 2 } 
	{ value_V_address0 sc_out sc_lv 7 signal 3 } 
	{ value_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ value_V_we0 sc_out sc_logic 1 signal 3 } 
	{ value_V_d0 sc_out sc_lv 16 signal 3 } 
	{ grp_fu_3353_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3353_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_3353_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "embedded_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address0" }} , 
 	{ "name": "embedded_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce0" }} , 
 	{ "name": "embedded_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q0" }} , 
 	{ "name": "embedded_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address1" }} , 
 	{ "name": "embedded_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce1" }} , 
 	{ "name": "embedded_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q1" }} , 
 	{ "name": "embedded_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address2" }} , 
 	{ "name": "embedded_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce2" }} , 
 	{ "name": "embedded_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q2" }} , 
 	{ "name": "embedded_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address3" }} , 
 	{ "name": "embedded_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce3" }} , 
 	{ "name": "embedded_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q3" }} , 
 	{ "name": "embedded_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address4" }} , 
 	{ "name": "embedded_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce4" }} , 
 	{ "name": "embedded_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q4" }} , 
 	{ "name": "embedded_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address5" }} , 
 	{ "name": "embedded_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce5" }} , 
 	{ "name": "embedded_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q5" }} , 
 	{ "name": "embedded_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address6" }} , 
 	{ "name": "embedded_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce6" }} , 
 	{ "name": "embedded_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q6" }} , 
 	{ "name": "embedded_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address7" }} , 
 	{ "name": "embedded_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce7" }} , 
 	{ "name": "embedded_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q7" }} , 
 	{ "name": "embedded_V_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address8" }} , 
 	{ "name": "embedded_V_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce8" }} , 
 	{ "name": "embedded_V_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q8" }} , 
 	{ "name": "embedded_V_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address9" }} , 
 	{ "name": "embedded_V_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce9" }} , 
 	{ "name": "embedded_V_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q9" }} , 
 	{ "name": "embedded_V_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address10" }} , 
 	{ "name": "embedded_V_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce10" }} , 
 	{ "name": "embedded_V_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q10" }} , 
 	{ "name": "embedded_V_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address11" }} , 
 	{ "name": "embedded_V_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce11" }} , 
 	{ "name": "embedded_V_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q11" }} , 
 	{ "name": "embedded_V_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address12" }} , 
 	{ "name": "embedded_V_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce12" }} , 
 	{ "name": "embedded_V_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q12" }} , 
 	{ "name": "embedded_V_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address13" }} , 
 	{ "name": "embedded_V_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce13" }} , 
 	{ "name": "embedded_V_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q13" }} , 
 	{ "name": "embedded_V_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address14" }} , 
 	{ "name": "embedded_V_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce14" }} , 
 	{ "name": "embedded_V_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q14" }} , 
 	{ "name": "embedded_V_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address15" }} , 
 	{ "name": "embedded_V_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce15" }} , 
 	{ "name": "embedded_V_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q15" }} , 
 	{ "name": "query_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "query_V", "role": "address0" }} , 
 	{ "name": "query_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_V", "role": "ce0" }} , 
 	{ "name": "query_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_V", "role": "we0" }} , 
 	{ "name": "query_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "query_V", "role": "d0" }} , 
 	{ "name": "key_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "key_V", "role": "address0" }} , 
 	{ "name": "key_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_V", "role": "ce0" }} , 
 	{ "name": "key_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_V", "role": "we0" }} , 
 	{ "name": "key_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "key_V", "role": "d0" }} , 
 	{ "name": "value_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_V", "role": "address0" }} , 
 	{ "name": "value_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_V", "role": "ce0" }} , 
 	{ "name": "value_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_V", "role": "we0" }} , 
 	{ "name": "value_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "value_V", "role": "d0" }} , 
 	{ "name": "grp_fu_3353_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3353_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3353_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_3353_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3353_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3353_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "174", "EstimateLatencyMax" : "174",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "value_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_111_6_VITIS_LOOP_112_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_2_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_3_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_4_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_5_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_6_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_7_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_8_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_9_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_10_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_11_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_12_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_13_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_14_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_KEY_WEIGHT_V_15_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U60", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U61", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U62", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U63", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U64", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U65", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U66", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U67", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U68", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U69", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U70", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U71", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U72", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U73", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U74", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U75", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U76", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U77", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U78", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U79", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U80", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U81", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U82", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U83", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U84", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U85", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U86", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U87", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U88", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U89", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U90", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U91", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U92", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U93", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U94", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U95", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U96", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U97", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U98", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U99", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U100", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U101", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U102", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U103", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U104", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U105", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U106", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U107", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_20s_31_4_1_U108", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U109", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U110", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7 {
		embedded_V {Type I LastRead 1 FirstWrite -1}
		query_V {Type O LastRead -1 FirstWrite 45}
		key_V {Type O LastRead -1 FirstWrite 45}
		value_V {Type O LastRead -1 FirstWrite 26}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "174", "Max" : "174"}
	, {"Name" : "Interval", "Min" : "174", "Max" : "174"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	embedded_V { ap_memory {  { embedded_V_address0 mem_address 1 7 }  { embedded_V_ce0 mem_ce 1 1 }  { embedded_V_q0 mem_dout 0 16 }  { embedded_V_address1 MemPortADDR2 1 7 }  { embedded_V_ce1 MemPortCE2 1 1 }  { embedded_V_q1 MemPortDOUT2 0 16 }  { embedded_V_address2 MemPortADDR2 1 7 }  { embedded_V_ce2 MemPortCE2 1 1 }  { embedded_V_q2 MemPortDOUT2 0 16 }  { embedded_V_address3 MemPortADDR2 1 7 }  { embedded_V_ce3 MemPortCE2 1 1 }  { embedded_V_q3 MemPortDOUT2 0 16 }  { embedded_V_address4 MemPortADDR2 1 7 }  { embedded_V_ce4 MemPortCE2 1 1 }  { embedded_V_q4 MemPortDOUT2 0 16 }  { embedded_V_address5 MemPortADDR2 1 7 }  { embedded_V_ce5 MemPortCE2 1 1 }  { embedded_V_q5 MemPortDOUT2 0 16 }  { embedded_V_address6 MemPortADDR2 1 7 }  { embedded_V_ce6 MemPortCE2 1 1 }  { embedded_V_q6 MemPortDOUT2 0 16 }  { embedded_V_address7 MemPortADDR2 1 7 }  { embedded_V_ce7 MemPortCE2 1 1 }  { embedded_V_q7 MemPortDOUT2 0 16 }  { embedded_V_address8 MemPortADDR2 1 7 }  { embedded_V_ce8 MemPortCE2 1 1 }  { embedded_V_q8 MemPortDOUT2 0 16 }  { embedded_V_address9 MemPortADDR2 1 7 }  { embedded_V_ce9 MemPortCE2 1 1 }  { embedded_V_q9 MemPortDOUT2 0 16 }  { embedded_V_address10 MemPortADDR2 1 7 }  { embedded_V_ce10 MemPortCE2 1 1 }  { embedded_V_q10 MemPortDOUT2 0 16 }  { embedded_V_address11 MemPortADDR2 1 7 }  { embedded_V_ce11 MemPortCE2 1 1 }  { embedded_V_q11 MemPortDOUT2 0 16 }  { embedded_V_address12 MemPortADDR2 1 7 }  { embedded_V_ce12 MemPortCE2 1 1 }  { embedded_V_q12 MemPortDOUT2 0 16 }  { embedded_V_address13 MemPortADDR2 1 7 }  { embedded_V_ce13 MemPortCE2 1 1 }  { embedded_V_q13 MemPortDOUT2 0 16 }  { embedded_V_address14 MemPortADDR2 1 7 }  { embedded_V_ce14 MemPortCE2 1 1 }  { embedded_V_q14 in_data 0 16 }  { embedded_V_address15 MemPortADDR2 1 7 }  { embedded_V_ce15 MemPortCE2 1 1 }  { embedded_V_q15 in_data 0 16 } } }
	query_V { ap_memory {  { query_V_address0 mem_address 1 7 }  { query_V_ce0 mem_ce 1 1 }  { query_V_we0 mem_we 1 1 }  { query_V_d0 mem_din 1 16 } } }
	key_V { ap_memory {  { key_V_address0 mem_address 1 7 }  { key_V_ce0 mem_ce 1 1 }  { key_V_we0 mem_we 1 1 }  { key_V_d0 mem_din 1 16 } } }
	value_V { ap_memory {  { value_V_address0 mem_address 1 7 }  { value_V_ce0 mem_ce 1 1 }  { value_V_we0 mem_we 1 1 }  { value_V_d0 mem_din 1 16 } } }
}
