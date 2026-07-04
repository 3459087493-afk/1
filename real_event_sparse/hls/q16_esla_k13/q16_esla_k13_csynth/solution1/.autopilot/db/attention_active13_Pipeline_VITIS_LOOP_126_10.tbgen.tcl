set moduleName attention_active13_Pipeline_VITIS_LOOP_126_10
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
set C_modelName {attention_active13_Pipeline_VITIS_LOOP_126_10}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln813 int 8 regular  }
	{ Q_V int 16 regular {array 208 { 1 3 } 1 1 }  }
	{ K_sum_V int 16 regular {array 16 { 1 3 } 1 1 }  }
	{ normalizer_V_2_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln813", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "Q_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K_sum_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "normalizer_V_2_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln813 sc_in sc_lv 8 signal 0 } 
	{ Q_V_address0 sc_out sc_lv 8 signal 1 } 
	{ Q_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ Q_V_q0 sc_in sc_lv 16 signal 1 } 
	{ K_sum_V_address0 sc_out sc_lv 4 signal 2 } 
	{ K_sum_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ K_sum_V_q0 sc_in sc_lv 16 signal 2 } 
	{ normalizer_V_2_out sc_out sc_lv 24 signal 3 } 
	{ normalizer_V_2_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln813", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln813", "role": "default" }} , 
 	{ "name": "Q_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Q_V", "role": "address0" }} , 
 	{ "name": "Q_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Q_V", "role": "ce0" }} , 
 	{ "name": "Q_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Q_V", "role": "q0" }} , 
 	{ "name": "K_sum_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "K_sum_V", "role": "address0" }} , 
 	{ "name": "K_sum_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_sum_V", "role": "ce0" }} , 
 	{ "name": "K_sum_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_sum_V", "role": "q0" }} , 
 	{ "name": "normalizer_V_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "normalizer_V_2_out", "role": "default" }} , 
 	{ "name": "normalizer_V_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "normalizer_V_2_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_126_10",
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
			{"Name" : "zext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_126_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U60", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	attention_active13_Pipeline_VITIS_LOOP_126_10 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 0 FirstWrite -1}
		K_sum_V {Type I LastRead 0 FirstWrite -1}
		normalizer_V_2_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "21", "Max" : "21"}
	, {"Name" : "Interval", "Min" : "21", "Max" : "21"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln813 { ap_none {  { zext_ln813 in_data 0 8 } } }
	Q_V { ap_memory {  { Q_V_address0 mem_address 1 8 }  { Q_V_ce0 mem_ce 1 1 }  { Q_V_q0 in_data 0 16 } } }
	K_sum_V { ap_memory {  { K_sum_V_address0 mem_address 1 4 }  { K_sum_V_ce0 mem_ce 1 1 }  { K_sum_V_q0 in_data 0 16 } } }
	normalizer_V_2_out { ap_vld {  { normalizer_V_2_out out_data 1 24 }  { normalizer_V_2_out_ap_vld out_vld 1 1 } } }
}
