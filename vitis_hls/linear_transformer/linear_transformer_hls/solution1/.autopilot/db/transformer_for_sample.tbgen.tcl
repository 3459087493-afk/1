set moduleName transformer_for_sample
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
set C_modelName {transformer_for_sample}
set C_modelType { float 32 }
set C_modelArgList {
	{ gmem0 int 32 regular {axi_master 0}  }
	{ input_array int 64 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "input_array","offset": { "type": "dynamic","port_name": "input_array","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "input_array", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 54
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ input_array sc_in sc_lv 64 signal 1 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem0", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "input_array", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_array", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "16", "18", "20", "22", "24", "26", "28", "30", "32", "34", "36", "38", "40", "45", "88", "90", "92", "94", "97", "99", "110", "121", "140", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178"],
		"CDFG" : "transformer_for_sample",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1561", "EstimateLatencyMax" : "1561",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065", "Port" : "gmem0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "input_array", "Type" : "None", "Direction" : "I"},
			{"Name" : "FRONT_LINEAR_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065", "Port" : "FRONT_LINEAR_WEIGHT_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "FRONT_LINEAR_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065", "Port" : "FRONT_LINEAR_WEIGHT_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "FRONT_LINEAR_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "40", "SubInstance" : "grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065", "Port" : "FRONT_LINEAR_BIAS", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "45", "SubInstance" : "grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "99", "SubInstance" : "grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS", "Inst_start_state" : "45", "Inst_end_state" : "46"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS", "Inst_start_state" : "47", "Inst_end_state" : "48"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15", "Inst_start_state" : "49", "Inst_end_state" : "50"}]},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "121", "SubInstance" : "grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Port" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS", "Inst_start_state" : "49", "Inst_end_state" : "50"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.front_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_t_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kv_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sum_k_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.normalizer_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.values_new_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attn_residual_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ff1_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.encoder_out_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.final_out_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_1_fu_987", "Parent" : "0", "Child" : ["15"],
		"CDFG" : "transformer_for_sample_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "front", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_1_fu_987.flow_control_loop_pipe_sequential_init_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_2_fu_993", "Parent" : "0", "Child" : ["17"],
		"CDFG" : "transformer_for_sample_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_2_fu_993.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_3_fu_999", "Parent" : "0", "Child" : ["19"],
		"CDFG" : "transformer_for_sample_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_3_fu_999.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_4_fu_1005", "Parent" : "0", "Child" : ["21"],
		"CDFG" : "transformer_for_sample_Pipeline_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_4_fu_1005.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_5_fu_1011", "Parent" : "0", "Child" : ["23"],
		"CDFG" : "transformer_for_sample_Pipeline_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "value_t", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_5_fu_1011.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_6_fu_1017", "Parent" : "0", "Child" : ["25"],
		"CDFG" : "transformer_for_sample_Pipeline_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "kv", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_6_fu_1017.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_7_fu_1023", "Parent" : "0", "Child" : ["27"],
		"CDFG" : "transformer_for_sample_Pipeline_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_k", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_7_fu_1023.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_8_fu_1029", "Parent" : "0", "Child" : ["29"],
		"CDFG" : "transformer_for_sample_Pipeline_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalizer", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_8_fu_1029.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_9_fu_1035", "Parent" : "0", "Child" : ["31"],
		"CDFG" : "transformer_for_sample_Pipeline_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "values_new", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_9_fu_1035.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_10_fu_1041", "Parent" : "0", "Child" : ["33"],
		"CDFG" : "transformer_for_sample_Pipeline_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attn_residual", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_10_fu_1041.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_11_fu_1047", "Parent" : "0", "Child" : ["35"],
		"CDFG" : "transformer_for_sample_Pipeline_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "130",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ff1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_11_fu_1047.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_12_fu_1053", "Parent" : "0", "Child" : ["37"],
		"CDFG" : "transformer_for_sample_Pipeline_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "encoder_out", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_12_fu_1053.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_13_fu_1059", "Parent" : "0", "Child" : ["39"],
		"CDFG" : "transformer_for_sample_Pipeline_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "final_out", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_13_fu_1059.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065", "Parent" : "0", "Child" : ["41", "42", "43", "44"],
		"CDFG" : "transformer_for_sample_Pipeline_front_linear_i_front_linear_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "156", "EstimateLatencyMax" : "156",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_array", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "front", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "FRONT_LINEAR_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "FRONT_LINEAR_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "FRONT_LINEAR_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "front_linear_i_front_linear_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065.FRONT_LINEAR_WEIGHT_0_U", "Parent" : "40"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065.FRONT_LINEAR_WEIGHT_1_U", "Parent" : "40"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065.FRONT_LINEAR_BIAS_U", "Parent" : "40"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_front_linear_i_front_linear_j_fu_1065.flow_control_loop_pipe_sequential_init_U", "Parent" : "40"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080", "Parent" : "0", "Child" : ["46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87"],
		"CDFG" : "transformer_for_sample_Pipeline_qkv_i_qkv_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "121", "EstimateLatencyMax" : "121",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "front", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "key", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "qkv_i_qkv_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter56", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter56", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0_U", "Parent" : "45"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1_U", "Parent" : "45"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2_U", "Parent" : "45"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3_U", "Parent" : "45"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4_U", "Parent" : "45"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5_U", "Parent" : "45"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6_U", "Parent" : "45"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7_U", "Parent" : "45"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U41", "Parent" : "45"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U42", "Parent" : "45"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U43", "Parent" : "45"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U44", "Parent" : "45"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U45", "Parent" : "45"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U46", "Parent" : "45"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U47", "Parent" : "45"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fadd_32ns_32ns_32_5_full_dsp_1_U48", "Parent" : "45"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U67", "Parent" : "45"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U68", "Parent" : "45"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U69", "Parent" : "45"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U70", "Parent" : "45"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U71", "Parent" : "45"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fmul_32ns_32ns_32_4_max_dsp_1_U72", "Parent" : "45"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fcmp_32ns_32ns_1_2_no_dsp_1_U74", "Parent" : "45"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fexp_32ns_32ns_32_10_full_dsp_1_U75", "Parent" : "45"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.fexp_32ns_32ns_32_10_full_dsp_1_U76", "Parent" : "45"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_qkv_i_qkv_j_fu_1080.flow_control_loop_pipe_sequential_init_U", "Parent" : "45"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_transpose_value_i_transpose_value_j_fu_1136", "Parent" : "0", "Child" : ["89"],
		"CDFG" : "transformer_for_sample_Pipeline_transpose_value_i_transpose_value_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "value_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_t", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "transpose_value_i_transpose_value_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_transpose_value_i_transpose_value_j_fu_1136.flow_control_loop_pipe_sequential_init_U", "Parent" : "88"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_kv_i_kv_j_fu_1142", "Parent" : "0", "Child" : ["91"],
		"CDFG" : "transformer_for_sample_Pipeline_kv_i_kv_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "111", "EstimateLatencyMax" : "111",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "value_t", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "kv", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "kv_i_kv_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter46", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter46", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_kv_i_kv_j_fu_1142.flow_control_loop_pipe_sequential_init_U", "Parent" : "90"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_sum_k_j_fu_1149", "Parent" : "0", "Child" : ["93"],
		"CDFG" : "transformer_for_sample_Pipeline_sum_k_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "51", "EstimateLatencyMax" : "51",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_k", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sum_k_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter42", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter42", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_sum_k_j_fu_1149.flow_control_loop_pipe_sequential_init_U", "Parent" : "92"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_normalizer_i_fu_1155", "Parent" : "0", "Child" : ["95", "96"],
		"CDFG" : "transformer_for_sample_Pipeline_normalizer_i",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "76", "EstimateLatencyMax" : "76",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "query", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_k_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_k_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalizer", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "normalizer_i", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter67", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter67", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_normalizer_i_fu_1155.fdiv_32ns_32ns_32_16_no_dsp_1_U155", "Parent" : "94"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_normalizer_i_fu_1155.flow_control_loop_pipe_sequential_init_U", "Parent" : "94"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_numerator_i_fu_1171", "Parent" : "0", "Child" : ["98"],
		"CDFG" : "transformer_for_sample_Pipeline_numerator_i",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "83", "EstimateLatencyMax" : "83",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalizer", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "kv_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "values_new", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "kv_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_46", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_48", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_49", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_50", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_53", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_54", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_56", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_57", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_58", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_59", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_60", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_61", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_62", "Type" : "None", "Direction" : "I"},
			{"Name" : "kv_load_63", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "numerator_i", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter13", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter13", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_numerator_i_fu_1171.flow_control_loop_pipe_sequential_init_U", "Parent" : "97"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244", "Parent" : "0", "Child" : ["100", "101", "102", "103", "104", "105", "106", "107", "108", "109"],
		"CDFG" : "transformer_for_sample_Pipeline_o_proj_i_o_proj_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "310", "EstimateLatencyMax" : "310",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "values_new", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "front", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "attn_residual", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "o_proj_i_o_proj_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0_U", "Parent" : "99"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1_U", "Parent" : "99"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2_U", "Parent" : "99"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3_U", "Parent" : "99"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4_U", "Parent" : "99"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5_U", "Parent" : "99"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6_U", "Parent" : "99"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7_U", "Parent" : "99"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS_U", "Parent" : "99"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_o_proj_i_o_proj_j_fu_1244.flow_control_loop_pipe_sequential_init_U", "Parent" : "99"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269", "Parent" : "0", "Child" : ["111", "112", "113", "114", "115", "116", "117", "118", "119", "120"],
		"CDFG" : "transformer_for_sample_Pipeline_ff1_i_ff1_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "182", "EstimateLatencyMax" : "182",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attn_residual", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ff1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ff1_i_ff1_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter53", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter53", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0_U", "Parent" : "110"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1_U", "Parent" : "110"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2_U", "Parent" : "110"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3_U", "Parent" : "110"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4_U", "Parent" : "110"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5_U", "Parent" : "110"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6_U", "Parent" : "110"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7_U", "Parent" : "110"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS_U", "Parent" : "110"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff1_i_ff1_j_fu_1269.flow_control_loop_pipe_sequential_init_U", "Parent" : "110"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293", "Parent" : "0", "Child" : ["122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139"],
		"CDFG" : "transformer_for_sample_Pipeline_ff2_i_ff2_j",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "161", "EstimateLatencyMax" : "161",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ff1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "attn_residual", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "encoder_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ff2_i_ff2_j", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter96", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter96", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0_U", "Parent" : "121"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1_U", "Parent" : "121"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2_U", "Parent" : "121"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3_U", "Parent" : "121"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4_U", "Parent" : "121"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5_U", "Parent" : "121"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6_U", "Parent" : "121"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7_U", "Parent" : "121"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8_U", "Parent" : "121"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9_U", "Parent" : "121"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10_U", "Parent" : "121"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11_U", "Parent" : "121"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12_U", "Parent" : "121"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13_U", "Parent" : "121"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14_U", "Parent" : "121"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15_U", "Parent" : "121"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS_U", "Parent" : "121"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_ff2_i_ff2_j_fu_1293.flow_control_loop_pipe_sequential_init_U", "Parent" : "121"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_final_i_fu_1334", "Parent" : "0", "Child" : ["141"],
		"CDFG" : "transformer_for_sample_Pipeline_final_i",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "60", "EstimateLatencyMax" : "60",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "encoder_out", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "final_out", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "final_i", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter51", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter51", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_transformer_for_sample_Pipeline_final_i_fu_1334.flow_control_loop_pipe_sequential_init_U", "Parent" : "140"},
	{"ID" : "142", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U387", "Parent" : "0"},
	{"ID" : "143", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U388", "Parent" : "0"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U389", "Parent" : "0"},
	{"ID" : "145", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U390", "Parent" : "0"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U391", "Parent" : "0"},
	{"ID" : "147", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U392", "Parent" : "0"},
	{"ID" : "148", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U393", "Parent" : "0"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U394", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U395", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U396", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U397", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U398", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U399", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U400", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U401", "Parent" : "0"},
	{"ID" : "157", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U402", "Parent" : "0"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U403", "Parent" : "0"},
	{"ID" : "159", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U404", "Parent" : "0"},
	{"ID" : "160", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U405", "Parent" : "0"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U406", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U407", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U408", "Parent" : "0"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U409", "Parent" : "0"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U410", "Parent" : "0"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U411", "Parent" : "0"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U412", "Parent" : "0"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U413", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U414", "Parent" : "0"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U415", "Parent" : "0"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U416", "Parent" : "0"},
	{"ID" : "172", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U417", "Parent" : "0"},
	{"ID" : "173", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U418", "Parent" : "0"},
	{"ID" : "174", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U419", "Parent" : "0"},
	{"ID" : "175", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U420", "Parent" : "0"},
	{"ID" : "176", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U421", "Parent" : "0"},
	{"ID" : "177", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U422", "Parent" : "0"},
	{"ID" : "178", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U423", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	transformer_for_sample {
		gmem0 {Type I LastRead 9 FirstWrite -1}
		input_array {Type I LastRead 2 FirstWrite -1}
		FRONT_LINEAR_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		FRONT_LINEAR_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		FRONT_LINEAR_BIAS {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_1 {
		front {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_2 {
		query {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_3 {
		key {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_4 {
		value_r {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_5 {
		value_t {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_6 {
		kv {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_7 {
		sum_k {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_8 {
		normalizer {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_9 {
		values_new {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_10 {
		attn_residual {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_11 {
		ff1 {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_12 {
		encoder_out {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_13 {
		final_out {Type O LastRead -1 FirstWrite 0}}
	transformer_for_sample_Pipeline_front_linear_i_front_linear_j {
		input_array {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 9 FirstWrite -1}
		front {Type O LastRead -1 FirstWrite 28}
		FRONT_LINEAR_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		FRONT_LINEAR_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		FRONT_LINEAR_BIAS {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_qkv_i_qkv_j {
		front {Type I LastRead 1 FirstWrite -1}
		query {Type O LastRead -1 FirstWrite 56}
		key {Type O LastRead -1 FirstWrite 56}
		value_r {Type O LastRead -1 FirstWrite 46}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_QUERY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_KEY_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_VALUE_MAT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_transpose_value_i_transpose_value_j {
		value_r {Type I LastRead 1 FirstWrite -1}
		value_t {Type O LastRead -1 FirstWrite 2}}
	transformer_for_sample_Pipeline_kv_i_kv_j {
		key {Type I LastRead 1 FirstWrite -1}
		value_t {Type I LastRead 2 FirstWrite -1}
		kv {Type O LastRead -1 FirstWrite 46}}
	transformer_for_sample_Pipeline_sum_k_j {
		key {Type I LastRead 1 FirstWrite -1}
		sum_k {Type O LastRead -1 FirstWrite 42}}
	transformer_for_sample_Pipeline_normalizer_i {
		query {Type I LastRead 1 FirstWrite -1}
		sum_k_load {Type I LastRead 0 FirstWrite -1}
		sum_k_load_1 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_2 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_3 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_4 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_5 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_6 {Type I LastRead 0 FirstWrite -1}
		sum_k_load_7 {Type I LastRead 0 FirstWrite -1}
		normalizer {Type O LastRead -1 FirstWrite 67}}
	transformer_for_sample_Pipeline_numerator_i {
		normalizer {Type I LastRead 44 FirstWrite -1}
		query {Type I LastRead 4 FirstWrite -1}
		kv_load {Type I LastRead 0 FirstWrite -1}
		kv_load_1 {Type I LastRead 0 FirstWrite -1}
		kv_load_2 {Type I LastRead 0 FirstWrite -1}
		kv_load_3 {Type I LastRead 0 FirstWrite -1}
		kv_load_4 {Type I LastRead 0 FirstWrite -1}
		kv_load_5 {Type I LastRead 0 FirstWrite -1}
		kv_load_6 {Type I LastRead 0 FirstWrite -1}
		kv_load_7 {Type I LastRead 0 FirstWrite -1}
		values_new {Type O LastRead -1 FirstWrite 50}
		kv_load_8 {Type I LastRead 0 FirstWrite -1}
		kv_load_9 {Type I LastRead 0 FirstWrite -1}
		kv_load_10 {Type I LastRead 0 FirstWrite -1}
		kv_load_11 {Type I LastRead 0 FirstWrite -1}
		kv_load_12 {Type I LastRead 0 FirstWrite -1}
		kv_load_13 {Type I LastRead 0 FirstWrite -1}
		kv_load_14 {Type I LastRead 0 FirstWrite -1}
		kv_load_15 {Type I LastRead 0 FirstWrite -1}
		kv_load_16 {Type I LastRead 0 FirstWrite -1}
		kv_load_17 {Type I LastRead 0 FirstWrite -1}
		kv_load_18 {Type I LastRead 0 FirstWrite -1}
		kv_load_19 {Type I LastRead 0 FirstWrite -1}
		kv_load_20 {Type I LastRead 0 FirstWrite -1}
		kv_load_21 {Type I LastRead 0 FirstWrite -1}
		kv_load_22 {Type I LastRead 0 FirstWrite -1}
		kv_load_23 {Type I LastRead 0 FirstWrite -1}
		kv_load_24 {Type I LastRead 0 FirstWrite -1}
		kv_load_25 {Type I LastRead 0 FirstWrite -1}
		kv_load_26 {Type I LastRead 0 FirstWrite -1}
		kv_load_27 {Type I LastRead 0 FirstWrite -1}
		kv_load_28 {Type I LastRead 0 FirstWrite -1}
		kv_load_29 {Type I LastRead 0 FirstWrite -1}
		kv_load_30 {Type I LastRead 0 FirstWrite -1}
		kv_load_31 {Type I LastRead 0 FirstWrite -1}
		kv_load_32 {Type I LastRead 0 FirstWrite -1}
		kv_load_33 {Type I LastRead 0 FirstWrite -1}
		kv_load_34 {Type I LastRead 0 FirstWrite -1}
		kv_load_35 {Type I LastRead 0 FirstWrite -1}
		kv_load_36 {Type I LastRead 0 FirstWrite -1}
		kv_load_37 {Type I LastRead 0 FirstWrite -1}
		kv_load_38 {Type I LastRead 0 FirstWrite -1}
		kv_load_39 {Type I LastRead 0 FirstWrite -1}
		kv_load_40 {Type I LastRead 0 FirstWrite -1}
		kv_load_41 {Type I LastRead 0 FirstWrite -1}
		kv_load_42 {Type I LastRead 0 FirstWrite -1}
		kv_load_43 {Type I LastRead 0 FirstWrite -1}
		kv_load_44 {Type I LastRead 0 FirstWrite -1}
		kv_load_45 {Type I LastRead 0 FirstWrite -1}
		kv_load_46 {Type I LastRead 0 FirstWrite -1}
		kv_load_47 {Type I LastRead 0 FirstWrite -1}
		kv_load_48 {Type I LastRead 0 FirstWrite -1}
		kv_load_49 {Type I LastRead 0 FirstWrite -1}
		kv_load_50 {Type I LastRead 0 FirstWrite -1}
		kv_load_51 {Type I LastRead 0 FirstWrite -1}
		kv_load_52 {Type I LastRead 0 FirstWrite -1}
		kv_load_53 {Type I LastRead 0 FirstWrite -1}
		kv_load_54 {Type I LastRead 0 FirstWrite -1}
		kv_load_55 {Type I LastRead 0 FirstWrite -1}
		kv_load_56 {Type I LastRead 0 FirstWrite -1}
		kv_load_57 {Type I LastRead 0 FirstWrite -1}
		kv_load_58 {Type I LastRead 0 FirstWrite -1}
		kv_load_59 {Type I LastRead 0 FirstWrite -1}
		kv_load_60 {Type I LastRead 0 FirstWrite -1}
		kv_load_61 {Type I LastRead 0 FirstWrite -1}
		kv_load_62 {Type I LastRead 0 FirstWrite -1}
		kv_load_63 {Type I LastRead 0 FirstWrite -1}}
	transformer_for_sample_Pipeline_o_proj_i_o_proj_j {
		values_new {Type I LastRead 4 FirstWrite -1}
		front {Type I LastRead 1 FirstWrite -1}
		attn_residual {Type O LastRead -1 FirstWrite 56}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_SELF_ATTN_O_PROJ_BIAS {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_ff1_i_ff1_j {
		attn_residual {Type I LastRead 1 FirstWrite -1}
		ff1 {Type O LastRead -1 FirstWrite 53}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_0_BIAS {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_ff2_i_ff2_j {
		ff1 {Type I LastRead 1 FirstWrite -1}
		attn_residual {Type I LastRead 1 FirstWrite -1}
		encoder_out {Type O LastRead -1 FirstWrite 96}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		TRANSFORMER_ENCODER_LAYERS_0_LINEAR_NET_3_BIAS {Type I LastRead -1 FirstWrite -1}}
	transformer_for_sample_Pipeline_final_i {
		encoder_out {Type I LastRead 1 FirstWrite -1}
		final_out {Type O LastRead -1 FirstWrite 51}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1561", "Max" : "1561"}
	, {"Name" : "Interval", "Min" : "1561", "Max" : "1561"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 32 }  { m_axi_gmem0_WSTRB STRB 1 4 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 32 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 9 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	input_array { ap_none {  { input_array in_data 0 64 } } }
}
