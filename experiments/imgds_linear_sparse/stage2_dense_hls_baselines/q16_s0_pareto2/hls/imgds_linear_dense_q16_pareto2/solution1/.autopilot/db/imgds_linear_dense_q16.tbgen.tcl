set moduleName imgds_linear_dense_q16
set isTopModule 1
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
set C_modelName {imgds_linear_dense_q16}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 16 regular {array 1024 { 1 3 } 1 1 }  }
	{ logits_0 int 16 regular {pointer 1}  }
	{ logits_1 int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "logits_0", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_1", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r_address0 sc_out sc_lv 10 signal 0 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_r_q0 sc_in sc_lv 16 signal 0 } 
	{ logits_0 sc_out sc_lv 16 signal 1 } 
	{ logits_0_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ logits_1 sc_out sc_lv 16 signal 2 } 
	{ logits_1_ap_vld sc_out sc_logic 1 outvld 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "logits_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "logits_0", "role": "default" }} , 
 	{ "name": "logits_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logits_0", "role": "ap_vld" }} , 
 	{ "name": "logits_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "logits_1", "role": "default" }} , 
 	{ "name": "logits_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logits_1", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "44", "48", "103", "158", "162", "164", "168", "170", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211"],
		"CDFG" : "imgds_linear_dense_q16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "74084", "EstimateLatencyMax" : "74084",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544", "Port" : "input_r", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "logits_0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "logits_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "input_projection_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_embedding_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544", "Port" : "input_projection_weight_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_fu_529", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_fu_529", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_fu_529", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_fu_529", "Port" : "layers_0_attention_output_bias_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_linear_attention_q16_fu_529", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "grp_layer_norm_q16_fu_603", "Port" : "output_norm_weight_V", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "grp_layer_norm_q16_fu_603", "Port" : "output_norm_bias_V", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "layers_0_feedforward_0_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "158", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3_fu_568", "Port" : "layers_0_feedforward_0_weight_V", "Inst_start_state" : "13", "Inst_end_state" : "14"}]},
			{"Name" : "layers_0_feedforward_3_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "164", "SubInstance" : "grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5_fu_586", "Port" : "layers_0_feedforward_3_weight_V", "Inst_start_state" : "18", "Inst_end_state" : "19"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_226_1_VITIS_LOOP_227_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_183_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_195_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state16", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state16"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_180_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "45", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state21"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_projection_bias_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_embedding_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_0_bias_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layers_0_feedforward_3_bias_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hidden_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ff_out_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.x_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529", "Parent" : "0", "Child" : ["10", "11", "12", "13", "14", "15", "16", "17", "20", "28", "30", "33", "37", "41", "42", "43"],
		"CDFG" : "linear_attention_q16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "27419", "EstimateLatencyMax" : "27419",
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
					{"ID" : "20", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "37", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372", "Port" : "x", "Inst_start_state" : "59", "Inst_end_state" : "60"}]},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331", "Port" : "layers_0_attention_query_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331", "Port" : "layers_0_attention_key_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331", "Port" : "layers_0_attention_value_weight_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "layers_0_attention_output_bias_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372", "Port" : "layers_0_attention_output_weight_V", "Inst_start_state" : "59", "Inst_end_state" : "60"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_94_1_VITIS_LOOP_95_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state25"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_125_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state26", "LastState" : ["ap_ST_fsm_state28"], "QuitState" : ["ap_ST_fsm_state26"], "PreState" : ["ap_ST_fsm_state25"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_157_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state57", "LastState" : ["ap_ST_fsm_state60"], "QuitState" : ["ap_ST_fsm_state57"], "PreState" : ["ap_ST_fsm_state56"], "PostState" : ["ap_ST_fsm_state29"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_135_9", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "60", "FirstState" : "ap_ST_fsm_state29", "LastState" : ["ap_ST_fsm_state57"], "QuitState" : ["ap_ST_fsm_state29"], "PreState" : ["ap_ST_fsm_state26"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.layers_0_attention_output_bias_V_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.Q_V_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.K_V_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.V_V_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.KV_V_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.K_sum_V_U", "Parent" : "9"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.attended_V_U", "Parent" : "9"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6_fu_324", "Parent" : "9", "Child" : ["18", "19"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4103", "EstimateLatencyMax" : "4103",
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
			{"Name" : "VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6_fu_324.mac_muladd_16s_16s_30ns_30_4_1_U26", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6_fu_324.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331", "Parent" : "9", "Child" : ["21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_97_3",
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
			{"Name" : "zext_ln99", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_V_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "phi_ln818_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_attention_query_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_key_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_value_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_97_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.layers_0_attention_query_weight_V_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.layers_0_attention_key_weight_V_U", "Parent" : "20"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.layers_0_attention_value_weight_V_U", "Parent" : "20"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.mul_mul_12s_16s_28_4_1_U11", "Parent" : "20"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.mul_mul_11s_16s_27_4_1_U12", "Parent" : "20"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.mul_mul_10s_16s_26_4_1_U13", "Parent" : "20"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_97_3_fu_331.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_127_8_fu_348", "Parent" : "9", "Child" : ["29"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_127_8",
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
			{"Name" : "zext_ln125", "Type" : "None", "Direction" : "I"},
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "s_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_127_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_127_8_fu_348.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_138_10_fu_355", "Parent" : "9", "Child" : ["31", "32"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_138_10",
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
			{"Name" : "p_normalizer_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_138_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_138_10_fu_355.mac_muladd_16s_16s_30ns_30_4_1_U34", "Parent" : "30"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_138_10_fu_355.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12_fu_363", "Parent" : "9", "Child" : ["34", "35", "36"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12",
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
			{"Name" : "sext_ln1270_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_147_11_VITIS_LOOP_149_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12_fu_363.mac_muladd_16s_16s_30ns_30_4_1_U39", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12_fu_363.mul_mul_24s_16s_30_4_1_U40", "Parent" : "33"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12_fu_363.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372", "Parent" : "9", "Child" : ["38", "39", "40"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_159_14",
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
			{"Name" : "sext_ln158", "Type" : "None", "Direction" : "I"},
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "add_ln813_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_attention_output_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_159_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372.layers_0_attention_output_weight_V_U", "Parent" : "37"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372.mul_mul_10s_16s_26_4_1_U47", "Parent" : "37"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.grp_linear_attention_q16_Pipeline_VITIS_LOOP_159_14_fu_372.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.fpext_32ns_64_2_no_dsp_1_U56", "Parent" : "9"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.fexp_32ns_32ns_32_10_full_dsp_1_U57", "Parent" : "9"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_linear_attention_q16_fu_529.fexp_32ns_32ns_32_10_full_dsp_1_U58", "Parent" : "9"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544", "Parent" : "0", "Child" : ["45", "46", "47"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "70", "EstimateLatencyMax" : "70",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln228", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln233_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln1271_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_63", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_projection_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_229_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544.input_projection_weight_V_U", "Parent" : "44"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544.mul_mul_9s_16s_25_4_1_U1", "Parent" : "44"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3_fu_544.flow_control_loop_pipe_sequential_init_U", "Parent" : "44"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558", "Parent" : "0", "Child" : ["49", "102"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1442", "EstimateLatencyMax" : "1442",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "49", "SubInstance" : "grp_layer_norm_q16_1_fu_92", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "91"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_249_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "90", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92", "Parent" : "48", "Child" : ["50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101"],
		"CDFG" : "layer_norm_q16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "90",
		"VariableLatency" : "0", "ExactLatency" : "89", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read31", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "49"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.fdiv_32ns_32ns_32_16_no_dsp_1_U66", "Parent" : "49"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.fpext_32ns_64_2_no_dsp_1_U67", "Parent" : "49"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.fsqrt_32ns_32ns_32_16_no_dsp_1_U68", "Parent" : "49"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mul_mul_16s_16s_30_4_1_U69", "Parent" : "49"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U70", "Parent" : "49"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U71", "Parent" : "49"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U72", "Parent" : "49"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U73", "Parent" : "49"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "49"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "49"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "49"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U77", "Parent" : "49"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U78", "Parent" : "49"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U79", "Parent" : "49"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U80", "Parent" : "49"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U81", "Parent" : "49"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U82", "Parent" : "49"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U83", "Parent" : "49"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U84", "Parent" : "49"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U85", "Parent" : "49"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U86", "Parent" : "49"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U87", "Parent" : "49"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U88", "Parent" : "49"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U89", "Parent" : "49"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U90", "Parent" : "49"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U91", "Parent" : "49"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U92", "Parent" : "49"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U93", "Parent" : "49"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U94", "Parent" : "49"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U95", "Parent" : "49"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U96", "Parent" : "49"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U97", "Parent" : "49"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U98", "Parent" : "49"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U99", "Parent" : "49"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U100", "Parent" : "49"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15s_26_4_1_U101", "Parent" : "49"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U102", "Parent" : "49"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U103", "Parent" : "49"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U104", "Parent" : "49"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U105", "Parent" : "49"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U106", "Parent" : "49"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16ns_26_4_1_U107", "Parent" : "49"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U108", "Parent" : "49"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_18s_26_4_1_U109", "Parent" : "49"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U110", "Parent" : "49"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U111", "Parent" : "49"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U112", "Parent" : "49"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U113", "Parent" : "49"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U114", "Parent" : "49"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U115", "Parent" : "49"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_18s_26_4_1_U116", "Parent" : "49"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4_fu_558.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563", "Parent" : "0", "Child" : ["104", "157"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1442", "EstimateLatencyMax" : "1442",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "grp_layer_norm_q16_1_fu_92", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "91"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_262_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "90", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92", "Parent" : "103", "Child" : ["105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156"],
		"CDFG" : "layer_norm_q16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "90",
		"VariableLatency" : "0", "ExactLatency" : "89", "EstimateLatencyMin" : "89", "EstimateLatencyMax" : "89",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read16", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read17", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read18", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read19", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read20", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read21", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read22", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read23", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read24", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read25", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read26", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read27", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read28", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read29", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read30", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read31", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "104"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.fdiv_32ns_32ns_32_16_no_dsp_1_U66", "Parent" : "104"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.fpext_32ns_64_2_no_dsp_1_U67", "Parent" : "104"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.fsqrt_32ns_32ns_32_16_no_dsp_1_U68", "Parent" : "104"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mul_mul_16s_16s_30_4_1_U69", "Parent" : "104"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U70", "Parent" : "104"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U71", "Parent" : "104"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U72", "Parent" : "104"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U73", "Parent" : "104"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "104"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "104"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "104"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U77", "Parent" : "104"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U78", "Parent" : "104"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U79", "Parent" : "104"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U80", "Parent" : "104"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U81", "Parent" : "104"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U82", "Parent" : "104"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U83", "Parent" : "104"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U84", "Parent" : "104"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U85", "Parent" : "104"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U86", "Parent" : "104"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U87", "Parent" : "104"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U88", "Parent" : "104"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U89", "Parent" : "104"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U90", "Parent" : "104"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U91", "Parent" : "104"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U92", "Parent" : "104"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U93", "Parent" : "104"},
	{"ID" : "134", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U94", "Parent" : "104"},
	{"ID" : "135", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U95", "Parent" : "104"},
	{"ID" : "136", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U96", "Parent" : "104"},
	{"ID" : "137", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U97", "Parent" : "104"},
	{"ID" : "138", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U98", "Parent" : "104"},
	{"ID" : "139", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U99", "Parent" : "104"},
	{"ID" : "140", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U100", "Parent" : "104"},
	{"ID" : "141", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15s_26_4_1_U101", "Parent" : "104"},
	{"ID" : "142", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U102", "Parent" : "104"},
	{"ID" : "143", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U103", "Parent" : "104"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U104", "Parent" : "104"},
	{"ID" : "145", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U105", "Parent" : "104"},
	{"ID" : "146", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U106", "Parent" : "104"},
	{"ID" : "147", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16ns_26_4_1_U107", "Parent" : "104"},
	{"ID" : "148", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.am_submul_16s_16s_16s_26_4_1_U108", "Parent" : "104"},
	{"ID" : "149", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_18s_26_4_1_U109", "Parent" : "104"},
	{"ID" : "150", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U110", "Parent" : "104"},
	{"ID" : "151", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U111", "Parent" : "104"},
	{"ID" : "152", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U112", "Parent" : "104"},
	{"ID" : "153", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U113", "Parent" : "104"},
	{"ID" : "154", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U114", "Parent" : "104"},
	{"ID" : "155", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U115", "Parent" : "104"},
	{"ID" : "156", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.grp_layer_norm_q16_1_fu_92.mac_muladd_16s_11ns_18s_26_4_1_U116", "Parent" : "104"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5_fu_563.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3_fu_568", "Parent" : "0", "Child" : ["159", "160", "161"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3",
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
			{"Name" : "sext_ln184", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln1271_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "tmp_67", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln818_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "layers_0_feedforward_0_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_185_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3_fu_568.layers_0_feedforward_0_weight_V_U", "Parent" : "158"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3_fu_568.mul_mul_11s_16s_27_4_1_U165", "Parent" : "158"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3_fu_568.flow_control_loop_pipe_sequential_init_U", "Parent" : "158"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_205_6_fu_579", "Parent" : "0", "Child" : ["163"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_205_6",
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
			{"Name" : "zext_ln1271_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_205_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_205_6_fu_579.flow_control_loop_pipe_sequential_init_U", "Parent" : "162"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5_fu_586", "Parent" : "0", "Child" : ["165", "166", "167"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "37", "EstimateLatencyMax" : "37",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln196", "Type" : "None", "Direction" : "I"},
			{"Name" : "ff_out_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln195", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_101", "Type" : "None", "Direction" : "I"},
			{"Name" : "hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layers_0_feedforward_3_weight_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_197_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5_fu_586.layers_0_feedforward_3_weight_V_U", "Parent" : "164"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5_fu_586.mul_mul_10s_15ns_25_4_1_U172", "Parent" : "164"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5_fu_586.flow_control_loop_pipe_sequential_init_U", "Parent" : "164"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_267_6_VITIS_LOOP_269_7_fu_597", "Parent" : "0", "Child" : ["169"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_267_6_VITIS_LOOP_269_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "261", "EstimateLatencyMax" : "261",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pooled_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_267_6_VITIS_LOOP_269_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_imgds_linear_dense_q16_Pipeline_VITIS_LOOP_267_6_VITIS_LOOP_269_7_fu_597.flow_control_loop_pipe_sequential_init_U", "Parent" : "168"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603", "Parent" : "0", "Child" : ["171", "173", "176", "182", "183"],
		"CDFG" : "layer_norm_q16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "114", "EstimateLatencyMax" : "114",
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
					{"ID" : "176", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159", "Port" : "x", "Inst_start_state" : "51", "Inst_end_state" : "52"},
					{"ID" : "171", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_46_1_fu_144", "Port" : "x", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "173", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_52_2_fu_151", "Port" : "x", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "176", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159", "Port" : "output_norm_weight_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "176", "SubInstance" : "grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159", "Port" : "output_norm_bias_V", "Inst_start_state" : "51", "Inst_end_state" : "52"}]}]},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_46_1_fu_144", "Parent" : "170", "Child" : ["172"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_46_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "18",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_46_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "172", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_46_1_fu_144.flow_control_loop_pipe_sequential_init_U", "Parent" : "171"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_52_2_fu_151", "Parent" : "170", "Child" : ["174", "175"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_52_2",
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
			{"Name" : "x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean", "Type" : "None", "Direction" : "I"},
			{"Name" : "var_sum_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_52_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "174", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_52_2_fu_151.mac_muladd_16s_16s_30ns_30_4_1_U188", "Parent" : "173"},
	{"ID" : "175", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_52_2_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "173"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159", "Parent" : "170", "Child" : ["177", "178", "179", "180", "181"],
		"CDFG" : "layer_norm_q16_Pipeline_VITIS_LOOP_64_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1270", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_64_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "177", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159.output_norm_weight_V_U", "Parent" : "176"},
	{"ID" : "178", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159.output_norm_bias_V_U", "Parent" : "176"},
	{"ID" : "179", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159.am_submul_16s_16s_16s_26_4_1_U192", "Parent" : "176"},
	{"ID" : "180", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159.mac_muladd_16s_11ns_18s_26_4_1_U193", "Parent" : "176"},
	{"ID" : "181", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.grp_layer_norm_q16_Pipeline_VITIS_LOOP_64_3_fu_159.flow_control_loop_pipe_sequential_init_U", "Parent" : "176"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.fadd_32ns_32ns_32_5_full_dsp_1_U199", "Parent" : "170"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_fu_603.fsqrt_32ns_32ns_32_16_no_dsp_1_U202", "Parent" : "170"},
	{"ID" : "184", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_19s_24_4_1_U204", "Parent" : "0"},
	{"ID" : "185", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_18s_25_4_1_U205", "Parent" : "0"},
	{"ID" : "186", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_24s_25_4_1_U206", "Parent" : "0"},
	{"ID" : "187", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_25s_26_4_1_U207", "Parent" : "0"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_25s_26_4_1_U208", "Parent" : "0"},
	{"ID" : "189", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_26s_26_4_1_U209", "Parent" : "0"},
	{"ID" : "190", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U210", "Parent" : "0"},
	{"ID" : "191", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8ns_26s_26_4_1_U211", "Parent" : "0"},
	{"ID" : "192", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U212", "Parent" : "0"},
	{"ID" : "193", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U213", "Parent" : "0"},
	{"ID" : "194", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U214", "Parent" : "0"},
	{"ID" : "195", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U215", "Parent" : "0"},
	{"ID" : "196", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U216", "Parent" : "0"},
	{"ID" : "197", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U217", "Parent" : "0"},
	{"ID" : "198", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U218", "Parent" : "0"},
	{"ID" : "199", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U219", "Parent" : "0"},
	{"ID" : "200", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_26ns_26_4_1_U220", "Parent" : "0"},
	{"ID" : "201", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U221", "Parent" : "0"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U222", "Parent" : "0"},
	{"ID" : "203", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_8s_26s_26_4_1_U223", "Parent" : "0"},
	{"ID" : "204", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U224", "Parent" : "0"},
	{"ID" : "205", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9s_26s_26_4_1_U225", "Parent" : "0"},
	{"ID" : "206", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_7ns_26s_26_4_1_U226", "Parent" : "0"},
	{"ID" : "207", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U227", "Parent" : "0"},
	{"ID" : "208", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10s_26ns_26_4_1_U228", "Parent" : "0"},
	{"ID" : "209", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_9ns_26ns_26_4_1_U229", "Parent" : "0"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U230", "Parent" : "0"},
	{"ID" : "211", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U231", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_dense_q16 {
		input_r {Type I LastRead 0 FirstWrite -1}
		logits_0 {Type O LastRead -1 FirstWrite 30}
		logits_1 {Type O LastRead -1 FirstWrite 29}
		input_projection_bias_V {Type I LastRead -1 FirstWrite -1}
		position_embedding_V {Type I LastRead -1 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16 {
		x {Type IO LastRead 3 FirstWrite -1}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_bias_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_Pipeline_VITIS_LOOP_112_4_VITIS_LOOP_113_5_VITIS_LOOP_115_6 {
		KV_V {Type O LastRead -1 FirstWrite 6}
		K_V {Type I LastRead 2 FirstWrite -1}
		V_V {Type I LastRead 2 FirstWrite -1}}
	linear_attention_q16_Pipeline_VITIS_LOOP_97_3 {
		zext_ln99 {Type I LastRead 0 FirstWrite -1}
		x {Type I LastRead 0 FirstWrite -1}
		tmp_4 {Type I LastRead 0 FirstWrite -1}
		x_V_out {Type O LastRead -1 FirstWrite 3}
		x_V_1_out {Type O LastRead -1 FirstWrite 3}
		phi_ln818_2_out {Type O LastRead -1 FirstWrite 3}
		layers_0_attention_query_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_key_weight_V {Type I LastRead -1 FirstWrite -1}
		layers_0_attention_value_weight_V {Type I LastRead -1 FirstWrite -1}}
	linear_attention_q16_Pipeline_VITIS_LOOP_127_8 {
		zext_ln125 {Type I LastRead 0 FirstWrite -1}
		K_V {Type I LastRead 0 FirstWrite -1}
		s_V_out {Type O LastRead -1 FirstWrite 1}}
	linear_attention_q16_Pipeline_VITIS_LOOP_138_10 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 0 FirstWrite -1}
		K_sum_V {Type I LastRead 0 FirstWrite -1}
		p_normalizer_V_2_out {Type O LastRead -1 FirstWrite 3}}
	linear_attention_q16_Pipeline_VITIS_LOOP_147_11_VITIS_LOOP_149_12 {
		zext_ln813 {Type I LastRead 0 FirstWrite -1}
		Q_V {Type I LastRead 1 FirstWrite -1}
		KV_V {Type I LastRead 1 FirstWrite -1}
		sext_ln1270_3 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type O LastRead -1 FirstWrite 8}}
	linear_attention_q16_Pipeline_VITIS_LOOP_159_14 {
		sext_ln158 {Type I LastRead 0 FirstWrite -1}
		x {Type IO LastRead 3 FirstWrite 5}
		add_ln813_4 {Type I LastRead 0 FirstWrite -1}
		tmp_17 {Type I LastRead 0 FirstWrite -1}
		attended_V {Type I LastRead 0 FirstWrite -1}
		layers_0_attention_output_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_229_3 {
		sext_ln228 {Type I LastRead 0 FirstWrite -1}
		x_V {Type O LastRead -1 FirstWrite 5}
		add_ln233_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln1271_4 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		tmp_63 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		input_projection_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_249_4 {
		x_V {Type IO LastRead 8 FirstWrite 82}}
	layer_norm_q16_1 {
		x {Type IO LastRead 8 FirstWrite 82}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 79 FirstWrite -1}
		p_read1 {Type I LastRead 79 FirstWrite -1}
		p_read2 {Type I LastRead 80 FirstWrite -1}
		p_read3 {Type I LastRead 80 FirstWrite -1}
		p_read4 {Type I LastRead 80 FirstWrite -1}
		p_read5 {Type I LastRead 81 FirstWrite -1}
		p_read6 {Type I LastRead 81 FirstWrite -1}
		p_read7 {Type I LastRead 81 FirstWrite -1}
		p_read8 {Type I LastRead 82 FirstWrite -1}
		p_read9 {Type I LastRead 82 FirstWrite -1}
		p_read10 {Type I LastRead 82 FirstWrite -1}
		p_read11 {Type I LastRead 83 FirstWrite -1}
		p_read12 {Type I LastRead 83 FirstWrite -1}
		p_read13 {Type I LastRead 83 FirstWrite -1}
		p_read14 {Type I LastRead 84 FirstWrite -1}
		p_read15 {Type I LastRead 84 FirstWrite -1}
		p_read16 {Type I LastRead 81 FirstWrite -1}
		p_read17 {Type I LastRead 81 FirstWrite -1}
		p_read18 {Type I LastRead 82 FirstWrite -1}
		p_read19 {Type I LastRead 82 FirstWrite -1}
		p_read20 {Type I LastRead 82 FirstWrite -1}
		p_read21 {Type I LastRead 83 FirstWrite -1}
		p_read22 {Type I LastRead 83 FirstWrite -1}
		p_read23 {Type I LastRead 83 FirstWrite -1}
		p_read24 {Type I LastRead 84 FirstWrite -1}
		p_read25 {Type I LastRead 84 FirstWrite -1}
		p_read26 {Type I LastRead 84 FirstWrite -1}
		p_read27 {Type I LastRead 85 FirstWrite -1}
		p_read28 {Type I LastRead 85 FirstWrite -1}
		p_read29 {Type I LastRead 85 FirstWrite -1}
		p_read30 {Type I LastRead 86 FirstWrite -1}
		p_read31 {Type I LastRead 86 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_262_5 {
		x_V {Type IO LastRead 8 FirstWrite 82}}
	layer_norm_q16_1 {
		x {Type IO LastRead 8 FirstWrite 82}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 79 FirstWrite -1}
		p_read1 {Type I LastRead 79 FirstWrite -1}
		p_read2 {Type I LastRead 80 FirstWrite -1}
		p_read3 {Type I LastRead 80 FirstWrite -1}
		p_read4 {Type I LastRead 80 FirstWrite -1}
		p_read5 {Type I LastRead 81 FirstWrite -1}
		p_read6 {Type I LastRead 81 FirstWrite -1}
		p_read7 {Type I LastRead 81 FirstWrite -1}
		p_read8 {Type I LastRead 82 FirstWrite -1}
		p_read9 {Type I LastRead 82 FirstWrite -1}
		p_read10 {Type I LastRead 82 FirstWrite -1}
		p_read11 {Type I LastRead 83 FirstWrite -1}
		p_read12 {Type I LastRead 83 FirstWrite -1}
		p_read13 {Type I LastRead 83 FirstWrite -1}
		p_read14 {Type I LastRead 84 FirstWrite -1}
		p_read15 {Type I LastRead 84 FirstWrite -1}
		p_read16 {Type I LastRead 81 FirstWrite -1}
		p_read17 {Type I LastRead 81 FirstWrite -1}
		p_read18 {Type I LastRead 82 FirstWrite -1}
		p_read19 {Type I LastRead 82 FirstWrite -1}
		p_read20 {Type I LastRead 82 FirstWrite -1}
		p_read21 {Type I LastRead 83 FirstWrite -1}
		p_read22 {Type I LastRead 83 FirstWrite -1}
		p_read23 {Type I LastRead 83 FirstWrite -1}
		p_read24 {Type I LastRead 84 FirstWrite -1}
		p_read25 {Type I LastRead 84 FirstWrite -1}
		p_read26 {Type I LastRead 84 FirstWrite -1}
		p_read27 {Type I LastRead 85 FirstWrite -1}
		p_read28 {Type I LastRead 85 FirstWrite -1}
		p_read29 {Type I LastRead 85 FirstWrite -1}
		p_read30 {Type I LastRead 86 FirstWrite -1}
		p_read31 {Type I LastRead 86 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_185_3 {
		sext_ln184 {Type I LastRead 0 FirstWrite -1}
		zext_ln1271_5 {Type I LastRead 0 FirstWrite -1}
		x_V {Type I LastRead 0 FirstWrite -1}
		tmp_67 {Type I LastRead 0 FirstWrite -1}
		phi_ln818_out {Type O LastRead -1 FirstWrite 3}
		layers_0_feedforward_0_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_205_6 {
		zext_ln1271_5 {Type I LastRead 0 FirstWrite -1}
		x_V {Type IO LastRead 0 FirstWrite 2}
		ff_out_V {Type I LastRead 0 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_197_5 {
		sext_ln196 {Type I LastRead 0 FirstWrite -1}
		ff_out_V {Type O LastRead -1 FirstWrite 4}
		zext_ln195 {Type I LastRead 0 FirstWrite -1}
		tmp_101 {Type I LastRead 0 FirstWrite -1}
		hidden_V {Type I LastRead 0 FirstWrite -1}
		layers_0_feedforward_3_weight_V {Type I LastRead -1 FirstWrite -1}}
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_267_6_VITIS_LOOP_269_7 {
		x_V {Type I LastRead 1 FirstWrite -1}
		pooled_V {Type O LastRead -1 FirstWrite 4}}
	layer_norm_q16 {
		x {Type IO LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_q16_Pipeline_VITIS_LOOP_46_1 {
		x {Type I LastRead 0 FirstWrite -1}
		sum_V_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_q16_Pipeline_VITIS_LOOP_52_2 {
		x {Type I LastRead 0 FirstWrite -1}
		mean {Type I LastRead 0 FirstWrite -1}
		var_sum_V_2_out {Type O LastRead -1 FirstWrite 3}}
	layer_norm_q16_Pipeline_VITIS_LOOP_64_3 {
		x {Type IO LastRead 0 FirstWrite 7}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		sext_ln1270 {Type I LastRead 0 FirstWrite -1}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "74084", "Max" : "74084"}
	, {"Name" : "Interval", "Min" : "74085", "Max" : "74085"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 10 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 16 } } }
	logits_0 { ap_vld {  { logits_0 out_data 1 16 }  { logits_0_ap_vld out_vld 1 1 } } }
	logits_1 { ap_vld {  { logits_1 out_data 1 16 }  { logits_1_ap_vld out_vld 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
