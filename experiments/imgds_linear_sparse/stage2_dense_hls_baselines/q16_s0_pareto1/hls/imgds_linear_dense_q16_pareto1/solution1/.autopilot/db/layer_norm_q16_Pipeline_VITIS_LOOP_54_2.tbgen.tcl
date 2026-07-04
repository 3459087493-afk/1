set moduleName layer_norm_q16_Pipeline_VITIS_LOOP_54_2
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
set C_modelName {layer_norm_q16_Pipeline_VITIS_LOOP_54_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_0_offset int 4 regular  }
	{ trunc_ln837_9 int 2 regular  }
	{ x_0 int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ x_1_offset int 4 regular  }
	{ trunc_ln837_6 int 2 regular  }
	{ x_1 int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ x_2_offset int 4 regular  }
	{ trunc_ln837_3 int 2 regular  }
	{ x_2 int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ x_3_offset int 4 regular  }
	{ trunc_ln837 int 2 regular  }
	{ x_3 int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ mean int 16 regular  }
	{ var_sum_V_4_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x_0_offset", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln837_9", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "x_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "x_1_offset", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln837_6", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "x_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "x_2_offset", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln837_3", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "x_2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "x_3_offset", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln837", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "x_3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "mean", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "var_sum_V_4_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_0_offset sc_in sc_lv 4 signal 0 } 
	{ trunc_ln837_9 sc_in sc_lv 2 signal 1 } 
	{ x_0_address0 sc_out sc_lv 6 signal 2 } 
	{ x_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ x_0_q0 sc_in sc_lv 16 signal 2 } 
	{ x_1_offset sc_in sc_lv 4 signal 3 } 
	{ trunc_ln837_6 sc_in sc_lv 2 signal 4 } 
	{ x_1_address0 sc_out sc_lv 6 signal 5 } 
	{ x_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ x_1_q0 sc_in sc_lv 16 signal 5 } 
	{ x_2_offset sc_in sc_lv 4 signal 6 } 
	{ trunc_ln837_3 sc_in sc_lv 2 signal 7 } 
	{ x_2_address0 sc_out sc_lv 6 signal 8 } 
	{ x_2_ce0 sc_out sc_logic 1 signal 8 } 
	{ x_2_q0 sc_in sc_lv 16 signal 8 } 
	{ x_3_offset sc_in sc_lv 4 signal 9 } 
	{ trunc_ln837 sc_in sc_lv 2 signal 10 } 
	{ x_3_address0 sc_out sc_lv 6 signal 11 } 
	{ x_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ x_3_q0 sc_in sc_lv 16 signal 11 } 
	{ mean sc_in sc_lv 16 signal 12 } 
	{ var_sum_V_4_out sc_out sc_lv 24 signal 13 } 
	{ var_sum_V_4_out_ap_vld sc_out sc_logic 1 outvld 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_0_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_0_offset", "role": "default" }} , 
 	{ "name": "trunc_ln837_9", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trunc_ln837_9", "role": "default" }} , 
 	{ "name": "x_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_0", "role": "address0" }} , 
 	{ "name": "x_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "ce0" }} , 
 	{ "name": "x_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_0", "role": "q0" }} , 
 	{ "name": "x_1_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_1_offset", "role": "default" }} , 
 	{ "name": "trunc_ln837_6", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trunc_ln837_6", "role": "default" }} , 
 	{ "name": "x_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_1", "role": "address0" }} , 
 	{ "name": "x_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "ce0" }} , 
 	{ "name": "x_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_1", "role": "q0" }} , 
 	{ "name": "x_2_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_2_offset", "role": "default" }} , 
 	{ "name": "trunc_ln837_3", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trunc_ln837_3", "role": "default" }} , 
 	{ "name": "x_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_2", "role": "address0" }} , 
 	{ "name": "x_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_2", "role": "ce0" }} , 
 	{ "name": "x_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_2", "role": "q0" }} , 
 	{ "name": "x_3_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_3_offset", "role": "default" }} , 
 	{ "name": "trunc_ln837", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "trunc_ln837", "role": "default" }} , 
 	{ "name": "x_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "x_3", "role": "address0" }} , 
 	{ "name": "x_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_3", "role": "ce0" }} , 
 	{ "name": "x_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_3", "role": "q0" }} , 
 	{ "name": "mean", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mean", "role": "default" }} , 
 	{ "name": "var_sum_V_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "var_sum_V_4_out", "role": "default" }} , 
 	{ "name": "var_sum_V_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "var_sum_V_4_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_54_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "21", "EstimateLatencyMax" : "21",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_0_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_1_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln837_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_2_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln837_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "x_3_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean", "Type" : "None", "Direction" : "I"},
			{"Name" : "var_sum_V_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_54_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U2236", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U2237", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U2238", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U2239", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	layer_norm_q16_Pipeline_VITIS_LOOP_54_2 {
		x_0_offset {Type I LastRead 0 FirstWrite -1}
		trunc_ln837_9 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 0 FirstWrite -1}
		x_1_offset {Type I LastRead 0 FirstWrite -1}
		trunc_ln837_6 {Type I LastRead 0 FirstWrite -1}
		x_1 {Type I LastRead 0 FirstWrite -1}
		x_2_offset {Type I LastRead 0 FirstWrite -1}
		trunc_ln837_3 {Type I LastRead 0 FirstWrite -1}
		x_2 {Type I LastRead 0 FirstWrite -1}
		x_3_offset {Type I LastRead 0 FirstWrite -1}
		trunc_ln837 {Type I LastRead 0 FirstWrite -1}
		x_3 {Type I LastRead 0 FirstWrite -1}
		mean {Type I LastRead 0 FirstWrite -1}
		var_sum_V_4_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "21", "Max" : "21"}
	, {"Name" : "Interval", "Min" : "21", "Max" : "21"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_0_offset { ap_none {  { x_0_offset in_data 0 4 } } }
	trunc_ln837_9 { ap_none {  { trunc_ln837_9 in_data 0 2 } } }
	x_0 { ap_memory {  { x_0_address0 mem_address 1 6 }  { x_0_ce0 mem_ce 1 1 }  { x_0_q0 in_data 0 16 } } }
	x_1_offset { ap_none {  { x_1_offset in_data 0 4 } } }
	trunc_ln837_6 { ap_none {  { trunc_ln837_6 in_data 0 2 } } }
	x_1 { ap_memory {  { x_1_address0 mem_address 1 6 }  { x_1_ce0 mem_ce 1 1 }  { x_1_q0 in_data 0 16 } } }
	x_2_offset { ap_none {  { x_2_offset in_data 0 4 } } }
	trunc_ln837_3 { ap_none {  { trunc_ln837_3 in_data 0 2 } } }
	x_2 { ap_memory {  { x_2_address0 mem_address 1 6 }  { x_2_ce0 mem_ce 1 1 }  { x_2_q0 in_data 0 16 } } }
	x_3_offset { ap_none {  { x_3_offset in_data 0 4 } } }
	trunc_ln837 { ap_none {  { trunc_ln837 in_data 0 2 } } }
	x_3 { ap_memory {  { x_3_address0 mem_address 1 6 }  { x_3_ce0 mem_ce 1 1 }  { x_3_q0 in_data 0 16 } } }
	mean { ap_none {  { mean in_data 0 16 } } }
	var_sum_V_4_out { ap_vld {  { var_sum_V_4_out out_data 1 24 }  { var_sum_V_4_out_ap_vld out_vld 1 1 } } }
}
