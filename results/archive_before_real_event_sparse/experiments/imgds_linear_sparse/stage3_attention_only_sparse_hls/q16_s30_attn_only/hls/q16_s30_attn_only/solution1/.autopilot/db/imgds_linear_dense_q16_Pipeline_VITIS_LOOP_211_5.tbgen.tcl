set moduleName imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5
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
set C_modelName {imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln210 int 13 regular  }
	{ ff_out_V int 16 regular {array 16 { 0 3 } 0 1 }  }
	{ zext_ln209 int 4 regular  }
	{ tmp_104 int 9 regular  }
	{ hidden_V int 15 regular {array 32 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln210", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "ff_out_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "zext_ln209", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_104", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "hidden_V", "interface" : "memory", "bitwidth" : 15, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln210 sc_in sc_lv 13 signal 0 } 
	{ ff_out_V_address0 sc_out sc_lv 4 signal 1 } 
	{ ff_out_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ ff_out_V_we0 sc_out sc_logic 1 signal 1 } 
	{ ff_out_V_d0 sc_out sc_lv 16 signal 1 } 
	{ zext_ln209 sc_in sc_lv 4 signal 2 } 
	{ tmp_104 sc_in sc_lv 9 signal 3 } 
	{ hidden_V_address0 sc_out sc_lv 5 signal 4 } 
	{ hidden_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ hidden_V_q0 sc_in sc_lv 15 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln210", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "sext_ln210", "role": "default" }} , 
 	{ "name": "ff_out_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ff_out_V", "role": "address0" }} , 
 	{ "name": "ff_out_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff_out_V", "role": "ce0" }} , 
 	{ "name": "ff_out_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff_out_V", "role": "we0" }} , 
 	{ "name": "ff_out_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ff_out_V", "role": "d0" }} , 
 	{ "name": "zext_ln209", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln209", "role": "default" }} , 
 	{ "name": "tmp_104", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "tmp_104", "role": "default" }} , 
 	{ "name": "hidden_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "hidden_V", "role": "address0" }} , 
 	{ "name": "hidden_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hidden_V", "role": "ce0" }} , 
 	{ "name": "hidden_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "hidden_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "37", "EstimateLatencyMax" : "37",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln210", "Type" : "None", "Direction" : "I"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln209", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_104", "Type" : "None", "Direction" : "I"},
			{"Name" : "hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_211_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_3_weight_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_10s_15ns_25_4_1_U178", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_211_5 {
		sext_ln210 {Type I LastRead 0 FirstWrite -1}
		ff_out_V {Type O LastRead -1 FirstWrite 4}
		zext_ln209 {Type I LastRead 0 FirstWrite -1}
		tmp_104 {Type I LastRead 0 FirstWrite -1}
		hidden_V {Type I LastRead 0 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "37", "Max" : "37"}
	, {"Name" : "Interval", "Min" : "37", "Max" : "37"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln210 { ap_none {  { sext_ln210 in_data 0 13 } } }
	ff_out_V { ap_memory {  { ff_out_V_address0 mem_address 1 4 }  { ff_out_V_ce0 mem_ce 1 1 }  { ff_out_V_we0 mem_we 1 1 }  { ff_out_V_d0 mem_din 1 16 } } }
	zext_ln209 { ap_none {  { zext_ln209 in_data 0 4 } } }
	tmp_104 { ap_none {  { tmp_104 in_data 0 9 } } }
	hidden_V { ap_memory {  { hidden_V_address0 mem_address 1 5 }  { hidden_V_ce0 mem_ce 1 1 }  { hidden_V_q0 in_data 0 15 } } }
}
