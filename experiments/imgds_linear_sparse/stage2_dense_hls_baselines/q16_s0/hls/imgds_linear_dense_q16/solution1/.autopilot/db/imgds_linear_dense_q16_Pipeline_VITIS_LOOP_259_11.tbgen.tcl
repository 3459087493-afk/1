set moduleName imgds_linear_dense_q16_Pipeline_VITIS_LOOP_259_11
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
set C_modelName {imgds_linear_dense_q16_Pipeline_VITIS_LOOP_259_11}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_V int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_32 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_33 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_34 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_35 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_36 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_37 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_38 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_39 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_40 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_41 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_42 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_43 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_44 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_45 int 16 regular {array 16 { 0 1 } 1 1 }  }
	{ x_V_46 int 16 regular {array 16 { 0 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x_V", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_32", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_33", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_34", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_35", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_36", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_37", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_38", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_39", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_40", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_41", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_42", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_43", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_44", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_45", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "x_V_46", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 134
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_V_address0 sc_out sc_lv 4 signal 0 } 
	{ x_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ x_V_we0 sc_out sc_logic 1 signal 0 } 
	{ x_V_d0 sc_out sc_lv 16 signal 0 } 
	{ x_V_address1 sc_out sc_lv 4 signal 0 } 
	{ x_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ x_V_q1 sc_in sc_lv 16 signal 0 } 
	{ x_V_32_address0 sc_out sc_lv 4 signal 1 } 
	{ x_V_32_ce0 sc_out sc_logic 1 signal 1 } 
	{ x_V_32_we0 sc_out sc_logic 1 signal 1 } 
	{ x_V_32_d0 sc_out sc_lv 16 signal 1 } 
	{ x_V_32_address1 sc_out sc_lv 4 signal 1 } 
	{ x_V_32_ce1 sc_out sc_logic 1 signal 1 } 
	{ x_V_32_q1 sc_in sc_lv 16 signal 1 } 
	{ x_V_33_address0 sc_out sc_lv 4 signal 2 } 
	{ x_V_33_ce0 sc_out sc_logic 1 signal 2 } 
	{ x_V_33_we0 sc_out sc_logic 1 signal 2 } 
	{ x_V_33_d0 sc_out sc_lv 16 signal 2 } 
	{ x_V_33_address1 sc_out sc_lv 4 signal 2 } 
	{ x_V_33_ce1 sc_out sc_logic 1 signal 2 } 
	{ x_V_33_q1 sc_in sc_lv 16 signal 2 } 
	{ x_V_34_address0 sc_out sc_lv 4 signal 3 } 
	{ x_V_34_ce0 sc_out sc_logic 1 signal 3 } 
	{ x_V_34_we0 sc_out sc_logic 1 signal 3 } 
	{ x_V_34_d0 sc_out sc_lv 16 signal 3 } 
	{ x_V_34_address1 sc_out sc_lv 4 signal 3 } 
	{ x_V_34_ce1 sc_out sc_logic 1 signal 3 } 
	{ x_V_34_q1 sc_in sc_lv 16 signal 3 } 
	{ x_V_35_address0 sc_out sc_lv 4 signal 4 } 
	{ x_V_35_ce0 sc_out sc_logic 1 signal 4 } 
	{ x_V_35_we0 sc_out sc_logic 1 signal 4 } 
	{ x_V_35_d0 sc_out sc_lv 16 signal 4 } 
	{ x_V_35_address1 sc_out sc_lv 4 signal 4 } 
	{ x_V_35_ce1 sc_out sc_logic 1 signal 4 } 
	{ x_V_35_q1 sc_in sc_lv 16 signal 4 } 
	{ x_V_36_address0 sc_out sc_lv 4 signal 5 } 
	{ x_V_36_ce0 sc_out sc_logic 1 signal 5 } 
	{ x_V_36_we0 sc_out sc_logic 1 signal 5 } 
	{ x_V_36_d0 sc_out sc_lv 16 signal 5 } 
	{ x_V_36_address1 sc_out sc_lv 4 signal 5 } 
	{ x_V_36_ce1 sc_out sc_logic 1 signal 5 } 
	{ x_V_36_q1 sc_in sc_lv 16 signal 5 } 
	{ x_V_37_address0 sc_out sc_lv 4 signal 6 } 
	{ x_V_37_ce0 sc_out sc_logic 1 signal 6 } 
	{ x_V_37_we0 sc_out sc_logic 1 signal 6 } 
	{ x_V_37_d0 sc_out sc_lv 16 signal 6 } 
	{ x_V_37_address1 sc_out sc_lv 4 signal 6 } 
	{ x_V_37_ce1 sc_out sc_logic 1 signal 6 } 
	{ x_V_37_q1 sc_in sc_lv 16 signal 6 } 
	{ x_V_38_address0 sc_out sc_lv 4 signal 7 } 
	{ x_V_38_ce0 sc_out sc_logic 1 signal 7 } 
	{ x_V_38_we0 sc_out sc_logic 1 signal 7 } 
	{ x_V_38_d0 sc_out sc_lv 16 signal 7 } 
	{ x_V_38_address1 sc_out sc_lv 4 signal 7 } 
	{ x_V_38_ce1 sc_out sc_logic 1 signal 7 } 
	{ x_V_38_q1 sc_in sc_lv 16 signal 7 } 
	{ x_V_39_address0 sc_out sc_lv 4 signal 8 } 
	{ x_V_39_ce0 sc_out sc_logic 1 signal 8 } 
	{ x_V_39_we0 sc_out sc_logic 1 signal 8 } 
	{ x_V_39_d0 sc_out sc_lv 16 signal 8 } 
	{ x_V_39_address1 sc_out sc_lv 4 signal 8 } 
	{ x_V_39_ce1 sc_out sc_logic 1 signal 8 } 
	{ x_V_39_q1 sc_in sc_lv 16 signal 8 } 
	{ x_V_40_address0 sc_out sc_lv 4 signal 9 } 
	{ x_V_40_ce0 sc_out sc_logic 1 signal 9 } 
	{ x_V_40_we0 sc_out sc_logic 1 signal 9 } 
	{ x_V_40_d0 sc_out sc_lv 16 signal 9 } 
	{ x_V_40_address1 sc_out sc_lv 4 signal 9 } 
	{ x_V_40_ce1 sc_out sc_logic 1 signal 9 } 
	{ x_V_40_q1 sc_in sc_lv 16 signal 9 } 
	{ x_V_41_address0 sc_out sc_lv 4 signal 10 } 
	{ x_V_41_ce0 sc_out sc_logic 1 signal 10 } 
	{ x_V_41_we0 sc_out sc_logic 1 signal 10 } 
	{ x_V_41_d0 sc_out sc_lv 16 signal 10 } 
	{ x_V_41_address1 sc_out sc_lv 4 signal 10 } 
	{ x_V_41_ce1 sc_out sc_logic 1 signal 10 } 
	{ x_V_41_q1 sc_in sc_lv 16 signal 10 } 
	{ x_V_42_address0 sc_out sc_lv 4 signal 11 } 
	{ x_V_42_ce0 sc_out sc_logic 1 signal 11 } 
	{ x_V_42_we0 sc_out sc_logic 1 signal 11 } 
	{ x_V_42_d0 sc_out sc_lv 16 signal 11 } 
	{ x_V_42_address1 sc_out sc_lv 4 signal 11 } 
	{ x_V_42_ce1 sc_out sc_logic 1 signal 11 } 
	{ x_V_42_q1 sc_in sc_lv 16 signal 11 } 
	{ x_V_43_address0 sc_out sc_lv 4 signal 12 } 
	{ x_V_43_ce0 sc_out sc_logic 1 signal 12 } 
	{ x_V_43_we0 sc_out sc_logic 1 signal 12 } 
	{ x_V_43_d0 sc_out sc_lv 16 signal 12 } 
	{ x_V_43_address1 sc_out sc_lv 4 signal 12 } 
	{ x_V_43_ce1 sc_out sc_logic 1 signal 12 } 
	{ x_V_43_q1 sc_in sc_lv 16 signal 12 } 
	{ x_V_44_address0 sc_out sc_lv 4 signal 13 } 
	{ x_V_44_ce0 sc_out sc_logic 1 signal 13 } 
	{ x_V_44_we0 sc_out sc_logic 1 signal 13 } 
	{ x_V_44_d0 sc_out sc_lv 16 signal 13 } 
	{ x_V_44_address1 sc_out sc_lv 4 signal 13 } 
	{ x_V_44_ce1 sc_out sc_logic 1 signal 13 } 
	{ x_V_44_q1 sc_in sc_lv 16 signal 13 } 
	{ x_V_45_address0 sc_out sc_lv 4 signal 14 } 
	{ x_V_45_ce0 sc_out sc_logic 1 signal 14 } 
	{ x_V_45_we0 sc_out sc_logic 1 signal 14 } 
	{ x_V_45_d0 sc_out sc_lv 16 signal 14 } 
	{ x_V_45_address1 sc_out sc_lv 4 signal 14 } 
	{ x_V_45_ce1 sc_out sc_logic 1 signal 14 } 
	{ x_V_45_q1 sc_in sc_lv 16 signal 14 } 
	{ x_V_46_address0 sc_out sc_lv 4 signal 15 } 
	{ x_V_46_ce0 sc_out sc_logic 1 signal 15 } 
	{ x_V_46_we0 sc_out sc_logic 1 signal 15 } 
	{ x_V_46_d0 sc_out sc_lv 16 signal 15 } 
	{ x_V_46_address1 sc_out sc_lv 4 signal 15 } 
	{ x_V_46_ce1 sc_out sc_logic 1 signal 15 } 
	{ x_V_46_q1 sc_in sc_lv 16 signal 15 } 
	{ grp_fu_970_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_970_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_970_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_970_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_970_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_975_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_975_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_975_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_975_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_980_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_980_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_980_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_983_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_983_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_983_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_983_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V", "role": "address0" }} , 
 	{ "name": "x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce0" }} , 
 	{ "name": "x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "we0" }} , 
 	{ "name": "x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "d0" }} , 
 	{ "name": "x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V", "role": "address1" }} , 
 	{ "name": "x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V", "role": "ce1" }} , 
 	{ "name": "x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V", "role": "q1" }} , 
 	{ "name": "x_V_32_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_32", "role": "address0" }} , 
 	{ "name": "x_V_32_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_32", "role": "ce0" }} , 
 	{ "name": "x_V_32_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_32", "role": "we0" }} , 
 	{ "name": "x_V_32_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_32", "role": "d0" }} , 
 	{ "name": "x_V_32_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_32", "role": "address1" }} , 
 	{ "name": "x_V_32_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_32", "role": "ce1" }} , 
 	{ "name": "x_V_32_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_32", "role": "q1" }} , 
 	{ "name": "x_V_33_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_33", "role": "address0" }} , 
 	{ "name": "x_V_33_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_33", "role": "ce0" }} , 
 	{ "name": "x_V_33_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_33", "role": "we0" }} , 
 	{ "name": "x_V_33_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_33", "role": "d0" }} , 
 	{ "name": "x_V_33_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_33", "role": "address1" }} , 
 	{ "name": "x_V_33_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_33", "role": "ce1" }} , 
 	{ "name": "x_V_33_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_33", "role": "q1" }} , 
 	{ "name": "x_V_34_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_34", "role": "address0" }} , 
 	{ "name": "x_V_34_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_34", "role": "ce0" }} , 
 	{ "name": "x_V_34_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_34", "role": "we0" }} , 
 	{ "name": "x_V_34_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_34", "role": "d0" }} , 
 	{ "name": "x_V_34_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_34", "role": "address1" }} , 
 	{ "name": "x_V_34_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_34", "role": "ce1" }} , 
 	{ "name": "x_V_34_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_34", "role": "q1" }} , 
 	{ "name": "x_V_35_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_35", "role": "address0" }} , 
 	{ "name": "x_V_35_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_35", "role": "ce0" }} , 
 	{ "name": "x_V_35_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_35", "role": "we0" }} , 
 	{ "name": "x_V_35_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_35", "role": "d0" }} , 
 	{ "name": "x_V_35_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_35", "role": "address1" }} , 
 	{ "name": "x_V_35_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_35", "role": "ce1" }} , 
 	{ "name": "x_V_35_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_35", "role": "q1" }} , 
 	{ "name": "x_V_36_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_36", "role": "address0" }} , 
 	{ "name": "x_V_36_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_36", "role": "ce0" }} , 
 	{ "name": "x_V_36_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_36", "role": "we0" }} , 
 	{ "name": "x_V_36_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_36", "role": "d0" }} , 
 	{ "name": "x_V_36_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_36", "role": "address1" }} , 
 	{ "name": "x_V_36_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_36", "role": "ce1" }} , 
 	{ "name": "x_V_36_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_36", "role": "q1" }} , 
 	{ "name": "x_V_37_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_37", "role": "address0" }} , 
 	{ "name": "x_V_37_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_37", "role": "ce0" }} , 
 	{ "name": "x_V_37_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_37", "role": "we0" }} , 
 	{ "name": "x_V_37_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_37", "role": "d0" }} , 
 	{ "name": "x_V_37_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_37", "role": "address1" }} , 
 	{ "name": "x_V_37_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_37", "role": "ce1" }} , 
 	{ "name": "x_V_37_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_37", "role": "q1" }} , 
 	{ "name": "x_V_38_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_38", "role": "address0" }} , 
 	{ "name": "x_V_38_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_38", "role": "ce0" }} , 
 	{ "name": "x_V_38_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_38", "role": "we0" }} , 
 	{ "name": "x_V_38_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_38", "role": "d0" }} , 
 	{ "name": "x_V_38_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_38", "role": "address1" }} , 
 	{ "name": "x_V_38_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_38", "role": "ce1" }} , 
 	{ "name": "x_V_38_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_38", "role": "q1" }} , 
 	{ "name": "x_V_39_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_39", "role": "address0" }} , 
 	{ "name": "x_V_39_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_39", "role": "ce0" }} , 
 	{ "name": "x_V_39_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_39", "role": "we0" }} , 
 	{ "name": "x_V_39_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_39", "role": "d0" }} , 
 	{ "name": "x_V_39_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_39", "role": "address1" }} , 
 	{ "name": "x_V_39_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_39", "role": "ce1" }} , 
 	{ "name": "x_V_39_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_39", "role": "q1" }} , 
 	{ "name": "x_V_40_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_40", "role": "address0" }} , 
 	{ "name": "x_V_40_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_40", "role": "ce0" }} , 
 	{ "name": "x_V_40_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_40", "role": "we0" }} , 
 	{ "name": "x_V_40_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_40", "role": "d0" }} , 
 	{ "name": "x_V_40_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_40", "role": "address1" }} , 
 	{ "name": "x_V_40_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_40", "role": "ce1" }} , 
 	{ "name": "x_V_40_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_40", "role": "q1" }} , 
 	{ "name": "x_V_41_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_41", "role": "address0" }} , 
 	{ "name": "x_V_41_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_41", "role": "ce0" }} , 
 	{ "name": "x_V_41_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_41", "role": "we0" }} , 
 	{ "name": "x_V_41_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_41", "role": "d0" }} , 
 	{ "name": "x_V_41_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_41", "role": "address1" }} , 
 	{ "name": "x_V_41_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_41", "role": "ce1" }} , 
 	{ "name": "x_V_41_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_41", "role": "q1" }} , 
 	{ "name": "x_V_42_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_42", "role": "address0" }} , 
 	{ "name": "x_V_42_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_42", "role": "ce0" }} , 
 	{ "name": "x_V_42_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_42", "role": "we0" }} , 
 	{ "name": "x_V_42_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_42", "role": "d0" }} , 
 	{ "name": "x_V_42_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_42", "role": "address1" }} , 
 	{ "name": "x_V_42_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_42", "role": "ce1" }} , 
 	{ "name": "x_V_42_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_42", "role": "q1" }} , 
 	{ "name": "x_V_43_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_43", "role": "address0" }} , 
 	{ "name": "x_V_43_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_43", "role": "ce0" }} , 
 	{ "name": "x_V_43_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_43", "role": "we0" }} , 
 	{ "name": "x_V_43_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_43", "role": "d0" }} , 
 	{ "name": "x_V_43_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_43", "role": "address1" }} , 
 	{ "name": "x_V_43_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_43", "role": "ce1" }} , 
 	{ "name": "x_V_43_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_43", "role": "q1" }} , 
 	{ "name": "x_V_44_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_44", "role": "address0" }} , 
 	{ "name": "x_V_44_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_44", "role": "ce0" }} , 
 	{ "name": "x_V_44_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_44", "role": "we0" }} , 
 	{ "name": "x_V_44_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_44", "role": "d0" }} , 
 	{ "name": "x_V_44_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_44", "role": "address1" }} , 
 	{ "name": "x_V_44_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_44", "role": "ce1" }} , 
 	{ "name": "x_V_44_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_44", "role": "q1" }} , 
 	{ "name": "x_V_45_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_45", "role": "address0" }} , 
 	{ "name": "x_V_45_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_45", "role": "ce0" }} , 
 	{ "name": "x_V_45_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_45", "role": "we0" }} , 
 	{ "name": "x_V_45_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_45", "role": "d0" }} , 
 	{ "name": "x_V_45_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_45", "role": "address1" }} , 
 	{ "name": "x_V_45_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_45", "role": "ce1" }} , 
 	{ "name": "x_V_45_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_45", "role": "q1" }} , 
 	{ "name": "x_V_46_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_46", "role": "address0" }} , 
 	{ "name": "x_V_46_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_46", "role": "ce0" }} , 
 	{ "name": "x_V_46_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_46", "role": "we0" }} , 
 	{ "name": "x_V_46_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_46", "role": "d0" }} , 
 	{ "name": "x_V_46_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_V_46", "role": "address1" }} , 
 	{ "name": "x_V_46_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_V_46", "role": "ce1" }} , 
 	{ "name": "x_V_46_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_V_46", "role": "q1" }} , 
 	{ "name": "grp_fu_970_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_970_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_970_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_970_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_970_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_970_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_970_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_970_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_970_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_970_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_975_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_975_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_975_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_975_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_975_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_975_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_975_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_975_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_980_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_980_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_980_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_980_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_980_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_980_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_983_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_983_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_983_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_983_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_983_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_983_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_983_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_983_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49"],
		"CDFG" : "imgds_linear_dense_q16_Pipeline_VITIS_LOOP_259_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "92", "EstimateLatencyMax" : "92",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_32", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_33", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_34", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_35", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_36", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_37", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_38", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_39", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_40", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_41", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_42", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_43", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_44", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_45", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "x_V_46", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_259_11", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter75", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter75", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_16s_30_4_1_U4000", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4001", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4002", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4003", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4004", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4005", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4006", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4007", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4008", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4009", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4010", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4011", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4012", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4013", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4014", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_30ns_30_4_1_U4015", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4016", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4017", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4018", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4019", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4020", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4021", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4022", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4023", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4024", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4025", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4026", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4027", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4028", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4029", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4030", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_17s_16s_26_4_1_U4031", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11ns_16s_26_4_1_U4032", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_16ns_26_4_1_U4033", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11ns_16s_26_4_1_U4034", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_16s_26_4_1_U4035", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_16s_11ns_26_4_1_U4036", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_16s_26_4_1_U4037", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_15s_26_4_1_U4038", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_14ns_26_4_1_U4039", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_15ns_26_4_1_U4040", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_13ns_26_4_1_U4041", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11ns_14s_26_4_1_U4042", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_14ns_26_4_1_U4043", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_16s_26_4_1_U4044", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11ns_15ns_26_4_1_U4045", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_11ns_15s_26_4_1_U4046", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_10ns_16ns_26_4_1_U4047", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	imgds_linear_dense_q16_Pipeline_VITIS_LOOP_259_11 {
		x_V {Type IO LastRead 0 FirstWrite 75}
		x_V_32 {Type IO LastRead 0 FirstWrite 75}
		x_V_33 {Type IO LastRead 0 FirstWrite 75}
		x_V_34 {Type IO LastRead 0 FirstWrite 75}
		x_V_35 {Type IO LastRead 0 FirstWrite 75}
		x_V_36 {Type IO LastRead 0 FirstWrite 75}
		x_V_37 {Type IO LastRead 0 FirstWrite 75}
		x_V_38 {Type IO LastRead 0 FirstWrite 75}
		x_V_39 {Type IO LastRead 0 FirstWrite 75}
		x_V_40 {Type IO LastRead 0 FirstWrite 75}
		x_V_41 {Type IO LastRead 0 FirstWrite 75}
		x_V_42 {Type IO LastRead 0 FirstWrite 75}
		x_V_43 {Type IO LastRead 0 FirstWrite 75}
		x_V_44 {Type IO LastRead 0 FirstWrite 75}
		x_V_45 {Type IO LastRead 0 FirstWrite 75}
		x_V_46 {Type IO LastRead 0 FirstWrite 75}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "92", "Max" : "92"}
	, {"Name" : "Interval", "Min" : "92", "Max" : "92"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_V { ap_memory {  { x_V_address0 mem_address 1 4 }  { x_V_ce0 mem_ce 1 1 }  { x_V_we0 mem_we 1 1 }  { x_V_d0 mem_din 1 16 }  { x_V_address1 MemPortADDR2 1 4 }  { x_V_ce1 MemPortCE2 1 1 }  { x_V_q1 in_data 0 16 } } }
	x_V_32 { ap_memory {  { x_V_32_address0 mem_address 1 4 }  { x_V_32_ce0 mem_ce 1 1 }  { x_V_32_we0 mem_we 1 1 }  { x_V_32_d0 mem_din 1 16 }  { x_V_32_address1 MemPortADDR2 1 4 }  { x_V_32_ce1 MemPortCE2 1 1 }  { x_V_32_q1 in_data 0 16 } } }
	x_V_33 { ap_memory {  { x_V_33_address0 mem_address 1 4 }  { x_V_33_ce0 mem_ce 1 1 }  { x_V_33_we0 mem_we 1 1 }  { x_V_33_d0 mem_din 1 16 }  { x_V_33_address1 MemPortADDR2 1 4 }  { x_V_33_ce1 MemPortCE2 1 1 }  { x_V_33_q1 in_data 0 16 } } }
	x_V_34 { ap_memory {  { x_V_34_address0 mem_address 1 4 }  { x_V_34_ce0 mem_ce 1 1 }  { x_V_34_we0 mem_we 1 1 }  { x_V_34_d0 mem_din 1 16 }  { x_V_34_address1 MemPortADDR2 1 4 }  { x_V_34_ce1 MemPortCE2 1 1 }  { x_V_34_q1 in_data 0 16 } } }
	x_V_35 { ap_memory {  { x_V_35_address0 mem_address 1 4 }  { x_V_35_ce0 mem_ce 1 1 }  { x_V_35_we0 mem_we 1 1 }  { x_V_35_d0 mem_din 1 16 }  { x_V_35_address1 MemPortADDR2 1 4 }  { x_V_35_ce1 MemPortCE2 1 1 }  { x_V_35_q1 in_data 0 16 } } }
	x_V_36 { ap_memory {  { x_V_36_address0 mem_address 1 4 }  { x_V_36_ce0 mem_ce 1 1 }  { x_V_36_we0 mem_we 1 1 }  { x_V_36_d0 mem_din 1 16 }  { x_V_36_address1 MemPortADDR2 1 4 }  { x_V_36_ce1 MemPortCE2 1 1 }  { x_V_36_q1 in_data 0 16 } } }
	x_V_37 { ap_memory {  { x_V_37_address0 mem_address 1 4 }  { x_V_37_ce0 mem_ce 1 1 }  { x_V_37_we0 mem_we 1 1 }  { x_V_37_d0 mem_din 1 16 }  { x_V_37_address1 MemPortADDR2 1 4 }  { x_V_37_ce1 MemPortCE2 1 1 }  { x_V_37_q1 in_data 0 16 } } }
	x_V_38 { ap_memory {  { x_V_38_address0 mem_address 1 4 }  { x_V_38_ce0 mem_ce 1 1 }  { x_V_38_we0 mem_we 1 1 }  { x_V_38_d0 mem_din 1 16 }  { x_V_38_address1 MemPortADDR2 1 4 }  { x_V_38_ce1 MemPortCE2 1 1 }  { x_V_38_q1 in_data 0 16 } } }
	x_V_39 { ap_memory {  { x_V_39_address0 mem_address 1 4 }  { x_V_39_ce0 mem_ce 1 1 }  { x_V_39_we0 mem_we 1 1 }  { x_V_39_d0 mem_din 1 16 }  { x_V_39_address1 MemPortADDR2 1 4 }  { x_V_39_ce1 MemPortCE2 1 1 }  { x_V_39_q1 in_data 0 16 } } }
	x_V_40 { ap_memory {  { x_V_40_address0 mem_address 1 4 }  { x_V_40_ce0 mem_ce 1 1 }  { x_V_40_we0 mem_we 1 1 }  { x_V_40_d0 mem_din 1 16 }  { x_V_40_address1 MemPortADDR2 1 4 }  { x_V_40_ce1 MemPortCE2 1 1 }  { x_V_40_q1 in_data 0 16 } } }
	x_V_41 { ap_memory {  { x_V_41_address0 mem_address 1 4 }  { x_V_41_ce0 mem_ce 1 1 }  { x_V_41_we0 mem_we 1 1 }  { x_V_41_d0 mem_din 1 16 }  { x_V_41_address1 MemPortADDR2 1 4 }  { x_V_41_ce1 MemPortCE2 1 1 }  { x_V_41_q1 in_data 0 16 } } }
	x_V_42 { ap_memory {  { x_V_42_address0 mem_address 1 4 }  { x_V_42_ce0 mem_ce 1 1 }  { x_V_42_we0 mem_we 1 1 }  { x_V_42_d0 mem_din 1 16 }  { x_V_42_address1 MemPortADDR2 1 4 }  { x_V_42_ce1 MemPortCE2 1 1 }  { x_V_42_q1 in_data 0 16 } } }
	x_V_43 { ap_memory {  { x_V_43_address0 mem_address 1 4 }  { x_V_43_ce0 mem_ce 1 1 }  { x_V_43_we0 mem_we 1 1 }  { x_V_43_d0 mem_din 1 16 }  { x_V_43_address1 MemPortADDR2 1 4 }  { x_V_43_ce1 MemPortCE2 1 1 }  { x_V_43_q1 in_data 0 16 } } }
	x_V_44 { ap_memory {  { x_V_44_address0 mem_address 1 4 }  { x_V_44_ce0 mem_ce 1 1 }  { x_V_44_we0 mem_we 1 1 }  { x_V_44_d0 mem_din 1 16 }  { x_V_44_address1 MemPortADDR2 1 4 }  { x_V_44_ce1 MemPortCE2 1 1 }  { x_V_44_q1 in_data 0 16 } } }
	x_V_45 { ap_memory {  { x_V_45_address0 mem_address 1 4 }  { x_V_45_ce0 mem_ce 1 1 }  { x_V_45_we0 mem_we 1 1 }  { x_V_45_d0 mem_din 1 16 }  { x_V_45_address1 MemPortADDR2 1 4 }  { x_V_45_ce1 MemPortCE2 1 1 }  { x_V_45_q1 in_data 0 16 } } }
	x_V_46 { ap_memory {  { x_V_46_address0 mem_address 1 4 }  { x_V_46_ce0 mem_ce 1 1 }  { x_V_46_we0 mem_we 1 1 }  { x_V_46_d0 mem_din 1 16 }  { x_V_46_address1 MemPortADDR2 1 4 }  { x_V_46_ce1 MemPortCE2 1 1 }  { x_V_46_q1 in_data 0 16 } } }
}
