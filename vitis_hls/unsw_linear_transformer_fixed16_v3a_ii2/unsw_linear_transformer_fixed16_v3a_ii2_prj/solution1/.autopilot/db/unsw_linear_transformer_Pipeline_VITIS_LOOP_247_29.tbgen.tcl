set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln246 int 14 regular  }
	{ zext_ln837_14 int 9 regular  }
	{ zext_ln837_13 int 7 regular  }
	{ norm1 int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ sum_V_65_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln246", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_14", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_13", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "norm1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sum_V_65_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln246 sc_in sc_lv 14 signal 0 } 
	{ zext_ln837_14 sc_in sc_lv 9 signal 1 } 
	{ zext_ln837_13 sc_in sc_lv 7 signal 2 } 
	{ norm1_address0 sc_out sc_lv 7 signal 3 } 
	{ norm1_ce0 sc_out sc_logic 1 signal 3 } 
	{ norm1_q0 sc_in sc_lv 16 signal 3 } 
	{ sum_V_65_out sc_out sc_lv 24 signal 4 } 
	{ sum_V_65_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln246", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "sext_ln246", "role": "default" }} , 
 	{ "name": "zext_ln837_14", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln837_14", "role": "default" }} , 
 	{ "name": "zext_ln837_13", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln837_13", "role": "default" }} , 
 	{ "name": "norm1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "norm1", "role": "address0" }} , 
 	{ "name": "norm1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "norm1", "role": "ce0" }} , 
 	{ "name": "norm1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "norm1", "role": "q0" }} , 
 	{ "name": "sum_V_65_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sum_V_65_out", "role": "default" }} , 
 	{ "name": "sum_V_65_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sum_V_65_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "38", "EstimateLatencyMax" : "38",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln246", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_65_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_247_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U95", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29 {
		sext_ln246 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_14 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_13 {Type I LastRead 0 FirstWrite -1}
		norm1 {Type I LastRead 0 FirstWrite -1}
		sum_V_65_out {Type O LastRead -1 FirstWrite 4}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "38", "Max" : "38"}
	, {"Name" : "Interval", "Min" : "38", "Max" : "38"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln246 { ap_none {  { sext_ln246 in_data 0 14 } } }
	zext_ln837_14 { ap_none {  { zext_ln837_14 in_data 0 9 } } }
	zext_ln837_13 { ap_none {  { zext_ln837_13 in_data 0 7 } } }
	norm1 { ap_memory {  { norm1_address0 mem_address 1 7 }  { norm1_ce0 mem_ce 1 1 }  { norm1_q0 in_data 0 16 } } }
	sum_V_65_out { ap_vld {  { sum_V_65_out out_data 1 24 }  { sum_V_65_out_ap_vld out_vld 1 1 } } }
}
