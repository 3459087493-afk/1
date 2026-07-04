set moduleName linear_attention_q8_sparse
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
set C_modelName {linear_attention_q8_sparse}
set C_modelType { void 0 }
set C_modelArgList {
	{ x int 16 regular {array 256 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 18
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
	{ grp_fu_2030_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2030_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2030_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2030_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2034_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2034_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_2034_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "grp_fu_2030_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2030_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2030_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2030_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2030_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2030_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2030_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2030_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2034_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2034_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2034_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_2034_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2034_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2034_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "12", "16", "22", "24", "27", "31", "35", "36", "37"],
		"CDFG" : "linear_attention_q8_sparse",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "27560", "EstimateLatencyMax" : "27560",
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
					{"ID" : "12", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "16", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403", "Port" : "x", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP_fu_383", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "2", "Inst_end_state" : "30"},
					{"ID" : "24", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12_fu_425", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "35", "Inst_end_state" : "36"},
					{"ID" : "27", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14_fu_435", "Port" : "ACTIVE_CHANNELS", "Inst_start_state" : "61", "Inst_end_state" : "62"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16_fu_446", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "65", "Inst_end_state" : "66"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_82_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_91_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state29"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_80_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state30"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state31", "LastState" : ["ap_ST_fsm_state34"], "QuitState" : ["ap_ST_fsm_state31"], "PreState" : ["ap_ST_fsm_state30"], "PostState" : ["ap_ST_fsm_state35"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_156_15", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state63", "LastState" : ["ap_ST_fsm_state67"], "QuitState" : ["ap_ST_fsm_state63"], "PreState" : ["ap_ST_fsm_state62"], "PostState" : ["ap_ST_fsm_state35"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_132_11", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "67", "FirstState" : "ap_ST_fsm_state35", "LastState" : ["ap_ST_fsm_state63"], "QuitState" : ["ap_ST_fsm_state35"], "PreState" : ["ap_ST_fsm_state31"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ACTIVE_CHANNELS_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_output_bias_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Q_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.KV_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_sum_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attended_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP_fu_383", "Parent" : "0", "Child" : ["10", "11"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2823", "EstimateLatencyMax" : "2823",
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
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP_111_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP_fu_383.mac_muladd_16s_16s_30ns_30_4_1_U27", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP_fu_383.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392", "Parent" : "0", "Child" : ["13", "14", "15"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3",
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
			{"Name" : "zext_ln1271_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sv_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_84_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392.layers_0_attention_value_weight_V_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392.mac_muladd_16s_4s_24s_24_4_1_U9", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3_fu_392.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403", "Parent" : "0", "Child" : ["17", "18", "19", "20", "21"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5",
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
			{"Name" : "zext_ln1271_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mul", "Type" : "None", "Direction" : "I"},
			{"Name" : "sq_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sk_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_94_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403.layers_0_attention_query_weight_V_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403.layers_0_attention_key_weight_V_U", "Parent" : "16"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403.mac_muladd_16s_6s_24s_24_4_1_U16", "Parent" : "16"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403.mac_muladd_16s_5s_24s_24_4_1_U17", "Parent" : "16"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5_fu_403.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_124_10_fu_417", "Parent" : "0", "Child" : ["23"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_124_10",
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
			{"Name" : "d_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_124_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_124_10_fu_417.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12_fu_425", "Parent" : "0", "Child" : ["25", "26"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "17",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_135_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12_fu_425.mac_muladd_16s_16s_30ns_30_4_1_U36", "Parent" : "24"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12_fu_425.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14_fu_435", "Parent" : "0", "Child" : ["28", "29", "30"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "186", "EstimateLatencyMax" : "186",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pos_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Q_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1270_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ACTIVE_CHANNELS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_145_13_VITIS_LOOP_147_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14_fu_435.mac_muladd_16s_16s_30ns_30_4_1_U42", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14_fu_435.mul_mul_24s_16s_30_4_1_U43", "Parent" : "27"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14_fu_435.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16_fu_446", "Parent" : "0", "Child" : ["32", "33", "34"],
		"CDFG" : "linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16",
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
			{"Name" : "zext_ln157", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_158_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16_fu_446.layers_0_attention_output_weight_V_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16_fu_446.mac_muladd_16s_5s_24s_24_4_1_U51", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16_fu_446.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U59", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U60", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U61", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	linear_attention_q8_sparse {
		x {Type IO LastRead 34 FirstWrite -1}
		ACTIVE_CHANNELS {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_107_6_VITIS_LOOP_109_7_VITIS_LOOP {
		KV_V {Type O LastRead -1 FirstWrite 6}
		K_V {Type I LastRead 2 FirstWrite -1}
		V_V {Type I LastRead 2 FirstWrite -1}
		ACTIVE_CHANNELS {Type I LastRead 1 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_84_3 {
		zext_ln1271_2 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_10 {Type I LastRead 0 FirstWrite -1}
		sv_V_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_94_5 {
		zext_ln1271_2 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		mul {Type I LastRead 0 FirstWrite -1}
		sq_V_out {Type O LastRead -1 FirstWrite 3}
		sk_V_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_124_10 {
		d_1 {Type I LastRead 0 FirstWrite -1}
		K_V {Type I LastRead 0 FirstWrite -1}
		s_V_out {Type O LastRead -1 FirstWrite 1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_135_12 {
		pos_r {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		K_sum_V {Type I LastRead 1 FirstWrite -1}
		p_normalizer_V_2_out {Type O LastRead -1 FirstWrite 4}
		ACTIVE_CHANNELS {Type I LastRead 0 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_145_13_VITIS_LOOP_147_14 {
		pos_r {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 2 FirstWrite -1}
		KV_V {Type I LastRead 2 FirstWrite -1}
		sext_ln1270_4 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 9}
		ACTIVE_CHANNELS {Type I LastRead 0 FirstWrite -1}}
	linear_attention_q8_sparse_Pipeline_VITIS_LOOP_158_16 {
		zext_ln157 {Type I LastRead 0 FirstWrite -1}
		tmp_18 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		s_V_6_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "27560", "Max" : "27560"}
	, {"Name" : "Interval", "Min" : "27560", "Max" : "27560"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x { ap_memory {  { x_address0 mem_address 1 8 }  { x_ce0 mem_ce 1 1 }  { x_we0 mem_we 1 1 }  { x_d0 mem_din 1 16 }  { x_q0 mem_dout 0 16 } } }
}
