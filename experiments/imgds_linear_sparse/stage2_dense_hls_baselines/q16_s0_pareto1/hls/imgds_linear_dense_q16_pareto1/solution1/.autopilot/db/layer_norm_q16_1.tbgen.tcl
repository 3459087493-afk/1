set moduleName layer_norm_q16_1
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
set C_modelName {layer_norm_q16.1}
set C_modelType { int 256 }
set C_modelArgList {
	{ p_read int 16 regular  }
	{ p_read1 int 16 regular  }
	{ p_read2 int 16 regular  }
	{ p_read3 int 16 regular  }
	{ p_read4 int 16 regular  }
	{ p_read5 int 16 regular  }
	{ p_read6 int 16 regular  }
	{ p_read7 int 16 regular  }
	{ p_read8 int 16 regular  }
	{ p_read9 int 16 regular  }
	{ p_read10 int 16 regular  }
	{ p_read11 int 16 regular  }
	{ p_read12 int 16 regular  }
	{ p_read13 int 16 regular  }
	{ p_read14 int 16 regular  }
	{ p_read15 int 16 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read7", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read11", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read13", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_read15", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 256} ]}
# RTL Port declarations: 
set portNum 45
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 16 signal 0 } 
	{ p_read1 sc_in sc_lv 16 signal 1 } 
	{ p_read2 sc_in sc_lv 16 signal 2 } 
	{ p_read3 sc_in sc_lv 16 signal 3 } 
	{ p_read4 sc_in sc_lv 16 signal 4 } 
	{ p_read5 sc_in sc_lv 16 signal 5 } 
	{ p_read6 sc_in sc_lv 16 signal 6 } 
	{ p_read7 sc_in sc_lv 16 signal 7 } 
	{ p_read8 sc_in sc_lv 16 signal 8 } 
	{ p_read9 sc_in sc_lv 16 signal 9 } 
	{ p_read10 sc_in sc_lv 16 signal 10 } 
	{ p_read11 sc_in sc_lv 16 signal 11 } 
	{ p_read12 sc_in sc_lv 16 signal 12 } 
	{ p_read13 sc_in sc_lv 16 signal 13 } 
	{ p_read14 sc_in sc_lv 16 signal 14 } 
	{ p_read15 sc_in sc_lv 16 signal 15 } 
	{ ap_return_0 sc_out sc_lv 16 signal -1 } 
	{ ap_return_1 sc_out sc_lv 16 signal -1 } 
	{ ap_return_2 sc_out sc_lv 16 signal -1 } 
	{ ap_return_3 sc_out sc_lv 16 signal -1 } 
	{ ap_return_4 sc_out sc_lv 16 signal -1 } 
	{ ap_return_5 sc_out sc_lv 16 signal -1 } 
	{ ap_return_6 sc_out sc_lv 16 signal -1 } 
	{ ap_return_7 sc_out sc_lv 16 signal -1 } 
	{ ap_return_8 sc_out sc_lv 16 signal -1 } 
	{ ap_return_9 sc_out sc_lv 16 signal -1 } 
	{ ap_return_10 sc_out sc_lv 16 signal -1 } 
	{ ap_return_11 sc_out sc_lv 16 signal -1 } 
	{ ap_return_12 sc_out sc_lv 16 signal -1 } 
	{ ap_return_13 sc_out sc_lv 16 signal -1 } 
	{ ap_return_14 sc_out sc_lv 16 signal -1 } 
	{ ap_return_15 sc_out sc_lv 16 signal -1 } 
	{ grp_fu_2686_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2686_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2686_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2686_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2683_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2683_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_2683_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "p_read5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read5", "role": "default" }} , 
 	{ "name": "p_read6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read6", "role": "default" }} , 
 	{ "name": "p_read7", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read7", "role": "default" }} , 
 	{ "name": "p_read8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read8", "role": "default" }} , 
 	{ "name": "p_read9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read9", "role": "default" }} , 
 	{ "name": "p_read10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read10", "role": "default" }} , 
 	{ "name": "p_read11", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read11", "role": "default" }} , 
 	{ "name": "p_read12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read12", "role": "default" }} , 
 	{ "name": "p_read13", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read13", "role": "default" }} , 
 	{ "name": "p_read14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read14", "role": "default" }} , 
 	{ "name": "p_read15", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p_read15", "role": "default" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }} , 
 	{ "name": "ap_return_6", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_6", "role": "default" }} , 
 	{ "name": "ap_return_7", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_7", "role": "default" }} , 
 	{ "name": "ap_return_8", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_8", "role": "default" }} , 
 	{ "name": "ap_return_9", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_9", "role": "default" }} , 
 	{ "name": "ap_return_10", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_10", "role": "default" }} , 
 	{ "name": "ap_return_11", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_11", "role": "default" }} , 
 	{ "name": "ap_return_12", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_12", "role": "default" }} , 
 	{ "name": "ap_return_13", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_13", "role": "default" }} , 
 	{ "name": "ap_return_14", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_14", "role": "default" }} , 
 	{ "name": "ap_return_15", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return_15", "role": "default" }} , 
 	{ "name": "grp_fu_2686_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2686_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2686_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2686_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2686_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2686_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2686_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2686_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2683_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2683_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2683_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_2683_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2683_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2683_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "7", "17", "33", "34"],
		"CDFG" : "layer_norm_q16_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "106", "EstimateLatencyMax" : "106",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
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
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397", "Port" : "output_norm_weight_V", "Inst_start_state" : "52", "Inst_end_state" : "53"}]},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397", "Port" : "output_norm_bias_V", "Inst_start_state" : "52", "Inst_end_state" : "53"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
		"CDFG" : "layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
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
			{"Name" : "sum_V_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_46_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338.mux_42_16_1_1_U3120", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338.mux_42_16_1_1_U3121", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338.mux_42_16_1_1_U3122", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338.mux_42_16_1_1_U3123", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1_fu_338.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375", "Parent" : "0", "Child" : ["8", "9", "10", "11", "12", "13", "14", "15", "16"],
		"CDFG" : "layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2",
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "mean", "Type" : "None", "Direction" : "I"},
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
			{"Name" : "var_sum_V_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_54_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mux_42_16_1_1_U3141", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mux_42_16_1_1_U3142", "Parent" : "7"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mux_42_16_1_1_U3143", "Parent" : "7"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mux_42_16_1_1_U3144", "Parent" : "7"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mac_muladd_16s_16s_30ns_30_4_1_U3145", "Parent" : "7"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mac_muladd_16s_16s_30ns_30_4_1_U3146", "Parent" : "7"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mac_muladd_16s_16s_30ns_30_4_1_U3147", "Parent" : "7"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.mac_muladd_16s_16s_30ns_30_4_1_U3148", "Parent" : "7"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2_fu_375.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397", "Parent" : "0", "Child" : ["18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "27", "EstimateLatencyMax" : "27",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
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
			{"Name" : "sext_ln1348", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln1273_521", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_0_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_012_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_02_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_03_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_1_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_14_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_15_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_169_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_2_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_27_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_28_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_29_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_3_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_310_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_311_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "x_312_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "output_norm_weight_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_norm_bias_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_67_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.output_norm_weight_V_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.output_norm_bias_V_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mux_42_16_1_1_U3167", "Parent" : "17"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mux_42_16_1_1_U3168", "Parent" : "17"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mux_42_16_1_1_U3169", "Parent" : "17"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mux_42_16_1_1_U3170", "Parent" : "17"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.am_submul_16s_16s_16s_26_4_1_U3171", "Parent" : "17"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.am_submul_16s_16s_16s_26_4_1_U3172", "Parent" : "17"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.am_submul_16s_16s_16s_26_4_1_U3173", "Parent" : "17"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.am_submul_16s_16s_16s_26_4_1_U3174", "Parent" : "17"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mac_muladd_16s_11ns_18s_26_4_1_U3175", "Parent" : "17"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mac_muladd_16s_11ns_18s_26_4_1_U3176", "Parent" : "17"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mac_muladd_16s_11ns_18s_26_4_1_U3177", "Parent" : "17"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.mac_muladd_16s_11ns_18s_26_4_1_U3178", "Parent" : "17"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3_fu_397.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U3215", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_16_no_dsp_1_U3218", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	layer_norm_q16_1 {
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
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}
	layer_norm_q16_1_Pipeline_VITIS_LOOP_46_1 {
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
		sum_V_out {Type O LastRead -1 FirstWrite 0}}
	layer_norm_q16_1_Pipeline_VITIS_LOOP_54_2 {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		mean {Type I LastRead 0 FirstWrite -1}
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
		var_sum_V_2_out {Type O LastRead -1 FirstWrite 2}}
	layer_norm_q16_1_Pipeline_VITIS_LOOP_67_3 {
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
		sext_ln1348 {Type I LastRead 0 FirstWrite -1}
		sext_ln1273_521 {Type I LastRead 0 FirstWrite -1}
		x_0_0_out {Type O LastRead -1 FirstWrite 2}
		x_012_0_out {Type O LastRead -1 FirstWrite 2}
		x_02_0_out {Type O LastRead -1 FirstWrite 2}
		x_03_0_out {Type O LastRead -1 FirstWrite 2}
		x_1_0_out {Type O LastRead -1 FirstWrite 2}
		x_14_0_out {Type O LastRead -1 FirstWrite 2}
		x_15_0_out {Type O LastRead -1 FirstWrite 2}
		x_169_0_out {Type O LastRead -1 FirstWrite 2}
		x_2_0_out {Type O LastRead -1 FirstWrite 2}
		x_27_0_out {Type O LastRead -1 FirstWrite 2}
		x_28_0_out {Type O LastRead -1 FirstWrite 2}
		x_29_0_out {Type O LastRead -1 FirstWrite 2}
		x_3_0_out {Type O LastRead -1 FirstWrite 2}
		x_310_0_out {Type O LastRead -1 FirstWrite 2}
		x_311_0_out {Type O LastRead -1 FirstWrite 2}
		x_312_0_out {Type O LastRead -1 FirstWrite 2}
		output_norm_weight_V {Type I LastRead -1 FirstWrite -1}
		output_norm_bias_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "106", "Max" : "106"}
	, {"Name" : "Interval", "Min" : "106", "Max" : "106"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 16 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 16 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 16 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 16 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 16 } } }
	p_read5 { ap_none {  { p_read5 in_data 0 16 } } }
	p_read6 { ap_none {  { p_read6 in_data 0 16 } } }
	p_read7 { ap_none {  { p_read7 in_data 0 16 } } }
	p_read8 { ap_none {  { p_read8 in_data 0 16 } } }
	p_read9 { ap_none {  { p_read9 in_data 0 16 } } }
	p_read10 { ap_none {  { p_read10 in_data 0 16 } } }
	p_read11 { ap_none {  { p_read11 in_data 0 16 } } }
	p_read12 { ap_none {  { p_read12 in_data 0 16 } } }
	p_read13 { ap_none {  { p_read13 in_data 0 16 } } }
	p_read14 { ap_none {  { p_read14 in_data 0 16 } } }
	p_read15 { ap_none {  { p_read15 in_data 0 16 } } }
}
