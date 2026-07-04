set moduleName layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s
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
set C_modelName {layer_norm_2d<ap_fixed,ap_fixed,ap_fixed,ap_fixed<16,6,0,0,0>>}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ output_r int 16 regular {array 128 { 0 3 } 0 1 }  }
	{ weight int 12 regular {array 16 { 1 } 1 1 }  }
	{ bias int 9 regular {array 16 { 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weight", "interface" : "memory", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "bias", "interface" : "memory", "bitwidth" : 9, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r_address0 sc_out sc_lv 7 signal 0 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_r_q0 sc_in sc_lv 16 signal 0 } 
	{ output_r_address0 sc_out sc_lv 7 signal 1 } 
	{ output_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_r_we0 sc_out sc_logic 1 signal 1 } 
	{ output_r_d0 sc_out sc_lv 16 signal 1 } 
	{ weight_address0 sc_out sc_lv 4 signal 2 } 
	{ weight_ce0 sc_out sc_logic 1 signal 2 } 
	{ weight_q0 sc_in sc_lv 12 signal 2 } 
	{ bias_address0 sc_out sc_lv 4 signal 3 } 
	{ bias_ce0 sc_out sc_logic 1 signal 3 } 
	{ bias_q0 sc_in sc_lv 9 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "output_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "output_r", "role": "address0" }} , 
 	{ "name": "output_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce0" }} , 
 	{ "name": "output_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we0" }} , 
 	{ "name": "output_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_r", "role": "d0" }} , 
 	{ "name": "weight_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weight", "role": "address0" }} , 
 	{ "name": "weight_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight", "role": "ce0" }} , 
 	{ "name": "weight_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "weight", "role": "q0" }} , 
 	{ "name": "bias_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bias", "role": "address0" }} , 
 	{ "name": "bias_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias", "role": "ce0" }} , 
 	{ "name": "bias_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bias", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "6", "10", "11", "12", "13"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1377", "EstimateLatencyMax" : "1377",
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
					{"ID" : "1", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "6", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "input_r", "Inst_start_state" : "57", "Inst_end_state" : "58"},
					{"ID" : "3", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204", "Port" : "input_r", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "output_r", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "weight", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "weight", "Inst_start_state" : "57", "Inst_end_state" : "58"}]},
			{"Name" : "bias", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Port" : "bias", "Inst_start_state" : "57", "Inst_end_state" : "58"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_14_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "58", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state58"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2",
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
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mean_V_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_16_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2_fu_196.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204", "Parent" : "0", "Child" : ["4", "5"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1",
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
			{"Name" : "zext_ln837", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "variance_V_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_23_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204.mul_20s_20s_40_1_1_U67", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1_fu_204.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213", "Parent" : "0", "Child" : ["7", "8", "9"],
		"CDFG" : "layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "45", "EstimateLatencyMax" : "45",
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
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.mul_mul_16s_16s_32_4_1_U73", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.mul_mul_20s_16s_36_4_1_U74", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_fu_213.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U84", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U85", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U86", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_16_no_dsp_1_U87", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s {
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		weight {Type I LastRead 6 FirstWrite -1}
		bias {Type I LastRead 10 FirstWrite -1}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2 {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		mean_V_3_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_1 {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		variance_V_4_out {Type O LastRead -1 FirstWrite 2}}
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 13}
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		conv7_i344 {Type I LastRead 0 FirstWrite -1}
		weight {Type I LastRead 6 FirstWrite -1}
		bias {Type I LastRead 10 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1377", "Max" : "1377"}
	, {"Name" : "Interval", "Min" : "1377", "Max" : "1377"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 7 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 16 } } }
	output_r { ap_memory {  { output_r_address0 mem_address 1 7 }  { output_r_ce0 mem_ce 1 1 }  { output_r_we0 mem_we 1 1 }  { output_r_d0 mem_din 1 16 } } }
	weight { ap_memory {  { weight_address0 mem_address 1 4 }  { weight_ce0 mem_ce 1 1 }  { weight_q0 mem_dout 0 12 } } }
	bias { ap_memory {  { bias_address0 mem_address 1 4 }  { bias_ce0 mem_ce 1 1 }  { bias_q0 mem_dout 0 9 } } }
}
