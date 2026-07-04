set moduleName linear_attention_small_b_Pipeline_VITIS_LOOP_48_3
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
set C_modelName {linear_attention_small_b_Pipeline_VITIS_LOOP_48_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln50 int 7 regular  }
	{ x int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ tmp_4 int 6 regular  }
	{ x_V_out int 16 regular {pointer 1}  }
	{ x_V_1_out int 16 regular {pointer 1}  }
	{ phi_ln818_2_out int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln50", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "x", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_4", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "x_V_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "x_V_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "phi_ln818_2_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln50 sc_in sc_lv 7 signal 0 } 
	{ x_address0 sc_out sc_lv 7 signal 1 } 
	{ x_ce0 sc_out sc_logic 1 signal 1 } 
	{ x_q0 sc_in sc_lv 16 signal 1 } 
	{ tmp_4 sc_in sc_lv 6 signal 2 } 
	{ x_V_out sc_out sc_lv 16 signal 3 } 
	{ x_V_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ x_V_1_out sc_out sc_lv 16 signal 4 } 
	{ x_V_1_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ phi_ln818_2_out sc_out sc_lv 16 signal 5 } 
	{ phi_ln818_2_out_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln50", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln50", "role": "default" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "q0" }} , 
 	{ "name": "tmp_4", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "tmp_4", "role": "default" }} , 
 	{ "name": "x_V_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_out", "role": "default" }} , 
 	{ "name": "x_V_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "x_V_out", "role": "ap_vld" }} , 
 	{ "name": "x_V_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_1_out", "role": "default" }} , 
 	{ "name": "x_V_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "x_V_1_out", "role": "ap_vld" }} , 
 	{ "name": "phi_ln818_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "phi_ln818_2_out", "role": "default" }} , 
 	{ "name": "phi_ln818_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln818_2_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_48_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln50", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_V_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "phi_ln818_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_48_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_query_weight_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_key_weight_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_value_weight_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_16s_28_4_1_U11", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_16s_27_4_1_U12", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_11s_16s_27_4_1_U13", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	linear_attention_small_b_Pipeline_VITIS_LOOP_48_3 {
		zext_ln50 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_4 {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		x_V_1_out {Type O LastRead -1 FirstWrite 3}
		phi_ln818_2_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "13", "Max" : "13"}
	, {"Name" : "Interval", "Min" : "13", "Max" : "13"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln50 { ap_none {  { zext_ln50 in_data 0 7 } } }
	x { ap_memory {  { x_address0 mem_address 1 7 }  { x_ce0 mem_ce 1 1 }  { x_q0 in_data 0 16 } } }
	tmp_4 { ap_none {  { tmp_4 in_data 0 6 } } }
	x_V_out { ap_vld {  { x_V_out out_data 1 16 }  { x_V_out_ap_vld out_vld 1 1 } } }
	x_V_1_out { ap_vld {  { x_V_1_out out_data 1 16 }  { x_V_1_out_ap_vld out_vld 1 1 } } }
	phi_ln818_2_out { ap_vld {  { phi_ln818_2_out out_data 1 16 }  { phi_ln818_2_out_ap_vld out_vld 1 1 } } }
}
