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
	{ input_r int 32 regular {array 192 { 1 1 } 1 1 }  }
	{ logits int 32 regular {array 2 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "logits", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
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
	{ input_r_address1 sc_out sc_lv 8 signal 0 } 
	{ input_r_ce1 sc_out sc_logic 1 signal 0 } 
	{ input_r_q1 sc_in sc_lv 32 signal 0 } 
	{ logits_address0 sc_out sc_lv 1 signal 1 } 
	{ logits_ce0 sc_out sc_logic 1 signal 1 } 
	{ logits_we0 sc_out sc_logic 1 signal 1 } 
	{ logits_d0 sc_out sc_lv 32 signal 1 } 
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
 	{ "name": "input_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_r", "role": "address1" }} , 
 	{ "name": "input_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce1" }} , 
 	{ "name": "input_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_r", "role": "q1" }} , 
 	{ "name": "logits_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "address0" }} , 
 	{ "name": "logits_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "ce0" }} , 
 	{ "name": "logits_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits", "role": "we0" }} , 
 	{ "name": "logits_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "logits", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "45", "163", "167", "183", "185", "188", "207", "224", "226", "245", "280", "282", "284", "286", "288", "292", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331"],
		"CDFG" : "unsw_linear_transformer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6948", "EstimateLatencyMax" : "6948",
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
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "logits", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "292", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_231_29_fu_1178", "Port" : "logits", "Inst_start_state" : "92", "Inst_end_state" : "93"}]},
			{"Name" : "INPUT_PROJECTION_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_BIAS", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_8", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_10", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_11", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_12", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_13", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_14", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_15", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_16", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_17", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_18", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_19", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_20", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_21", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_22", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "INPUT_PROJECTION_WEIGHT_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "INPUT_PROJECTION_WEIGHT_23", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "POSITION_EMBEDDING_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Port" : "POSITION_EMBEDDING_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_4", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_4", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_4", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_5", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_5", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_5", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_6", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_6", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_6", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_7", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_7", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_7", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_8", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_8", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_8", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_9", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_9", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_9", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_10", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_10", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_10", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_11", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_11", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_11", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_12", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_12", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_12", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_13", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_13", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_13", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_14", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_14", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_14", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_15", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_KEY_WEIGHT_15", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Port" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_15", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "ACTIVE_K_CHANNELS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "163", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926", "Port" : "ACTIVE_K_CHANNELS", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "Q_ACTIVE_MASK", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "163", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926", "Port" : "Q_ACTIVE_MASK", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_BIAS", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "188", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Port" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15", "Inst_start_state" : "11", "Inst_end_state" : "22"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_BIAS", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_0", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_1", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_2", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_3", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_4", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_5", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_6", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_7", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_8", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_9", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_10", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_11", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_12", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_13", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_14", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "226", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Port" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_15", "Inst_start_state" : "25", "Inst_end_state" : "26"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_BIAS", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_0", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_1", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_2", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_3", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_4", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_5", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_6", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_7", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_8", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_9", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_10", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_11", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_12", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_13", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_14", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_15", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_16", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_17", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_18", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_19", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_20", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_21", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_22", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_23", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_24", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_25", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_26", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_27", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_28", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_29", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_30", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "245", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Port" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_31", "Inst_start_state" : "27", "Inst_end_state" : "28"}]},
			{"Name" : "OUTPUT_NORM_WEIGHT", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "288", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166", "Port" : "OUTPUT_NORM_WEIGHT", "Inst_start_state" : "81", "Inst_end_state" : "82"}]},
			{"Name" : "OUTPUT_NORM_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "288", "SubInstance" : "grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166", "Port" : "OUTPUT_NORM_BIAS", "Inst_start_state" : "81", "Inst_end_state" : "82"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_146_14", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "93", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state10"], "PostState" : ["ap_ST_fsm_state22"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.embedded_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparse_query_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparse_key_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_value_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_sum_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attention_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm1_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.feedforward_hidden_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.residual2_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.norm2_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pooled_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.normalized_output_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762", "Parent" : "0", "Child" : ["18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1658", "EstimateLatencyMax" : "1658",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "INPUT_PROJECTION_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "INPUT_PROJECTION_WEIGHT_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "POSITION_EMBEDDING_0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_75_1_VITIS_LOOP_76_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_BIAS_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_0_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_1_U", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_2_U", "Parent" : "17"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_3_U", "Parent" : "17"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_4_U", "Parent" : "17"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_5_U", "Parent" : "17"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_6_U", "Parent" : "17"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_7_U", "Parent" : "17"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_8_U", "Parent" : "17"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_9_U", "Parent" : "17"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_10_U", "Parent" : "17"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_11_U", "Parent" : "17"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_12_U", "Parent" : "17"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_13_U", "Parent" : "17"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_14_U", "Parent" : "17"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_15_U", "Parent" : "17"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_16_U", "Parent" : "17"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_17_U", "Parent" : "17"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_18_U", "Parent" : "17"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_19_U", "Parent" : "17"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_20_U", "Parent" : "17"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_21_U", "Parent" : "17"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_22_U", "Parent" : "17"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.INPUT_PROJECTION_WEIGHT_23_U", "Parent" : "17"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.POSITION_EMBEDDING_0_U", "Parent" : "17"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2_fu_762.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822", "Parent" : "0", "Child" : ["46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "225", "EstimateLatencyMax" : "225",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "embedded", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_QUERY_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_KEY_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_VALUE_WEIGHT_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_90_4_VITIS_LOOP_91_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter96", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter96", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_8_U", "Parent" : "45"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_8_U", "Parent" : "45"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_8_U", "Parent" : "45"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_9_U", "Parent" : "45"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_9_U", "Parent" : "45"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_9_U", "Parent" : "45"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_10_U", "Parent" : "45"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_10_U", "Parent" : "45"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_10_U", "Parent" : "45"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_11_U", "Parent" : "45"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_11_U", "Parent" : "45"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_11_U", "Parent" : "45"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_12_U", "Parent" : "45"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_12_U", "Parent" : "45"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_12_U", "Parent" : "45"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_13_U", "Parent" : "45"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_13_U", "Parent" : "45"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_13_U", "Parent" : "45"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_14_U", "Parent" : "45"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_14_U", "Parent" : "45"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_14_U", "Parent" : "45"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_QUERY_WEIGHT_15_U", "Parent" : "45"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_KEY_WEIGHT_15_U", "Parent" : "45"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.LAYERS_0_ATTENTION_VALUE_WEIGHT_15_U", "Parent" : "45"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U51", "Parent" : "45"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U52", "Parent" : "45"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U53", "Parent" : "45"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U54", "Parent" : "45"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U55", "Parent" : "45"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U56", "Parent" : "45"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U57", "Parent" : "45"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U58", "Parent" : "45"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U59", "Parent" : "45"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U60", "Parent" : "45"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U61", "Parent" : "45"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U62", "Parent" : "45"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U63", "Parent" : "45"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U64", "Parent" : "45"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "45"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U66", "Parent" : "45"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U67", "Parent" : "45"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U68", "Parent" : "45"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U69", "Parent" : "45"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U70", "Parent" : "45"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U71", "Parent" : "45"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U72", "Parent" : "45"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U73", "Parent" : "45"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U74", "Parent" : "45"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U75", "Parent" : "45"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U76", "Parent" : "45"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U77", "Parent" : "45"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U78", "Parent" : "45"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U79", "Parent" : "45"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U80", "Parent" : "45"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U81", "Parent" : "45"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U82", "Parent" : "45"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fadd_32ns_32ns_32_5_full_dsp_1_U83", "Parent" : "45"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U100", "Parent" : "45"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U101", "Parent" : "45"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U102", "Parent" : "45"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U103", "Parent" : "45"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U104", "Parent" : "45"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U105", "Parent" : "45"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U106", "Parent" : "45"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U107", "Parent" : "45"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U108", "Parent" : "45"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U109", "Parent" : "45"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U110", "Parent" : "45"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U111", "Parent" : "45"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U112", "Parent" : "45"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U113", "Parent" : "45"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U114", "Parent" : "45"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U115", "Parent" : "45"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U116", "Parent" : "45"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U117", "Parent" : "45"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U118", "Parent" : "45"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U119", "Parent" : "45"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U120", "Parent" : "45"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U121", "Parent" : "45"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U122", "Parent" : "45"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U123", "Parent" : "45"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U124", "Parent" : "45"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U125", "Parent" : "45"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U126", "Parent" : "45"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U127", "Parent" : "45"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U128", "Parent" : "45"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U129", "Parent" : "45"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U130", "Parent" : "45"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fmul_32ns_32ns_32_4_max_dsp_1_U131", "Parent" : "45"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fcmp_32ns_32ns_1_2_no_dsp_1_U133", "Parent" : "45"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fexp_32ns_32ns_32_10_full_dsp_1_U134", "Parent" : "45"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.fexp_32ns_32ns_32_10_full_dsp_1_U135", "Parent" : "45"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5_fu_822.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926", "Parent" : "0", "Child" : ["164", "165", "166"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "121", "EstimateLatencyMax" : "121",
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
			{"Name" : "VITIS_LOOP_115_7_VITIS_LOOP_116_8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926.ACTIVE_K_CHANNELS_U", "Parent" : "163"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926.Q_ACTIVE_MASK_U", "Parent" : "163"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8_fu_926.flow_control_loop_pipe_sequential_init_U", "Parent" : "163"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938", "Parent" : "0", "Child" : ["168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10",
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
			{"Name" : "VITIS_LOOP_125_9_VITIS_LOOP_126_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter12", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter12", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U200", "Parent" : "167"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U201", "Parent" : "167"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U202", "Parent" : "167"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U203", "Parent" : "167"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U204", "Parent" : "167"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.fpext_32ns_64_2_no_dsp_1_U205", "Parent" : "167"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U206", "Parent" : "167"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U207", "Parent" : "167"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U208", "Parent" : "167"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U209", "Parent" : "167"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U210", "Parent" : "167"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U211", "Parent" : "167"},
	{"ID" : "180", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U212", "Parent" : "167"},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.mul_24s_20s_38_1_1_U213", "Parent" : "167"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10_fu_938.flow_control_loop_pipe_sequential_init_U", "Parent" : "167"},
	{"ID" : "183", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_137_12_fu_945", "Parent" : "0", "Child" : ["184"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_137_12",
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
			{"Name" : "sparse_key_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_137_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_137_12_fu_945.flow_control_loop_pipe_sequential_init_U", "Parent" : "183"},
	{"ID" : "185", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_148_15_fu_951", "Parent" : "0", "Child" : ["186", "187"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_148_15",
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
			{"Name" : "sub_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "sparse_query_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "denominator_V_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_148_15", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_148_15_fu_951.mul_20s_23s_38_1_1_U220", "Parent" : "185"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_148_15_fu_951.flow_control_loop_pipe_sequential_init_U", "Parent" : "185"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959", "Parent" : "0", "Child" : ["189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "220", "EstimateLatencyMax" : "220",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attention", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_167_18_VITIS_LOOP_168_19", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter91", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter91", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_BIAS_U", "Parent" : "188"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0_U", "Parent" : "188"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1_U", "Parent" : "188"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2_U", "Parent" : "188"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3_U", "Parent" : "188"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4_U", "Parent" : "188"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5_U", "Parent" : "188"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6_U", "Parent" : "188"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7_U", "Parent" : "188"},
	{"ID" : "198", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8_U", "Parent" : "188"},
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9_U", "Parent" : "188"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10_U", "Parent" : "188"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11_U", "Parent" : "188"},
	{"ID" : "202", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12_U", "Parent" : "188"},
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13_U", "Parent" : "188"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14_U", "Parent" : "188"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15_U", "Parent" : "188"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19_fu_959.flow_control_loop_pipe_sequential_init_U", "Parent" : "188"},
	{"ID" : "207", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000", "Parent" : "0", "Child" : ["208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73", "EstimateLatencyMax" : "73",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln818_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1347_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv_i115", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_155_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter56", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter56", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U226", "Parent" : "207"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U227", "Parent" : "207"},
	{"ID" : "210", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U228", "Parent" : "207"},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U229", "Parent" : "207"},
	{"ID" : "212", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U230", "Parent" : "207"},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U231", "Parent" : "207"},
	{"ID" : "214", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U232", "Parent" : "207"},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U233", "Parent" : "207"},
	{"ID" : "216", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U234", "Parent" : "207"},
	{"ID" : "217", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U235", "Parent" : "207"},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U236", "Parent" : "207"},
	{"ID" : "219", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U237", "Parent" : "207"},
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U238", "Parent" : "207"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.mul_20s_24s_38_1_1_U239", "Parent" : "207"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.sdiv_38ns_24ns_38_42_1_U240", "Parent" : "207"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16_fu_1000.flow_control_loop_pipe_sequential_init_U", "Parent" : "207"},
	{"ID" : "224", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_21_1_fu_1022", "Parent" : "0", "Child" : ["225"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_21_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "303", "EstimateLatencyMax" : "303",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_21_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage5", "LastStateIter" : "ap_enable_reg_pp0_iter30", "LastStateBlock" : "ap_block_pp0_stage5_subdone", "QuitState" : "ap_ST_fsm_pp0_stage5", "QuitStateIter" : "ap_enable_reg_pp0_iter30", "QuitStateBlock" : "ap_block_pp0_stage5_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_21_1_fu_1022.flow_control_loop_pipe_sequential_init_U", "Parent" : "224"},
	{"ID" : "226", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028", "Parent" : "0", "Child" : ["227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2130", "EstimateLatencyMax" : "2130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "feedforward_hidden", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_0_WEIGHT_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_188_21_VITIS_LOOP_189_22", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_BIAS_U", "Parent" : "226"},
	{"ID" : "228", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_0_U", "Parent" : "226"},
	{"ID" : "229", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_1_U", "Parent" : "226"},
	{"ID" : "230", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_2_U", "Parent" : "226"},
	{"ID" : "231", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_3_U", "Parent" : "226"},
	{"ID" : "232", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_4_U", "Parent" : "226"},
	{"ID" : "233", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_5_U", "Parent" : "226"},
	{"ID" : "234", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_6_U", "Parent" : "226"},
	{"ID" : "235", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_7_U", "Parent" : "226"},
	{"ID" : "236", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_8_U", "Parent" : "226"},
	{"ID" : "237", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_9_U", "Parent" : "226"},
	{"ID" : "238", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_10_U", "Parent" : "226"},
	{"ID" : "239", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_11_U", "Parent" : "226"},
	{"ID" : "240", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_12_U", "Parent" : "226"},
	{"ID" : "241", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_13_U", "Parent" : "226"},
	{"ID" : "242", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_14_U", "Parent" : "226"},
	{"ID" : "243", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.LAYERS_0_FEEDFORWARD_0_WEIGHT_15_U", "Parent" : "226"},
	{"ID" : "244", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22_fu_1028.flow_control_loop_pipe_sequential_init_U", "Parent" : "226"},
	{"ID" : "245", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068", "Parent" : "0", "Child" : ["246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "427", "EstimateLatencyMax" : "427",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "feedforward_hidden", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_31", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_200_24_VITIS_LOOP_201_25", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter85", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter85", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "246", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_BIAS_U", "Parent" : "245"},
	{"ID" : "247", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_0_U", "Parent" : "245"},
	{"ID" : "248", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_1_U", "Parent" : "245"},
	{"ID" : "249", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_2_U", "Parent" : "245"},
	{"ID" : "250", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_3_U", "Parent" : "245"},
	{"ID" : "251", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_4_U", "Parent" : "245"},
	{"ID" : "252", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_5_U", "Parent" : "245"},
	{"ID" : "253", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_6_U", "Parent" : "245"},
	{"ID" : "254", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_7_U", "Parent" : "245"},
	{"ID" : "255", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_8_U", "Parent" : "245"},
	{"ID" : "256", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_9_U", "Parent" : "245"},
	{"ID" : "257", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_10_U", "Parent" : "245"},
	{"ID" : "258", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_11_U", "Parent" : "245"},
	{"ID" : "259", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_12_U", "Parent" : "245"},
	{"ID" : "260", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_13_U", "Parent" : "245"},
	{"ID" : "261", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_14_U", "Parent" : "245"},
	{"ID" : "262", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_15_U", "Parent" : "245"},
	{"ID" : "263", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_16_U", "Parent" : "245"},
	{"ID" : "264", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_17_U", "Parent" : "245"},
	{"ID" : "265", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_18_U", "Parent" : "245"},
	{"ID" : "266", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_19_U", "Parent" : "245"},
	{"ID" : "267", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_20_U", "Parent" : "245"},
	{"ID" : "268", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_21_U", "Parent" : "245"},
	{"ID" : "269", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_22_U", "Parent" : "245"},
	{"ID" : "270", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_23_U", "Parent" : "245"},
	{"ID" : "271", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_24_U", "Parent" : "245"},
	{"ID" : "272", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_25_U", "Parent" : "245"},
	{"ID" : "273", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_26_U", "Parent" : "245"},
	{"ID" : "274", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_27_U", "Parent" : "245"},
	{"ID" : "275", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_28_U", "Parent" : "245"},
	{"ID" : "276", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_29_U", "Parent" : "245"},
	{"ID" : "277", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_30_U", "Parent" : "245"},
	{"ID" : "278", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.LAYERS_0_FEEDFORWARD_3_WEIGHT_31_U", "Parent" : "245"},
	{"ID" : "279", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25_fu_1068.flow_control_loop_pipe_sequential_init_U", "Parent" : "245"},
	{"ID" : "280", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_21_11_fu_1141", "Parent" : "0", "Child" : ["281"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_21_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "303", "EstimateLatencyMax" : "303",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_21_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage5", "LastStateIter" : "ap_enable_reg_pp0_iter30", "LastStateBlock" : "ap_block_pp0_stage5_subdone", "QuitState" : "ap_ST_fsm_pp0_stage5", "QuitStateIter" : "ap_enable_reg_pp0_iter30", "QuitStateBlock" : "ap_block_pp0_stage5_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "281", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_21_11_fu_1141.flow_control_loop_pipe_sequential_init_U", "Parent" : "280"},
	{"ID" : "282", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_220_27_fu_1147", "Parent" : "0", "Child" : ["283"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_220_27",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "108", "EstimateLatencyMax" : "108",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "norm2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pooled", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_220_27", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "283", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_220_27_fu_1147.flow_control_loop_pipe_sequential_init_U", "Parent" : "282"},
	{"ID" : "284", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_51_1_fu_1153", "Parent" : "0", "Child" : ["285"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_51_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "84", "EstimateLatencyMax" : "84",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pooled", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_51_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "285", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_51_1_fu_1153.flow_control_loop_pipe_sequential_init_U", "Parent" : "284"},
	{"ID" : "286", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_57_2_fu_1159", "Parent" : "0", "Child" : ["287"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_57_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "93", "EstimateLatencyMax" : "93",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "pooled", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "variance_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_57_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "287", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_57_2_fu_1159.flow_control_loop_pipe_sequential_init_U", "Parent" : "286"},
	{"ID" : "288", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166", "Parent" : "0", "Child" : ["289", "290", "291"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3",
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
			{"Name" : "pooled", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "inverse_std_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "OUTPUT_NORM_WEIGHT", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "OUTPUT_NORM_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_64_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "289", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166.OUTPUT_NORM_WEIGHT_U", "Parent" : "288"},
	{"ID" : "290", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166.OUTPUT_NORM_BIAS_U", "Parent" : "288"},
	{"ID" : "291", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3_fu_1166.flow_control_loop_pipe_sequential_init_U", "Parent" : "288"},
	{"ID" : "292", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_231_29_fu_1178", "Parent" : "0", "Child" : ["293"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_231_29",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "87", "EstimateLatencyMax" : "87",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized_output_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized_output_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_231_29", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter84", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter84", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "293", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_unsw_linear_transformer_Pipeline_VITIS_LOOP_231_29_fu_1178.flow_control_loop_pipe_sequential_init_U", "Parent" : "292"},
	{"ID" : "294", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U519", "Parent" : "0"},
	{"ID" : "295", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U520", "Parent" : "0"},
	{"ID" : "296", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U521", "Parent" : "0"},
	{"ID" : "297", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_16_no_dsp_1_U522", "Parent" : "0"},
	{"ID" : "298", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U523", "Parent" : "0"},
	{"ID" : "299", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U524", "Parent" : "0"},
	{"ID" : "300", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U525", "Parent" : "0"},
	{"ID" : "301", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U526", "Parent" : "0"},
	{"ID" : "302", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U527", "Parent" : "0"},
	{"ID" : "303", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U528", "Parent" : "0"},
	{"ID" : "304", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U529", "Parent" : "0"},
	{"ID" : "305", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_5_full_dsp_1_U530", "Parent" : "0"},
	{"ID" : "306", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U531", "Parent" : "0"},
	{"ID" : "307", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U532", "Parent" : "0"},
	{"ID" : "308", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U533", "Parent" : "0"},
	{"ID" : "309", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U534", "Parent" : "0"},
	{"ID" : "310", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U535", "Parent" : "0"},
	{"ID" : "311", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U536", "Parent" : "0"},
	{"ID" : "312", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U537", "Parent" : "0"},
	{"ID" : "313", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U538", "Parent" : "0"},
	{"ID" : "314", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U539", "Parent" : "0"},
	{"ID" : "315", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U540", "Parent" : "0"},
	{"ID" : "316", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U541", "Parent" : "0"},
	{"ID" : "317", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U542", "Parent" : "0"},
	{"ID" : "318", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U543", "Parent" : "0"},
	{"ID" : "319", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U544", "Parent" : "0"},
	{"ID" : "320", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U545", "Parent" : "0"},
	{"ID" : "321", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U546", "Parent" : "0"},
	{"ID" : "322", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U547", "Parent" : "0"},
	{"ID" : "323", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U548", "Parent" : "0"},
	{"ID" : "324", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U549", "Parent" : "0"},
	{"ID" : "325", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U550", "Parent" : "0"},
	{"ID" : "326", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U551", "Parent" : "0"},
	{"ID" : "327", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U552", "Parent" : "0"},
	{"ID" : "328", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U553", "Parent" : "0"},
	{"ID" : "329", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U554", "Parent" : "0"},
	{"ID" : "330", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U555", "Parent" : "0"},
	{"ID" : "331", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U556", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer {
		input_r {Type I LastRead 13 FirstWrite -1}
		logits {Type O LastRead -1 FirstWrite 84}
		INPUT_PROJECTION_BIAS {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_16 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_17 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_18 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_19 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_20 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_21 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_22 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_23 {Type I LastRead -1 FirstWrite -1}
		POSITION_EMBEDDING_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		ACTIVE_K_CHANNELS {Type I LastRead -1 FirstWrite -1}
		Q_ACTIVE_MASK {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_31 {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_WEIGHT {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2 {
		input_r {Type I LastRead 13 FirstWrite -1}
		embedded {Type O LastRead -1 FirstWrite 132}
		INPUT_PROJECTION_BIAS {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_16 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_17 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_18 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_19 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_20 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_21 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_22 {Type I LastRead -1 FirstWrite -1}
		INPUT_PROJECTION_WEIGHT_23 {Type I LastRead -1 FirstWrite -1}
		POSITION_EMBEDDING_0 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_90_4_VITIS_LOOP_91_5 {
		embedded {Type I LastRead 1 FirstWrite -1}
		query {Type O LastRead -1 FirstWrite 96}
		key {Type O LastRead -1 FirstWrite 96}
		value_r {Type O LastRead -1 FirstWrite 86}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_QUERY_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_KEY_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_VALUE_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_115_7_VITIS_LOOP_116_8 {
		sparse_query_V {Type O LastRead -1 FirstWrite 8}
		sparse_key_V {Type O LastRead -1 FirstWrite 8}
		query {Type I LastRead 1 FirstWrite -1}
		key {Type I LastRead 1 FirstWrite -1}
		ACTIVE_K_CHANNELS {Type I LastRead -1 FirstWrite -1}
		Q_ACTIVE_MASK {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_125_9_VITIS_LOOP_126_10 {
		sparse_key_V {Type I LastRead 2 FirstWrite -1}
		value_r {Type I LastRead 2 FirstWrite -1}
		key_value_V {Type O LastRead -1 FirstWrite 12}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_137_12 {
		sparse_key_V {Type I LastRead 1 FirstWrite -1}
		key_sum_V {Type O LastRead -1 FirstWrite 2}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_148_15 {
		sub_ln837 {Type I LastRead 0 FirstWrite -1}
		sparse_query_V {Type I LastRead 0 FirstWrite -1}
		key_sum_V {Type I LastRead 0 FirstWrite -1}
		denominator_V_3_out {Type O LastRead -1 FirstWrite 2}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_167_18_VITIS_LOOP_168_19 {
		attention {Type I LastRead 1 FirstWrite -1}
		embedded {Type I LastRead 1 FirstWrite -1}
		residual1 {Type O LastRead -1 FirstWrite 91}
		LAYERS_0_ATTENTION_OUTPUT_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16 {
		key_value_V {Type I LastRead 1 FirstWrite -1}
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		attention {Type O LastRead -1 FirstWrite 56}
		sext_ln818_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln1347_19 {Type I LastRead 0 FirstWrite -1}
		conv_i115 {Type I LastRead 0 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_21_1 {
		residual1 {Type I LastRead 8 FirstWrite -1}
		norm1 {Type O LastRead -1 FirstWrite 238}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_188_21_VITIS_LOOP_189_22 {
		norm1 {Type I LastRead 8 FirstWrite -1}
		feedforward_hidden {Type O LastRead -1 FirstWrite 88}
		LAYERS_0_FEEDFORWARD_0_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_0_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_200_24_VITIS_LOOP_201_25 {
		feedforward_hidden {Type I LastRead 2 FirstWrite -1}
		norm1 {Type I LastRead 163 FirstWrite -1}
		residual2 {Type O LastRead -1 FirstWrite 171}
		LAYERS_0_FEEDFORWARD_3_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_31 {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_21_11 {
		residual2 {Type I LastRead 8 FirstWrite -1}
		norm2 {Type O LastRead -1 FirstWrite 238}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_220_27 {
		norm2 {Type I LastRead 35 FirstWrite -1}
		pooled {Type O LastRead -1 FirstWrite 46}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_51_1 {
		pooled {Type I LastRead 0 FirstWrite -1}
		mean_4_out {Type O LastRead -1 FirstWrite 2}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_57_2 {
		pooled {Type I LastRead 0 FirstWrite -1}
		mean_3 {Type I LastRead 0 FirstWrite -1}
		variance_4_out {Type O LastRead -1 FirstWrite 11}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_64_3 {
		pooled {Type I LastRead 0 FirstWrite -1}
		mean_3 {Type I LastRead 0 FirstWrite -1}
		inverse_std_2 {Type I LastRead 0 FirstWrite -1}
		normalized_output {Type O LastRead -1 FirstWrite 20}
		OUTPUT_NORM_WEIGHT {Type I LastRead -1 FirstWrite -1}
		OUTPUT_NORM_BIAS {Type I LastRead -1 FirstWrite -1}}
	unsw_linear_transformer_Pipeline_VITIS_LOOP_231_29 {
		normalized_output_load {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_1 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_2 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_3 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_4 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_5 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_6 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_7 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_8 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_9 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_10 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_11 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_12 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_13 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_14 {Type I LastRead 0 FirstWrite -1}
		normalized_output_load_15 {Type I LastRead 0 FirstWrite -1}
		logits {Type O LastRead -1 FirstWrite 84}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6948", "Max" : "6948"}
	, {"Name" : "Interval", "Min" : "6949", "Max" : "6949"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 8 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 32 }  { input_r_address1 MemPortADDR2 1 8 }  { input_r_ce1 MemPortCE2 1 1 }  { input_r_q1 MemPortDOUT2 0 32 } } }
	logits { ap_memory {  { logits_address0 mem_address 1 1 }  { logits_ce0 mem_ce 1 1 }  { logits_we0 mem_we 1 1 }  { logits_d0 mem_din 1 32 } } }
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
