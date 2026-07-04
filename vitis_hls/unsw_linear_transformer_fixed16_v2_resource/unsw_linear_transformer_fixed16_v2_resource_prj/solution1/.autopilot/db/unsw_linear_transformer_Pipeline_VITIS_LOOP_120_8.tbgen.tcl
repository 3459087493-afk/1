set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln837_5 int 8 regular  }
	{ zext_ln122 int 7 regular  }
	{ embedded_V int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ query_sum_V_4_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln837_5", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln122", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "embedded_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "query_sum_V_4_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln837_5 sc_in sc_lv 8 signal 0 } 
	{ zext_ln122 sc_in sc_lv 7 signal 1 } 
	{ embedded_V_address0 sc_out sc_lv 7 signal 2 } 
	{ embedded_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ embedded_V_q0 sc_in sc_lv 16 signal 2 } 
	{ query_sum_V_4_out sc_out sc_lv 24 signal 3 } 
	{ query_sum_V_4_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln837_5", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln837_5", "role": "default" }} , 
 	{ "name": "zext_ln122", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln122", "role": "default" }} , 
 	{ "name": "embedded_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address0" }} , 
 	{ "name": "embedded_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce0" }} , 
 	{ "name": "embedded_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "q0" }} , 
 	{ "name": "query_sum_V_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "query_sum_V_4_out", "role": "default" }} , 
 	{ "name": "query_sum_V_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "query_sum_V_4_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln122", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_sum_V_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_120_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U15", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8 {
		zext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln122 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type I LastRead 0 FirstWrite -1}
		query_sum_V_4_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "68", "Max" : "68"}
	, {"Name" : "Interval", "Min" : "68", "Max" : "68"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln837_5 { ap_none {  { zext_ln837_5 in_data 0 8 } } }
	zext_ln122 { ap_none {  { zext_ln122 in_data 0 7 } } }
	embedded_V { ap_memory {  { embedded_V_address0 mem_address 1 7 }  { embedded_V_ce0 mem_ce 1 1 }  { embedded_V_q0 in_data 0 16 } } }
	query_sum_V_4_out { ap_vld {  { query_sum_V_4_out out_data 1 24 }  { query_sum_V_4_out_ap_vld out_vld 1 1 } } }
}
