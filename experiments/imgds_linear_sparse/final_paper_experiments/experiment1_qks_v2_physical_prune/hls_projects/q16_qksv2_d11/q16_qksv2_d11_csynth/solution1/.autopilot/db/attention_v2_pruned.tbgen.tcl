set moduleName attention_v2_pruned
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
set C_modelName {attention_v2_pruned}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 16 regular {array 256 { 2 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_address0 sc_out sc_lv 8 signal 0 } 
	{ x_ce0 sc_out sc_logic 1 signal 0 } 
	{ x_we0 sc_out sc_logic 1 signal 0 } 
	{ x_d0 sc_out sc_lv 16 signal 0 } 
	{ x_q0 sc_in sc_lv 16 signal 0 } 
	{ x_address1 sc_out sc_lv 8 signal 0 } 
	{ x_ce1 sc_out sc_logic 1 signal 0 } 
	{ x_q1 sc_in sc_lv 16 signal 0 } 
	{ grp_fu_2695_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2695_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2695_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2695_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2699_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2699_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_2699_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "we0" }} , 
 	{ "name": "x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "d0" }} , 
 	{ "name": "x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "q0" }} , 
 	{ "name": "x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x", "role": "address1" }} , 
 	{ "name": "x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce1" }} , 
 	{ "name": "x_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x", "role": "q1" }} , 
 	{ "name": "grp_fu_2695_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2695_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2695_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2695_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2695_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2695_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2695_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2695_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2699_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2699_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2699_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_2699_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2699_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2699_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "12", "16", "20", "24", "26", "29", "33", "37"],
		"CDFG" : "attention_v2_pruned",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32815", "EstimateLatencyMax" : "32815",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365", "Port" : "x", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "8", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "16", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354", "Port" : "x", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "33", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400", "Port" : "x", "Inst_start_state" : "82", "Inst_end_state" : "83"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "82", "Inst_end_state" : "83"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_83_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state25"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state26"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_93_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state47"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_71_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state26"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state48"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_118_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state51"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state48"], "PostState" : ["ap_ST_fsm_state52"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_149_17", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state80", "LastState" : ["ap_ST_fsm_state83"], "QuitState" : ["ap_ST_fsm_state80"], "PreState" : ["ap_ST_fsm_state79"], "PostState" : ["ap_ST_fsm_state52"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_128_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "83", "FirstState" : "ap_ST_fsm_state52", "LastState" : ["ap_ST_fsm_state80"], "QuitState" : ["ap_ST_fsm_state52"], "PreState" : ["ap_ST_fsm_state49"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_output_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Q_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.KV_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_sum_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attended_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337", "Parent" : "0", "Child" : ["9", "10", "11"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "263", "EstimateLatencyMax" : "263",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln1271_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_73_2_VITIS_LOOP_75_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337.layers_0_attention_value_weight_V_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337.mul_mul_10s_16s_26_4_1_U11", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3_fu_337.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10_fu_347", "Parent" : "0", "Child" : ["13", "14", "15"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2825", "EstimateLatencyMax" : "2825",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10_fu_347.mac_muladd_5ns_4ns_4ns_8_4_1_U31", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10_fu_347.mac_muladd_16s_16s_30ns_30_4_1_U32", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10_fu_347.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354", "Parent" : "0", "Child" : ["17", "18", "19"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_85_5",
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
			{"Name" : "zext_ln1271_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_94", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_85_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354.layers_0_attention_query_weight_V_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354.mul_mul_12s_16s_28_4_1_U17", "Parent" : "16"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_85_5_fu_354.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365", "Parent" : "0", "Child" : ["21", "22", "23"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_95_7",
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
			{"Name" : "zext_ln1271_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_96", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365.layers_0_attention_key_weight_V_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365.mul_mul_11s_16s_27_4_1_U24", "Parent" : "20"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_95_7_fu_365.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_120_12_fu_376", "Parent" : "0", "Child" : ["25"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_120_12",
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
			{"Name" : "zext_ln118", "Type" : "None", "Direction" : "I"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_120_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_120_12_fu_376.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_131_14_fu_383", "Parent" : "0", "Child" : ["27", "28"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_131_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "16",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "phi_mul18", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_131_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_131_14_fu_383.mac_muladd_16s_16s_30ns_30_4_1_U41", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_131_14_fu_383.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16_fu_391", "Parent" : "0", "Child" : ["30", "31", "32"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "185", "EstimateLatencyMax" : "185",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "phi_mul18", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1270_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_139_15_VITIS_LOOP_141_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16_fu_391.mac_muladd_16s_16s_30ns_30_4_1_U46", "Parent" : "29"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16_fu_391.mul_mul_24s_16s_30_4_1_U47", "Parent" : "29"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16_fu_391.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400", "Parent" : "0", "Child" : ["34", "35", "36"],
		"CDFG" : "attention_v2_pruned_Pipeline_VITIS_LOOP_151_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22", "EstimateLatencyMax" : "22",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln150", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln813_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_101", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_151_18", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400.layers_0_attention_output_weight_V_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400.mul_mul_10s_16s_26_4_1_U54", "Parent" : "33"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_v2_pruned_Pipeline_VITIS_LOOP_151_18_fu_400.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U63", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	attention_v2_pruned {
		x {Type IO LastRead 3 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_73_2_VITIS_LOOP_75_3 {
		zext_ln1271_6 {Type I LastRead 0 FirstWrite -1}
		V_V {Type O LastRead -1 FirstWrite 6}
		x {Type I LastRead 1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_105_8_VITIS_LOOP_106_9_VITIS_LOOP_108_10 {
		KV_V {Type O LastRead -1 FirstWrite 8}
		K_V {Type I LastRead 4 FirstWrite -1}
		V_V {Type I LastRead 4 FirstWrite -1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_85_5 {
		zext_ln1271_6 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_94 {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_95_7 {
		zext_ln1271_6 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_96 {Type I LastRead 0 FirstWrite -1}
		x_V_1_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_120_12 {
		zext_ln118 {Type I LastRead 0 FirstWrite -1}
		K_V {Type I LastRead 0 FirstWrite -1}
		sum_V_out {Type O LastRead -1 FirstWrite 1}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_131_14 {
		phi_mul18 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 0 FirstWrite -1}
		K_sum_V {Type I LastRead 0 FirstWrite -1}
		normalizer_V_2_out {Type O LastRead -1 FirstWrite 3}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_139_15_VITIS_LOOP_141_16 {
		phi_mul18 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		KV_V {Type I LastRead 1 FirstWrite -1}
		sext_ln1270_23 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 8}}
	attention_v2_pruned_Pipeline_VITIS_LOOP_151_18 {
		sext_ln150 {Type I LastRead 0 FirstWrite -1}
		x {Type IO LastRead 3 FirstWrite 5}
		add_ln813_18 {Type I LastRead 0 FirstWrite -1}
		tmp_101 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32815", "Max" : "32815"}
	, {"Name" : "Interval", "Min" : "32815", "Max" : "32815"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_memory {  { x_address0 mem_address 1 8 }  { x_ce0 mem_ce 1 1 }  { x_we0 mem_we 1 1 }  { x_d0 mem_din 1 16 }  { x_q0 mem_dout 0 16 }  { x_address1 MemPortADDR2 1 8 }  { x_ce1 MemPortCE2 1 1 }  { x_q1 MemPortDOUT2 0 16 } } }
}
