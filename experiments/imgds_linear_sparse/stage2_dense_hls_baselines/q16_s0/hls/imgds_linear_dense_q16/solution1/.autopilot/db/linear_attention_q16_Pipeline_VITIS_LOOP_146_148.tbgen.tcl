set moduleName linear_attention_q16_Pipeline_VITIS_LOOP_146_148
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
set C_modelName {linear_attention_q16_Pipeline_VITIS_LOOP_146_148}
set C_modelType { void 0 }
set C_modelArgList {
	{ attended_V_reload int 16 regular  }
	{ attended_V_1_reload int 16 regular  }
	{ attended_V_2_reload int 16 regular  }
	{ attended_V_3_reload int 16 regular  }
	{ attended_V_4_reload int 16 regular  }
	{ attended_V_5_reload int 16 regular  }
	{ attended_V_6_reload int 16 regular  }
	{ attended_V_7_reload int 16 regular  }
	{ attended_V_8_reload int 16 regular  }
	{ attended_V_9_reload int 16 regular  }
	{ attended_V_10_reload int 16 regular  }
	{ attended_V_11_reload int 16 regular  }
	{ attended_V_12_reload int 16 regular  }
	{ attended_V_13_reload int 16 regular  }
	{ attended_V_14_reload int 16 regular  }
	{ attended_V_15_reload int 16 regular  }
	{ phi_ln818_8_out int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "attended_V_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_1_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_2_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_3_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_4_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_5_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_6_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_7_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_8_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_9_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_10_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_11_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_12_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_13_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_14_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "attended_V_15_reload", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "phi_ln818_8_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ attended_V_reload sc_in sc_lv 16 signal 0 } 
	{ attended_V_1_reload sc_in sc_lv 16 signal 1 } 
	{ attended_V_2_reload sc_in sc_lv 16 signal 2 } 
	{ attended_V_3_reload sc_in sc_lv 16 signal 3 } 
	{ attended_V_4_reload sc_in sc_lv 16 signal 4 } 
	{ attended_V_5_reload sc_in sc_lv 16 signal 5 } 
	{ attended_V_6_reload sc_in sc_lv 16 signal 6 } 
	{ attended_V_7_reload sc_in sc_lv 16 signal 7 } 
	{ attended_V_8_reload sc_in sc_lv 16 signal 8 } 
	{ attended_V_9_reload sc_in sc_lv 16 signal 9 } 
	{ attended_V_10_reload sc_in sc_lv 16 signal 10 } 
	{ attended_V_11_reload sc_in sc_lv 16 signal 11 } 
	{ attended_V_12_reload sc_in sc_lv 16 signal 12 } 
	{ attended_V_13_reload sc_in sc_lv 16 signal 13 } 
	{ attended_V_14_reload sc_in sc_lv 16 signal 14 } 
	{ attended_V_15_reload sc_in sc_lv 16 signal 15 } 
	{ phi_ln818_8_out sc_out sc_lv 16 signal 16 } 
	{ phi_ln818_8_out_ap_vld sc_out sc_logic 1 outvld 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "attended_V_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_reload", "role": "default" }} , 
 	{ "name": "attended_V_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_1_reload", "role": "default" }} , 
 	{ "name": "attended_V_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_2_reload", "role": "default" }} , 
 	{ "name": "attended_V_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_3_reload", "role": "default" }} , 
 	{ "name": "attended_V_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_4_reload", "role": "default" }} , 
 	{ "name": "attended_V_5_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_5_reload", "role": "default" }} , 
 	{ "name": "attended_V_6_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_6_reload", "role": "default" }} , 
 	{ "name": "attended_V_7_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_7_reload", "role": "default" }} , 
 	{ "name": "attended_V_8_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_8_reload", "role": "default" }} , 
 	{ "name": "attended_V_9_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_9_reload", "role": "default" }} , 
 	{ "name": "attended_V_10_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_10_reload", "role": "default" }} , 
 	{ "name": "attended_V_11_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_11_reload", "role": "default" }} , 
 	{ "name": "attended_V_12_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_12_reload", "role": "default" }} , 
 	{ "name": "attended_V_13_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_13_reload", "role": "default" }} , 
 	{ "name": "attended_V_14_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_14_reload", "role": "default" }} , 
 	{ "name": "attended_V_15_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attended_V_15_reload", "role": "default" }} , 
 	{ "name": "phi_ln818_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "phi_ln818_8_out", "role": "default" }} , 
 	{ "name": "phi_ln818_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "phi_ln818_8_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_146_148",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "20",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attended_V_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_3_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_5_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_6_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_7_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_8_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_9_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_10_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_11_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_12_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_13_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_14_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "attended_V_15_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "phi_ln818_8_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_146_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_164_16_1_1_U2900", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_164_16_1_1_x7_U2901", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U2902", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	linear_attention_q16_Pipeline_VITIS_LOOP_146_148 {
		attended_V_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_1_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_2_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_3_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_4_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_5_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_6_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_7_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_8_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_9_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_10_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_11_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_12_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_13_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_14_reload {Type I LastRead 0 FirstWrite -1}
		attended_V_15_reload {Type I LastRead 0 FirstWrite -1}
		phi_ln818_8_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "20"}
	, {"Name" : "Interval", "Min" : "20", "Max" : "20"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	attended_V_reload { ap_none {  { attended_V_reload in_data 0 16 } } }
	attended_V_1_reload { ap_none {  { attended_V_1_reload in_data 0 16 } } }
	attended_V_2_reload { ap_none {  { attended_V_2_reload in_data 0 16 } } }
	attended_V_3_reload { ap_none {  { attended_V_3_reload in_data 0 16 } } }
	attended_V_4_reload { ap_none {  { attended_V_4_reload in_data 0 16 } } }
	attended_V_5_reload { ap_none {  { attended_V_5_reload in_data 0 16 } } }
	attended_V_6_reload { ap_none {  { attended_V_6_reload in_data 0 16 } } }
	attended_V_7_reload { ap_none {  { attended_V_7_reload in_data 0 16 } } }
	attended_V_8_reload { ap_none {  { attended_V_8_reload in_data 0 16 } } }
	attended_V_9_reload { ap_none {  { attended_V_9_reload in_data 0 16 } } }
	attended_V_10_reload { ap_none {  { attended_V_10_reload in_data 0 16 } } }
	attended_V_11_reload { ap_none {  { attended_V_11_reload in_data 0 16 } } }
	attended_V_12_reload { ap_none {  { attended_V_12_reload in_data 0 16 } } }
	attended_V_13_reload { ap_none {  { attended_V_13_reload in_data 0 16 } } }
	attended_V_14_reload { ap_none {  { attended_V_14_reload in_data 0 16 } } }
	attended_V_15_reload { ap_none {  { attended_V_15_reload in_data 0 16 } } }
	phi_ln818_8_out { ap_vld {  { phi_ln818_8_out out_data 1 16 }  { phi_ln818_8_out_ap_vld out_vld 1 1 } } }
}
