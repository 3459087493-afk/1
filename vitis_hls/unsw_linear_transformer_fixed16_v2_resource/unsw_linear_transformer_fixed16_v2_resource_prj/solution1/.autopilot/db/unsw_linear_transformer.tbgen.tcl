set moduleName unsw_linear_transformer
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
set C_modelName {unsw_linear_transformer}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 32 regular {array 192 { 1 3 } 1 1 }  }
	{ logits int 32 regular {array 2 { 0 0 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "logits", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r_address0 sc_out sc_lv 8 signal 0 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_r_q0 sc_in sc_lv 32 signal 0 } 
	{ logits_address0 sc_out sc_lv 1 signal 1 } 
	{ logits_ce0 sc_out sc_logic 1 signal 1 } 
	{ logits_we0 sc_out sc_logic 1 signal 1 } 
	{ logits_d0 sc_out sc_lv 32 signal 1 } 
	{ logits_address1 sc_out sc_lv 1 signal 1 } 
	{ logits_ce1 sc_out sc_logic 1 signal 1 } 
	{ logits_we1 sc_out sc_logic 1 signal 1 } 
	{ logits_d1 sc_out sc_lv 32 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "logits_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "address0" }} , 
 	{ "name": "logits_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "ce0" }} , 
 	{ "name": "logits_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "we0" }} , 
 	{ "name": "logits_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logits", "role": "d0" }} , 
 	{ "name": "logits_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "address1" }} , 
 	{ "name": "logits_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "ce1" }} , 
 	{ "name": "logits_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "we1" }} , 
 	{ "name": "logits_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logits", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "27", "31", "35", "39", "42", "46", "48", "51", "55", "69", "73", "77", "81", "83", "98", "102", "103"],
		"CDFG" : "unsw_linear_transformer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "115939", "EstimateLatencyMax" : "115939",
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
					{"ID" : "25", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_93_1_VITIS_LOOP_94_2_fu_776", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "logits", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "INPUT_PROJECTION_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "POSITION_EMBEDDING_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5_fu_784", "Port" : "INPUT_PROJECTION_WEIGHT_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8_fu_798", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11_fu_808", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V", "Inst_start_state" : "33", "Inst_end_state" : "34"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14_fu_825", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "69", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26_fu_871", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V", "Inst_start_state" : "72", "Inst_end_state" : "73"}]},
			{"Name" : "LAYERS_0_NORM1_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859", "Port" : "weight", "Inst_start_state" : "83", "Inst_end_state" : "88"}]},
			{"Name" : "LAYERS_0_NORM1_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859", "Port" : "bias", "Inst_start_state" : "83", "Inst_end_state" : "88"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29_fu_882", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V", "Inst_start_state" : "80", "Inst_end_state" : "81"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "77", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32_fu_893", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V", "Inst_start_state" : "86", "Inst_end_state" : "87"}]},
			{"Name" : "LAYERS_0_NORM2_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859", "Port" : "weight", "Inst_start_state" : "83", "Inst_end_state" : "88"}]},
			{"Name" : "LAYERS_0_NORM2_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859", "Port" : "bias", "Inst_start_state" : "83", "Inst_end_state" : "88"}]},
			{"Name" : "OUTPUT_NORM_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914", "Port" : "OUTPUT_NORM_WEIGHT_V", "Inst_start_state" : "91", "Inst_end_state" : "92"}]},
			{"Name" : "OUTPUT_NORM_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914", "Port" : "OUTPUT_NORM_BIAS_V", "Inst_start_state" : "91", "Inst_end_state" : "92"}]},
			{"Name" : "CLASSIFIER_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_fu_924", "Port" : "CLASSIFIER_WEIGHT_V", "Inst_start_state" : "93", "Inst_end_state" : "94"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_102_3_VITIS_LOOP_103_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_117_6_VITIS_LOOP_118_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state31"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state32"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_137_9_VITIS_LOOP_138_10", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state32", "LastState" : ["ap_ST_fsm_state55"], "QuitState" : ["ap_ST_fsm_state32"], "PreState" : ["ap_ST_fsm_state8"], "PostState" : ["ap_ST_fsm_state56"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_157_12_VITIS_LOOP_158_13", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state56", "LastState" : ["ap_ST_fsm_state60"], "QuitState" : ["ap_ST_fsm_state56"], "PreState" : ["ap_ST_fsm_state32"], "PostState" : ["ap_ST_fsm_state61"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_186_18", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state62", "LastState" : ["ap_ST_fsm_state65"], "QuitState" : ["ap_ST_fsm_state62"], "PreState" : ["ap_ST_fsm_state61"], "PostState" : ["ap_ST_fsm_state66"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_197_20", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state66", "LastState" : ["ap_ST_fsm_state69"], "QuitState" : ["ap_ST_fsm_state66"], "PreState" : ["ap_ST_fsm_state62"], "PostState" : ["ap_ST_fsm_state70"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_221_24_VITIS_LOOP_222_25", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state70", "LastState" : ["ap_ST_fsm_state76"], "QuitState" : ["ap_ST_fsm_state70"], "PreState" : ["ap_ST_fsm_state66"], "PostState" : ["ap_ST_fsm_state77"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_244_27_VITIS_LOOP_245_28", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state78", "LastState" : ["ap_ST_fsm_state82"], "QuitState" : ["ap_ST_fsm_state78"], "PreState" : ["ap_ST_fsm_state77"], "PostState" : ["ap_ST_fsm_state83"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_258_30_VITIS_LOOP_259_31", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state83", "LastState" : ["ap_ST_fsm_state87"], "QuitState" : ["ap_ST_fsm_state83"], "PreState" : ["ap_ST_fsm_state78"], "PostState" : ["ap_ST_fsm_state88"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_296_35", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "100", "FirstState" : "ap_ST_fsm_state93", "LastState" : ["ap_ST_fsm_state96"], "QuitState" : ["ap_ST_fsm_state93"], "PreState" : ["ap_ST_fsm_state92"], "PostState" : ["ap_ST_fsm_state97"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.INPUT_PROJECTION_BIAS_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.POSITION_EMBEDDING_V_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_BIAS_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_NORM1_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_NORM1_BIAS_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_0_BIAS_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_BIAS_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_NORM2_WEIGHT_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_NORM2_BIAS_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_fp_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.embedded_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_value_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_sum_arr_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attention_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual1_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm1_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.feedforward_hidden_V_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual2_V_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm2_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_V_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.normalized_output_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_93_1_VITIS_LOOP_94_2_fu_776", "Parent" : "0", "Child" : ["26"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_93_1_VITIS_LOOP_94_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "776", "EstimateLatencyMax" : "776",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "input_fp_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_93_1_VITIS_LOOP_94_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_93_1_VITIS_LOOP_94_2_fu_776.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5_fu_784", "Parent" : "0", "Child" : ["28", "29", "30"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "101", "EstimateLatencyMax" : "101",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln104", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln837_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_fp_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln813_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln813", "Type" : "None", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_105_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5_fu_784.INPUT_PROJECTION_WEIGHT_V_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5_fu_784.mul_mul_15s_20s_35_4_1_U4", "Parent" : "27"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5_fu_784.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8_fu_798", "Parent" : "0", "Child" : ["32", "33", "34"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln122", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_sum_V_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_120_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8_fu_798.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8_fu_798.mul_mul_13s_20s_33_4_1_U15", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8_fu_798.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11_fu_808", "Parent" : "0", "Child" : ["36", "37", "38"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln142", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_V_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_140_11", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11_fu_808.LAYERS_0_ATTENTION_KEY_WEIGHT_V_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11_fu_808.mul_mul_15s_20s_35_4_1_U22", "Parent" : "35"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11_fu_808.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_s_fu_818", "Parent" : "0", "Child" : ["40", "41"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8195", "EstimateLatencyMax" : "8195",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_175_17", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_s_fu_818.mul_22s_22s_44_1_1_U34", "Parent" : "39"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_s_fu_818.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14_fu_825", "Parent" : "0", "Child" : ["43", "44", "45"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln162", "Type" : "None", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_sum_V_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_160_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14_fu_825.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14_fu_825.mul_mul_15s_20s_35_4_1_U28", "Parent" : "42"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14_fu_825.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_19_fu_835", "Parent" : "0", "Child" : ["47"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_188_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "26",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln186", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_60_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_188_19", "PipelineType" : "NotSupport"}]},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_19_fu_835.flow_control_loop_pipe_sequential_init_U", "Parent" : "46"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_199_21_fu_842", "Parent" : "0", "Child" : ["49", "50"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_199_21",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_arr_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "denominator_V_5_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_199_21", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_199_21_fu_842.mul_22s_22s_44_1_1_U42", "Parent" : "48"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_199_21_fu_842.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23_fu_850", "Parent" : "0", "Child" : ["52", "53", "54"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1079", "EstimateLatencyMax" : "1079",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "conv_i2289", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_207_22_VITIS_LOOP_209_23", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23_fu_850.mul_22s_28s_50_3_1_U47", "Parent" : "51"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23_fu_850.sdiv_44ns_28ns_44_48_1_U48", "Parent" : "51"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23_fu_850.flow_control_loop_pipe_sequential_init_U", "Parent" : "51"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859", "Parent" : "0", "Child" : ["56", "58", "61", "65", "66", "67", "68"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1985", "EstimateLatencyMax" : "1985",
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
					{"ID" : "58", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204", "Port" : "input_r", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "61", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "input_r", "Inst_start_state" : "57", "Inst_end_state" : "58"},
					{"ID" : "56", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "output_r", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "weight", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "weight", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bias", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "bias", "Inst_start_state" : "57", "Inst_end_state" : "58"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state58"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196", "Parent" : "55", "Child" : ["57"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50", "EstimateLatencyMax" : "50",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_V_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_16_2", "PipelineType" : "NotSupport"}]},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196.flow_control_loop_pipe_sequential_init_U", "Parent" : "56"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204", "Parent" : "55", "Child" : ["59", "60"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "variance_V_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_23_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204.mul_20s_20s_40_1_1_U67", "Parent" : "58"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204.flow_control_loop_pipe_sequential_init_U", "Parent" : "58"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Parent" : "55", "Child" : ["62", "63", "64"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "75", "EstimateLatencyMax" : "75",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv7_i344", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bias", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_35_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.mul_mul_16s_16s_32_4_1_U73", "Parent" : "61"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.mul_mul_20s_16s_36_4_1_U74", "Parent" : "61"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.flow_control_loop_pipe_sequential_init_U", "Parent" : "61"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.fadd_32ns_32ns_32_5_full_dsp_1_U84", "Parent" : "55"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.fdiv_32ns_32ns_32_16_no_dsp_1_U85", "Parent" : "55"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.fpext_32ns_64_2_no_dsp_1_U86", "Parent" : "55"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_859.fsqrt_32ns_32ns_32_16_no_dsp_1_U87", "Parent" : "55"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26_fu_871", "Parent" : "0", "Child" : ["70", "71", "72"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln223", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_62_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_224_26", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26_fu_871.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26_fu_871.mul_mul_14s_20s_34_4_1_U56", "Parent" : "69"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26_fu_871.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29_fu_882", "Parent" : "0", "Child" : ["74", "75", "76"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln246", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_65_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_247_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29_fu_882.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_U", "Parent" : "73"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29_fu_882.mul_mul_15s_20s_35_4_1_U95", "Parent" : "73"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29_fu_882.flow_control_loop_pipe_sequential_init_U", "Parent" : "73"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32_fu_893", "Parent" : "0", "Child" : ["78", "79", "80"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "133", "EstimateLatencyMax" : "133",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln260", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual2_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "add_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "feedforward_hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln813_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "lhs_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_261_32", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32_fu_893.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32_fu_893.mul_mul_14s_19ns_33_4_1_U102", "Parent" : "77"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32_fu_893.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_279_33_VITIS_LOOP_281_34_fu_908", "Parent" : "0", "Child" : ["82"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_279_33_VITIS_LOOP_281_34",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "515", "EstimateLatencyMax" : "515",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "norm2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pooled_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_279_33_VITIS_LOOP_281_34", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_279_33_VITIS_LOOP_281_34_fu_908.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914", "Parent" : "0", "Child" : ["84", "86", "89", "95", "96", "97"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "229", "EstimateLatencyMax" : "229",
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
					{"ID" : "89", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "input_r", "Inst_start_state" : "54", "Inst_end_state" : "55"},
					{"ID" : "86", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183", "Port" : "input_r", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "84", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "output_r", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "OUTPUT_NORM_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "OUTPUT_NORM_WEIGHT_V", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "OUTPUT_NORM_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "OUTPUT_NORM_BIAS_V", "Inst_start_state" : "54", "Inst_end_state" : "55"}]}]},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176", "Parent" : "83", "Child" : ["85"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_V_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_56_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176.flow_control_loop_pipe_sequential_init_U", "Parent" : "84"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183", "Parent" : "83", "Child" : ["87", "88"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "variance_V_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_63_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183.mul_20s_20s_40_1_1_U118", "Parent" : "86"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183.flow_control_loop_pipe_sequential_init_U", "Parent" : "86"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Parent" : "83", "Child" : ["90", "91", "92", "93", "94"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "75", "EstimateLatencyMax" : "75",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv7_i340", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "OUTPUT_NORM_WEIGHT_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "OUTPUT_NORM_BIAS_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_75_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.OUTPUT_NORM_WEIGHT_V_U", "Parent" : "89"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.OUTPUT_NORM_BIAS_V_U", "Parent" : "89"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.mul_mul_16s_16s_32_4_1_U122", "Parent" : "89"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.mul_mul_20s_15ns_35_4_1_U123", "Parent" : "89"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.flow_control_loop_pipe_sequential_init_U", "Parent" : "89"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.fadd_32ns_32ns_32_5_full_dsp_1_U131", "Parent" : "83"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.fdiv_32ns_32ns_32_16_no_dsp_1_U132", "Parent" : "83"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_914.fsqrt_32ns_32ns_32_16_no_dsp_1_U134", "Parent" : "83"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_fu_924", "Parent" : "0", "Child" : ["99", "100", "101"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln297", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_V_73_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "CLASSIFIER_WEIGHT_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_298_36", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_fu_924.CLASSIFIER_WEIGHT_V_U", "Parent" : "98"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_fu_924.mul_mul_15s_20s_35_4_1_U137", "Parent" : "98"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36_fu_924.flow_control_loop_pipe_sequential_init_U", "Parent" : "98"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U143", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_10_full_dsp_1_U144", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer {
		input_r {Type I LastRead 1 FirstWrite -1}
		logits {Type O LastRead -1 FirstWrite 22}
		INPUT_PROJECTION_BIAS_V {Type I LastRead -1 FirstWrite -1}
		POSITION_EMBEDDING_V_0 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_NORM1_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_NORM1_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_NORM2_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_NORM2_BIAS_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}
		CLASSIFIER_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_93_1_VITIS_LOOP_94_2 {
		input_r {Type I LastRead 1 FirstWrite -1}
		input_fp_V {Type O LastRead -1 FirstWrite 10}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_105_5 {
		sext_ln104 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type O LastRead -1 FirstWrite 7}
		add_ln837 {Type I LastRead 0 FirstWrite -1}
		sub_ln837_1 {Type I LastRead 0 FirstWrite -1}
		sub_ln837 {Type I LastRead 0 FirstWrite -1}
		input_fp_V {Type I LastRead 0 FirstWrite -1}
		sext_ln813_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln813 {Type I LastRead 0 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_120_8 {
		zext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln122 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type I LastRead 0 FirstWrite -1}
		query_sum_V_4_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_140_11 {
		zext_ln837_6 {Type I LastRead 0 FirstWrite -1}
		zext_ln142 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type I LastRead 0 FirstWrite -1}
		key_sum_V_4_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_172_15_VITIS_LOOP_173_16_VITIS_LOOP_s {
		key_value_V {Type O LastRead -1 FirstWrite 6}
		key_V {Type I LastRead 2 FirstWrite -1}
		value_V {Type I LastRead 2 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_160_14 {
		zext_ln837_7 {Type I LastRead 0 FirstWrite -1}
		zext_ln162 {Type I LastRead 0 FirstWrite -1}
		embedded_V {Type I LastRead 0 FirstWrite -1}
		value_sum_V_4_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_188_19 {
		zext_ln186 {Type I LastRead 0 FirstWrite -1}
		key_V {Type I LastRead 0 FirstWrite -1}
		sum_V_60_out {Type O LastRead -1 FirstWrite 0}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_199_21 {
		zext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		query_V {Type I LastRead 0 FirstWrite -1}
		key_sum_arr_V {Type I LastRead 0 FirstWrite -1}
		denominator_V_5_out {Type O LastRead -1 FirstWrite 0}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_207_22_VITIS_LOOP_209_23 {
		zext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		attention_V {Type O LastRead -1 FirstWrite 57}
		query_V {Type I LastRead 1 FirstWrite -1}
		key_value_V {Type I LastRead 1 FirstWrite -1}
		conv_i2289 {Type I LastRead 0 FirstWrite -1}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s {
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		weight {Type I LastRead 4 FirstWrite -1}
		bias {Type I LastRead 8 FirstWrite -1}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2 {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		mean_V_3_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1 {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		variance_V_4_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		conv7_i344 {Type I LastRead 0 FirstWrite -1}
		weight {Type I LastRead 4 FirstWrite -1}
		bias {Type I LastRead 8 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_224_26 {
		sext_ln223 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_12 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_11 {Type I LastRead 0 FirstWrite -1}
		attention_V {Type I LastRead 0 FirstWrite -1}
		sum_V_62_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_247_29 {
		sext_ln246 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_14 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_13 {Type I LastRead 0 FirstWrite -1}
		norm1 {Type I LastRead 0 FirstWrite -1}
		sum_V_65_out {Type O LastRead -1 FirstWrite 2}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_261_32 {
		sext_ln260 {Type I LastRead 0 FirstWrite -1}
		residual2_V {Type O LastRead -1 FirstWrite 7}
		add_ln837_14 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_17 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_16 {Type I LastRead 0 FirstWrite -1}
		feedforward_hidden_V {Type I LastRead 0 FirstWrite -1}
		sext_ln813_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_28 {Type I LastRead 0 FirstWrite -1}
		lhs_20 {Type I LastRead 0 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_279_33_VITIS_LOOP_281_34 {
		norm2 {Type I LastRead 1 FirstWrite -1}
		pooled_V {Type O LastRead -1 FirstWrite 5}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s {
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2 {
		input_r {Type I LastRead 0 FirstWrite -1}
		mean_V_6_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1 {
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		variance_V_8_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO {
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		conv7_i340 {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_298_36 {
		select_ln297 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_19 {Type I LastRead 0 FirstWrite -1}
		normalized_output {Type I LastRead 0 FirstWrite -1}
		sum_V_73_out {Type O LastRead -1 FirstWrite 2}
		CLASSIFIER_WEIGHT_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "115939", "Max" : "115939"}
	, {"Name" : "Interval", "Min" : "115940", "Max" : "115940"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 8 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 32 } } }
	logits { ap_memory {  { logits_address0 mem_address 1 1 }  { logits_ce0 mem_ce 1 1 }  { logits_we0 mem_we 1 1 }  { logits_d0 mem_din 1 32 }  { logits_address1 MemPortADDR2 1 1 }  { logits_ce1 MemPortCE2 1 1 }  { logits_we1 MemPortWE2 1 1 }  { logits_d1 MemPortDIN2 1 32 } } }
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
