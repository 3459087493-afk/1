set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_155_16}
set C_modelType { void 0 }
set C_modelArgList {
	{ key_value_V int 24 regular {array 224 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 3 3 } 1 1 }  }
	{ zext_ln837 int 7 regular  }
	{ attention float 32 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ sext_ln818_1 int 20 regular  }
	{ sext_ln1347_7 int 20 regular  }
	{ sext_ln1347_8 int 20 regular  }
	{ sext_ln1347_9 int 20 regular  }
	{ sext_ln1347_10 int 20 regular  }
	{ sext_ln1347_11 int 20 regular  }
	{ sext_ln1347_12 int 20 regular  }
	{ sext_ln1347_13 int 20 regular  }
	{ sext_ln1347_14 int 20 regular  }
	{ sext_ln1347_15 int 20 regular  }
	{ sext_ln1347_16 int 20 regular  }
	{ sext_ln1347_17 int 20 regular  }
	{ sext_ln1347_18 int 20 regular  }
	{ sext_ln1347_19 int 20 regular  }
	{ conv_i115 int 23 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key_value_V", "interface" : "memory", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "attention", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln818_1", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_7", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_8", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_9", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_10", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_11", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_12", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_13", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_14", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_15", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_16", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_17", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_18", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln1347_19", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i115", "interface" : "wire", "bitwidth" : 23, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 68
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_value_V_address0 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q0 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address1 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q1 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address2 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q2 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address3 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q3 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address4 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q4 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address5 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q5 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address6 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q6 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address7 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q7 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address8 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce8 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q8 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address9 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce9 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q9 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address10 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce10 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q10 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address11 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce11 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q11 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address12 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce12 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q12 sc_in sc_lv 24 signal 0 } 
	{ key_value_V_address13 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce13 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q13 sc_in sc_lv 24 signal 0 } 
	{ zext_ln837 sc_in sc_lv 7 signal 1 } 
	{ attention_address0 sc_out sc_lv 7 signal 2 } 
	{ attention_ce0 sc_out sc_logic 1 signal 2 } 
	{ attention_we0 sc_out sc_logic 1 signal 2 } 
	{ attention_d0 sc_out sc_lv 32 signal 2 } 
	{ sext_ln818_1 sc_in sc_lv 20 signal 3 } 
	{ sext_ln1347_7 sc_in sc_lv 20 signal 4 } 
	{ sext_ln1347_8 sc_in sc_lv 20 signal 5 } 
	{ sext_ln1347_9 sc_in sc_lv 20 signal 6 } 
	{ sext_ln1347_10 sc_in sc_lv 20 signal 7 } 
	{ sext_ln1347_11 sc_in sc_lv 20 signal 8 } 
	{ sext_ln1347_12 sc_in sc_lv 20 signal 9 } 
	{ sext_ln1347_13 sc_in sc_lv 20 signal 10 } 
	{ sext_ln1347_14 sc_in sc_lv 20 signal 11 } 
	{ sext_ln1347_15 sc_in sc_lv 20 signal 12 } 
	{ sext_ln1347_16 sc_in sc_lv 20 signal 13 } 
	{ sext_ln1347_17 sc_in sc_lv 20 signal 14 } 
	{ sext_ln1347_18 sc_in sc_lv 20 signal 15 } 
	{ sext_ln1347_19 sc_in sc_lv 20 signal 16 } 
	{ conv_i115 sc_in sc_lv 23 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "key_value_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address0" }} , 
 	{ "name": "key_value_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce0" }} , 
 	{ "name": "key_value_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q0" }} , 
 	{ "name": "key_value_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address1" }} , 
 	{ "name": "key_value_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce1" }} , 
 	{ "name": "key_value_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q1" }} , 
 	{ "name": "key_value_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address2" }} , 
 	{ "name": "key_value_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce2" }} , 
 	{ "name": "key_value_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q2" }} , 
 	{ "name": "key_value_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address3" }} , 
 	{ "name": "key_value_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce3" }} , 
 	{ "name": "key_value_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q3" }} , 
 	{ "name": "key_value_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address4" }} , 
 	{ "name": "key_value_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce4" }} , 
 	{ "name": "key_value_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q4" }} , 
 	{ "name": "key_value_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address5" }} , 
 	{ "name": "key_value_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce5" }} , 
 	{ "name": "key_value_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q5" }} , 
 	{ "name": "key_value_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address6" }} , 
 	{ "name": "key_value_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce6" }} , 
 	{ "name": "key_value_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q6" }} , 
 	{ "name": "key_value_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address7" }} , 
 	{ "name": "key_value_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce7" }} , 
 	{ "name": "key_value_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q7" }} , 
 	{ "name": "key_value_V_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address8" }} , 
 	{ "name": "key_value_V_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce8" }} , 
 	{ "name": "key_value_V_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q8" }} , 
 	{ "name": "key_value_V_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address9" }} , 
 	{ "name": "key_value_V_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce9" }} , 
 	{ "name": "key_value_V_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q9" }} , 
 	{ "name": "key_value_V_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address10" }} , 
 	{ "name": "key_value_V_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce10" }} , 
 	{ "name": "key_value_V_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q10" }} , 
 	{ "name": "key_value_V_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address11" }} , 
 	{ "name": "key_value_V_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce11" }} , 
 	{ "name": "key_value_V_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q11" }} , 
 	{ "name": "key_value_V_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address12" }} , 
 	{ "name": "key_value_V_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce12" }} , 
 	{ "name": "key_value_V_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q12" }} , 
 	{ "name": "key_value_V_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address13" }} , 
 	{ "name": "key_value_V_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce13" }} , 
 	{ "name": "key_value_V_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "key_value_V", "role": "q13" }} , 
 	{ "name": "zext_ln837", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln837", "role": "default" }} , 
 	{ "name": "attention_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address0" }} , 
 	{ "name": "attention_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce0" }} , 
 	{ "name": "attention_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "we0" }} , 
 	{ "name": "attention_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "d0" }} , 
 	{ "name": "sext_ln818_1", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln818_1", "role": "default" }} , 
 	{ "name": "sext_ln1347_7", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_7", "role": "default" }} , 
 	{ "name": "sext_ln1347_8", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_8", "role": "default" }} , 
 	{ "name": "sext_ln1347_9", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_9", "role": "default" }} , 
 	{ "name": "sext_ln1347_10", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_10", "role": "default" }} , 
 	{ "name": "sext_ln1347_11", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_11", "role": "default" }} , 
 	{ "name": "sext_ln1347_12", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_12", "role": "default" }} , 
 	{ "name": "sext_ln1347_13", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_13", "role": "default" }} , 
 	{ "name": "sext_ln1347_14", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_14", "role": "default" }} , 
 	{ "name": "sext_ln1347_15", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_15", "role": "default" }} , 
 	{ "name": "sext_ln1347_16", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_16", "role": "default" }} , 
 	{ "name": "sext_ln1347_17", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_17", "role": "default" }} , 
 	{ "name": "sext_ln1347_18", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_18", "role": "default" }} , 
 	{ "name": "sext_ln1347_19", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "sext_ln1347_19", "role": "default" }} , 
 	{ "name": "conv_i115", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "conv_i115", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U226", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U227", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U228", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U229", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U230", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U231", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U232", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U233", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U234", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U235", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U236", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U237", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U238", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_20s_24s_38_1_1_U239", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_38ns_24ns_38_42_1_U240", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		conv_i115 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "73", "Max" : "73"}
	, {"Name" : "Interval", "Min" : "73", "Max" : "73"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	key_value_V { ap_memory {  { key_value_V_address0 mem_address 1 8 }  { key_value_V_ce0 mem_ce 1 1 }  { key_value_V_q0 mem_dout 0 24 }  { key_value_V_address1 MemPortADDR2 1 8 }  { key_value_V_ce1 MemPortCE2 1 1 }  { key_value_V_q1 MemPortDOUT2 0 24 }  { key_value_V_address2 MemPortADDR2 1 8 }  { key_value_V_ce2 MemPortCE2 1 1 }  { key_value_V_q2 MemPortDOUT2 0 24 }  { key_value_V_address3 MemPortADDR2 1 8 }  { key_value_V_ce3 MemPortCE2 1 1 }  { key_value_V_q3 MemPortDOUT2 0 24 }  { key_value_V_address4 MemPortADDR2 1 8 }  { key_value_V_ce4 MemPortCE2 1 1 }  { key_value_V_q4 MemPortDOUT2 0 24 }  { key_value_V_address5 MemPortADDR2 1 8 }  { key_value_V_ce5 MemPortCE2 1 1 }  { key_value_V_q5 MemPortDOUT2 0 24 }  { key_value_V_address6 MemPortADDR2 1 8 }  { key_value_V_ce6 MemPortCE2 1 1 }  { key_value_V_q6 MemPortDOUT2 0 24 }  { key_value_V_address7 MemPortADDR2 1 8 }  { key_value_V_ce7 MemPortCE2 1 1 }  { key_value_V_q7 MemPortDOUT2 0 24 }  { key_value_V_address8 MemPortADDR2 1 8 }  { key_value_V_ce8 MemPortCE2 1 1 }  { key_value_V_q8 MemPortDOUT2 0 24 }  { key_value_V_address9 MemPortADDR2 1 8 }  { key_value_V_ce9 MemPortCE2 1 1 }  { key_value_V_q9 MemPortDOUT2 0 24 }  { key_value_V_address10 MemPortADDR2 1 8 }  { key_value_V_ce10 MemPortCE2 1 1 }  { key_value_V_q10 MemPortDOUT2 0 24 }  { key_value_V_address11 MemPortADDR2 1 8 }  { key_value_V_ce11 MemPortCE2 1 1 }  { key_value_V_q11 MemPortDOUT2 0 24 }  { key_value_V_address12 MemPortADDR2 1 8 }  { key_value_V_ce12 MemPortCE2 1 1 }  { key_value_V_q12 MemPortDOUT2 0 24 }  { key_value_V_address13 MemPortADDR2 1 8 }  { key_value_V_ce13 MemPortCE2 1 1 }  { key_value_V_q13 MemPortDOUT2 0 24 } } }
	zext_ln837 { ap_none {  { zext_ln837 in_data 0 7 } } }
	attention { ap_memory {  { attention_address0 mem_address 1 7 }  { attention_ce0 mem_ce 1 1 }  { attention_we0 mem_we 1 1 }  { attention_d0 mem_din 1 32 } } }
	sext_ln818_1 { ap_none {  { sext_ln818_1 in_data 0 20 } } }
	sext_ln1347_7 { ap_none {  { sext_ln1347_7 in_data 0 20 } } }
	sext_ln1347_8 { ap_none {  { sext_ln1347_8 in_data 0 20 } } }
	sext_ln1347_9 { ap_none {  { sext_ln1347_9 in_data 0 20 } } }
	sext_ln1347_10 { ap_none {  { sext_ln1347_10 in_data 0 20 } } }
	sext_ln1347_11 { ap_none {  { sext_ln1347_11 in_data 0 20 } } }
	sext_ln1347_12 { ap_none {  { sext_ln1347_12 in_data 0 20 } } }
	sext_ln1347_13 { ap_none {  { sext_ln1347_13 in_data 0 20 } } }
	sext_ln1347_14 { ap_none {  { sext_ln1347_14 in_data 0 20 } } }
	sext_ln1347_15 { ap_none {  { sext_ln1347_15 in_data 0 20 } } }
	sext_ln1347_16 { ap_none {  { sext_ln1347_16 in_data 0 20 } } }
	sext_ln1347_17 { ap_none {  { sext_ln1347_17 in_data 0 20 } } }
	sext_ln1347_18 { ap_none {  { sext_ln1347_18 in_data 0 20 } } }
	sext_ln1347_19 { ap_none {  { sext_ln1347_19 in_data 0 20 } } }
	conv_i115 { ap_none {  { conv_i115 in_data 0 23 } } }
}
