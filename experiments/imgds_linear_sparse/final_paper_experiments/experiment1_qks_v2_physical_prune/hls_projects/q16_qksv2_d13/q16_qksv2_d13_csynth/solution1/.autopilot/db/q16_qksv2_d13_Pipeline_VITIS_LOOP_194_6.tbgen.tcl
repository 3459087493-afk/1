set moduleName q16_qksv2_d13_Pipeline_VITIS_LOOP_194_6
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
set C_modelName {q16_qksv2_d13_Pipeline_VITIS_LOOP_194_6}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln1271_3 int 8 regular  }
	{ x_V int 16 regular {array 256 { 0 1 } 1 1 }  }
	{ ff_out_V int 16 regular {array 16 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln1271_3", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "x_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "ff_out_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln1271_3 sc_in sc_lv 8 signal 0 } 
	{ x_V_address0 sc_out sc_lv 8 signal 1 } 
	{ x_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ x_V_we0 sc_out sc_logic 1 signal 1 } 
	{ x_V_d0 sc_out sc_lv 16 signal 1 } 
	{ x_V_address1 sc_out sc_lv 8 signal 1 } 
	{ x_V_ce1 sc_out sc_logic 1 signal 1 } 
	{ x_V_q1 sc_in sc_lv 16 signal 1 } 
	{ ff_out_V_address0 sc_out sc_lv 4 signal 2 } 
	{ ff_out_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ ff_out_V_q0 sc_in sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln1271_3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln1271_3", "role": "default" }} , 
 	{ "name": "x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_V", "role": "address0" }} , 
 	{ "name": "x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce0" }} , 
 	{ "name": "x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we0" }} , 
 	{ "name": "x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d0" }} , 
 	{ "name": "x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_V", "role": "address1" }} , 
 	{ "name": "x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce1" }} , 
 	{ "name": "x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q1" }} , 
 	{ "name": "ff_out_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ff_out_V", "role": "address0" }} , 
 	{ "name": "ff_out_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ff_out_V", "role": "ce0" }} , 
 	{ "name": "ff_out_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ff_out_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "q16_qksv2_d13_Pipeline_VITIS_LOOP_194_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln1271_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_194_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	q16_qksv2_d13_Pipeline_VITIS_LOOP_194_6 {
		zext_ln1271_3 {Type I LastRead 0 FirstWrite -1}
		x_V {Type IO LastRead 0 FirstWrite 2}
		ff_out_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "19"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "19"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln1271_3 { ap_none {  { zext_ln1271_3 in_data 0 8 } } }
	x_V { ap_memory {  { x_V_address0 mem_address 1 8 }  { x_V_ce0 mem_ce 1 1 }  { x_V_we0 mem_we 1 1 }  { x_V_d0 mem_din 1 16 }  { x_V_address1 MemPortADDR2 1 8 }  { x_V_ce1 MemPortCE2 1 1 }  { x_V_q1 in_data 0 16 } } }
	ff_out_V { ap_memory {  { ff_out_V_address0 mem_address 1 4 }  { ff_out_V_ce0 mem_ce 1 1 }  { ff_out_V_q0 in_data 0 16 } } }
}
