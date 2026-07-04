set moduleName layer_norm_2d_ap_fixed_ap_fixed_ap_fixed_ap_fixed_16_6_0_0_0_s
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
set C_modelName {layer_norm_2d<ap_fixed,ap_fixed,ap_fixed,ap_fixed<16,6,0,0,0>>}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 16 regular {array 128 { 1 1 } 1 1 }  }
	{ output_r int 16 regular {array 128 { 0 0 } 0 1 }  }
	{ p_read int 11 regular  }
	{ p_read1 int 9 regular  }
	{ p_read2 int 10 regular  }
	{ p_read3 int 10 regular  }
	{ p_read4 int 10 regular  }
	{ p_read5 int 11 regular  }
	{ p_read6 int 9 regular  }
	{ p_read7 int 10 regular  }
	{ p_read8 int 10 regular  }
	{ p_read9 int 11 regular  }
	{ p_read10 int 9 regular  }
	{ p_read11 int 9 regular  }
	{ p_read12 int 10 regular  }
	{ p_read13 int 10 regular  }
	{ p_read14 int 11 regular  }
	{ p_read15 int 9 regular  }
	{ p_read16 int 7 regular  }
	{ p_read17 int 9 regular  }
	{ p_read18 int 8 regular  }
	{ p_read19 int 7 regular  }
	{ p_read20 int 6 regular  }
	{ p_read21 int 7 regular  }
	{ p_read22 int 6 regular  }
	{ p_read23 int 5 regular  }
	{ p_read24 int 8 regular  }
	{ p_read25 int 8 regular  }
	{ p_read26 int 7 regular  }
	{ p_read27 int 8 regular  }
	{ p_read28 int 8 regular  }
	{ p_read29 int 9 regular  }
	{ p_read30 int 7 regular  }
	{ p_read31 int 8 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read5", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "p_read6", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read7", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read8", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read9", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "p_read10", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read11", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read12", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read13", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "p_read14", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "p_read15", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read16", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read17", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read18", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read19", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read20", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "p_read21", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read22", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "p_read23", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "p_read24", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read25", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read26", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read27", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read28", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_read29", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "p_read30", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read31", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 52
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
	{ input_r_address1 sc_out sc_lv 7 signal 0 } 
	{ input_r_ce1 sc_out sc_logic 1 signal 0 } 
	{ input_r_q1 sc_in sc_lv 16 signal 0 } 
	{ output_r_address0 sc_out sc_lv 7 signal 1 } 
	{ output_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_r_we0 sc_out sc_logic 1 signal 1 } 
	{ output_r_d0 sc_out sc_lv 16 signal 1 } 
	{ output_r_address1 sc_out sc_lv 7 signal 1 } 
	{ output_r_ce1 sc_out sc_logic 1 signal 1 } 
	{ output_r_we1 sc_out sc_logic 1 signal 1 } 
	{ output_r_d1 sc_out sc_lv 16 signal 1 } 
	{ p_read sc_in sc_lv 11 signal 2 } 
	{ p_read1 sc_in sc_lv 9 signal 3 } 
	{ p_read2 sc_in sc_lv 10 signal 4 } 
	{ p_read3 sc_in sc_lv 10 signal 5 } 
	{ p_read4 sc_in sc_lv 10 signal 6 } 
	{ p_read5 sc_in sc_lv 11 signal 7 } 
	{ p_read6 sc_in sc_lv 9 signal 8 } 
	{ p_read7 sc_in sc_lv 10 signal 9 } 
	{ p_read8 sc_in sc_lv 10 signal 10 } 
	{ p_read9 sc_in sc_lv 11 signal 11 } 
	{ p_read10 sc_in sc_lv 9 signal 12 } 
	{ p_read11 sc_in sc_lv 9 signal 13 } 
	{ p_read12 sc_in sc_lv 10 signal 14 } 
	{ p_read13 sc_in sc_lv 10 signal 15 } 
	{ p_read14 sc_in sc_lv 11 signal 16 } 
	{ p_read15 sc_in sc_lv 9 signal 17 } 
	{ p_read16 sc_in sc_lv 7 signal 18 } 
	{ p_read17 sc_in sc_lv 9 signal 19 } 
	{ p_read18 sc_in sc_lv 8 signal 20 } 
	{ p_read19 sc_in sc_lv 7 signal 21 } 
	{ p_read20 sc_in sc_lv 6 signal 22 } 
	{ p_read21 sc_in sc_lv 7 signal 23 } 
	{ p_read22 sc_in sc_lv 6 signal 24 } 
	{ p_read23 sc_in sc_lv 5 signal 25 } 
	{ p_read24 sc_in sc_lv 8 signal 26 } 
	{ p_read25 sc_in sc_lv 8 signal 27 } 
	{ p_read26 sc_in sc_lv 7 signal 28 } 
	{ p_read27 sc_in sc_lv 8 signal 29 } 
	{ p_read28 sc_in sc_lv 8 signal 30 } 
	{ p_read29 sc_in sc_lv 9 signal 31 } 
	{ p_read30 sc_in sc_lv 7 signal 32 } 
	{ p_read31 sc_in sc_lv 8 signal 33 } 
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
 	{ "name": "input_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "input_r", "role": "address1" }} , 
 	{ "name": "input_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce1" }} , 
 	{ "name": "input_r_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_r", "role": "q1" }} , 
 	{ "name": "output_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "output_r", "role": "address0" }} , 
 	{ "name": "output_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce0" }} , 
 	{ "name": "output_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we0" }} , 
 	{ "name": "output_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_r", "role": "d0" }} , 
 	{ "name": "output_r_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "output_r", "role": "address1" }} , 
 	{ "name": "output_r_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce1" }} , 
 	{ "name": "output_r_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we1" }} , 
 	{ "name": "output_r_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_r", "role": "d1" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "p_read5", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_read5", "role": "default" }} , 
 	{ "name": "p_read6", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read6", "role": "default" }} , 
 	{ "name": "p_read7", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read7", "role": "default" }} , 
 	{ "name": "p_read8", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read8", "role": "default" }} , 
 	{ "name": "p_read9", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_read9", "role": "default" }} , 
 	{ "name": "p_read10", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read10", "role": "default" }} , 
 	{ "name": "p_read11", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read11", "role": "default" }} , 
 	{ "name": "p_read12", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read12", "role": "default" }} , 
 	{ "name": "p_read13", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_read13", "role": "default" }} , 
 	{ "name": "p_read14", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_read14", "role": "default" }} , 
 	{ "name": "p_read15", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read15", "role": "default" }} , 
 	{ "name": "p_read16", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read16", "role": "default" }} , 
 	{ "name": "p_read17", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read17", "role": "default" }} , 
 	{ "name": "p_read18", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read18", "role": "default" }} , 
 	{ "name": "p_read19", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read19", "role": "default" }} , 
 	{ "name": "p_read20", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read20", "role": "default" }} , 
 	{ "name": "p_read21", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read21", "role": "default" }} , 
 	{ "name": "p_read22", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read22", "role": "default" }} , 
 	{ "name": "p_read23", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "p_read23", "role": "default" }} , 
 	{ "name": "p_read24", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read24", "role": "default" }} , 
 	{ "name": "p_read25", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read25", "role": "default" }} , 
 	{ "name": "p_read26", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read26", "role": "default" }} , 
 	{ "name": "p_read27", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read27", "role": "default" }} , 
 	{ "name": "p_read28", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read28", "role": "default" }} , 
 	{ "name": "p_read29", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "p_read29", "role": "default" }} , 
 	{ "name": "p_read30", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read30", "role": "default" }} , 
 	{ "name": "p_read31", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read31", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U260", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_16_no_dsp_1_U261", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U262", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_16_no_dsp_1_U263", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U264", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U265", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U266", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U267", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U268", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U269", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U270", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U271", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U272", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U273", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U274", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U275", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U276", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U277", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U278", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_20s_40_1_1_U279", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U280", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U281", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U282", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U283", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U284", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U285", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U286", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U287", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U288", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U289", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U290", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U291", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U292", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U293", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U294", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_32_4_1_U295", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_15ns_35_4_1_U296", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U297", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U298", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U299", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U300", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_15ns_35_4_1_U301", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U302", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U303", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U304", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_15ns_35_4_1_U305", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U306", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U307", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_13s_33_4_1_U308", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U309", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_15ns_35_4_1_U310", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_20s_14ns_34_4_1_U311", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		p_read31 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "158", "Max" : "158"}
	, {"Name" : "Interval", "Min" : "158", "Max" : "158"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 7 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 16 }  { input_r_address1 MemPortADDR2 1 7 }  { input_r_ce1 MemPortCE2 1 1 }  { input_r_q1 MemPortDOUT2 0 16 } } }
	output_r { ap_memory {  { output_r_address0 mem_address 1 7 }  { output_r_ce0 mem_ce 1 1 }  { output_r_we0 mem_we 1 1 }  { output_r_d0 mem_din 1 16 }  { output_r_address1 MemPortADDR2 1 7 }  { output_r_ce1 MemPortCE2 1 1 }  { output_r_we1 MemPortWE2 1 1 }  { output_r_d1 MemPortDIN2 1 16 } } }
	p_read { ap_none {  { p_read in_data 0 11 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 9 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 10 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 10 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 10 } } }
	p_read5 { ap_none {  { p_read5 in_data 0 11 } } }
	p_read6 { ap_none {  { p_read6 in_data 0 9 } } }
	p_read7 { ap_none {  { p_read7 in_data 0 10 } } }
	p_read8 { ap_none {  { p_read8 in_data 0 10 } } }
	p_read9 { ap_none {  { p_read9 in_data 0 11 } } }
	p_read10 { ap_none {  { p_read10 in_data 0 9 } } }
	p_read11 { ap_none {  { p_read11 in_data 0 9 } } }
	p_read12 { ap_none {  { p_read12 in_data 0 10 } } }
	p_read13 { ap_none {  { p_read13 in_data 0 10 } } }
	p_read14 { ap_none {  { p_read14 in_data 0 11 } } }
	p_read15 { ap_none {  { p_read15 in_data 0 9 } } }
	p_read16 { ap_none {  { p_read16 in_data 0 7 } } }
	p_read17 { ap_none {  { p_read17 in_data 0 9 } } }
	p_read18 { ap_none {  { p_read18 in_data 0 8 } } }
	p_read19 { ap_none {  { p_read19 in_data 0 7 } } }
	p_read20 { ap_none {  { p_read20 in_data 0 6 } } }
	p_read21 { ap_none {  { p_read21 in_data 0 7 } } }
	p_read22 { ap_none {  { p_read22 in_data 0 6 } } }
	p_read23 { ap_none {  { p_read23 in_data 0 5 } } }
	p_read24 { ap_none {  { p_read24 in_data 0 8 } } }
	p_read25 { ap_none {  { p_read25 in_data 0 8 } } }
	p_read26 { ap_none {  { p_read26 in_data 0 7 } } }
	p_read27 { ap_none {  { p_read27 in_data 0 8 } } }
	p_read28 { ap_none {  { p_read28 in_data 0 8 } } }
	p_read29 { ap_none {  { p_read29 in_data 0 9 } } }
	p_read30 { ap_none {  { p_read30 in_data 0 7 } } }
	p_read31 { ap_none {  { p_read31 in_data 0 8 } } }
}
