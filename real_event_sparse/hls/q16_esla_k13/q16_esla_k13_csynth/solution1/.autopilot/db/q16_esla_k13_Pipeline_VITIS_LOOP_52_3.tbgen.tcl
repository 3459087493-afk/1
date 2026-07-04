set moduleName q16_esla_k13_Pipeline_VITIS_LOOP_52_3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {q16_esla_k13_Pipeline_VITIS_LOOP_52_3}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln48 int 4 regular  }
	{ sorted_score_V int 21 regular {array 16 { 2 3 } 1 1 }  }
	{ sorted_index int 4 regular {array 16 { 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ key_score_V int 21 regular  }
	{ key_index int 4 regular  }
	{ j_out int 4 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln48", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "sorted_score_V", "interface" : "memory", "bitwidth" : 21, "direction" : "READWRITE"} , 
 	{ "Name" : "sorted_index", "interface" : "memory", "bitwidth" : 4, "direction" : "READWRITE"} , 
 	{ "Name" : "key_score_V", "interface" : "wire", "bitwidth" : 21, "direction" : "READONLY"} , 
 	{ "Name" : "key_index", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "j_out", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln48 sc_in sc_lv 4 signal 0 } 
	{ sorted_score_V_address0 sc_out sc_lv 4 signal 1 } 
	{ sorted_score_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ sorted_score_V_we0 sc_out sc_logic 1 signal 1 } 
	{ sorted_score_V_d0 sc_out sc_lv 21 signal 1 } 
	{ sorted_score_V_q0 sc_in sc_lv 21 signal 1 } 
	{ sorted_index_address0 sc_out sc_lv 4 signal 2 } 
	{ sorted_index_ce0 sc_out sc_logic 1 signal 2 } 
	{ sorted_index_we0 sc_out sc_logic 1 signal 2 } 
	{ sorted_index_d0 sc_out sc_lv 4 signal 2 } 
	{ sorted_index_q0 sc_in sc_lv 4 signal 2 } 
	{ key_score_V sc_in sc_lv 21 signal 3 } 
	{ key_index sc_in sc_lv 4 signal 4 } 
	{ j_out sc_out sc_lv 4 signal 5 } 
	{ j_out_ap_vld sc_out sc_logic 1 outvld 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln48", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "zext_ln48", "role": "default" }} , 
 	{ "name": "sorted_score_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sorted_score_V", "role": "address0" }} , 
 	{ "name": "sorted_score_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sorted_score_V", "role": "ce0" }} , 
 	{ "name": "sorted_score_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sorted_score_V", "role": "we0" }} , 
 	{ "name": "sorted_score_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":21, "type": "signal", "bundle":{"name": "sorted_score_V", "role": "d0" }} , 
 	{ "name": "sorted_score_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":21, "type": "signal", "bundle":{"name": "sorted_score_V", "role": "q0" }} , 
 	{ "name": "sorted_index_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sorted_index", "role": "address0" }} , 
 	{ "name": "sorted_index_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sorted_index", "role": "ce0" }} , 
 	{ "name": "sorted_index_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sorted_index", "role": "we0" }} , 
 	{ "name": "sorted_index_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sorted_index", "role": "d0" }} , 
 	{ "name": "sorted_index_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "sorted_index", "role": "q0" }} , 
 	{ "name": "key_score_V", "direction": "in", "datatype": "sc_lv", "bitwidth":21, "type": "signal", "bundle":{"name": "key_score_V", "role": "default" }} , 
 	{ "name": "key_index", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "key_index", "role": "default" }} , 
 	{ "name": "j_out", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "j_out", "role": "default" }} , 
 	{ "name": "j_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "j_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "q16_esla_k13_Pipeline_VITIS_LOOP_52_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln48", "Type" : "None", "Direction" : "I"},
			{"Name" : "sorted_score_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "sorted_index", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "key_score_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_index", "Type" : "None", "Direction" : "I"},
			{"Name" : "j_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_52_3", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state6", "ap_ST_fsm_state8"]}}]}]}


set ArgLastReadFirstWriteLatency {
	q16_esla_k13_Pipeline_VITIS_LOOP_52_3 {
		zext_ln48 {Type I LastRead 0 FirstWrite -1}
		sorted_score_V {Type IO LastRead 1 FirstWrite 3}
		sorted_index {Type IO LastRead 3 FirstWrite 4}
		key_score_V {Type I LastRead 0 FirstWrite -1}
		key_index {Type I LastRead 0 FirstWrite -1}
		j_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln48 { ap_none {  { zext_ln48 in_data 0 4 } } }
	sorted_score_V { ap_memory {  { sorted_score_V_address0 mem_address 1 4 }  { sorted_score_V_ce0 mem_ce 1 1 }  { sorted_score_V_we0 mem_we 1 1 }  { sorted_score_V_d0 mem_din 1 21 }  { sorted_score_V_q0 in_data 0 21 } } }
	sorted_index { ap_memory {  { sorted_index_address0 mem_address 1 4 }  { sorted_index_ce0 mem_ce 1 1 }  { sorted_index_we0 mem_we 1 1 }  { sorted_index_d0 mem_din 1 4 }  { sorted_index_q0 in_data 0 4 } } }
	key_score_V { ap_none {  { key_score_V in_data 0 21 } } }
	key_index { ap_none {  { key_index in_data 0 4 } } }
	j_out { ap_vld {  { j_out out_data 1 4 }  { j_out_ap_vld out_vld 1 1 } } }
}
