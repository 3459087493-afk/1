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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "18", "70", "171", "181", "183", "186", "221", "240", "294", "329", "396", "398", "413", "428", "429"],
		"CDFG" : "unsw_linear_transformer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5210", "EstimateLatencyMax" : "5210",
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
					{"ID" : "16", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_87_1_VITIS_LOOP_88_2_fu_993", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "logits", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "INPUT_PROJECTION_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_BIAS_V", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_4", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_5", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_6", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_7", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_8", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_9", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_10", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_11", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_12", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_13", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_14", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_15", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_16", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_17", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_18", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_19", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_20", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_21", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_22", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "INPUT_PROJECTION_WEIGHT_V_23", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "POSITION_EMBEDDING_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Port" : "POSITION_EMBEDDING_V_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_8", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_9", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_10", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_11", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_12", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_13", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_14", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_15", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_BIAS_V", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "186", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15", "Inst_start_state" : "11", "Inst_end_state" : "23"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_BIAS_V", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "294", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_BIAS_V", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "329", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "OUTPUT_NORM_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "398", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470", "Port" : "OUTPUT_NORM_WEIGHT_V", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "OUTPUT_NORM_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "398", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470", "Port" : "OUTPUT_NORM_BIAS_V", "Inst_start_state" : "34", "Inst_end_state" : "35"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_165_14", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "49", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_fp_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.embedded_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_value_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_sum_arr_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attention_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual1_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.feedforward_hidden_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual2_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm2_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.normalized_output_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_87_1_VITIS_LOOP_88_2_fu_993", "Parent" : "0", "Child" : ["17"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_87_1_VITIS_LOOP_88_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "202", "EstimateLatencyMax" : "202",
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
			{"Name" : "VITIS_LOOP_87_1_VITIS_LOOP_88_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_87_1_VITIS_LOOP_88_2_fu_993.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001", "Parent" : "0", "Child" : ["19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "295", "EstimateLatencyMax" : "295",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_fp_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "INPUT_PROJECTION_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_V_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "POSITION_EMBEDDING_V_0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_3_VITIS_LOOP_96_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter19", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter19", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_BIAS_V_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_0_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_1_U", "Parent" : "18"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_2_U", "Parent" : "18"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_3_U", "Parent" : "18"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_4_U", "Parent" : "18"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_5_U", "Parent" : "18"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_6_U", "Parent" : "18"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_7_U", "Parent" : "18"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_8_U", "Parent" : "18"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_9_U", "Parent" : "18"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_10_U", "Parent" : "18"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_11_U", "Parent" : "18"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_12_U", "Parent" : "18"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_13_U", "Parent" : "18"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_14_U", "Parent" : "18"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_15_U", "Parent" : "18"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_16_U", "Parent" : "18"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_17_U", "Parent" : "18"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_18_U", "Parent" : "18"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_19_U", "Parent" : "18"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_20_U", "Parent" : "18"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_21_U", "Parent" : "18"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_22_U", "Parent" : "18"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.INPUT_PROJECTION_WEIGHT_V_23_U", "Parent" : "18"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.POSITION_EMBEDDING_V_0_U", "Parent" : "18"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U4", "Parent" : "18"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U5", "Parent" : "18"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U6", "Parent" : "18"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U7", "Parent" : "18"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U8", "Parent" : "18"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U9", "Parent" : "18"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U10", "Parent" : "18"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_15s_20s_35_4_1_U11", "Parent" : "18"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_15s_20s_35_4_1_U12", "Parent" : "18"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U13", "Parent" : "18"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U14", "Parent" : "18"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U15", "Parent" : "18"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U16", "Parent" : "18"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U17", "Parent" : "18"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U18", "Parent" : "18"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_15s_20s_35_4_1_U19", "Parent" : "18"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U20", "Parent" : "18"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U21", "Parent" : "18"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U22", "Parent" : "18"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U23", "Parent" : "18"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U24", "Parent" : "18"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_14s_20s_34_4_1_U25", "Parent" : "18"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_13s_20s_33_4_1_U26", "Parent" : "18"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.mul_mul_15s_20s_35_4_1_U27", "Parent" : "18"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_fu_1001.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059", "Parent" : "0", "Child" : ["71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "174", "EstimateLatencyMax" : "174",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "value_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_111_6_VITIS_LOOP_112_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0_U", "Parent" : "70"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_0_U", "Parent" : "70"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0_U", "Parent" : "70"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1_U", "Parent" : "70"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_1_U", "Parent" : "70"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1_U", "Parent" : "70"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2_U", "Parent" : "70"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_2_U", "Parent" : "70"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2_U", "Parent" : "70"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3_U", "Parent" : "70"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_3_U", "Parent" : "70"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3_U", "Parent" : "70"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4_U", "Parent" : "70"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_4_U", "Parent" : "70"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4_U", "Parent" : "70"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5_U", "Parent" : "70"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_5_U", "Parent" : "70"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5_U", "Parent" : "70"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6_U", "Parent" : "70"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_6_U", "Parent" : "70"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6_U", "Parent" : "70"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7_U", "Parent" : "70"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_7_U", "Parent" : "70"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7_U", "Parent" : "70"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8_U", "Parent" : "70"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_8_U", "Parent" : "70"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8_U", "Parent" : "70"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9_U", "Parent" : "70"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_9_U", "Parent" : "70"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9_U", "Parent" : "70"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10_U", "Parent" : "70"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_10_U", "Parent" : "70"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10_U", "Parent" : "70"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11_U", "Parent" : "70"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_11_U", "Parent" : "70"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11_U", "Parent" : "70"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12_U", "Parent" : "70"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_12_U", "Parent" : "70"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12_U", "Parent" : "70"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13_U", "Parent" : "70"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_13_U", "Parent" : "70"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13_U", "Parent" : "70"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14_U", "Parent" : "70"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_14_U", "Parent" : "70"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14_U", "Parent" : "70"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15_U", "Parent" : "70"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_KEY_WEIGHT_V_15_U", "Parent" : "70"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15_U", "Parent" : "70"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.fpext_32ns_64_2_no_dsp_1_U60", "Parent" : "70"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.fexp_32ns_32ns_32_10_full_dsp_1_U61", "Parent" : "70"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.fexp_32ns_32ns_32_10_full_dsp_1_U62", "Parent" : "70"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U63", "Parent" : "70"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U64", "Parent" : "70"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U65", "Parent" : "70"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U66", "Parent" : "70"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U67", "Parent" : "70"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U68", "Parent" : "70"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U69", "Parent" : "70"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U70", "Parent" : "70"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U71", "Parent" : "70"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U72", "Parent" : "70"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U73", "Parent" : "70"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U74", "Parent" : "70"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U75", "Parent" : "70"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U76", "Parent" : "70"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U77", "Parent" : "70"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U78", "Parent" : "70"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_13s_20s_33_4_1_U79", "Parent" : "70"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U80", "Parent" : "70"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U81", "Parent" : "70"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U82", "Parent" : "70"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U83", "Parent" : "70"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U84", "Parent" : "70"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U85", "Parent" : "70"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U86", "Parent" : "70"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U87", "Parent" : "70"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U88", "Parent" : "70"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U89", "Parent" : "70"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U90", "Parent" : "70"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_15s_20s_35_4_1_U91", "Parent" : "70"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U92", "Parent" : "70"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U93", "Parent" : "70"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_15s_20s_35_4_1_U94", "Parent" : "70"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U95", "Parent" : "70"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U96", "Parent" : "70"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U97", "Parent" : "70"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_15s_20s_35_4_1_U98", "Parent" : "70"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U99", "Parent" : "70"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U100", "Parent" : "70"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U101", "Parent" : "70"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_13s_20s_33_4_1_U102", "Parent" : "70"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U103", "Parent" : "70"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U104", "Parent" : "70"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_12s_20s_32_4_1_U105", "Parent" : "70"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U106", "Parent" : "70"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U107", "Parent" : "70"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_11s_20s_31_4_1_U108", "Parent" : "70"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_13s_20s_33_4_1_U109", "Parent" : "70"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.mul_mul_14s_20s_34_4_1_U110", "Parent" : "70"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_fu_1059.flow_control_loop_pipe_sequential_init_U", "Parent" : "70"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163", "Parent" : "0", "Child" : ["172", "173", "174", "175", "176", "177", "178", "179", "180"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "271", "EstimateLatencyMax" : "271",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_142_9_VITIS_LOOP_143_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U166", "Parent" : "171"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U167", "Parent" : "171"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U168", "Parent" : "171"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U169", "Parent" : "171"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U170", "Parent" : "171"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U171", "Parent" : "171"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U172", "Parent" : "171"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.mul_22s_22s_44_1_1_U173", "Parent" : "171"},
	{"ID" : "180", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10_fu_1163.flow_control_loop_pipe_sequential_init_U", "Parent" : "171"},
	{"ID" : "181", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_12_fu_1170", "Parent" : "0", "Child" : ["182"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_155_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "23", "EstimateLatencyMax" : "23",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_arr_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_155_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_12_fu_1170.flow_control_loop_pipe_sequential_init_U", "Parent" : "181"},
	{"ID" : "183", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_15_fu_1176", "Parent" : "0", "Child" : ["184", "185"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_167_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "36", "EstimateLatencyMax" : "36",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_arr_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "denominator_V_5_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_167_15", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_15_fu_1176.mul_22s_22s_44_1_1_U180", "Parent" : "183"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_15_fu_1176.flow_control_loop_pipe_sequential_init_U", "Parent" : "183"},
	{"ID" : "186", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184", "Parent" : "0", "Child" : ["187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "157", "EstimateLatencyMax" : "157",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual1_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_187_18_VITIS_LOOP_188_19", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter28", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter28", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_BIAS_V_U", "Parent" : "186"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0_U", "Parent" : "186"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1_U", "Parent" : "186"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2_U", "Parent" : "186"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3_U", "Parent" : "186"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4_U", "Parent" : "186"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5_U", "Parent" : "186"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6_U", "Parent" : "186"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7_U", "Parent" : "186"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8_U", "Parent" : "186"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9_U", "Parent" : "186"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10_U", "Parent" : "186"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11_U", "Parent" : "186"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12_U", "Parent" : "186"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13_U", "Parent" : "186"},
	{"ID" : "202", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14_U", "Parent" : "186"},
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15_U", "Parent" : "186"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U224", "Parent" : "186"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U225", "Parent" : "186"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U226", "Parent" : "186"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U227", "Parent" : "186"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U228", "Parent" : "186"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U229", "Parent" : "186"},
	{"ID" : "210", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U230", "Parent" : "186"},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U231", "Parent" : "186"},
	{"ID" : "212", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U232", "Parent" : "186"},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U233", "Parent" : "186"},
	{"ID" : "214", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U234", "Parent" : "186"},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U235", "Parent" : "186"},
	{"ID" : "216", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U236", "Parent" : "186"},
	{"ID" : "217", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U237", "Parent" : "186"},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U238", "Parent" : "186"},
	{"ID" : "219", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.mul_mul_14s_20s_34_4_1_U239", "Parent" : "186"},
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19_fu_1184.flow_control_loop_pipe_sequential_init_U", "Parent" : "186"},
	{"ID" : "221", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225", "Parent" : "0", "Child" : ["222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "95", "EstimateLatencyMax" : "95",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln837_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv_i2287", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter78", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter78", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U185", "Parent" : "221"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U186", "Parent" : "221"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U187", "Parent" : "221"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U188", "Parent" : "221"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U189", "Parent" : "221"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U190", "Parent" : "221"},
	{"ID" : "228", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U191", "Parent" : "221"},
	{"ID" : "229", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U192", "Parent" : "221"},
	{"ID" : "230", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U193", "Parent" : "221"},
	{"ID" : "231", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U194", "Parent" : "221"},
	{"ID" : "232", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U195", "Parent" : "221"},
	{"ID" : "233", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U196", "Parent" : "221"},
	{"ID" : "234", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U197", "Parent" : "221"},
	{"ID" : "235", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U198", "Parent" : "221"},
	{"ID" : "236", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U199", "Parent" : "221"},
	{"ID" : "237", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.mul_22s_28s_50_3_1_U200", "Parent" : "221"},
	{"ID" : "238", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.sdiv_44ns_28ns_44_48_1_U201", "Parent" : "221"},
	{"ID" : "239", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16_fu_1225.flow_control_loop_pipe_sequential_init_U", "Parent" : "221"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249", "Parent" : "0", "Child" : ["241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "158", "EstimateLatencyMax" : "158",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"},
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
			{"Name" : "p_read31", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "241", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.fadd_32ns_32ns_32_5_full_dsp_1_U260", "Parent" : "240"},
	{"ID" : "242", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.fdiv_32ns_32ns_32_16_no_dsp_1_U261", "Parent" : "240"},
	{"ID" : "243", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.fpext_32ns_64_2_no_dsp_1_U262", "Parent" : "240"},
	{"ID" : "244", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.fsqrt_32ns_32ns_32_16_no_dsp_1_U263", "Parent" : "240"},
	{"ID" : "245", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U264", "Parent" : "240"},
	{"ID" : "246", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U265", "Parent" : "240"},
	{"ID" : "247", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U266", "Parent" : "240"},
	{"ID" : "248", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U267", "Parent" : "240"},
	{"ID" : "249", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U268", "Parent" : "240"},
	{"ID" : "250", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U269", "Parent" : "240"},
	{"ID" : "251", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U270", "Parent" : "240"},
	{"ID" : "252", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U271", "Parent" : "240"},
	{"ID" : "253", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U272", "Parent" : "240"},
	{"ID" : "254", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U273", "Parent" : "240"},
	{"ID" : "255", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U274", "Parent" : "240"},
	{"ID" : "256", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U275", "Parent" : "240"},
	{"ID" : "257", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U276", "Parent" : "240"},
	{"ID" : "258", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U277", "Parent" : "240"},
	{"ID" : "259", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U278", "Parent" : "240"},
	{"ID" : "260", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_20s_20s_40_1_1_U279", "Parent" : "240"},
	{"ID" : "261", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U280", "Parent" : "240"},
	{"ID" : "262", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U281", "Parent" : "240"},
	{"ID" : "263", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U282", "Parent" : "240"},
	{"ID" : "264", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U283", "Parent" : "240"},
	{"ID" : "265", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U284", "Parent" : "240"},
	{"ID" : "266", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U285", "Parent" : "240"},
	{"ID" : "267", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U286", "Parent" : "240"},
	{"ID" : "268", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U287", "Parent" : "240"},
	{"ID" : "269", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U288", "Parent" : "240"},
	{"ID" : "270", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U289", "Parent" : "240"},
	{"ID" : "271", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U290", "Parent" : "240"},
	{"ID" : "272", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U291", "Parent" : "240"},
	{"ID" : "273", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U292", "Parent" : "240"},
	{"ID" : "274", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U293", "Parent" : "240"},
	{"ID" : "275", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U294", "Parent" : "240"},
	{"ID" : "276", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_16s_16s_32_4_1_U295", "Parent" : "240"},
	{"ID" : "277", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_15ns_35_4_1_U296", "Parent" : "240"},
	{"ID" : "278", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U297", "Parent" : "240"},
	{"ID" : "279", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U298", "Parent" : "240"},
	{"ID" : "280", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U299", "Parent" : "240"},
	{"ID" : "281", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U300", "Parent" : "240"},
	{"ID" : "282", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_15ns_35_4_1_U301", "Parent" : "240"},
	{"ID" : "283", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U302", "Parent" : "240"},
	{"ID" : "284", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U303", "Parent" : "240"},
	{"ID" : "285", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U304", "Parent" : "240"},
	{"ID" : "286", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_15ns_35_4_1_U305", "Parent" : "240"},
	{"ID" : "287", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U306", "Parent" : "240"},
	{"ID" : "288", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U307", "Parent" : "240"},
	{"ID" : "289", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_13s_33_4_1_U308", "Parent" : "240"},
	{"ID" : "290", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U309", "Parent" : "240"},
	{"ID" : "291", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_15ns_35_4_1_U310", "Parent" : "240"},
	{"ID" : "292", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.mul_mul_20s_14ns_34_4_1_U311", "Parent" : "240"},
	{"ID" : "293", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1249.flow_control_loop_pipe_sequential_init_U", "Parent" : "240"},
	{"ID" : "294", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351", "Parent" : "0", "Child" : ["295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2068", "EstimateLatencyMax" : "2068",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "feedforward_hidden_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_209_21_VITIS_LOOP_210_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "295", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_BIAS_V_U", "Parent" : "294"},
	{"ID" : "296", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0_U", "Parent" : "294"},
	{"ID" : "297", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1_U", "Parent" : "294"},
	{"ID" : "298", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2_U", "Parent" : "294"},
	{"ID" : "299", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3_U", "Parent" : "294"},
	{"ID" : "300", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4_U", "Parent" : "294"},
	{"ID" : "301", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5_U", "Parent" : "294"},
	{"ID" : "302", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6_U", "Parent" : "294"},
	{"ID" : "303", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7_U", "Parent" : "294"},
	{"ID" : "304", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8_U", "Parent" : "294"},
	{"ID" : "305", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9_U", "Parent" : "294"},
	{"ID" : "306", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10_U", "Parent" : "294"},
	{"ID" : "307", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11_U", "Parent" : "294"},
	{"ID" : "308", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12_U", "Parent" : "294"},
	{"ID" : "309", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13_U", "Parent" : "294"},
	{"ID" : "310", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14_U", "Parent" : "294"},
	{"ID" : "311", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15_U", "Parent" : "294"},
	{"ID" : "312", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U354", "Parent" : "294"},
	{"ID" : "313", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U355", "Parent" : "294"},
	{"ID" : "314", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U356", "Parent" : "294"},
	{"ID" : "315", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U357", "Parent" : "294"},
	{"ID" : "316", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U358", "Parent" : "294"},
	{"ID" : "317", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_15s_20s_35_4_1_U359", "Parent" : "294"},
	{"ID" : "318", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U360", "Parent" : "294"},
	{"ID" : "319", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U361", "Parent" : "294"},
	{"ID" : "320", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U362", "Parent" : "294"},
	{"ID" : "321", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U363", "Parent" : "294"},
	{"ID" : "322", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U364", "Parent" : "294"},
	{"ID" : "323", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U365", "Parent" : "294"},
	{"ID" : "324", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U366", "Parent" : "294"},
	{"ID" : "325", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U367", "Parent" : "294"},
	{"ID" : "326", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U368", "Parent" : "294"},
	{"ID" : "327", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.mul_mul_14s_20s_34_4_1_U369", "Parent" : "294"},
	{"ID" : "328", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22_fu_1351.flow_control_loop_pipe_sequential_init_U", "Parent" : "294"},
	{"ID" : "329", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391", "Parent" : "0", "Child" : ["330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369", "370", "371", "372", "373", "374", "375", "376", "377", "378", "379", "380", "381", "382", "383", "384", "385", "386", "387", "388", "389", "390", "391", "392", "393", "394", "395"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "304", "EstimateLatencyMax" : "304",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "feedforward_hidden_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual2_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_222_24_VITIS_LOOP_223_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter24", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter24", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "330", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_BIAS_V_U", "Parent" : "329"},
	{"ID" : "331", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0_U", "Parent" : "329"},
	{"ID" : "332", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1_U", "Parent" : "329"},
	{"ID" : "333", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2_U", "Parent" : "329"},
	{"ID" : "334", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3_U", "Parent" : "329"},
	{"ID" : "335", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4_U", "Parent" : "329"},
	{"ID" : "336", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5_U", "Parent" : "329"},
	{"ID" : "337", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6_U", "Parent" : "329"},
	{"ID" : "338", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7_U", "Parent" : "329"},
	{"ID" : "339", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8_U", "Parent" : "329"},
	{"ID" : "340", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9_U", "Parent" : "329"},
	{"ID" : "341", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10_U", "Parent" : "329"},
	{"ID" : "342", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11_U", "Parent" : "329"},
	{"ID" : "343", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12_U", "Parent" : "329"},
	{"ID" : "344", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13_U", "Parent" : "329"},
	{"ID" : "345", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14_U", "Parent" : "329"},
	{"ID" : "346", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15_U", "Parent" : "329"},
	{"ID" : "347", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16_U", "Parent" : "329"},
	{"ID" : "348", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17_U", "Parent" : "329"},
	{"ID" : "349", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18_U", "Parent" : "329"},
	{"ID" : "350", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19_U", "Parent" : "329"},
	{"ID" : "351", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20_U", "Parent" : "329"},
	{"ID" : "352", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21_U", "Parent" : "329"},
	{"ID" : "353", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22_U", "Parent" : "329"},
	{"ID" : "354", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23_U", "Parent" : "329"},
	{"ID" : "355", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24_U", "Parent" : "329"},
	{"ID" : "356", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25_U", "Parent" : "329"},
	{"ID" : "357", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26_U", "Parent" : "329"},
	{"ID" : "358", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27_U", "Parent" : "329"},
	{"ID" : "359", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28_U", "Parent" : "329"},
	{"ID" : "360", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29_U", "Parent" : "329"},
	{"ID" : "361", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30_U", "Parent" : "329"},
	{"ID" : "362", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31_U", "Parent" : "329"},
	{"ID" : "363", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U389", "Parent" : "329"},
	{"ID" : "364", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U390", "Parent" : "329"},
	{"ID" : "365", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U391", "Parent" : "329"},
	{"ID" : "366", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U392", "Parent" : "329"},
	{"ID" : "367", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U393", "Parent" : "329"},
	{"ID" : "368", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U394", "Parent" : "329"},
	{"ID" : "369", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U395", "Parent" : "329"},
	{"ID" : "370", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U396", "Parent" : "329"},
	{"ID" : "371", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U397", "Parent" : "329"},
	{"ID" : "372", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U398", "Parent" : "329"},
	{"ID" : "373", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U399", "Parent" : "329"},
	{"ID" : "374", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U400", "Parent" : "329"},
	{"ID" : "375", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U401", "Parent" : "329"},
	{"ID" : "376", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U402", "Parent" : "329"},
	{"ID" : "377", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U403", "Parent" : "329"},
	{"ID" : "378", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U404", "Parent" : "329"},
	{"ID" : "379", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U405", "Parent" : "329"},
	{"ID" : "380", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U406", "Parent" : "329"},
	{"ID" : "381", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U407", "Parent" : "329"},
	{"ID" : "382", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U408", "Parent" : "329"},
	{"ID" : "383", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U409", "Parent" : "329"},
	{"ID" : "384", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U410", "Parent" : "329"},
	{"ID" : "385", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U411", "Parent" : "329"},
	{"ID" : "386", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U412", "Parent" : "329"},
	{"ID" : "387", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U413", "Parent" : "329"},
	{"ID" : "388", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U414", "Parent" : "329"},
	{"ID" : "389", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U415", "Parent" : "329"},
	{"ID" : "390", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U416", "Parent" : "329"},
	{"ID" : "391", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U417", "Parent" : "329"},
	{"ID" : "392", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U418", "Parent" : "329"},
	{"ID" : "393", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_14s_19ns_33_4_1_U419", "Parent" : "329"},
	{"ID" : "394", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.mul_mul_13s_19ns_32_4_1_U420", "Parent" : "329"},
	{"ID" : "395", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_fu_1391.flow_control_loop_pipe_sequential_init_U", "Parent" : "329"},
	{"ID" : "396", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_242_27_fu_1464", "Parent" : "0", "Child" : ["397"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_242_27",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "69", "EstimateLatencyMax" : "69",
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
			{"Name" : "VITIS_LOOP_242_27", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "397", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_242_27_fu_1464.flow_control_loop_pipe_sequential_init_U", "Parent" : "396"},
	{"ID" : "398", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470", "Parent" : "0", "Child" : ["399", "401", "404", "410", "411", "412"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "122", "EstimateLatencyMax" : "122",
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
					{"ID" : "401", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183", "Port" : "input_r", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "399", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "404", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "input_r", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "404", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "output_r", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "OUTPUT_NORM_WEIGHT_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "404", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "OUTPUT_NORM_WEIGHT_V", "Inst_start_state" : "54", "Inst_end_state" : "55"}]},
			{"Name" : "OUTPUT_NORM_BIAS_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "404", "SubInstance" : "grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Port" : "OUTPUT_NORM_BIAS_V", "Inst_start_state" : "54", "Inst_end_state" : "55"}]}]},
	{"ID" : "399", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176", "Parent" : "398", "Child" : ["400"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2",
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
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_V_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_53_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "400", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_176.flow_control_loop_pipe_sequential_init_U", "Parent" : "399"},
	{"ID" : "401", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183", "Parent" : "398", "Child" : ["402", "403"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1",
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
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "variance_V_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_59_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "402", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183.mul_20s_20s_40_1_1_U463", "Parent" : "401"},
	{"ID" : "403", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_183.flow_control_loop_pipe_sequential_init_U", "Parent" : "401"},
	{"ID" : "404", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191", "Parent" : "398", "Child" : ["405", "406", "407", "408", "409"],
		"CDFG" : "layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "29", "EstimateLatencyMax" : "29",
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
			{"Name" : "VITIS_LOOP_70_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "405", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.OUTPUT_NORM_WEIGHT_V_U", "Parent" : "404"},
	{"ID" : "406", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.OUTPUT_NORM_BIAS_V_U", "Parent" : "404"},
	{"ID" : "407", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.mul_mul_16s_16s_32_4_1_U467", "Parent" : "404"},
	{"ID" : "408", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.mul_mul_20s_15ns_35_4_1_U468", "Parent" : "404"},
	{"ID" : "409", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_191.flow_control_loop_pipe_sequential_init_U", "Parent" : "404"},
	{"ID" : "410", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.fadd_32ns_32ns_32_5_full_dsp_1_U475", "Parent" : "398"},
	{"ID" : "411", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.fdiv_32ns_32ns_32_16_no_dsp_1_U476", "Parent" : "398"},
	{"ID" : "412", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s_fu_1470.fsqrt_32ns_32ns_32_16_no_dsp_1_U478", "Parent" : "398"},
	{"ID" : "413", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480", "Parent" : "0", "Child" : ["414", "415", "416", "417", "418", "419", "420", "421", "422", "423", "424", "425", "426", "427"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28", "EstimateLatencyMax" : "28",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln837_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_221", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_303", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_222", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_311", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_223", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_321", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln837_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln258", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_Val2_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_Val2_14_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_258_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "414", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_13s_20s_33_4_1_U481", "Parent" : "413"},
	{"ID" : "415", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_13s_20s_33_4_1_U482", "Parent" : "413"},
	{"ID" : "416", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U483", "Parent" : "413"},
	{"ID" : "417", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_12s_20s_32_4_1_U484", "Parent" : "413"},
	{"ID" : "418", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_15s_20s_35_4_1_U485", "Parent" : "413"},
	{"ID" : "419", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U486", "Parent" : "413"},
	{"ID" : "420", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U487", "Parent" : "413"},
	{"ID" : "421", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_15s_20s_35_4_1_U488", "Parent" : "413"},
	{"ID" : "422", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U489", "Parent" : "413"},
	{"ID" : "423", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U490", "Parent" : "413"},
	{"ID" : "424", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_13s_20s_33_4_1_U491", "Parent" : "413"},
	{"ID" : "425", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U492", "Parent" : "413"},
	{"ID" : "426", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.mul_mul_14s_20s_34_4_1_U493", "Parent" : "413"},
	{"ID" : "427", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29_fu_1480.flow_control_loop_pipe_sequential_init_U", "Parent" : "413"},
	{"ID" : "428", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_12s_32_4_1_U518", "Parent" : "0"},
	{"ID" : "429", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U519", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer {
		input_r {Type I LastRead 1 FirstWrite -1}
		logits {Type O LastRead -1 FirstWrite 37}
		INPUT_PROJECTION_BIAS_V {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_16 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_17 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_18 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_19 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_20 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_21 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_22 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_23 {Type I LastRead -1 FirstWrite -1}
		POSITION_EMBEDDING_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31 {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_87_1_VITIS_LOOP_88_2 {
		input_r {Type I LastRead 1 FirstWrite -1}
		input_fp_V {Type O LastRead -1 FirstWrite 9}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4 {
		input_fp_V {Type I LastRead 3 FirstWrite -1}
		embedded_V {Type O LastRead -1 FirstWrite 39}
		INPUT_PROJECTION_BIAS_V {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_16 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_17 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_18 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_19 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_20 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_21 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_22 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_V_23 {Type I LastRead -1 FirstWrite -1}
		POSITION_EMBEDDING_V_0 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7 {
		embedded_V {Type I LastRead 1 FirstWrite -1}
		query_V {Type O LastRead -1 FirstWrite 45}
		key_V {Type O LastRead -1 FirstWrite 45}
		value_V {Type O LastRead -1 FirstWrite 26}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_142_9_VITIS_LOOP_143_10 {
		key_V {Type I LastRead 2 FirstWrite -1}
		value_V {Type I LastRead 2 FirstWrite -1}
		key_value_V {Type O LastRead -1 FirstWrite 14}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_155_12 {
		key_V {Type I LastRead 1 FirstWrite -1}
		key_sum_arr_V {Type O LastRead -1 FirstWrite 6}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_167_15 {
		zext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		query_V {Type I LastRead 0 FirstWrite -1}
		key_sum_arr_V {Type I LastRead 0 FirstWrite -1}
		denominator_V_5_out {Type O LastRead -1 FirstWrite 2}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_187_18_VITIS_LOOP_188_19 {
		attention_V {Type I LastRead 1 FirstWrite -1}
		embedded_V {Type I LastRead 1 FirstWrite -1}
		residual1_V {Type O LastRead -1 FirstWrite 28}
		LAYERS_0_ATTENTION_OUTPUT_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16 {
		key_value_V {Type I LastRead 1 FirstWrite -1}
		zext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		attention_V {Type O LastRead -1 FirstWrite 78}
		sext_ln837_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln174 {Type I LastRead 0 FirstWrite -1}
		conv_i2287 {Type I LastRead 0 FirstWrite -1}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s {
		input_r {Type I LastRead 8 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 93}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		p_read9 {Type I LastRead 0 FirstWrite -1}
		p_read10 {Type I LastRead 0 FirstWrite -1}
		p_read11 {Type I LastRead 0 FirstWrite -1}
		p_read12 {Type I LastRead 0 FirstWrite -1}
		p_read13 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read15 {Type I LastRead 0 FirstWrite -1}
		p_read16 {Type I LastRead 0 FirstWrite -1}
		p_read17 {Type I LastRead 0 FirstWrite -1}
		p_read18 {Type I LastRead 0 FirstWrite -1}
		p_read19 {Type I LastRead 0 FirstWrite -1}
		p_read20 {Type I LastRead 0 FirstWrite -1}
		p_read21 {Type I LastRead 0 FirstWrite -1}
		p_read22 {Type I LastRead 0 FirstWrite -1}
		p_read23 {Type I LastRead 0 FirstWrite -1}
		p_read24 {Type I LastRead 0 FirstWrite -1}
		p_read25 {Type I LastRead 0 FirstWrite -1}
		p_read26 {Type I LastRead 0 FirstWrite -1}
		p_read27 {Type I LastRead 0 FirstWrite -1}
		p_read28 {Type I LastRead 0 FirstWrite -1}
		p_read29 {Type I LastRead 0 FirstWrite -1}
		p_read30 {Type I LastRead 0 FirstWrite -1}
		p_read31 {Type I LastRead 0 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_209_21_VITIS_LOOP_210_22 {
		norm1 {Type I LastRead 8 FirstWrite -1}
		feedforward_hidden_V {Type O LastRead -1 FirstWrite 26}
		LAYERS_0_FEEDFORWARD_0_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25 {
		feedforward_hidden_V {Type I LastRead 2 FirstWrite -1}
		norm1 {Type I LastRead 45 FirstWrite -1}
		residual2_V {Type O LastRead -1 FirstWrite 48}
		LAYERS_0_FEEDFORWARD_3_BIAS_V {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_V_31 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_242_27 {
		norm2 {Type I LastRead 4 FirstWrite -1}
		pooled_V {Type O LastRead -1 FirstWrite 7}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s {
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 12}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2 {
		input_r {Type I LastRead 0 FirstWrite -1}
		mean_V_3_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1 {
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		variance_V_4_out {Type O LastRead -1 FirstWrite 3}}
	layer_norm_1d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO {
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		conv7_i340 {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 12}
		OUTPUT_NORM_WEIGHT_V {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS_V {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_258_29 {
		sext_ln837_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_221 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_303 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_19 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_222 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_311 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_21 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_23 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_223 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_321 {Type I LastRead 0 FirstWrite -1}
		zext_ln837_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_25 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_27 {Type I LastRead 0 FirstWrite -1}
		sext_ln258 {Type I LastRead 0 FirstWrite -1}
		p_Val2_17_out {Type O LastRead -1 FirstWrite 24}
		p_Val2_14_out {Type O LastRead -1 FirstWrite 24}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5210", "Max" : "5210"}
	, {"Name" : "Interval", "Min" : "5211", "Max" : "5211"}
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
