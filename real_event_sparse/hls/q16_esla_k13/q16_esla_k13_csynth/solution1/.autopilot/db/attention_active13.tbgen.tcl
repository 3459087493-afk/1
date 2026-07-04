set moduleName attention_active13
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
set C_modelName {attention_active13}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_active int 16 regular {array 208 { 2 1 } 1 1 }  }
	{ phi_k_active int 16 regular {array 208 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x_active", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "phi_k_active", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_active_address0 sc_out sc_lv 8 signal 0 } 
	{ x_active_ce0 sc_out sc_logic 1 signal 0 } 
	{ x_active_we0 sc_out sc_logic 1 signal 0 } 
	{ x_active_d0 sc_out sc_lv 16 signal 0 } 
	{ x_active_q0 sc_in sc_lv 16 signal 0 } 
	{ x_active_address1 sc_out sc_lv 8 signal 0 } 
	{ x_active_ce1 sc_out sc_logic 1 signal 0 } 
	{ x_active_q1 sc_in sc_lv 16 signal 0 } 
	{ phi_k_active_address0 sc_out sc_lv 8 signal 1 } 
	{ phi_k_active_ce0 sc_out sc_logic 1 signal 1 } 
	{ phi_k_active_q0 sc_in sc_lv 16 signal 1 } 
	{ grp_fu_4305_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_4305_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_4305_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_4305_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1077_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1077_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1077_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1080_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1080_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1080_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1080_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_active_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_active", "role": "address0" }} , 
 	{ "name": "x_active_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_active", "role": "ce0" }} , 
 	{ "name": "x_active_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_active", "role": "we0" }} , 
 	{ "name": "x_active_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_active", "role": "d0" }} , 
 	{ "name": "x_active_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_active", "role": "q0" }} , 
 	{ "name": "x_active_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_active", "role": "address1" }} , 
 	{ "name": "x_active_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_active", "role": "ce1" }} , 
 	{ "name": "x_active_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_active", "role": "q1" }} , 
 	{ "name": "phi_k_active_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "phi_k_active", "role": "address0" }} , 
 	{ "name": "phi_k_active_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "phi_k_active", "role": "ce0" }} , 
 	{ "name": "phi_k_active_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "phi_k_active", "role": "q0" }} , 
 	{ "name": "grp_fu_4305_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_4305_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_4305_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_4305_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_4305_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_4305_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_4305_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_4305_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1077_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1077_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1077_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1077_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1077_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1077_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1080_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1080_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1080_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1080_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1080_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1080_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1080_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1080_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "10", "16", "18", "21", "25"],
		"CDFG" : "attention_active13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "22298", "EstimateLatencyMax" : "22298",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_active", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316", "Port" : "x_active", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "25", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355", "Port" : "x_active", "Inst_start_state" : "59", "Inst_end_state" : "60"}]},
			{"Name" : "phi_k_active", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6_fu_308", "Port" : "phi_k_active", "Inst_start_state" : "2", "Inst_end_state" : "25"},
					{"ID" : "16", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_117_8_fu_330", "Port" : "phi_k_active", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "59", "Inst_end_state" : "60"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_87_1_VITIS_LOOP_88_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_115_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_142_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state57", "LastState" : ["ap_ST_fsm_state60"], "QuitState" : ["ap_ST_fsm_state57"], "PreState" : ["ap_ST_fsm_state56"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_124_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state57"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_attention_output_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Q_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.V_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.KV_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.K_sum_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attended_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6_fu_308", "Parent" : "0", "Child" : ["8", "9"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3335", "EstimateLatencyMax" : "3335",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "phi_k_active", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6_fu_308.mac_muladd_16s_16s_30ns_30_4_1_U52", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6_fu_308.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316", "Parent" : "0", "Child" : ["11", "12", "13", "14", "15"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_91_3",
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
			{"Name" : "zext_ln93", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_active", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_132", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "phi_ln818_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_91_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316.layers_0_attention_query_weight_V_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316.layers_0_attention_value_weight_V_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316.mul_mul_12s_16s_28_4_1_U41", "Parent" : "10"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316.mul_mul_10s_16s_26_4_1_U42", "Parent" : "10"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_91_3_fu_316.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_117_8_fu_330", "Parent" : "0", "Child" : ["17"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_117_8",
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
			{"Name" : "zext_ln115", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_k_active", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_117_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_117_8_fu_330.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_126_10_fu_338", "Parent" : "0", "Child" : ["19", "20"],
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
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_126_10_fu_338.mac_muladd_16s_16s_30ns_30_4_1_U60", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_126_10_fu_338.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12_fu_346", "Parent" : "0", "Child" : ["22", "23", "24"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "265", "EstimateLatencyMax" : "265",
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
			{"Name" : "sext_ln1270_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_133_11_VITIS_LOOP_135_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12_fu_346.mac_muladd_16s_16s_30ns_30_4_1_U65", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12_fu_346.mul_mul_24s_16s_30_4_1_U66", "Parent" : "21"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12_fu_346.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355", "Parent" : "0", "Child" : ["26", "27", "28"],
		"CDFG" : "attention_active13_Pipeline_VITIS_LOOP_144_14",
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
			{"Name" : "sext_ln143", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_active", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln813_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_141", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_144_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355.layers_0_attention_output_weight_V_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355.mul_mul_10s_16s_26_4_1_U73", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_attention_active13_Pipeline_VITIS_LOOP_144_14_fu_355.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"}]}


set ArgLastReadFirstWriteLatency {
	attention_active13 {
		x_active {Type IO LastRead 3 FirstWrite -1}
		phi_k_active {Type I LastRead 2 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_active13_Pipeline_VITIS_LOOP_103_4_VITIS_LOOP_104_5_VITIS_LOOP_106_6 {
		KV_V {Type O LastRead -1 FirstWrite 6}
		phi_k_active {Type I LastRead 2 FirstWrite -1}
		V_V {Type I LastRead 2 FirstWrite -1}}
	attention_active13_Pipeline_VITIS_LOOP_91_3 {
		zext_ln93 {Type I LastRead 0 FirstWrite -1}
		x_active {Type I LastRead 0 FirstWrite -1}
		tmp_132 {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		phi_ln818_1_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	attention_active13_Pipeline_VITIS_LOOP_117_8 {
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		phi_k_active {Type I LastRead 0 FirstWrite -1}
		sum_V_out {Type O LastRead -1 FirstWrite 1}}
	attention_active13_Pipeline_VITIS_LOOP_126_10 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 0 FirstWrite -1}
		K_sum_V {Type I LastRead 0 FirstWrite -1}
		normalizer_V_2_out {Type O LastRead -1 FirstWrite 3}}
	attention_active13_Pipeline_VITIS_LOOP_133_11_VITIS_LOOP_135_12 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		KV_V {Type I LastRead 1 FirstWrite -1}
		sext_ln1270_26 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 8}}
	attention_active13_Pipeline_VITIS_LOOP_144_14 {
		sext_ln143 {Type I LastRead 0 FirstWrite -1}
		x_active {Type IO LastRead 3 FirstWrite 5}
		add_ln813_20 {Type I LastRead 0 FirstWrite -1}
		tmp_141 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "22298", "Max" : "22298"}
	, {"Name" : "Interval", "Min" : "22298", "Max" : "22298"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	x_active { ap_memory {  { x_active_address0 mem_address 1 8 }  { x_active_ce0 mem_ce 1 1 }  { x_active_we0 mem_we 1 1 }  { x_active_d0 mem_din 1 16 }  { x_active_q0 mem_dout 0 16 }  { x_active_address1 MemPortADDR2 1 8 }  { x_active_ce1 MemPortCE2 1 1 }  { x_active_q1 MemPortDOUT2 0 16 } } }
	phi_k_active { ap_memory {  { phi_k_active_address0 mem_address 1 8 }  { phi_k_active_ce0 mem_ce 1 1 }  { phi_k_active_q0 mem_dout 0 16 } } }
}
