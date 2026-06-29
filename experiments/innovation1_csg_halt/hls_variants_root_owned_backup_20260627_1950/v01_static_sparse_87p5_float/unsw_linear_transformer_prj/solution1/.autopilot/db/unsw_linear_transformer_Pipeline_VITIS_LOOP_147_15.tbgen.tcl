set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_147_15
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_147_15}
set C_modelType { void 0 }
set C_modelArgList {
	{ sub_ln148 int 7 regular  }
	{ sparse_query float 32 regular {array 112 { 1 3 } 1 1 }  }
	{ key_sum float 32 regular {array 14 { 1 3 } 1 1 }  }
	{ denominator_1_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sub_ln148", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "sparse_query", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key_sum", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "denominator_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sub_ln148 sc_in sc_lv 7 signal 0 } 
	{ sparse_query_address0 sc_out sc_lv 7 signal 1 } 
	{ sparse_query_ce0 sc_out sc_logic 1 signal 1 } 
	{ sparse_query_q0 sc_in sc_lv 32 signal 1 } 
	{ key_sum_address0 sc_out sc_lv 4 signal 2 } 
	{ key_sum_ce0 sc_out sc_logic 1 signal 2 } 
	{ key_sum_q0 sc_in sc_lv 32 signal 2 } 
	{ denominator_1_out sc_out sc_lv 32 signal 3 } 
	{ denominator_1_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ grp_fu_1206_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1206_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1211_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1211_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sub_ln148", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sub_ln148", "role": "default" }} , 
 	{ "name": "sparse_query_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_query", "role": "address0" }} , 
 	{ "name": "sparse_query_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_query", "role": "ce0" }} , 
 	{ "name": "sparse_query_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_query", "role": "q0" }} , 
 	{ "name": "key_sum_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "key_sum", "role": "address0" }} , 
 	{ "name": "key_sum_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_sum", "role": "ce0" }} , 
 	{ "name": "key_sum_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_sum", "role": "q0" }} , 
 	{ "name": "denominator_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "denominator_1_out", "role": "default" }} , 
 	{ "name": "denominator_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "denominator_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1206_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1211_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1211_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1211_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_147_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sub_ln148", "Type" : "None", "Direction" : "I"},
			{"Name" : "sparse_query", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "denominator_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_147_15", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_147_15 {
		sub_ln148 {Type I LastRead 0 FirstWrite -1}
		sparse_query {Type I LastRead 0 FirstWrite -1}
		key_sum {Type I LastRead 0 FirstWrite -1}
		denominator_1_out {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "78", "Max" : "78"}
	, {"Name" : "Interval", "Min" : "78", "Max" : "78"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sub_ln148 { ap_none {  { sub_ln148 in_data 0 7 } } }
	sparse_query { ap_memory {  { sparse_query_address0 mem_address 1 7 }  { sparse_query_ce0 mem_ce 1 1 }  { sparse_query_q0 mem_dout 0 32 } } }
	key_sum { ap_memory {  { key_sum_address0 mem_address 1 4 }  { key_sum_ce0 mem_ce 1 1 }  { key_sum_q0 mem_dout 0 32 } } }
	denominator_1_out { ap_vld {  { denominator_1_out out_data 1 32 }  { denominator_1_out_ap_vld out_vld 1 1 } } }
}
