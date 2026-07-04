set moduleName linear_attention_q16_Pipeline_VITIS_LOOP_121_4_VITIS_LOOP_122_5
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
set C_modelName {linear_attention_q16_Pipeline_VITIS_LOOP_121_4_VITIS_LOOP_122_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ K_V int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ K_V_1 int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ K_V_2 int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ K_V_3 int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ KV_V_3 int 16 regular {array 64 { 0 3 } 0 1 }  }
	{ KV_V_2 int 16 regular {array 64 { 0 3 } 0 1 }  }
	{ KV_V_1 int 16 regular {array 64 { 0 3 } 0 1 }  }
	{ KV_V int 16 regular {array 64 { 0 3 } 0 1 }  }
	{ V_V int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ V_V_1 int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ V_V_2 int 16 regular {array 64 { 1 1 } 1 1 }  }
	{ V_V_3 int 16 regular {array 64 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "K_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K_V_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K_V_2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "K_V_3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "KV_V_3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "KV_V_2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "KV_V_1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "KV_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "V_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "V_V_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "V_V_2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "V_V_3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ K_V_address0 sc_out sc_lv 6 signal 0 } 
	{ K_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ K_V_q0 sc_in sc_lv 16 signal 0 } 
	{ K_V_address1 sc_out sc_lv 6 signal 0 } 
	{ K_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ K_V_q1 sc_in sc_lv 16 signal 0 } 
	{ K_V_1_address0 sc_out sc_lv 6 signal 1 } 
	{ K_V_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ K_V_1_q0 sc_in sc_lv 16 signal 1 } 
	{ K_V_1_address1 sc_out sc_lv 6 signal 1 } 
	{ K_V_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ K_V_1_q1 sc_in sc_lv 16 signal 1 } 
	{ K_V_2_address0 sc_out sc_lv 6 signal 2 } 
	{ K_V_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ K_V_2_q0 sc_in sc_lv 16 signal 2 } 
	{ K_V_2_address1 sc_out sc_lv 6 signal 2 } 
	{ K_V_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ K_V_2_q1 sc_in sc_lv 16 signal 2 } 
	{ K_V_3_address0 sc_out sc_lv 6 signal 3 } 
	{ K_V_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ K_V_3_q0 sc_in sc_lv 16 signal 3 } 
	{ K_V_3_address1 sc_out sc_lv 6 signal 3 } 
	{ K_V_3_ce1 sc_out sc_logic 1 signal 3 } 
	{ K_V_3_q1 sc_in sc_lv 16 signal 3 } 
	{ KV_V_3_address0 sc_out sc_lv 6 signal 4 } 
	{ KV_V_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ KV_V_3_we0 sc_out sc_logic 1 signal 4 } 
	{ KV_V_3_d0 sc_out sc_lv 16 signal 4 } 
	{ KV_V_2_address0 sc_out sc_lv 6 signal 5 } 
	{ KV_V_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ KV_V_2_we0 sc_out sc_logic 1 signal 5 } 
	{ KV_V_2_d0 sc_out sc_lv 16 signal 5 } 
	{ KV_V_1_address0 sc_out sc_lv 6 signal 6 } 
	{ KV_V_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ KV_V_1_we0 sc_out sc_logic 1 signal 6 } 
	{ KV_V_1_d0 sc_out sc_lv 16 signal 6 } 
	{ KV_V_address0 sc_out sc_lv 6 signal 7 } 
	{ KV_V_ce0 sc_out sc_logic 1 signal 7 } 
	{ KV_V_we0 sc_out sc_logic 1 signal 7 } 
	{ KV_V_d0 sc_out sc_lv 16 signal 7 } 
	{ V_V_address0 sc_out sc_lv 6 signal 8 } 
	{ V_V_ce0 sc_out sc_logic 1 signal 8 } 
	{ V_V_q0 sc_in sc_lv 16 signal 8 } 
	{ V_V_address1 sc_out sc_lv 6 signal 8 } 
	{ V_V_ce1 sc_out sc_logic 1 signal 8 } 
	{ V_V_q1 sc_in sc_lv 16 signal 8 } 
	{ V_V_1_address0 sc_out sc_lv 6 signal 9 } 
	{ V_V_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ V_V_1_q0 sc_in sc_lv 16 signal 9 } 
	{ V_V_1_address1 sc_out sc_lv 6 signal 9 } 
	{ V_V_1_ce1 sc_out sc_logic 1 signal 9 } 
	{ V_V_1_q1 sc_in sc_lv 16 signal 9 } 
	{ V_V_2_address0 sc_out sc_lv 6 signal 10 } 
	{ V_V_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ V_V_2_q0 sc_in sc_lv 16 signal 10 } 
	{ V_V_2_address1 sc_out sc_lv 6 signal 10 } 
	{ V_V_2_ce1 sc_out sc_logic 1 signal 10 } 
	{ V_V_2_q1 sc_in sc_lv 16 signal 10 } 
	{ V_V_3_address0 sc_out sc_lv 6 signal 11 } 
	{ V_V_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ V_V_3_q0 sc_in sc_lv 16 signal 11 } 
	{ V_V_3_address1 sc_out sc_lv 6 signal 11 } 
	{ V_V_3_ce1 sc_out sc_logic 1 signal 11 } 
	{ V_V_3_q1 sc_in sc_lv 16 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "K_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V", "role": "address0" }} , 
 	{ "name": "K_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V", "role": "ce0" }} , 
 	{ "name": "K_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V", "role": "q0" }} , 
 	{ "name": "K_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V", "role": "address1" }} , 
 	{ "name": "K_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V", "role": "ce1" }} , 
 	{ "name": "K_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V", "role": "q1" }} , 
 	{ "name": "K_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_1", "role": "address0" }} , 
 	{ "name": "K_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_1", "role": "ce0" }} , 
 	{ "name": "K_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_1", "role": "q0" }} , 
 	{ "name": "K_V_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_1", "role": "address1" }} , 
 	{ "name": "K_V_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_1", "role": "ce1" }} , 
 	{ "name": "K_V_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_1", "role": "q1" }} , 
 	{ "name": "K_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_2", "role": "address0" }} , 
 	{ "name": "K_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_2", "role": "ce0" }} , 
 	{ "name": "K_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_2", "role": "q0" }} , 
 	{ "name": "K_V_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_2", "role": "address1" }} , 
 	{ "name": "K_V_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_2", "role": "ce1" }} , 
 	{ "name": "K_V_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_2", "role": "q1" }} , 
 	{ "name": "K_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_3", "role": "address0" }} , 
 	{ "name": "K_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_3", "role": "ce0" }} , 
 	{ "name": "K_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_3", "role": "q0" }} , 
 	{ "name": "K_V_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "K_V_3", "role": "address1" }} , 
 	{ "name": "K_V_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "K_V_3", "role": "ce1" }} , 
 	{ "name": "K_V_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "K_V_3", "role": "q1" }} , 
 	{ "name": "KV_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "KV_V_3", "role": "address0" }} , 
 	{ "name": "KV_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_3", "role": "ce0" }} , 
 	{ "name": "KV_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_3", "role": "we0" }} , 
 	{ "name": "KV_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "KV_V_3", "role": "d0" }} , 
 	{ "name": "KV_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "KV_V_2", "role": "address0" }} , 
 	{ "name": "KV_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_2", "role": "ce0" }} , 
 	{ "name": "KV_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_2", "role": "we0" }} , 
 	{ "name": "KV_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "KV_V_2", "role": "d0" }} , 
 	{ "name": "KV_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "KV_V_1", "role": "address0" }} , 
 	{ "name": "KV_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_1", "role": "ce0" }} , 
 	{ "name": "KV_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V_1", "role": "we0" }} , 
 	{ "name": "KV_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "KV_V_1", "role": "d0" }} , 
 	{ "name": "KV_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "KV_V", "role": "address0" }} , 
 	{ "name": "KV_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V", "role": "ce0" }} , 
 	{ "name": "KV_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "KV_V", "role": "we0" }} , 
 	{ "name": "KV_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "KV_V", "role": "d0" }} , 
 	{ "name": "V_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V", "role": "address0" }} , 
 	{ "name": "V_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V", "role": "ce0" }} , 
 	{ "name": "V_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V", "role": "q0" }} , 
 	{ "name": "V_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V", "role": "address1" }} , 
 	{ "name": "V_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V", "role": "ce1" }} , 
 	{ "name": "V_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V", "role": "q1" }} , 
 	{ "name": "V_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_1", "role": "address0" }} , 
 	{ "name": "V_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_1", "role": "ce0" }} , 
 	{ "name": "V_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_1", "role": "q0" }} , 
 	{ "name": "V_V_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_1", "role": "address1" }} , 
 	{ "name": "V_V_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_1", "role": "ce1" }} , 
 	{ "name": "V_V_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_1", "role": "q1" }} , 
 	{ "name": "V_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_2", "role": "address0" }} , 
 	{ "name": "V_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_2", "role": "ce0" }} , 
 	{ "name": "V_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_2", "role": "q0" }} , 
 	{ "name": "V_V_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_2", "role": "address1" }} , 
 	{ "name": "V_V_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_2", "role": "ce1" }} , 
 	{ "name": "V_V_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_2", "role": "q1" }} , 
 	{ "name": "V_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_3", "role": "address0" }} , 
 	{ "name": "V_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_3", "role": "ce0" }} , 
 	{ "name": "V_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_3", "role": "q0" }} , 
 	{ "name": "V_V_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "V_V_3", "role": "address1" }} , 
 	{ "name": "V_V_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "V_V_3", "role": "ce1" }} , 
 	{ "name": "V_V_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "V_V_3", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
		"CDFG" : "linear_attention_q16_Pipeline_VITIS_LOOP_121_4_VITIS_LOOP_122_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2067", "EstimateLatencyMax" : "2067",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "K_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "K_V_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "KV_V_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "KV_V_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "KV_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "KV_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "V_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "V_V_3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_4_VITIS_LOOP_122_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage6", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage6_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1364", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1365", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1366", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1367", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1368", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_16_1_1_U1369", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_26_4_1_U1370", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1371", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1372", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1373", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1374", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1375", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1376", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1377", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1378", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1379", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1380", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1381", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1382", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1383", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1384", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_26ns_26_4_1_U1385", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	linear_attention_q16_Pipeline_VITIS_LOOP_121_4_VITIS_LOOP_122_5 {
		K_V {Type I LastRead 17 FirstWrite -1}
		K_V_1 {Type I LastRead 17 FirstWrite -1}
		K_V_2 {Type I LastRead 17 FirstWrite -1}
		K_V_3 {Type I LastRead 17 FirstWrite -1}
		KV_V_3 {Type O LastRead -1 FirstWrite 22}
		KV_V_2 {Type O LastRead -1 FirstWrite 22}
		KV_V_1 {Type O LastRead -1 FirstWrite 22}
		KV_V {Type O LastRead -1 FirstWrite 22}
		V_V {Type I LastRead 16 FirstWrite -1}
		V_V_1 {Type I LastRead 16 FirstWrite -1}
		V_V_2 {Type I LastRead 16 FirstWrite -1}
		V_V_3 {Type I LastRead 16 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2067", "Max" : "2067"}
	, {"Name" : "Interval", "Min" : "2067", "Max" : "2067"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	K_V { ap_memory {  { K_V_address0 mem_address 1 6 }  { K_V_ce0 mem_ce 1 1 }  { K_V_q0 in_data 0 16 }  { K_V_address1 MemPortADDR2 1 6 }  { K_V_ce1 MemPortCE2 1 1 }  { K_V_q1 in_data 0 16 } } }
	K_V_1 { ap_memory {  { K_V_1_address0 mem_address 1 6 }  { K_V_1_ce0 mem_ce 1 1 }  { K_V_1_q0 in_data 0 16 }  { K_V_1_address1 MemPortADDR2 1 6 }  { K_V_1_ce1 MemPortCE2 1 1 }  { K_V_1_q1 in_data 0 16 } } }
	K_V_2 { ap_memory {  { K_V_2_address0 mem_address 1 6 }  { K_V_2_ce0 mem_ce 1 1 }  { K_V_2_q0 in_data 0 16 }  { K_V_2_address1 MemPortADDR2 1 6 }  { K_V_2_ce1 MemPortCE2 1 1 }  { K_V_2_q1 in_data 0 16 } } }
	K_V_3 { ap_memory {  { K_V_3_address0 mem_address 1 6 }  { K_V_3_ce0 mem_ce 1 1 }  { K_V_3_q0 in_data 0 16 }  { K_V_3_address1 MemPortADDR2 1 6 }  { K_V_3_ce1 MemPortCE2 1 1 }  { K_V_3_q1 in_data 0 16 } } }
	KV_V_3 { ap_memory {  { KV_V_3_address0 mem_address 1 6 }  { KV_V_3_ce0 mem_ce 1 1 }  { KV_V_3_we0 mem_we 1 1 }  { KV_V_3_d0 mem_din 1 16 } } }
	KV_V_2 { ap_memory {  { KV_V_2_address0 mem_address 1 6 }  { KV_V_2_ce0 mem_ce 1 1 }  { KV_V_2_we0 mem_we 1 1 }  { KV_V_2_d0 mem_din 1 16 } } }
	KV_V_1 { ap_memory {  { KV_V_1_address0 mem_address 1 6 }  { KV_V_1_ce0 mem_ce 1 1 }  { KV_V_1_we0 mem_we 1 1 }  { KV_V_1_d0 mem_din 1 16 } } }
	KV_V { ap_memory {  { KV_V_address0 mem_address 1 6 }  { KV_V_ce0 mem_ce 1 1 }  { KV_V_we0 mem_we 1 1 }  { KV_V_d0 mem_din 1 16 } } }
	V_V { ap_memory {  { V_V_address0 mem_address 1 6 }  { V_V_ce0 mem_ce 1 1 }  { V_V_q0 in_data 0 16 }  { V_V_address1 MemPortADDR2 1 6 }  { V_V_ce1 MemPortCE2 1 1 }  { V_V_q1 in_data 0 16 } } }
	V_V_1 { ap_memory {  { V_V_1_address0 mem_address 1 6 }  { V_V_1_ce0 mem_ce 1 1 }  { V_V_1_q0 in_data 0 16 }  { V_V_1_address1 MemPortADDR2 1 6 }  { V_V_1_ce1 MemPortCE2 1 1 }  { V_V_1_q1 in_data 0 16 } } }
	V_V_2 { ap_memory {  { V_V_2_address0 mem_address 1 6 }  { V_V_2_ce0 mem_ce 1 1 }  { V_V_2_q0 in_data 0 16 }  { V_V_2_address1 MemPortADDR2 1 6 }  { V_V_2_ce1 MemPortCE2 1 1 }  { V_V_2_q1 in_data 0 16 } } }
	V_V_3 { ap_memory {  { V_V_3_address0 mem_address 1 6 }  { V_V_3_ce0 mem_ce 1 1 }  { V_V_3_q0 in_data 0 16 }  { V_V_3_address1 MemPortADDR2 1 6 }  { V_V_3_ce1 MemPortCE2 1 1 }  { V_V_3_q1 in_data 0 16 } } }
}
