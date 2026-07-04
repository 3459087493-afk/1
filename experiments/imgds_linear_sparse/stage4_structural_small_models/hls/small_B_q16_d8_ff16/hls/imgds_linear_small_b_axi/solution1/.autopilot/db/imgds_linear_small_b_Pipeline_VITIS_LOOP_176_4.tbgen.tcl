set moduleName imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4
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
set C_modelName {imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_V int 16 regular {array 128 { 2 2 } 1 1 }  }
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
	{ x_V_address0 sc_out sc_lv 7 signal 0 } 
	{ x_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ x_V_we0 sc_out sc_logic 1 signal 0 } 
	{ x_V_d0 sc_out sc_lv 16 signal 0 } 
	{ x_V_q0 sc_in sc_lv 16 signal 0 } 
	{ x_V_address1 sc_out sc_lv 7 signal 0 } 
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
 	{ "name": "x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "x_V", "role": "address0" }} , 
 	{ "name": "x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce0" }} , 
 	{ "name": "x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we0" }} , 
 	{ "name": "x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d0" }} , 
 	{ "name": "x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q0" }} , 
 	{ "name": "x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "x_V", "role": "address1" }} , 
 	{ "name": "x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce1" }} , 
 	{ "name": "x_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we1" }} , 
 	{ "name": "x_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d1" }} , 
 	{ "name": "x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "30"],
		"CDFG" : "imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1170", "EstimateLatencyMax" : "1170",
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
					{"ID" : "1", "SubInstance" : "grp_layer_norm_small_b_1_fu_64", "Port" : "x", "Inst_start_state" : "2", "Inst_end_state" : "74"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_176_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "73", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"],
		"CDFG" : "layer_norm_small_b_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "73",
		"VariableLatency" : "0", "ExactLatency" : "72", "EstimateLatencyMin" : "72", "EstimateLatencyMax" : "72",
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
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.fadd_32ns_32ns_32_5_full_dsp_1_U65", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.fdiv_32ns_32ns_32_16_no_dsp_1_U66", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.fpext_32ns_64_2_no_dsp_1_U67", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.fsqrt_32ns_32ns_32_16_no_dsp_1_U68", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mul_mul_16s_16s_30_4_1_U69", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U70", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U71", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U72", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U73", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U74", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U75", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_16s_30ns_30_4_1_U76", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U77", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U78", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U79", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U80", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U81", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U82", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U83", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17ns_26_4_1_U84", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U85", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.am_submul_16s_16s_16s_26_4_1_U86", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U87", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U88", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_17s_26_4_1_U89", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17ns_26_4_1_U90", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_10ns_17s_26_4_1_U91", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_small_b_1_fu_64.mac_muladd_16s_11ns_18s_26_4_1_U92", "Parent" : "1"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_small_b_Pipeline_VITIS_LOOP_176_4 {
		x_V {Type IO LastRead 4 FirstWrite 69}}
	layer_norm_small_b_1 {
		x {Type IO LastRead 4 FirstWrite 69}
		x_offset {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 66 FirstWrite -1}
		p_read1 {Type I LastRead 66 FirstWrite -1}
		p_read2 {Type I LastRead 67 FirstWrite -1}
		p_read3 {Type I LastRead 67 FirstWrite -1}
		p_read4 {Type I LastRead 68 FirstWrite -1}
		p_read5 {Type I LastRead 68 FirstWrite -1}
		p_read6 {Type I LastRead 69 FirstWrite -1}
		p_read7 {Type I LastRead 69 FirstWrite -1}
		p_read8 {Type I LastRead 68 FirstWrite -1}
		p_read9 {Type I LastRead 68 FirstWrite -1}
		p_read10 {Type I LastRead 69 FirstWrite -1}
		p_read11 {Type I LastRead 69 FirstWrite -1}
		p_read12 {Type I LastRead 70 FirstWrite -1}
		p_read13 {Type I LastRead 70 FirstWrite -1}
		p_read14 {Type I LastRead 71 FirstWrite -1}
		p_read15 {Type I LastRead 71 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1170", "Max" : "1170"}
	, {"Name" : "Interval", "Min" : "1170", "Max" : "1170"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_V { ap_memory {  { x_V_address0 mem_address 1 7 }  { x_V_ce0 mem_ce 1 1 }  { x_V_we0 mem_we 1 1 }  { x_V_d0 mem_din 1 16 }  { x_V_q0 mem_dout 0 16 }  { x_V_address1 MemPortADDR2 1 7 }  { x_V_ce1 MemPortCE2 1 1 }  { x_V_we1 MemPortWE2 1 1 }  { x_V_d1 MemPortDIN2 1 16 }  { x_V_q1 MemPortDOUT2 0 16 } } }
}
