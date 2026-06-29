set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_141_9_VITIS_LOOP_142_10
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_141_9_VITIS_LOOP_142_10}
set C_modelType { void 0 }
set C_modelArgList {
	{ sparse_key_V int 16 regular {array 112 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ value_r float 32 regular {array 128 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ key_value_V int 24 regular {array 224 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sparse_key_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "value_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key_value_V", "interface" : "memory", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 61
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sparse_key_V_address0 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q0 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address1 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q1 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address2 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q2 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address3 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q3 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address4 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q4 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address5 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q5 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address6 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q6 sc_in sc_lv 16 signal 0 } 
	{ sparse_key_V_address7 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_V_q7 sc_in sc_lv 16 signal 0 } 
	{ value_r_address0 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ value_r_q0 sc_in sc_lv 32 signal 1 } 
	{ value_r_address1 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce1 sc_out sc_logic 1 signal 1 } 
	{ value_r_q1 sc_in sc_lv 32 signal 1 } 
	{ value_r_address2 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce2 sc_out sc_logic 1 signal 1 } 
	{ value_r_q2 sc_in sc_lv 32 signal 1 } 
	{ value_r_address3 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce3 sc_out sc_logic 1 signal 1 } 
	{ value_r_q3 sc_in sc_lv 32 signal 1 } 
	{ value_r_address4 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce4 sc_out sc_logic 1 signal 1 } 
	{ value_r_q4 sc_in sc_lv 32 signal 1 } 
	{ value_r_address5 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce5 sc_out sc_logic 1 signal 1 } 
	{ value_r_q5 sc_in sc_lv 32 signal 1 } 
	{ value_r_address6 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce6 sc_out sc_logic 1 signal 1 } 
	{ value_r_q6 sc_in sc_lv 32 signal 1 } 
	{ value_r_address7 sc_out sc_lv 7 signal 1 } 
	{ value_r_ce7 sc_out sc_logic 1 signal 1 } 
	{ value_r_q7 sc_in sc_lv 32 signal 1 } 
	{ key_value_V_address0 sc_out sc_lv 8 signal 2 } 
	{ key_value_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ key_value_V_we0 sc_out sc_logic 1 signal 2 } 
	{ key_value_V_d0 sc_out sc_lv 24 signal 2 } 
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
 	{ "name": "sparse_key_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address0" }} , 
 	{ "name": "sparse_key_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce0" }} , 
 	{ "name": "sparse_key_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q0" }} , 
 	{ "name": "sparse_key_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address1" }} , 
 	{ "name": "sparse_key_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce1" }} , 
 	{ "name": "sparse_key_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q1" }} , 
 	{ "name": "sparse_key_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address2" }} , 
 	{ "name": "sparse_key_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce2" }} , 
 	{ "name": "sparse_key_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q2" }} , 
 	{ "name": "sparse_key_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address3" }} , 
 	{ "name": "sparse_key_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce3" }} , 
 	{ "name": "sparse_key_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q3" }} , 
 	{ "name": "sparse_key_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address4" }} , 
 	{ "name": "sparse_key_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce4" }} , 
 	{ "name": "sparse_key_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q4" }} , 
 	{ "name": "sparse_key_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address5" }} , 
 	{ "name": "sparse_key_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce5" }} , 
 	{ "name": "sparse_key_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q5" }} , 
 	{ "name": "sparse_key_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address6" }} , 
 	{ "name": "sparse_key_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce6" }} , 
 	{ "name": "sparse_key_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q6" }} , 
 	{ "name": "sparse_key_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "address7" }} , 
 	{ "name": "sparse_key_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "ce7" }} , 
 	{ "name": "sparse_key_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sparse_key_V", "role": "q7" }} , 
 	{ "name": "value_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address0" }} , 
 	{ "name": "value_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce0" }} , 
 	{ "name": "value_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q0" }} , 
 	{ "name": "value_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address1" }} , 
 	{ "name": "value_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce1" }} , 
 	{ "name": "value_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q1" }} , 
 	{ "name": "value_r_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address2" }} , 
 	{ "name": "value_r_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce2" }} , 
 	{ "name": "value_r_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q2" }} , 
 	{ "name": "value_r_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address3" }} , 
 	{ "name": "value_r_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce3" }} , 
 	{ "name": "value_r_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q3" }} , 
 	{ "name": "value_r_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address4" }} , 
 	{ "name": "value_r_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce4" }} , 
 	{ "name": "value_r_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q4" }} , 
 	{ "name": "value_r_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address5" }} , 
 	{ "name": "value_r_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce5" }} , 
 	{ "name": "value_r_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q5" }} , 
 	{ "name": "value_r_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address6" }} , 
 	{ "name": "value_r_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce6" }} , 
 	{ "name": "value_r_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q6" }} , 
 	{ "name": "value_r_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "value_r", "role": "address7" }} , 
 	{ "name": "value_r_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_r", "role": "ce7" }} , 
 	{ "name": "value_r_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "value_r", "role": "q7" }} , 
 	{ "name": "key_value_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address0" }} , 
 	{ "name": "key_value_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce0" }} , 
 	{ "name": "key_value_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "we0" }} , 
 	{ "name": "key_value_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "d0" }} , 
 	{ "name": "grp_fu_3649_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_3649_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_3649_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_3649_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_3649_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_3649_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_141_9_VITIS_LOOP_142_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "237", "EstimateLatencyMax" : "237",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sparse_key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_141_9_VITIS_LOOP_142_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U205", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U206", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U207", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U208", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U209", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U210", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U211", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U212", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U213", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U214", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U215", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U216", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U217", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U218", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_24s_20s_38_1_1_U219", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_141_9_VITIS_LOOP_142_10 {
		sparse_key_V {Type I LastRead 2 FirstWrite -1}
		value_r {Type I LastRead 2 FirstWrite -1}
		key_value_V {Type O LastRead -1 FirstWrite 12}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "237", "Max" : "237"}
	, {"Name" : "Interval", "Min" : "237", "Max" : "237"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sparse_key_V { ap_memory {  { sparse_key_V_address0 mem_address 1 7 }  { sparse_key_V_ce0 mem_ce 1 1 }  { sparse_key_V_q0 mem_dout 0 16 }  { sparse_key_V_address1 MemPortADDR2 1 7 }  { sparse_key_V_ce1 MemPortCE2 1 1 }  { sparse_key_V_q1 MemPortDOUT2 0 16 }  { sparse_key_V_address2 MemPortADDR2 1 7 }  { sparse_key_V_ce2 MemPortCE2 1 1 }  { sparse_key_V_q2 MemPortDOUT2 0 16 }  { sparse_key_V_address3 MemPortADDR2 1 7 }  { sparse_key_V_ce3 MemPortCE2 1 1 }  { sparse_key_V_q3 MemPortDOUT2 0 16 }  { sparse_key_V_address4 MemPortADDR2 1 7 }  { sparse_key_V_ce4 MemPortCE2 1 1 }  { sparse_key_V_q4 MemPortDOUT2 0 16 }  { sparse_key_V_address5 MemPortADDR2 1 7 }  { sparse_key_V_ce5 MemPortCE2 1 1 }  { sparse_key_V_q5 MemPortDOUT2 0 16 }  { sparse_key_V_address6 MemPortADDR2 1 7 }  { sparse_key_V_ce6 MemPortCE2 1 1 }  { sparse_key_V_q6 MemPortDOUT2 0 16 }  { sparse_key_V_address7 MemPortADDR2 1 7 }  { sparse_key_V_ce7 MemPortCE2 1 1 }  { sparse_key_V_q7 MemPortDOUT2 0 16 } } }
	value_r { ap_memory {  { value_r_address0 mem_address 1 7 }  { value_r_ce0 mem_ce 1 1 }  { value_r_q0 mem_dout 0 32 }  { value_r_address1 MemPortADDR2 1 7 }  { value_r_ce1 MemPortCE2 1 1 }  { value_r_q1 MemPortDOUT2 0 32 }  { value_r_address2 MemPortADDR2 1 7 }  { value_r_ce2 MemPortCE2 1 1 }  { value_r_q2 MemPortDOUT2 0 32 }  { value_r_address3 MemPortADDR2 1 7 }  { value_r_ce3 MemPortCE2 1 1 }  { value_r_q3 MemPortDOUT2 0 32 }  { value_r_address4 MemPortADDR2 1 7 }  { value_r_ce4 MemPortCE2 1 1 }  { value_r_q4 MemPortDOUT2 0 32 }  { value_r_address5 MemPortADDR2 1 7 }  { value_r_ce5 MemPortCE2 1 1 }  { value_r_q5 MemPortDOUT2 0 32 }  { value_r_address6 MemPortADDR2 1 7 }  { value_r_ce6 MemPortCE2 1 1 }  { value_r_q6 MemPortDOUT2 0 32 }  { value_r_address7 MemPortADDR2 1 7 }  { value_r_ce7 MemPortCE2 1 1 }  { value_r_q7 MemPortDOUT2 0 32 } } }
	key_value_V { ap_memory {  { key_value_V_address0 mem_address 1 8 }  { key_value_V_ce0 mem_ce 1 1 }  { key_value_V_we0 mem_we 1 1 }  { key_value_V_d0 mem_din 1 24 } } }
}
