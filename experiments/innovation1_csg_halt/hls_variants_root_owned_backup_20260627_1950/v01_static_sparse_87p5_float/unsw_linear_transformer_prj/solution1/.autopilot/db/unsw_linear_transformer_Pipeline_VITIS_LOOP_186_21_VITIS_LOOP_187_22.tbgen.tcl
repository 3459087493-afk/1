set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22}
set C_modelType { void 0 }
set C_modelArgList {
	{ norm1 float 32 regular {array 128 { 1 1 } 1 1 }  }
	{ feedforward_hidden float 32 regular {array 256 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "norm1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "feedforward_hidden", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ norm1_address0 sc_out sc_lv 7 signal 0 } 
	{ norm1_ce0 sc_out sc_logic 1 signal 0 } 
	{ norm1_q0 sc_in sc_lv 32 signal 0 } 
	{ norm1_address1 sc_out sc_lv 7 signal 0 } 
	{ norm1_ce1 sc_out sc_logic 1 signal 0 } 
	{ norm1_q1 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address0 sc_out sc_lv 8 signal 1 } 
	{ feedforward_hidden_ce0 sc_out sc_logic 1 signal 1 } 
	{ feedforward_hidden_we0 sc_out sc_logic 1 signal 1 } 
	{ feedforward_hidden_d0 sc_out sc_lv 32 signal 1 } 
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
	{ grp_fu_1211_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1882_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1882_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1222_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1222_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1222_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_1222_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_1222_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "norm1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "norm1", "role": "address0" }} , 
 	{ "name": "norm1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "norm1", "role": "ce0" }} , 
 	{ "name": "norm1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "norm1", "role": "q0" }} , 
 	{ "name": "norm1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "norm1", "role": "address1" }} , 
 	{ "name": "norm1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "norm1", "role": "ce1" }} , 
 	{ "name": "norm1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "norm1", "role": "q1" }} , 
 	{ "name": "feedforward_hidden_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address0" }} , 
 	{ "name": "feedforward_hidden_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce0" }} , 
 	{ "name": "feedforward_hidden_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "we0" }} , 
 	{ "name": "feedforward_hidden_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "d0" }} , 
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
 	{ "name": "grp_fu_1211_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1211_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1882_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1882_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1882_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1222_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1222_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1222_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1222_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1222_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_1222_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1222_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1222_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1222_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1222_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2130", "EstimateLatencyMax" : "2130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "feedforward_hidden", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_186_21_VITIS_LOOP_187_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_BIAS_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_8_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_9_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_10_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_11_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_12_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_13_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_14_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_15_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_186_21_VITIS_LOOP_187_22 {
		norm1 {Type I LastRead 8 FirstWrite -1}
		feedforward_hidden {Type O LastRead -1 FirstWrite 88}
		LAYERS_0_FEEDFORWARD_0_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2130", "Max" : "2130"}
	, {"Name" : "Interval", "Min" : "2130", "Max" : "2130"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	norm1 { ap_memory {  { norm1_address0 mem_address 1 7 }  { norm1_ce0 mem_ce 1 1 }  { norm1_q0 mem_dout 0 32 }  { norm1_address1 MemPortADDR2 1 7 }  { norm1_ce1 MemPortCE2 1 1 }  { norm1_q1 MemPortDOUT2 0 32 } } }
	feedforward_hidden { ap_memory {  { feedforward_hidden_address0 mem_address 1 8 }  { feedforward_hidden_ce0 mem_ce 1 1 }  { feedforward_hidden_we0 mem_we 1 1 }  { feedforward_hidden_d0 mem_din 1 32 } } }
}
