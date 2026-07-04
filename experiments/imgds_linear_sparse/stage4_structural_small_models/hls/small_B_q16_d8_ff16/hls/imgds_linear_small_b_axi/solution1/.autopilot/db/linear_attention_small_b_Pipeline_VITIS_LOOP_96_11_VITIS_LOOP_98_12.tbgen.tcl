set moduleName linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12
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
set C_modelName {linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln813 int 7 regular  }
	{ Q_V int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ KV_V int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ sext_ln1270_2 int 16 regular  }
	{ attended_V int 16 regular {array 8 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln813", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "Q_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "KV_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1270_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln813 sc_in sc_lv 7 signal 0 } 
	{ Q_V_address0 sc_out sc_lv 7 signal 1 } 
	{ Q_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ Q_V_q0 sc_in sc_lv 16 signal 1 } 
	{ KV_V_address0 sc_out sc_lv 6 signal 2 } 
	{ KV_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ KV_V_q0 sc_in sc_lv 16 signal 2 } 
	{ sext_ln1270_2 sc_in sc_lv 16 signal 3 } 
	{ attended_V_address0 sc_out sc_lv 3 signal 4 } 
	{ attended_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ attended_V_we0 sc_out sc_logic 1 signal 4 } 
	{ attended_V_d0 sc_out sc_lv 16 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln813", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln813", "role": "default" }} , 
 	{ "name": "Q_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "Q_V", "role": "address0" }} , 
 	{ "name": "Q_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Q_V", "role": "ce0" }} , 
 	{ "name": "Q_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Q_V", "role": "q0" }} , 
 	{ "name": "KV_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "KV_V", "role": "address0" }} , 
 	{ "name": "KV_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V", "role": "ce0" }} , 
 	{ "name": "KV_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "KV_V", "role": "q0" }} , 
 	{ "name": "sext_ln1270_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln1270_2", "role": "default" }} , 
 	{ "name": "attended_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "attended_V", "role": "address0" }} , 
 	{ "name": "attended_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attended_V", "role": "ce0" }} , 
 	{ "name": "attended_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attended_V", "role": "we0" }} , 
 	{ "name": "attended_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73", "EstimateLatencyMax" : "73",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1270_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_96_11_VITIS_LOOP_98_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U38", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_24s_16s_30_4_1_U39", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	linear_attention_small_b_Pipeline_VITIS_LOOP_96_11_VITIS_LOOP_98_12 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		KV_V {Type I LastRead 1 FirstWrite -1}
		sext_ln1270_2 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 8}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "73", "Max" : "73"}
	, {"Name" : "Interval", "Min" : "73", "Max" : "73"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln813 { ap_none {  { zext_ln813 in_data 0 7 } } }
	Q_V { ap_memory {  { Q_V_address0 mem_address 1 7 }  { Q_V_ce0 mem_ce 1 1 }  { Q_V_q0 in_data 0 16 } } }
	KV_V { ap_memory {  { KV_V_address0 mem_address 1 6 }  { KV_V_ce0 mem_ce 1 1 }  { KV_V_q0 in_data 0 16 } } }
	sext_ln1270_2 { ap_none {  { sext_ln1270_2 in_data 0 16 } } }
	attended_V { ap_memory {  { attended_V_address0 mem_address 1 3 }  { attended_V_ce0 mem_ce 1 1 }  { attended_V_we0 mem_we 1 1 }  { attended_V_d0 mem_din 1 16 } } }
}
