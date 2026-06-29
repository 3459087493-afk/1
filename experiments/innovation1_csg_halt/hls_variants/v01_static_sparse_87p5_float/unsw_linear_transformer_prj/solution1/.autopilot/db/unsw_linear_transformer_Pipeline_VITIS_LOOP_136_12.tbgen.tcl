set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_136_12
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_136_12}
set C_modelType { void 0 }
set C_modelArgList {
	{ sparse_key float 32 regular {array 112 { 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ key_sum float 32 regular {array 14 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sparse_key", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key_sum", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sparse_key_address0 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce0 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q0 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address1 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce1 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q1 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address2 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce2 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q2 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address3 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce3 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q3 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address4 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce4 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q4 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address5 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce5 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q5 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address6 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce6 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q6 sc_in sc_lv 32 signal 0 } 
	{ sparse_key_address7 sc_out sc_lv 7 signal 0 } 
	{ sparse_key_ce7 sc_out sc_logic 1 signal 0 } 
	{ sparse_key_q7 sc_in sc_lv 32 signal 0 } 
	{ key_sum_address0 sc_out sc_lv 4 signal 1 } 
	{ key_sum_ce0 sc_out sc_logic 1 signal 1 } 
	{ key_sum_we0 sc_out sc_logic 1 signal 1 } 
	{ key_sum_d0 sc_out sc_lv 32 signal 1 } 
	{ grp_fu_1206_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1206_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1874_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1874_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1874_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1878_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1878_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1878_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1886_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1886_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1886_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1890_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1890_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1890_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1894_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1894_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1894_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1898_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1898_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1898_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1902_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1902_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1902_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sparse_key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address0" }} , 
 	{ "name": "sparse_key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce0" }} , 
 	{ "name": "sparse_key_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q0" }} , 
 	{ "name": "sparse_key_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address1" }} , 
 	{ "name": "sparse_key_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce1" }} , 
 	{ "name": "sparse_key_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q1" }} , 
 	{ "name": "sparse_key_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address2" }} , 
 	{ "name": "sparse_key_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce2" }} , 
 	{ "name": "sparse_key_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q2" }} , 
 	{ "name": "sparse_key_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address3" }} , 
 	{ "name": "sparse_key_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce3" }} , 
 	{ "name": "sparse_key_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q3" }} , 
 	{ "name": "sparse_key_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address4" }} , 
 	{ "name": "sparse_key_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce4" }} , 
 	{ "name": "sparse_key_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q4" }} , 
 	{ "name": "sparse_key_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address5" }} , 
 	{ "name": "sparse_key_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce5" }} , 
 	{ "name": "sparse_key_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q5" }} , 
 	{ "name": "sparse_key_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address6" }} , 
 	{ "name": "sparse_key_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce6" }} , 
 	{ "name": "sparse_key_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q6" }} , 
 	{ "name": "sparse_key_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "sparse_key", "role": "address7" }} , 
 	{ "name": "sparse_key_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sparse_key", "role": "ce7" }} , 
 	{ "name": "sparse_key_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sparse_key", "role": "q7" }} , 
 	{ "name": "key_sum_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "key_sum", "role": "address0" }} , 
 	{ "name": "key_sum_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_sum", "role": "ce0" }} , 
 	{ "name": "key_sum_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_sum", "role": "we0" }} , 
 	{ "name": "key_sum_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_sum", "role": "d0" }} , 
 	{ "name": "grp_fu_1206_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1874_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1874_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1874_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1874_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1878_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1878_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1878_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1878_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1886_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1886_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1886_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1886_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1890_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1890_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1890_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1890_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1894_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1894_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1894_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1894_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1898_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1898_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1898_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1898_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1902_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1902_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1902_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1902_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_136_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "57", "EstimateLatencyMax" : "57",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sparse_key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_sum", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter42", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter42", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_136_12 {
		sparse_key {Type I LastRead 1 FirstWrite -1}
		key_sum {Type O LastRead -1 FirstWrite 42}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "57", "Max" : "57"}
	, {"Name" : "Interval", "Min" : "57", "Max" : "57"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sparse_key { ap_memory {  { sparse_key_address0 mem_address 1 7 }  { sparse_key_ce0 mem_ce 1 1 }  { sparse_key_q0 mem_dout 0 32 }  { sparse_key_address1 MemPortADDR2 1 7 }  { sparse_key_ce1 MemPortCE2 1 1 }  { sparse_key_q1 MemPortDOUT2 0 32 }  { sparse_key_address2 MemPortADDR2 1 7 }  { sparse_key_ce2 MemPortCE2 1 1 }  { sparse_key_q2 MemPortDOUT2 0 32 }  { sparse_key_address3 MemPortADDR2 1 7 }  { sparse_key_ce3 MemPortCE2 1 1 }  { sparse_key_q3 MemPortDOUT2 0 32 }  { sparse_key_address4 MemPortADDR2 1 7 }  { sparse_key_ce4 MemPortCE2 1 1 }  { sparse_key_q4 MemPortDOUT2 0 32 }  { sparse_key_address5 MemPortADDR2 1 7 }  { sparse_key_ce5 MemPortCE2 1 1 }  { sparse_key_q5 MemPortDOUT2 0 32 }  { sparse_key_address6 MemPortADDR2 1 7 }  { sparse_key_ce6 MemPortCE2 1 1 }  { sparse_key_q6 MemPortDOUT2 0 32 }  { sparse_key_address7 MemPortADDR2 1 7 }  { sparse_key_ce7 MemPortCE2 1 1 }  { sparse_key_q7 MemPortDOUT2 0 32 } } }
	key_sum { ap_memory {  { key_sum_address0 mem_address 1 4 }  { key_sum_ce0 mem_ce 1 1 }  { key_sum_we0 mem_we 1 1 }  { key_sum_d0 mem_din 1 32 } } }
}
