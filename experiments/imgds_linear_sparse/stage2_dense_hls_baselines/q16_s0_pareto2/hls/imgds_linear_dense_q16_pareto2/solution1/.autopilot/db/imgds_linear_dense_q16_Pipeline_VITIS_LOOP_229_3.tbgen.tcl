set moduleName imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3
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
set C_modelName {imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln228 int 13 regular  }
	{ x_V int 16 regular {array 256 { 0 3 } 0 1 }  }
	{ add_ln233_1 int 8 regular  }
	{ zext_ln1271_4 int 10 regular  }
	{ input_r int 16 regular {array 1024 { 1 3 } 1 1 }  }
	{ tmp_63 int 10 regular  }
	{ sext_ln813 int 10 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln228", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "x_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "add_ln233_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln1271_4", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_63", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln813", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln228 sc_in sc_lv 13 signal 0 } 
	{ x_V_address0 sc_out sc_lv 8 signal 1 } 
	{ x_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ x_V_we0 sc_out sc_logic 1 signal 1 } 
	{ x_V_d0 sc_out sc_lv 16 signal 1 } 
	{ add_ln233_1 sc_in sc_lv 8 signal 2 } 
	{ zext_ln1271_4 sc_in sc_lv 10 signal 3 } 
	{ input_r_address0 sc_out sc_lv 10 signal 4 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 4 } 
	{ input_r_q0 sc_in sc_lv 16 signal 4 } 
	{ tmp_63 sc_in sc_lv 10 signal 5 } 
	{ sext_ln813 sc_in sc_lv 10 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln228", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "sext_ln228", "role": "default" }} , 
 	{ "name": "x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_V", "role": "address0" }} , 
 	{ "name": "x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce0" }} , 
 	{ "name": "x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we0" }} , 
 	{ "name": "x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d0" }} , 
 	{ "name": "add_ln233_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "add_ln233_1", "role": "default" }} , 
 	{ "name": "zext_ln1271_4", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "zext_ln1271_4", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "tmp_63", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "tmp_63", "role": "default" }} , 
 	{ "name": "sext_ln813", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "sext_ln813", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "70", "EstimateLatencyMax" : "70",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln228", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln233_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln1271_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_63", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_229_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_projection_weight_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_9s_16s_25_4_1_U1", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3 {
		sext_ln228 {Type I LastRead 0 FirstWrite -1}
		x_V {Type O LastRead -1 FirstWrite 5}
		add_ln233_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		tmp_63 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "70", "Max" : "70"}
	, {"Name" : "Interval", "Min" : "70", "Max" : "70"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln228 { ap_none {  { sext_ln228 in_data 0 13 } } }
	x_V { ap_memory {  { x_V_address0 mem_address 1 8 }  { x_V_ce0 mem_ce 1 1 }  { x_V_we0 mem_we 1 1 }  { x_V_d0 mem_din 1 16 } } }
	add_ln233_1 { ap_none {  { add_ln233_1 in_data 0 8 } } }
	zext_ln1271_4 { ap_none {  { zext_ln1271_4 in_data 0 10 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 10 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 in_data 0 16 } } }
	tmp_63 { ap_none {  { tmp_63 in_data 0 10 } } }
	sext_ln813 { ap_none {  { sext_ln813 in_data 0 10 } } }
}
