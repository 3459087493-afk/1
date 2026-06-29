set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_128_7_VITIS_LOOP_129_8
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_128_7_VITIS_LOOP_129_8}
set C_modelType { void 0 }
set C_modelArgList {
	{ sparse_query_V int 16 regular {array 112 { 0 3 } 0 1 }  }
	{ sparse_key_V int 16 regular {array 112 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ query float 32 regular {array 128 { 1 3 } 1 1 }  }
	{ key float 32 regular {array 128 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sparse_query_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sparse_key_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sparse_query_V_address0 sc_out sc_lv 7 signal 0 } 
	{ sparse_query_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ sparse_query_V_we0 sc_out sc_logic 1 signal 0 } 
	{ sparse_query_V_d0 sc_out sc_lv 16 signal 0 } 
	{ sparse_key_V_address0 sc_out sc_lv 7 signal 1 } 
	{ sparse_key_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ sparse_key_V_we0 sc_out sc_logic 1 signal 1 } 
	{ sparse_key_V_d0 sc_out sc_lv 16 signal 1 } 
	{ query_address0 sc_out sc_lv 7 signal 2 } 
	{ query_ce0 sc_out sc_logic 1 signal 2 } 
	{ query_q0 sc_in sc_lv 32 signal 2 } 
	{ key_address0 sc_out sc_lv 7 signal 3 } 
	{ key_ce0 sc_out sc_logic 1 signal 3 } 
	{ key_q0 sc_in sc_lv 32 signal 3 } 
	{ grp_fu_3649_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_3649_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_3649_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sparse_query_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_query_V", "role": "address0" }} , 
 	{ "name": "sparse_query_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_query_V", "role": "ce0" }} , 
 	{ "name": "sparse_query_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_query_V", "role": "we0" }} , 
 	{ "name": "sparse_query_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_query_V", "role": "d0" }} , 
 	{ "name": "sparse_key_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address0" }} , 
 	{ "name": "sparse_key_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce0" }} , 
 	{ "name": "sparse_key_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "we0" }} , 
 	{ "name": "sparse_key_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "d0" }} , 
 	{ "name": "query_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "query", "role": "address0" }} , 
 	{ "name": "query_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query", "role": "ce0" }} , 
 	{ "name": "query_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query", "role": "q0" }} , 
 	{ "name": "key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "key", "role": "address0" }} , 
 	{ "name": "key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce0" }} , 
 	{ "name": "key_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key", "role": "q0" }} , 
 	{ "name": "grp_fu_3649_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3649_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3649_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_3649_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3649_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3649_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_128_7_VITIS_LOOP_129_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "233", "EstimateLatencyMax" : "233",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sparse_query_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sparse_key_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ACTIVE_K_CHANNELS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Q_ACTIVE_MASK", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_128_7_VITIS_LOOP_129_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ACTIVE_K_CHANNELS_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Q_ACTIVE_MASK_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_128_7_VITIS_LOOP_129_8 {
		sparse_query_V {Type O LastRead -1 FirstWrite 9}
		sparse_key_V {Type O LastRead -1 FirstWrite 8}
		query {Type I LastRead 1 FirstWrite -1}
		key {Type I LastRead 1 FirstWrite -1}
		ACTIVE_K_CHANNELS {Type I LastRead -1 FirstWrite -1}
		Q_ACTIVE_MASK {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "233", "Max" : "233"}
	, {"Name" : "Interval", "Min" : "233", "Max" : "233"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sparse_query_V { ap_memory {  { sparse_query_V_address0 mem_address 1 7 }  { sparse_query_V_ce0 mem_ce 1 1 }  { sparse_query_V_we0 mem_we 1 1 }  { sparse_query_V_d0 mem_din 1 16 } } }
	sparse_key_V { ap_memory {  { sparse_key_V_address0 mem_address 1 7 }  { sparse_key_V_ce0 mem_ce 1 1 }  { sparse_key_V_we0 mem_we 1 1 }  { sparse_key_V_d0 mem_din 1 16 } } }
	query { ap_memory {  { query_address0 mem_address 1 7 }  { query_ce0 mem_ce 1 1 }  { query_q0 mem_dout 0 32 } } }
	key { ap_memory {  { key_address0 mem_address 1 7 }  { key_ce0 mem_ce 1 1 }  { key_q0 mem_dout 0 32 } } }
}
