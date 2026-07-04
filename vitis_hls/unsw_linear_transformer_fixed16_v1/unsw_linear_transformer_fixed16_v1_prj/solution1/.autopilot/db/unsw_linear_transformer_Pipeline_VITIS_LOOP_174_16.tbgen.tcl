set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16}
set C_modelType { void 0 }
set C_modelArgList {
	{ key_value_V int 28 regular {array 256 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ zext_ln837_5 int 7 regular  }
	{ attention_V int 16 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ sext_ln837_1 int 22 regular  }
	{ sext_ln837_2 int 22 regular  }
	{ sext_ln837_3 int 22 regular  }
	{ sext_ln837_4 int 22 regular  }
	{ sext_ln837_5 int 22 regular  }
	{ sext_ln837_6 int 22 regular  }
	{ sext_ln837_7 int 22 regular  }
	{ sext_ln837_8 int 22 regular  }
	{ sext_ln837_9 int 22 regular  }
	{ sext_ln837_10 int 22 regular  }
	{ sext_ln837_11 int 22 regular  }
	{ sext_ln837_12 int 22 regular  }
	{ sext_ln837_13 int 22 regular  }
	{ sext_ln837_14 int 22 regular  }
	{ sext_ln837_15 int 22 regular  }
	{ sext_ln174 int 22 regular  }
	{ conv_i2287 int 27 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key_value_V", "interface" : "memory", "bitwidth" : 28, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln837_5", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "attention_V", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln837_1", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_2", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_3", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_4", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_5", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_6", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_7", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_8", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_9", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_10", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_11", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_12", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_13", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_14", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln837_15", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln174", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i2287", "interface" : "wire", "bitwidth" : 27, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 76
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_value_V_address0 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q0 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address1 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q1 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address2 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce2 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q2 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address3 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce3 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q3 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address4 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce4 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q4 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address5 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce5 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q5 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address6 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce6 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q6 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address7 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce7 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q7 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address8 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce8 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q8 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address9 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce9 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q9 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address10 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce10 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q10 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address11 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce11 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q11 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address12 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce12 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q12 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address13 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce13 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q13 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address14 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce14 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q14 sc_in sc_lv 28 signal 0 } 
	{ key_value_V_address15 sc_out sc_lv 8 signal 0 } 
	{ key_value_V_ce15 sc_out sc_logic 1 signal 0 } 
	{ key_value_V_q15 sc_in sc_lv 28 signal 0 } 
	{ zext_ln837_5 sc_in sc_lv 7 signal 1 } 
	{ attention_V_address0 sc_out sc_lv 7 signal 2 } 
	{ attention_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ attention_V_we0 sc_out sc_logic 1 signal 2 } 
	{ attention_V_d0 sc_out sc_lv 16 signal 2 } 
	{ sext_ln837_1 sc_in sc_lv 22 signal 3 } 
	{ sext_ln837_2 sc_in sc_lv 22 signal 4 } 
	{ sext_ln837_3 sc_in sc_lv 22 signal 5 } 
	{ sext_ln837_4 sc_in sc_lv 22 signal 6 } 
	{ sext_ln837_5 sc_in sc_lv 22 signal 7 } 
	{ sext_ln837_6 sc_in sc_lv 22 signal 8 } 
	{ sext_ln837_7 sc_in sc_lv 22 signal 9 } 
	{ sext_ln837_8 sc_in sc_lv 22 signal 10 } 
	{ sext_ln837_9 sc_in sc_lv 22 signal 11 } 
	{ sext_ln837_10 sc_in sc_lv 22 signal 12 } 
	{ sext_ln837_11 sc_in sc_lv 22 signal 13 } 
	{ sext_ln837_12 sc_in sc_lv 22 signal 14 } 
	{ sext_ln837_13 sc_in sc_lv 22 signal 15 } 
	{ sext_ln837_14 sc_in sc_lv 22 signal 16 } 
	{ sext_ln837_15 sc_in sc_lv 22 signal 17 } 
	{ sext_ln174 sc_in sc_lv 22 signal 18 } 
	{ conv_i2287 sc_in sc_lv 27 signal 19 } 
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
 	{ "name": "key_value_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q0" }} , 
 	{ "name": "key_value_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address1" }} , 
 	{ "name": "key_value_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce1" }} , 
 	{ "name": "key_value_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q1" }} , 
 	{ "name": "key_value_V_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address2" }} , 
 	{ "name": "key_value_V_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce2" }} , 
 	{ "name": "key_value_V_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q2" }} , 
 	{ "name": "key_value_V_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address3" }} , 
 	{ "name": "key_value_V_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce3" }} , 
 	{ "name": "key_value_V_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q3" }} , 
 	{ "name": "key_value_V_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address4" }} , 
 	{ "name": "key_value_V_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce4" }} , 
 	{ "name": "key_value_V_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q4" }} , 
 	{ "name": "key_value_V_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address5" }} , 
 	{ "name": "key_value_V_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce5" }} , 
 	{ "name": "key_value_V_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q5" }} , 
 	{ "name": "key_value_V_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address6" }} , 
 	{ "name": "key_value_V_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce6" }} , 
 	{ "name": "key_value_V_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q6" }} , 
 	{ "name": "key_value_V_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address7" }} , 
 	{ "name": "key_value_V_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce7" }} , 
 	{ "name": "key_value_V_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q7" }} , 
 	{ "name": "key_value_V_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address8" }} , 
 	{ "name": "key_value_V_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce8" }} , 
 	{ "name": "key_value_V_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q8" }} , 
 	{ "name": "key_value_V_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address9" }} , 
 	{ "name": "key_value_V_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce9" }} , 
 	{ "name": "key_value_V_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q9" }} , 
 	{ "name": "key_value_V_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address10" }} , 
 	{ "name": "key_value_V_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce10" }} , 
 	{ "name": "key_value_V_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q10" }} , 
 	{ "name": "key_value_V_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address11" }} , 
 	{ "name": "key_value_V_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce11" }} , 
 	{ "name": "key_value_V_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q11" }} , 
 	{ "name": "key_value_V_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address12" }} , 
 	{ "name": "key_value_V_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce12" }} , 
 	{ "name": "key_value_V_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q12" }} , 
 	{ "name": "key_value_V_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address13" }} , 
 	{ "name": "key_value_V_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce13" }} , 
 	{ "name": "key_value_V_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q13" }} , 
 	{ "name": "key_value_V_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address14" }} , 
 	{ "name": "key_value_V_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce14" }} , 
 	{ "name": "key_value_V_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q14" }} , 
 	{ "name": "key_value_V_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value_V", "role": "address15" }} , 
 	{ "name": "key_value_V_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value_V", "role": "ce15" }} , 
 	{ "name": "key_value_V_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":28, "type": "signal", "bundle":{"name": "key_value_V", "role": "q15" }} , 
 	{ "name": "zext_ln837_5", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln837_5", "role": "default" }} , 
 	{ "name": "attention_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention_V", "role": "address0" }} , 
 	{ "name": "attention_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "ce0" }} , 
 	{ "name": "attention_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_V", "role": "we0" }} , 
 	{ "name": "attention_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "attention_V", "role": "d0" }} , 
 	{ "name": "sext_ln837_1", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_1", "role": "default" }} , 
 	{ "name": "sext_ln837_2", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_2", "role": "default" }} , 
 	{ "name": "sext_ln837_3", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_3", "role": "default" }} , 
 	{ "name": "sext_ln837_4", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_4", "role": "default" }} , 
 	{ "name": "sext_ln837_5", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_5", "role": "default" }} , 
 	{ "name": "sext_ln837_6", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_6", "role": "default" }} , 
 	{ "name": "sext_ln837_7", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_7", "role": "default" }} , 
 	{ "name": "sext_ln837_8", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_8", "role": "default" }} , 
 	{ "name": "sext_ln837_9", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_9", "role": "default" }} , 
 	{ "name": "sext_ln837_10", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_10", "role": "default" }} , 
 	{ "name": "sext_ln837_11", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_11", "role": "default" }} , 
 	{ "name": "sext_ln837_12", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_12", "role": "default" }} , 
 	{ "name": "sext_ln837_13", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_13", "role": "default" }} , 
 	{ "name": "sext_ln837_14", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_14", "role": "default" }} , 
 	{ "name": "sext_ln837_15", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln837_15", "role": "default" }} , 
 	{ "name": "sext_ln174", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln174", "role": "default" }} , 
 	{ "name": "conv_i2287", "direction": "in", "datatype": "sc_lv", "bitwidth":27, "type": "signal", "bundle":{"name": "conv_i2287", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "95", "EstimateLatencyMax" : "95",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_value_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sext_ln837_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln837_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln174", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv_i2287", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_174_16", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter78", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter78", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U185", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U186", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U187", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U188", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U189", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U190", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U191", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U192", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U193", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U194", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U195", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U196", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U197", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U198", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U199", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_22s_28s_50_3_1_U200", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sdiv_44ns_28ns_44_48_1_U201", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_174_16 {
		key_value_V {Type I LastRead 1 FirstWrite -1}
		zext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		attention_V {Type O LastRead -1 FirstWrite 78}
		sext_ln837_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln837_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln174 {Type I LastRead 0 FirstWrite -1}
		conv_i2287 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "95", "Max" : "95"}
	, {"Name" : "Interval", "Min" : "95", "Max" : "95"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	key_value_V { ap_memory {  { key_value_V_address0 mem_address 1 8 }  { key_value_V_ce0 mem_ce 1 1 }  { key_value_V_q0 mem_dout 0 28 }  { key_value_V_address1 MemPortADDR2 1 8 }  { key_value_V_ce1 MemPortCE2 1 1 }  { key_value_V_q1 MemPortDOUT2 0 28 }  { key_value_V_address2 MemPortADDR2 1 8 }  { key_value_V_ce2 MemPortCE2 1 1 }  { key_value_V_q2 MemPortDOUT2 0 28 }  { key_value_V_address3 MemPortADDR2 1 8 }  { key_value_V_ce3 MemPortCE2 1 1 }  { key_value_V_q3 MemPortDOUT2 0 28 }  { key_value_V_address4 MemPortADDR2 1 8 }  { key_value_V_ce4 MemPortCE2 1 1 }  { key_value_V_q4 MemPortDOUT2 0 28 }  { key_value_V_address5 MemPortADDR2 1 8 }  { key_value_V_ce5 MemPortCE2 1 1 }  { key_value_V_q5 MemPortDOUT2 0 28 }  { key_value_V_address6 MemPortADDR2 1 8 }  { key_value_V_ce6 MemPortCE2 1 1 }  { key_value_V_q6 MemPortDOUT2 0 28 }  { key_value_V_address7 MemPortADDR2 1 8 }  { key_value_V_ce7 MemPortCE2 1 1 }  { key_value_V_q7 MemPortDOUT2 0 28 }  { key_value_V_address8 MemPortADDR2 1 8 }  { key_value_V_ce8 MemPortCE2 1 1 }  { key_value_V_q8 MemPortDOUT2 0 28 }  { key_value_V_address9 MemPortADDR2 1 8 }  { key_value_V_ce9 MemPortCE2 1 1 }  { key_value_V_q9 MemPortDOUT2 0 28 }  { key_value_V_address10 MemPortADDR2 1 8 }  { key_value_V_ce10 MemPortCE2 1 1 }  { key_value_V_q10 MemPortDOUT2 0 28 }  { key_value_V_address11 MemPortADDR2 1 8 }  { key_value_V_ce11 MemPortCE2 1 1 }  { key_value_V_q11 MemPortDOUT2 0 28 }  { key_value_V_address12 MemPortADDR2 1 8 }  { key_value_V_ce12 MemPortCE2 1 1 }  { key_value_V_q12 MemPortDOUT2 0 28 }  { key_value_V_address13 MemPortADDR2 1 8 }  { key_value_V_ce13 MemPortCE2 1 1 }  { key_value_V_q13 MemPortDOUT2 0 28 }  { key_value_V_address14 MemPortADDR2 1 8 }  { key_value_V_ce14 MemPortCE2 1 1 }  { key_value_V_q14 MemPortDOUT2 0 28 }  { key_value_V_address15 MemPortADDR2 1 8 }  { key_value_V_ce15 MemPortCE2 1 1 }  { key_value_V_q15 MemPortDOUT2 0 28 } } }
	zext_ln837_5 { ap_none {  { zext_ln837_5 in_data 0 7 } } }
	attention_V { ap_memory {  { attention_V_address0 mem_address 1 7 }  { attention_V_ce0 mem_ce 1 1 }  { attention_V_we0 mem_we 1 1 }  { attention_V_d0 mem_din 1 16 } } }
	sext_ln837_1 { ap_none {  { sext_ln837_1 in_data 0 22 } } }
	sext_ln837_2 { ap_none {  { sext_ln837_2 in_data 0 22 } } }
	sext_ln837_3 { ap_none {  { sext_ln837_3 in_data 0 22 } } }
	sext_ln837_4 { ap_none {  { sext_ln837_4 in_data 0 22 } } }
	sext_ln837_5 { ap_none {  { sext_ln837_5 in_data 0 22 } } }
	sext_ln837_6 { ap_none {  { sext_ln837_6 in_data 0 22 } } }
	sext_ln837_7 { ap_none {  { sext_ln837_7 in_data 0 22 } } }
	sext_ln837_8 { ap_none {  { sext_ln837_8 in_data 0 22 } } }
	sext_ln837_9 { ap_none {  { sext_ln837_9 in_data 0 22 } } }
	sext_ln837_10 { ap_none {  { sext_ln837_10 in_data 0 22 } } }
	sext_ln837_11 { ap_none {  { sext_ln837_11 in_data 0 22 } } }
	sext_ln837_12 { ap_none {  { sext_ln837_12 in_data 0 22 } } }
	sext_ln837_13 { ap_none {  { sext_ln837_13 in_data 0 22 } } }
	sext_ln837_14 { ap_none {  { sext_ln837_14 in_data 0 22 } } }
	sext_ln837_15 { ap_none {  { sext_ln837_15 in_data 0 22 } } }
	sext_ln174 { ap_none {  { sext_ln174 in_data 0 22 } } }
	conv_i2287 { ap_none {  { conv_i2287 in_data 0 27 } } }
}
