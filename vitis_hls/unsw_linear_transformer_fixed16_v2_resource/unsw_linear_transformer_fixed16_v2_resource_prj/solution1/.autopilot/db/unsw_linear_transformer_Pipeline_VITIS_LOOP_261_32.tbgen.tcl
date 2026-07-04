set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln260 int 13 regular  }
	{ residual2_V int 16 regular {array 128 { 0 3 } 0 1 }  }
	{ add_ln837_14 int 7 regular  }
	{ zext_ln837_17 int 9 regular  }
	{ zext_ln837_16 int 8 regular  }
	{ feedforward_hidden_V int 15 regular {array 256 { 1 3 } 1 1 }  }
	{ sext_ln813_7 int 20 regular  }
	{ sext_ln1347_28 int 20 regular  }
	{ lhs_20 int 20 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln260", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "residual2_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "add_ln837_14", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_17", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_16", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "feedforward_hidden_V", "interface" : "memory", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln813_7", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_28", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "lhs_20", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln260 sc_in sc_lv 13 signal 0 } 
	{ residual2_V_address0 sc_out sc_lv 7 signal 1 } 
	{ residual2_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ residual2_V_we0 sc_out sc_logic 1 signal 1 } 
	{ residual2_V_d0 sc_out sc_lv 16 signal 1 } 
	{ add_ln837_14 sc_in sc_lv 7 signal 2 } 
	{ zext_ln837_17 sc_in sc_lv 9 signal 3 } 
	{ zext_ln837_16 sc_in sc_lv 8 signal 4 } 
	{ feedforward_hidden_V_address0 sc_out sc_lv 8 signal 5 } 
	{ feedforward_hidden_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ feedforward_hidden_V_q0 sc_in sc_lv 15 signal 5 } 
	{ sext_ln813_7 sc_in sc_lv 20 signal 6 } 
	{ sext_ln1347_28 sc_in sc_lv 20 signal 7 } 
	{ lhs_20 sc_in sc_lv 20 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln260", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "sext_ln260", "role": "default" }} , 
 	{ "name": "residual2_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "residual2_V", "role": "address0" }} , 
 	{ "name": "residual2_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2_V", "role": "ce0" }} , 
 	{ "name": "residual2_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2_V", "role": "we0" }} , 
 	{ "name": "residual2_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "residual2_V", "role": "d0" }} , 
 	{ "name": "add_ln837_14", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "add_ln837_14", "role": "default" }} , 
 	{ "name": "zext_ln837_17", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln837_17", "role": "default" }} , 
 	{ "name": "zext_ln837_16", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln837_16", "role": "default" }} , 
 	{ "name": "feedforward_hidden_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "address0" }} , 
 	{ "name": "feedforward_hidden_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "ce0" }} , 
 	{ "name": "feedforward_hidden_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "feedforward_hidden_V", "role": "q0" }} , 
 	{ "name": "sext_ln813_7", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln813_7", "role": "default" }} , 
 	{ "name": "sext_ln1347_28", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_28", "role": "default" }} , 
 	{ "name": "lhs_20", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "lhs_20", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133", "EstimateLatencyMax" : "133",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln260", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual2_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "feedforward_hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln813_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "lhs_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_261_32", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_19ns_33_4_1_U102", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32 {
		sext_ln260 {Type I LastRead 0 FirstWrite -1}
		residual2_V {Type O LastRead -1 FirstWrite 7}
		add_ln837_14 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_17 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_16 {Type I LastRead 0 FirstWrite -1}
		feedforward_hidden_V {Type I LastRead 0 FirstWrite -1}
		sext_ln813_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_28 {Type I LastRead 0 FirstWrite -1}
		lhs_20 {Type I LastRead 0 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "133", "Max" : "133"}
	, {"Name" : "Interval", "Min" : "133", "Max" : "133"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln260 { ap_none {  { sext_ln260 in_data 0 13 } } }
	residual2_V { ap_memory {  { residual2_V_address0 mem_address 1 7 }  { residual2_V_ce0 mem_ce 1 1 }  { residual2_V_we0 mem_we 1 1 }  { residual2_V_d0 mem_din 1 16 } } }
	add_ln837_14 { ap_none {  { add_ln837_14 in_data 0 7 } } }
	zext_ln837_17 { ap_none {  { zext_ln837_17 in_data 0 9 } } }
	zext_ln837_16 { ap_none {  { zext_ln837_16 in_data 0 8 } } }
	feedforward_hidden_V { ap_memory {  { feedforward_hidden_V_address0 mem_address 1 8 }  { feedforward_hidden_V_ce0 mem_ce 1 1 }  { feedforward_hidden_V_q0 in_data 0 15 } } }
	sext_ln813_7 { ap_none {  { sext_ln813_7 in_data 0 20 } } }
	sext_ln1347_28 { ap_none {  { sext_ln1347_28 in_data 0 20 } } }
	lhs_20 { ap_none {  { lhs_20 in_data 0 20 } } }
}
