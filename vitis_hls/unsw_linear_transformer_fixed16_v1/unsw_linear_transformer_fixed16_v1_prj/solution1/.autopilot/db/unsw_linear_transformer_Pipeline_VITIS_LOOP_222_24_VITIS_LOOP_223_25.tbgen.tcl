set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25}
set C_modelType { void 0 }
set C_modelArgList {
	{ feedforward_hidden_V int 15 regular {array 256 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ norm1 int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ residual2_V int 16 regular {array 128 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "feedforward_hidden_V", "interface" : "memory", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "norm1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "residual2_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ feedforward_hidden_V_address0 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q0 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address1 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q1 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address2 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q2 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address3 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q3 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address4 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q4 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address5 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q5 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address6 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q6 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address7 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q7 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address8 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce8 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q8 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address9 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce9 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q9 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address10 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce10 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q10 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address11 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce11 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q11 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address12 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce12 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q12 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address13 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce13 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q13 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address14 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce14 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q14 sc_in sc_lv 15 signal 0 } 
	{ feedforward_hidden_V_address15 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_V_ce15 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_V_q15 sc_in sc_lv 15 signal 0 } 
	{ norm1_address0 sc_out sc_lv 7 signal 1 } 
	{ norm1_ce0 sc_out sc_logic 1 signal 1 } 
	{ norm1_q0 sc_in sc_lv 16 signal 1 } 
	{ residual2_V_address0 sc_out sc_lv 7 signal 2 } 
	{ residual2_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ residual2_V_we0 sc_out sc_logic 1 signal 2 } 
	{ residual2_V_d0 sc_out sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "feedforward_hidden_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address0" }} , 
 	{ "name": "feedforward_hidden_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce0" }} , 
 	{ "name": "feedforward_hidden_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q0" }} , 
 	{ "name": "feedforward_hidden_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address1" }} , 
 	{ "name": "feedforward_hidden_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce1" }} , 
 	{ "name": "feedforward_hidden_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q1" }} , 
 	{ "name": "feedforward_hidden_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address2" }} , 
 	{ "name": "feedforward_hidden_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce2" }} , 
 	{ "name": "feedforward_hidden_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q2" }} , 
 	{ "name": "feedforward_hidden_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address3" }} , 
 	{ "name": "feedforward_hidden_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce3" }} , 
 	{ "name": "feedforward_hidden_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q3" }} , 
 	{ "name": "feedforward_hidden_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address4" }} , 
 	{ "name": "feedforward_hidden_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce4" }} , 
 	{ "name": "feedforward_hidden_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q4" }} , 
 	{ "name": "feedforward_hidden_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address5" }} , 
 	{ "name": "feedforward_hidden_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce5" }} , 
 	{ "name": "feedforward_hidden_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q5" }} , 
 	{ "name": "feedforward_hidden_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address6" }} , 
 	{ "name": "feedforward_hidden_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce6" }} , 
 	{ "name": "feedforward_hidden_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q6" }} , 
 	{ "name": "feedforward_hidden_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address7" }} , 
 	{ "name": "feedforward_hidden_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce7" }} , 
 	{ "name": "feedforward_hidden_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q7" }} , 
 	{ "name": "feedforward_hidden_V_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address8" }} , 
 	{ "name": "feedforward_hidden_V_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce8" }} , 
 	{ "name": "feedforward_hidden_V_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q8" }} , 
 	{ "name": "feedforward_hidden_V_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address9" }} , 
 	{ "name": "feedforward_hidden_V_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce9" }} , 
 	{ "name": "feedforward_hidden_V_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q9" }} , 
 	{ "name": "feedforward_hidden_V_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address10" }} , 
 	{ "name": "feedforward_hidden_V_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce10" }} , 
 	{ "name": "feedforward_hidden_V_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q10" }} , 
 	{ "name": "feedforward_hidden_V_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address11" }} , 
 	{ "name": "feedforward_hidden_V_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce11" }} , 
 	{ "name": "feedforward_hidden_V_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q11" }} , 
 	{ "name": "feedforward_hidden_V_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address12" }} , 
 	{ "name": "feedforward_hidden_V_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce12" }} , 
 	{ "name": "feedforward_hidden_V_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q12" }} , 
 	{ "name": "feedforward_hidden_V_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address13" }} , 
 	{ "name": "feedforward_hidden_V_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce13" }} , 
 	{ "name": "feedforward_hidden_V_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q13" }} , 
 	{ "name": "feedforward_hidden_V_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address14" }} , 
 	{ "name": "feedforward_hidden_V_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce14" }} , 
 	{ "name": "feedforward_hidden_V_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q14" }} , 
 	{ "name": "feedforward_hidden_V_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address15" }} , 
 	{ "name": "feedforward_hidden_V_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce15" }} , 
 	{ "name": "feedforward_hidden_V_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q15" }} , 
 	{ "name": "norm1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "norm1", "role": "address0" }} , 
 	{ "name": "norm1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "norm1", "role": "ce0" }} , 
 	{ "name": "norm1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "norm1", "role": "q0" }} , 
 	{ "name": "residual2_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "residual2_V", "role": "address0" }} , 
 	{ "name": "residual2_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2_V", "role": "ce0" }} , 
 	{ "name": "residual2_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2_V", "role": "we0" }} , 
 	{ "name": "residual2_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "residual2_V", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "304", "EstimateLatencyMax" : "304",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "feedforward_hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual2_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_222_24_VITIS_LOOP_223_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter24", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter24", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_BIAS_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U389", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U390", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U391", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U392", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U393", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U394", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U395", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U396", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U397", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U398", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U399", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U400", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U401", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U402", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U403", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U404", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U405", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U406", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U407", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U408", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U409", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U410", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U411", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U412", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U413", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U414", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U415", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U416", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U417", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U418", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U419", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_19ns_32_4_1_U420", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25 {
		feedforward_hidden_V {Type I LastRead 2 FirstWrite -1}
		norm1 {Type I LastRead 45 FirstWrite -1}
		residual2_V {Type O LastRead -1 FirstWrite 48}
		LAYERS_0_FEEDFORWARD_3_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "304", "Max" : "304"}
	, {"Name" : "Interval", "Min" : "304", "Max" : "304"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	feedforward_hidden_V { ap_memory {  { feedforward_hidden_V_address0 mem_address 1 8 }  { feedforward_hidden_V_ce0 mem_ce 1 1 }  { feedforward_hidden_V_q0 in_data 0 15 }  { feedforward_hidden_V_address1 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce1 MemPortCE2 1 1 }  { feedforward_hidden_V_q1 in_data 0 15 }  { feedforward_hidden_V_address2 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce2 MemPortCE2 1 1 }  { feedforward_hidden_V_q2 in_data 0 15 }  { feedforward_hidden_V_address3 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce3 MemPortCE2 1 1 }  { feedforward_hidden_V_q3 in_data 0 15 }  { feedforward_hidden_V_address4 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce4 MemPortCE2 1 1 }  { feedforward_hidden_V_q4 in_data 0 15 }  { feedforward_hidden_V_address5 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce5 MemPortCE2 1 1 }  { feedforward_hidden_V_q5 in_data 0 15 }  { feedforward_hidden_V_address6 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce6 MemPortCE2 1 1 }  { feedforward_hidden_V_q6 in_data 0 15 }  { feedforward_hidden_V_address7 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce7 MemPortCE2 1 1 }  { feedforward_hidden_V_q7 in_data 0 15 }  { feedforward_hidden_V_address8 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce8 MemPortCE2 1 1 }  { feedforward_hidden_V_q8 in_data 0 15 }  { feedforward_hidden_V_address9 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce9 MemPortCE2 1 1 }  { feedforward_hidden_V_q9 in_data 0 15 }  { feedforward_hidden_V_address10 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce10 MemPortCE2 1 1 }  { feedforward_hidden_V_q10 in_data 0 15 }  { feedforward_hidden_V_address11 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce11 MemPortCE2 1 1 }  { feedforward_hidden_V_q11 in_data 0 15 }  { feedforward_hidden_V_address12 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce12 MemPortCE2 1 1 }  { feedforward_hidden_V_q12 in_data 0 15 }  { feedforward_hidden_V_address13 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce13 MemPortCE2 1 1 }  { feedforward_hidden_V_q13 in_data 0 15 }  { feedforward_hidden_V_address14 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce14 MemPortCE2 1 1 }  { feedforward_hidden_V_q14 in_data 0 15 }  { feedforward_hidden_V_address15 MemPortADDR2 1 8 }  { feedforward_hidden_V_ce15 MemPortCE2 1 1 }  { feedforward_hidden_V_q15 in_data 0 15 } } }
	norm1 { ap_memory {  { norm1_address0 mem_address 1 7 }  { norm1_ce0 mem_ce 1 1 }  { norm1_q0 mem_dout 0 16 } } }
	residual2_V { ap_memory {  { residual2_V_address0 mem_address 1 7 }  { residual2_V_ce0 mem_ce 1 1 }  { residual2_V_we0 mem_we 1 1 }  { residual2_V_d0 mem_din 1 16 } } }
}
