set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln837_16 int 20 regular  }
	{ sext_ln1347_221 int 31 regular  }
	{ sext_ln1347_303 int 31 regular  }
	{ zext_ln837_8 int 1 regular  }
	{ sext_ln837_17 int 20 regular  }
	{ sext_ln837_18 int 20 regular  }
	{ sext_ln837_19 int 20 regular  }
	{ sext_ln1347_222 int 27 regular  }
	{ sext_ln1347_311 int 27 regular  }
	{ zext_ln837_9 int 1 regular  }
	{ sext_ln837_20 int 20 regular  }
	{ sext_ln837_21 int 20 regular  }
	{ sext_ln837_22 int 20 regular  }
	{ sext_ln837_23 int 20 regular  }
	{ sext_ln1347_223 int 28 regular  }
	{ sext_ln1347_321 int 28 regular  }
	{ zext_ln837_10 int 1 regular  }
	{ sext_ln837_24 int 20 regular  }
	{ sext_ln837_25 int 20 regular  }
	{ sext_ln837_26 int 20 regular  }
	{ sext_ln837_27 int 20 regular  }
	{ sext_ln258 int 20 regular  }
	{ p_Val2_17_out int 16 regular {pointer 1}  }
	{ p_Val2_14_out int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln837_16", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_221", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_303", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_8", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_17", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_18", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_19", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_222", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_311", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_9", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_20", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_21", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_22", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_23", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_223", "interface" : "wire", "bitwidth" : 28, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_321", "interface" : "wire", "bitwidth" : 28, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_10", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_24", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_25", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_26", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_27", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln258", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "p_Val2_17_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_Val2_14_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln837_16 sc_in sc_lv 20 signal 0 } 
	{ sext_ln1347_221 sc_in sc_lv 31 signal 1 } 
	{ sext_ln1347_303 sc_in sc_lv 31 signal 2 } 
	{ zext_ln837_8 sc_in sc_lv 1 signal 3 } 
	{ sext_ln837_17 sc_in sc_lv 20 signal 4 } 
	{ sext_ln837_18 sc_in sc_lv 20 signal 5 } 
	{ sext_ln837_19 sc_in sc_lv 20 signal 6 } 
	{ sext_ln1347_222 sc_in sc_lv 27 signal 7 } 
	{ sext_ln1347_311 sc_in sc_lv 27 signal 8 } 
	{ zext_ln837_9 sc_in sc_lv 1 signal 9 } 
	{ sext_ln837_20 sc_in sc_lv 20 signal 10 } 
	{ sext_ln837_21 sc_in sc_lv 20 signal 11 } 
	{ sext_ln837_22 sc_in sc_lv 20 signal 12 } 
	{ sext_ln837_23 sc_in sc_lv 20 signal 13 } 
	{ sext_ln1347_223 sc_in sc_lv 28 signal 14 } 
	{ sext_ln1347_321 sc_in sc_lv 28 signal 15 } 
	{ zext_ln837_10 sc_in sc_lv 1 signal 16 } 
	{ sext_ln837_24 sc_in sc_lv 20 signal 17 } 
	{ sext_ln837_25 sc_in sc_lv 20 signal 18 } 
	{ sext_ln837_26 sc_in sc_lv 20 signal 19 } 
	{ sext_ln837_27 sc_in sc_lv 20 signal 20 } 
	{ sext_ln258 sc_in sc_lv 20 signal 21 } 
	{ p_Val2_17_out sc_out sc_lv 16 signal 22 } 
	{ p_Val2_17_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ p_Val2_14_out sc_out sc_lv 16 signal 23 } 
	{ p_Val2_14_out_ap_vld sc_out sc_logic 1 outvld 23 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln837_16", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_16", "role": "default" }} , 
 	{ "name": "sext_ln1347_221", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "sext_ln1347_221", "role": "default" }} , 
 	{ "name": "sext_ln1347_303", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "sext_ln1347_303", "role": "default" }} , 
 	{ "name": "zext_ln837_8", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "zext_ln837_8", "role": "default" }} , 
 	{ "name": "sext_ln837_17", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_17", "role": "default" }} , 
 	{ "name": "sext_ln837_18", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_18", "role": "default" }} , 
 	{ "name": "sext_ln837_19", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_19", "role": "default" }} , 
 	{ "name": "sext_ln1347_222", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "sext_ln1347_222", "role": "default" }} , 
 	{ "name": "sext_ln1347_311", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "sext_ln1347_311", "role": "default" }} , 
 	{ "name": "zext_ln837_9", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "zext_ln837_9", "role": "default" }} , 
 	{ "name": "sext_ln837_20", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_20", "role": "default" }} , 
 	{ "name": "sext_ln837_21", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_21", "role": "default" }} , 
 	{ "name": "sext_ln837_22", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_22", "role": "default" }} , 
 	{ "name": "sext_ln837_23", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_23", "role": "default" }} , 
 	{ "name": "sext_ln1347_223", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "sext_ln1347_223", "role": "default" }} , 
 	{ "name": "sext_ln1347_321", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "sext_ln1347_321", "role": "default" }} , 
 	{ "name": "zext_ln837_10", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "zext_ln837_10", "role": "default" }} , 
 	{ "name": "sext_ln837_24", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_24", "role": "default" }} , 
 	{ "name": "sext_ln837_25", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_25", "role": "default" }} , 
 	{ "name": "sext_ln837_26", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_26", "role": "default" }} , 
 	{ "name": "sext_ln837_27", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln837_27", "role": "default" }} , 
 	{ "name": "sext_ln258", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln258", "role": "default" }} , 
 	{ "name": "p_Val2_17_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_Val2_17_out", "role": "default" }} , 
 	{ "name": "p_Val2_17_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_Val2_17_out", "role": "ap_vld" }} , 
 	{ "name": "p_Val2_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_Val2_14_out", "role": "default" }} , 
 	{ "name": "p_Val2_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_Val2_14_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28", "EstimateLatencyMax" : "28",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln837_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_221", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_303", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_222", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_311", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_223", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_321", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln258", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_Val2_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_Val2_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_258_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U481", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U482", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U483", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_12s_20s_32_4_1_U484", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U485", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U486", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U487", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_20s_35_4_1_U488", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U489", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U490", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_13s_20s_33_4_1_U491", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U492", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14s_20s_34_4_1_U493", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29 {
		sext_ln837_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_221 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_303 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_19 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_222 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_311 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_21 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_23 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_223 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_321 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_25 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_27 {Type I LastRead 0 FirstWrite -1}
		sext_ln258 {Type I LastRead 0 FirstWrite -1}
		p_Val2_17_out {Type O LastRead -1 FirstWrite 24}
		p_Val2_14_out {Type O LastRead -1 FirstWrite 24}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "28", "Max" : "28"}
	, {"Name" : "Interval", "Min" : "28", "Max" : "28"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln837_16 { ap_none {  { sext_ln837_16 in_data 0 20 } } }
	sext_ln1347_221 { ap_none {  { sext_ln1347_221 in_data 0 31 } } }
	sext_ln1347_303 { ap_none {  { sext_ln1347_303 in_data 0 31 } } }
	zext_ln837_8 { ap_none {  { zext_ln837_8 in_data 0 1 } } }
	sext_ln837_17 { ap_none {  { sext_ln837_17 in_data 0 20 } } }
	sext_ln837_18 { ap_none {  { sext_ln837_18 in_data 0 20 } } }
	sext_ln837_19 { ap_none {  { sext_ln837_19 in_data 0 20 } } }
	sext_ln1347_222 { ap_none {  { sext_ln1347_222 in_data 0 27 } } }
	sext_ln1347_311 { ap_none {  { sext_ln1347_311 in_data 0 27 } } }
	zext_ln837_9 { ap_none {  { zext_ln837_9 in_data 0 1 } } }
	sext_ln837_20 { ap_none {  { sext_ln837_20 in_data 0 20 } } }
	sext_ln837_21 { ap_none {  { sext_ln837_21 in_data 0 20 } } }
	sext_ln837_22 { ap_none {  { sext_ln837_22 in_data 0 20 } } }
	sext_ln837_23 { ap_none {  { sext_ln837_23 in_data 0 20 } } }
	sext_ln1347_223 { ap_none {  { sext_ln1347_223 in_data 0 28 } } }
	sext_ln1347_321 { ap_none {  { sext_ln1347_321 in_data 0 28 } } }
	zext_ln837_10 { ap_none {  { zext_ln837_10 in_data 0 1 } } }
	sext_ln837_24 { ap_none {  { sext_ln837_24 in_data 0 20 } } }
	sext_ln837_25 { ap_none {  { sext_ln837_25 in_data 0 20 } } }
	sext_ln837_26 { ap_none {  { sext_ln837_26 in_data 0 20 } } }
	sext_ln837_27 { ap_none {  { sext_ln837_27 in_data 0 20 } } }
	sext_ln258 { ap_none {  { sext_ln258 in_data 0 20 } } }
	p_Val2_17_out { ap_vld {  { p_Val2_17_out out_data 1 16 }  { p_Val2_17_out_ap_vld out_vld 1 1 } } }
	p_Val2_14_out { ap_vld {  { p_Val2_14_out out_data 1 16 }  { p_Val2_14_out_ap_vld out_vld 1 1 } } }
}
