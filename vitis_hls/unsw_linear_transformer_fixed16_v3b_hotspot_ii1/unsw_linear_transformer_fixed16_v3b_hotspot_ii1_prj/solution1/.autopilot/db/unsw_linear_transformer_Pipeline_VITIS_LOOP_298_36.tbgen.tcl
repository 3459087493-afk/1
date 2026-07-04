set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36}
set C_modelType { void 0 }
set C_modelArgList {
	{ select_ln297 int 12 regular  }
	{ zext_ln837_19 int 5 regular  }
	{ normalized_output int 16 regular {array 16 { 1 3 } 1 1 }  }
	{ sum_V_73_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "select_ln297", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_19", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "normalized_output", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sum_V_73_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln297 sc_in sc_lv 12 signal 0 } 
	{ zext_ln837_19 sc_in sc_lv 5 signal 1 } 
	{ normalized_output_address0 sc_out sc_lv 4 signal 2 } 
	{ normalized_output_ce0 sc_out sc_logic 1 signal 2 } 
	{ normalized_output_q0 sc_in sc_lv 16 signal 2 } 
	{ sum_V_73_out sc_out sc_lv 24 signal 3 } 
	{ sum_V_73_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln297", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "select_ln297", "role": "default" }} , 
 	{ "name": "zext_ln837_19", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "zext_ln837_19", "role": "default" }} , 
 	{ "name": "normalized_output_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "normalized_output", "role": "address0" }} , 
 	{ "name": "normalized_output_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "normalized_output", "role": "ce0" }} , 
 	{ "name": "normalized_output_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "normalized_output", "role": "q0" }} , 
 	{ "name": "sum_V_73_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sum_V_73_out", "role": "default" }} , 
 	{ "name": "sum_V_73_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sum_V_73_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22", "EstimateLatencyMax" : "22",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln297", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_73_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "CLASSIFIER_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_298_36", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CLASSIFIER_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U137", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36 {
		select_ln297 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_19 {Type I LastRead 0 FirstWrite -1}
		normalized_output {Type I LastRead 0 FirstWrite -1}
		sum_V_73_out {Type O LastRead -1 FirstWrite 4}
		CLASSIFIER_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "22", "Max" : "22"}
	, {"Name" : "Interval", "Min" : "22", "Max" : "22"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln297 { ap_none {  { select_ln297 in_data 0 12 } } }
	zext_ln837_19 { ap_none {  { zext_ln837_19 in_data 0 5 } } }
	normalized_output { ap_memory {  { normalized_output_address0 mem_address 1 4 }  { normalized_output_ce0 mem_ce 1 1 }  { normalized_output_q0 in_data 0 16 } } }
	sum_V_73_out { ap_vld {  { sum_V_73_out out_data 1 24 }  { sum_V_73_out_ap_vld out_vld 1 1 } } }
}
