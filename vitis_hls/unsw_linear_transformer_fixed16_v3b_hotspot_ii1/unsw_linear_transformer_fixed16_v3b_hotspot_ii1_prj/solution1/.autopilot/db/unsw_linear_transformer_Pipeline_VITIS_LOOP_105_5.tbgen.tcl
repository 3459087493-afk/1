set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln104 int 12 regular  }
	{ embedded_V int 16 regular {array 128 { 0 3 } 0 1 }  }
	{ add_ln837 int 7 regular  }
	{ sub_ln837_1 int 9 regular  }
	{ sub_ln837 int 8 regular  }
	{ input_fp_V int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ sext_ln813_2 int 14 regular  }
	{ sext_ln813 int 14 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln104", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "embedded_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "add_ln837", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln837_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln837", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "input_fp_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln813_2", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln813", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln104 sc_in sc_lv 12 signal 0 } 
	{ embedded_V_address0 sc_out sc_lv 7 signal 1 } 
	{ embedded_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ embedded_V_we0 sc_out sc_logic 1 signal 1 } 
	{ embedded_V_d0 sc_out sc_lv 16 signal 1 } 
	{ add_ln837 sc_in sc_lv 7 signal 2 } 
	{ sub_ln837_1 sc_in sc_lv 9 signal 3 } 
	{ sub_ln837 sc_in sc_lv 8 signal 4 } 
	{ input_fp_V_address0 sc_out sc_lv 8 signal 5 } 
	{ input_fp_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ input_fp_V_q0 sc_in sc_lv 16 signal 5 } 
	{ sext_ln813_2 sc_in sc_lv 14 signal 6 } 
	{ sext_ln813 sc_in sc_lv 14 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln104", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sext_ln104", "role": "default" }} , 
 	{ "name": "embedded_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded_V", "role": "address0" }} , 
 	{ "name": "embedded_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "ce0" }} , 
 	{ "name": "embedded_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded_V", "role": "we0" }} , 
 	{ "name": "embedded_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "embedded_V", "role": "d0" }} , 
 	{ "name": "add_ln837", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "add_ln837", "role": "default" }} , 
 	{ "name": "sub_ln837_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "sub_ln837_1", "role": "default" }} , 
 	{ "name": "sub_ln837", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sub_ln837", "role": "default" }} , 
 	{ "name": "input_fp_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_fp_V", "role": "address0" }} , 
 	{ "name": "input_fp_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_fp_V", "role": "ce0" }} , 
 	{ "name": "input_fp_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_fp_V", "role": "q0" }} , 
 	{ "name": "sext_ln813_2", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "sext_ln813_2", "role": "default" }} , 
 	{ "name": "sext_ln813", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "sext_ln813", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32", "EstimateLatencyMax" : "32",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln104", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln837_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_fp_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln813_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_105_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.INPUT_PROJECTION_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U4", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5 {
		sext_ln104 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type O LastRead -1 FirstWrite 7}
		add_ln837 {Type I LastRead 0 FirstWrite -1}
		sub_ln837_1 {Type I LastRead 0 FirstWrite -1}
		sub_ln837 {Type I LastRead 0 FirstWrite -1}
		input_fp_V {Type I LastRead 0 FirstWrite -1}
		sext_ln813_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32", "Max" : "32"}
	, {"Name" : "Interval", "Min" : "32", "Max" : "32"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln104 { ap_none {  { sext_ln104 in_data 0 12 } } }
	embedded_V { ap_memory {  { embedded_V_address0 mem_address 1 7 }  { embedded_V_ce0 mem_ce 1 1 }  { embedded_V_we0 mem_we 1 1 }  { embedded_V_d0 mem_din 1 16 } } }
	add_ln837 { ap_none {  { add_ln837 in_data 0 7 } } }
	sub_ln837_1 { ap_none {  { sub_ln837_1 in_data 0 9 } } }
	sub_ln837 { ap_none {  { sub_ln837 in_data 0 8 } } }
	input_fp_V { ap_memory {  { input_fp_V_address0 mem_address 1 8 }  { input_fp_V_ce0 mem_ce 1 1 }  { input_fp_V_q0 in_data 0 16 } } }
	sext_ln813_2 { ap_none {  { sext_ln813_2 in_data 0 14 } } }
	sext_ln813 { ap_none {  { sext_ln813 in_data 0 14 } } }
}
