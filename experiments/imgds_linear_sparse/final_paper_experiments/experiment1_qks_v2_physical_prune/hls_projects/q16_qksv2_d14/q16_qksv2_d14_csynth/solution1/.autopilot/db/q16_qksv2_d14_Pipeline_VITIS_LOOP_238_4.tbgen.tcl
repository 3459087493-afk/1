set moduleName q16_qksv2_d14_Pipeline_VITIS_LOOP_238_4
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
set C_modelName {q16_qksv2_d14_Pipeline_VITIS_LOOP_238_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_V int 16 regular {array 256 { 2 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_V_address0 sc_out sc_lv 8 signal 0 } 
	{ x_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ x_V_we0 sc_out sc_logic 1 signal 0 } 
	{ x_V_d0 sc_out sc_lv 16 signal 0 } 
	{ x_V_q0 sc_in sc_lv 16 signal 0 } 
	{ x_V_address1 sc_out sc_lv 8 signal 0 } 
	{ x_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ x_V_we1 sc_out sc_logic 1 signal 0 } 
	{ x_V_d1 sc_out sc_lv 16 signal 0 } 
	{ x_V_q1 sc_in sc_lv 16 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_V", "role": "address0" }} , 
 	{ "name": "x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce0" }} , 
 	{ "name": "x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we0" }} , 
 	{ "name": "x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d0" }} , 
 	{ "name": "x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q0" }} , 
 	{ "name": "x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_V", "role": "address1" }} , 
 	{ "name": "x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce1" }} , 
 	{ "name": "x_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we1" }} , 
 	{ "name": "x_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d1" }} , 
 	{ "name": "x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "54"],
		"CDFG" : "q16_qksv2_d14_Pipeline_VITIS_LOOP_238_4",
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
					{"ID" : "1", "SubInstance" : "grp_layer_norm_1_fu_92", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "91"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_238_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "90", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53"],
		"CDFG" : "layer_norm_1",
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.fadd_32ns_32ns_32_5_full_dsp_1_U69", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.fdiv_32ns_32ns_32_16_no_dsp_1_U70", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.fpext_32ns_64_2_no_dsp_1_U71", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.fsqrt_32ns_32ns_32_16_no_dsp_1_U72", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mul_mul_16s_16s_30_4_1_U73", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U77", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U78", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U79", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U80", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U81", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U82", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U83", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U84", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U85", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U86", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U87", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_16s_30ns_30_4_1_U88", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U89", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U90", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U91", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U92", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U93", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U94", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U95", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U96", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U97", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U98", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U99", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U100", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U101", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U102", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U103", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U104", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_15s_26_4_1_U105", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U106", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U107", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U108", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_16s_26_4_1_U109", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U110", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_10ns_16ns_26_4_1_U111", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.am_submul_16s_16s_16s_26_4_1_U112", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_10ns_18s_26_4_1_U113", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_16ns_26_4_1_U114", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U115", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U116", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_10ns_16s_26_4_1_U117", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_15ns_26_4_1_U118", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_17s_26_4_1_U119", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_1_fu_92.mac_muladd_16s_11ns_18s_26_4_1_U120", "Parent" : "1"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	q16_qksv2_d14_Pipeline_VITIS_LOOP_238_4 {
		x_V {Type IO LastRead 8 FirstWrite 82}}
	layer_norm_1 {
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
		p_read31 {Type I LastRead 86 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1442", "Max" : "1442"}
	, {"Name" : "Interval", "Min" : "1442", "Max" : "1442"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_V { ap_memory {  { x_V_address0 mem_address 1 8 }  { x_V_ce0 mem_ce 1 1 }  { x_V_we0 mem_we 1 1 }  { x_V_d0 mem_din 1 16 }  { x_V_q0 mem_dout 0 16 }  { x_V_address1 MemPortADDR2 1 8 }  { x_V_ce1 MemPortCE2 1 1 }  { x_V_we1 MemPortWE2 1 1 }  { x_V_d1 MemPortDIN2 1 16 }  { x_V_q1 MemPortDOUT2 0 16 } } }
}
