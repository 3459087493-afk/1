set moduleName layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2
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
set C_modelName {layer_norm_2d<ap_fixed,ap_fixed,ap_fixed,ap_fixed<16,6,0,0,0>>_Pipeline_VITIS_LO.2}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln837 int 7 regular  }
	{ input_r int 16 regular {array 128 { 1 3 } 1 1 }  }
	{ mean_V_3_out int 24 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln837", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "mean_V_3_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln837 sc_in sc_lv 7 signal 0 } 
	{ input_r_address0 sc_out sc_lv 7 signal 1 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ input_r_q0 sc_in sc_lv 16 signal 1 } 
	{ mean_V_3_out sc_out sc_lv 24 signal 2 } 
	{ mean_V_3_out_ap_vld sc_out sc_logic 1 outvld 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln837", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln837", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "mean_V_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "mean_V_3_out", "role": "default" }} , 
 	{ "name": "mean_V_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mean_V_3_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_Pipeline_VITIS_LO_2 {
		zext_ln837 {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		mean_V_3_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "50", "Max" : "50"}
	, {"Name" : "Interval", "Min" : "50", "Max" : "50"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	zext_ln837 { ap_none {  { zext_ln837 in_data 0 7 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 7 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 16 } } }
	mean_V_3_out { ap_vld {  { mean_V_3_out out_data 1 24 }  { mean_V_3_out_ap_vld out_vld 1 1 } } }
}
