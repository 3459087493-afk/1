set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19}
set C_modelType { void 0 }
set C_modelArgList {
	{ attention_V int 16 regular {array 128 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ embedded_V int 16 regular {array 128 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ residual1_V int 16 regular {array 128 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "attention_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "embedded_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "residual1_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ attention_V_address0 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q0 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address1 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q1 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address2 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q2 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address3 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q3 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address4 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q4 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address5 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q5 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address6 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q6 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address7 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q7 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address8 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce8 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q8 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address9 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce9 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q9 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address10 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce10 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q10 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address11 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce11 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q11 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address12 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce12 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q12 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address13 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce13 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q13 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address14 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce14 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q14 sc_in sc_lv 16 signal 0 } 
	{ attention_V_address15 sc_out sc_lv 7 signal 0 } 
	{ attention_V_ce15 sc_out sc_logic 1 signal 0 } 
	{ attention_V_q15 sc_in sc_lv 16 signal 0 } 
	{ embedded_V_address0 sc_out sc_lv 7 signal 1 } 
	{ embedded_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ embedded_V_q0 sc_in sc_lv 16 signal 1 } 
	{ residual1_V_address0 sc_out sc_lv 7 signal 2 } 
	{ residual1_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ residual1_V_we0 sc_out sc_logic 1 signal 2 } 
	{ residual1_V_d0 sc_out sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "attention_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address0" }} , 
 	{ "name": "attention_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce0" }} , 
 	{ "name": "attention_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q0" }} , 
 	{ "name": "attention_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address1" }} , 
 	{ "name": "attention_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce1" }} , 
 	{ "name": "attention_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q1" }} , 
 	{ "name": "attention_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address2" }} , 
 	{ "name": "attention_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce2" }} , 
 	{ "name": "attention_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q2" }} , 
 	{ "name": "attention_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address3" }} , 
 	{ "name": "attention_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce3" }} , 
 	{ "name": "attention_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q3" }} , 
 	{ "name": "attention_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address4" }} , 
 	{ "name": "attention_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce4" }} , 
 	{ "name": "attention_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q4" }} , 
 	{ "name": "attention_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address5" }} , 
 	{ "name": "attention_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce5" }} , 
 	{ "name": "attention_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q5" }} , 
 	{ "name": "attention_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address6" }} , 
 	{ "name": "attention_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce6" }} , 
 	{ "name": "attention_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q6" }} , 
 	{ "name": "attention_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address7" }} , 
 	{ "name": "attention_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce7" }} , 
 	{ "name": "attention_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q7" }} , 
 	{ "name": "attention_V_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address8" }} , 
 	{ "name": "attention_V_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce8" }} , 
 	{ "name": "attention_V_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q8" }} , 
 	{ "name": "attention_V_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address9" }} , 
 	{ "name": "attention_V_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce9" }} , 
 	{ "name": "attention_V_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q9" }} , 
 	{ "name": "attention_V_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address10" }} , 
 	{ "name": "attention_V_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce10" }} , 
 	{ "name": "attention_V_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q10" }} , 
 	{ "name": "attention_V_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address11" }} , 
 	{ "name": "attention_V_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce11" }} , 
 	{ "name": "attention_V_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q11" }} , 
 	{ "name": "attention_V_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address12" }} , 
 	{ "name": "attention_V_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce12" }} , 
 	{ "name": "attention_V_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q12" }} , 
 	{ "name": "attention_V_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address13" }} , 
 	{ "name": "attention_V_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce13" }} , 
 	{ "name": "attention_V_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q13" }} , 
 	{ "name": "attention_V_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address14" }} , 
 	{ "name": "attention_V_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce14" }} , 
 	{ "name": "attention_V_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q14" }} , 
 	{ "name": "attention_V_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address15" }} , 
 	{ "name": "attention_V_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce15" }} , 
 	{ "name": "attention_V_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "q15" }} , 
 	{ "name": "embedded_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address0" }} , 
 	{ "name": "embedded_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce0" }} , 
 	{ "name": "embedded_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q0" }} , 
 	{ "name": "residual1_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "residual1_V", "role": "address0" }} , 
 	{ "name": "residual1_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual1_V", "role": "ce0" }} , 
 	{ "name": "residual1_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual1_V", "role": "we0" }} , 
 	{ "name": "residual1_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "residual1_V", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "157", "EstimateLatencyMax" : "157",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual1_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_187_18_VITIS_LOOP_188_19", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter28", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter28", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_BIAS_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U224", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U225", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U226", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U227", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U228", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U229", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U230", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U231", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U232", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U233", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U234", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U235", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U236", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U237", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U238", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U239", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19 {
		attention_V {Type I LastRead 1 FirstWrite -1}
		embedded_V {Type I LastRead 1 FirstWrite -1}
		residual1_V {Type O LastRead -1 FirstWrite 28}
		LAYERS_0_ATTENTION_OUTPUT_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "157", "Max" : "157"}
	, {"Name" : "Interval", "Min" : "157", "Max" : "157"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	attention_V { ap_memory {  { attention_V_address0 mem_address 1 7 }  { attention_V_ce0 mem_ce 1 1 }  { attention_V_q0 mem_dout 0 16 }  { attention_V_address1 MemPortADDR2 1 7 }  { attention_V_ce1 MemPortCE2 1 1 }  { attention_V_q1 MemPortDOUT2 0 16 }  { attention_V_address2 MemPortADDR2 1 7 }  { attention_V_ce2 MemPortCE2 1 1 }  { attention_V_q2 MemPortDOUT2 0 16 }  { attention_V_address3 MemPortADDR2 1 7 }  { attention_V_ce3 MemPortCE2 1 1 }  { attention_V_q3 MemPortDOUT2 0 16 }  { attention_V_address4 MemPortADDR2 1 7 }  { attention_V_ce4 MemPortCE2 1 1 }  { attention_V_q4 MemPortDOUT2 0 16 }  { attention_V_address5 MemPortADDR2 1 7 }  { attention_V_ce5 MemPortCE2 1 1 }  { attention_V_q5 MemPortDOUT2 0 16 }  { attention_V_address6 MemPortADDR2 1 7 }  { attention_V_ce6 MemPortCE2 1 1 }  { attention_V_q6 MemPortDOUT2 0 16 }  { attention_V_address7 MemPortADDR2 1 7 }  { attention_V_ce7 MemPortCE2 1 1 }  { attention_V_q7 MemPortDOUT2 0 16 }  { attention_V_address8 MemPortADDR2 1 7 }  { attention_V_ce8 MemPortCE2 1 1 }  { attention_V_q8 MemPortDOUT2 0 16 }  { attention_V_address9 MemPortADDR2 1 7 }  { attention_V_ce9 MemPortCE2 1 1 }  { attention_V_q9 MemPortDOUT2 0 16 }  { attention_V_address10 MemPortADDR2 1 7 }  { attention_V_ce10 MemPortCE2 1 1 }  { attention_V_q10 MemPortDOUT2 0 16 }  { attention_V_address11 MemPortADDR2 1 7 }  { attention_V_ce11 MemPortCE2 1 1 }  { attention_V_q11 MemPortDOUT2 0 16 }  { attention_V_address12 MemPortADDR2 1 7 }  { attention_V_ce12 MemPortCE2 1 1 }  { attention_V_q12 MemPortDOUT2 0 16 }  { attention_V_address13 MemPortADDR2 1 7 }  { attention_V_ce13 MemPortCE2 1 1 }  { attention_V_q13 MemPortDOUT2 0 16 }  { attention_V_address14 MemPortADDR2 1 7 }  { attention_V_ce14 MemPortCE2 1 1 }  { attention_V_q14 MemPortDOUT2 0 16 }  { attention_V_address15 MemPortADDR2 1 7 }  { attention_V_ce15 MemPortCE2 1 1 }  { attention_V_q15 in_data 0 16 } } }
	embedded_V { ap_memory {  { embedded_V_address0 mem_address 1 7 }  { embedded_V_ce0 mem_ce 1 1 }  { embedded_V_q0 mem_dout 0 16 } } }
	residual1_V { ap_memory {  { residual1_V_address0 mem_address 1 7 }  { residual1_V_ce0 mem_ce 1 1 }  { residual1_V_we0 mem_we 1 1 }  { residual1_V_d0 mem_din 1 16 } } }
}
