set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17}
set C_modelType { void 0 }
set C_modelArgList {
	{ attention float 32 regular {array 128 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ embedded float 32 regular {array 128 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ residual1 float 32 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "attention", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "embedded", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 210
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ attention_address0 sc_out sc_lv 7 signal 0 } 
	{ attention_ce0 sc_out sc_logic 1 signal 0 } 
	{ attention_q0 sc_in sc_lv 32 signal 0 } 
	{ attention_address1 sc_out sc_lv 7 signal 0 } 
	{ attention_ce1 sc_out sc_logic 1 signal 0 } 
	{ attention_q1 sc_in sc_lv 32 signal 0 } 
	{ attention_address2 sc_out sc_lv 7 signal 0 } 
	{ attention_ce2 sc_out sc_logic 1 signal 0 } 
	{ attention_q2 sc_in sc_lv 32 signal 0 } 
	{ attention_address3 sc_out sc_lv 7 signal 0 } 
	{ attention_ce3 sc_out sc_logic 1 signal 0 } 
	{ attention_q3 sc_in sc_lv 32 signal 0 } 
	{ attention_address4 sc_out sc_lv 7 signal 0 } 
	{ attention_ce4 sc_out sc_logic 1 signal 0 } 
	{ attention_q4 sc_in sc_lv 32 signal 0 } 
	{ attention_address5 sc_out sc_lv 7 signal 0 } 
	{ attention_ce5 sc_out sc_logic 1 signal 0 } 
	{ attention_q5 sc_in sc_lv 32 signal 0 } 
	{ attention_address6 sc_out sc_lv 7 signal 0 } 
	{ attention_ce6 sc_out sc_logic 1 signal 0 } 
	{ attention_q6 sc_in sc_lv 32 signal 0 } 
	{ attention_address7 sc_out sc_lv 7 signal 0 } 
	{ attention_ce7 sc_out sc_logic 1 signal 0 } 
	{ attention_q7 sc_in sc_lv 32 signal 0 } 
	{ attention_address8 sc_out sc_lv 7 signal 0 } 
	{ attention_ce8 sc_out sc_logic 1 signal 0 } 
	{ attention_q8 sc_in sc_lv 32 signal 0 } 
	{ attention_address9 sc_out sc_lv 7 signal 0 } 
	{ attention_ce9 sc_out sc_logic 1 signal 0 } 
	{ attention_q9 sc_in sc_lv 32 signal 0 } 
	{ attention_address10 sc_out sc_lv 7 signal 0 } 
	{ attention_ce10 sc_out sc_logic 1 signal 0 } 
	{ attention_q10 sc_in sc_lv 32 signal 0 } 
	{ attention_address11 sc_out sc_lv 7 signal 0 } 
	{ attention_ce11 sc_out sc_logic 1 signal 0 } 
	{ attention_q11 sc_in sc_lv 32 signal 0 } 
	{ attention_address12 sc_out sc_lv 7 signal 0 } 
	{ attention_ce12 sc_out sc_logic 1 signal 0 } 
	{ attention_q12 sc_in sc_lv 32 signal 0 } 
	{ attention_address13 sc_out sc_lv 7 signal 0 } 
	{ attention_ce13 sc_out sc_logic 1 signal 0 } 
	{ attention_q13 sc_in sc_lv 32 signal 0 } 
	{ attention_address14 sc_out sc_lv 7 signal 0 } 
	{ attention_ce14 sc_out sc_logic 1 signal 0 } 
	{ attention_q14 sc_in sc_lv 32 signal 0 } 
	{ attention_address15 sc_out sc_lv 7 signal 0 } 
	{ attention_ce15 sc_out sc_logic 1 signal 0 } 
	{ attention_q15 sc_in sc_lv 32 signal 0 } 
	{ embedded_address0 sc_out sc_lv 7 signal 1 } 
	{ embedded_ce0 sc_out sc_logic 1 signal 1 } 
	{ embedded_q0 sc_in sc_lv 32 signal 1 } 
	{ residual1_address0 sc_out sc_lv 7 signal 2 } 
	{ residual1_ce0 sc_out sc_logic 1 signal 2 } 
	{ residual1_we0 sc_out sc_logic 1 signal 2 } 
	{ residual1_d0 sc_out sc_lv 32 signal 2 } 
	{ grp_fu_1196_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1196_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1196_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1196_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1196_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1884_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1884_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1884_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1884_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1884_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1888_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1888_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1888_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1888_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1888_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1896_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1896_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1896_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1896_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1896_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1900_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1900_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1900_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1900_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1900_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1904_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1904_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1904_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1904_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1904_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1908_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1908_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1908_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1908_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1908_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1912_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1912_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1912_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_1912_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1912_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1916_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1916_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1916_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1916_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1916_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1920_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1920_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1920_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1920_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1920_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1924_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1924_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1924_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1924_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1924_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1928_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1928_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1928_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1928_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1928_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1932_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1932_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1932_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1932_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1932_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1936_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1936_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1936_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1936_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1936_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1940_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1940_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1940_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1940_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1940_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1944_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1944_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1944_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1944_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1944_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1948_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1948_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1948_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1948_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1948_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1201_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1201_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1201_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1201_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1892_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1892_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1892_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1892_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1952_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1952_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1952_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1952_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1956_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1956_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1956_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1956_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1960_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1960_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1960_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1960_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1964_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1964_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1964_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1964_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1968_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1968_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1968_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1968_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1972_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1972_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1972_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1972_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1976_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1976_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1976_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1976_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1980_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1980_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1980_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1980_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1984_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1984_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1984_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1984_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1988_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1988_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1988_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1988_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1992_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1992_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1992_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1992_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1996_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1996_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1996_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1996_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2000_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2000_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2000_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2000_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_2004_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2004_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_2004_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_2004_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "attention_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address0" }} , 
 	{ "name": "attention_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce0" }} , 
 	{ "name": "attention_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q0" }} , 
 	{ "name": "attention_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address1" }} , 
 	{ "name": "attention_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce1" }} , 
 	{ "name": "attention_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q1" }} , 
 	{ "name": "attention_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address2" }} , 
 	{ "name": "attention_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce2" }} , 
 	{ "name": "attention_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q2" }} , 
 	{ "name": "attention_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address3" }} , 
 	{ "name": "attention_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce3" }} , 
 	{ "name": "attention_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q3" }} , 
 	{ "name": "attention_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address4" }} , 
 	{ "name": "attention_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce4" }} , 
 	{ "name": "attention_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q4" }} , 
 	{ "name": "attention_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address5" }} , 
 	{ "name": "attention_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce5" }} , 
 	{ "name": "attention_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q5" }} , 
 	{ "name": "attention_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address6" }} , 
 	{ "name": "attention_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce6" }} , 
 	{ "name": "attention_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q6" }} , 
 	{ "name": "attention_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address7" }} , 
 	{ "name": "attention_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce7" }} , 
 	{ "name": "attention_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q7" }} , 
 	{ "name": "attention_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address8" }} , 
 	{ "name": "attention_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce8" }} , 
 	{ "name": "attention_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q8" }} , 
 	{ "name": "attention_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address9" }} , 
 	{ "name": "attention_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce9" }} , 
 	{ "name": "attention_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q9" }} , 
 	{ "name": "attention_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address10" }} , 
 	{ "name": "attention_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce10" }} , 
 	{ "name": "attention_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q10" }} , 
 	{ "name": "attention_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address11" }} , 
 	{ "name": "attention_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce11" }} , 
 	{ "name": "attention_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q11" }} , 
 	{ "name": "attention_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address12" }} , 
 	{ "name": "attention_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce12" }} , 
 	{ "name": "attention_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q12" }} , 
 	{ "name": "attention_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address13" }} , 
 	{ "name": "attention_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce13" }} , 
 	{ "name": "attention_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q13" }} , 
 	{ "name": "attention_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address14" }} , 
 	{ "name": "attention_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce14" }} , 
 	{ "name": "attention_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q14" }} , 
 	{ "name": "attention_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address15" }} , 
 	{ "name": "attention_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce15" }} , 
 	{ "name": "attention_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "q15" }} , 
 	{ "name": "embedded_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "embedded", "role": "address0" }} , 
 	{ "name": "embedded_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "embedded", "role": "ce0" }} , 
 	{ "name": "embedded_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "embedded", "role": "q0" }} , 
 	{ "name": "residual1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "residual1", "role": "address0" }} , 
 	{ "name": "residual1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual1", "role": "ce0" }} , 
 	{ "name": "residual1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual1", "role": "we0" }} , 
 	{ "name": "residual1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual1", "role": "d0" }} , 
 	{ "name": "grp_fu_1196_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1196_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1196_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1196_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1196_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1196_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1196_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1196_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1196_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1196_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1884_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1884_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1884_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1884_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1884_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1884_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1884_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1884_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1884_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1884_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1888_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1888_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1888_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1888_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1888_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1888_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1888_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1888_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1888_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1888_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1896_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1896_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1896_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1896_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1896_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1896_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1896_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1896_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1896_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1896_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1900_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1900_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1900_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1900_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1900_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1900_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1900_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1900_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1900_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1900_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1904_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1904_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1904_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1904_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1904_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1904_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1904_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1904_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1904_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1904_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1908_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1908_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1908_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1908_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1908_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1908_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1908_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1908_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1908_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1908_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1912_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1912_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1912_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1912_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1912_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1912_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1912_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1912_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1912_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1912_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1916_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1916_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1916_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1916_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1916_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1916_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1916_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1916_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1916_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1916_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1920_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1920_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1920_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1920_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1920_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1920_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1920_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1920_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1920_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1920_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1924_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1924_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1924_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1924_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1924_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1924_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1924_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1924_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1924_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1924_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1928_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1928_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1928_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1928_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1928_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1928_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1928_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1928_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1928_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1928_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1932_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1932_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1932_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1932_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1932_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1932_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1932_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1932_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1932_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1932_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1936_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1936_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1936_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1936_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1936_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1936_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1936_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1936_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1936_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1936_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1940_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1940_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1940_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1940_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1940_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1940_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1940_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1940_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1940_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1940_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1944_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1944_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1944_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1944_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1944_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1944_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1944_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1944_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1944_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1944_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1948_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1948_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1948_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1948_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1948_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1948_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1948_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1948_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1948_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1948_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1201_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1201_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1201_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1201_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1201_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1201_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1201_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1201_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1892_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1892_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1892_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1892_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1892_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1892_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1892_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1892_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1952_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1952_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1952_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1952_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1952_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1952_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1952_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1952_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1956_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1956_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1956_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1956_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1956_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1956_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1956_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1956_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1960_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1960_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1960_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1960_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1960_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1960_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1960_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1960_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1964_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1964_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1964_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1964_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1964_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1964_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1964_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1964_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1968_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1968_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1968_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1968_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1968_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1968_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1968_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1968_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1972_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1972_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1972_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1972_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1972_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1972_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1972_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1972_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1976_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1976_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1976_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1976_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1976_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1976_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1976_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1976_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1980_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1980_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1980_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1980_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1980_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1980_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1980_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1980_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1984_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1984_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1984_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1984_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1984_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1984_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1984_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1984_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1988_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1988_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1988_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1988_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1988_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1988_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1988_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1988_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1992_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1992_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1992_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1992_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1992_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1992_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1992_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1992_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1996_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1996_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1996_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1996_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1996_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1996_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1996_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1996_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2000_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2000_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2000_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2000_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2000_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2000_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2000_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2000_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_2004_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2004_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_2004_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2004_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_2004_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_2004_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_2004_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2004_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "220", "EstimateLatencyMax" : "220",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attention", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "embedded", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_147_16_VITIS_LOOP_148_17", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter91", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter91", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_BIAS_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_147_16_VITIS_LOOP_148_17 {
		attention {Type I LastRead 1 FirstWrite -1}
		embedded {Type I LastRead 1 FirstWrite -1}
		residual1 {Type O LastRead -1 FirstWrite 91}
		LAYERS_0_ATTENTION_OUTPUT_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_ATTENTION_OUTPUT_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "220", "Max" : "220"}
	, {"Name" : "Interval", "Min" : "220", "Max" : "220"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	attention { ap_memory {  { attention_address0 mem_address 1 7 }  { attention_ce0 mem_ce 1 1 }  { attention_q0 mem_dout 0 32 }  { attention_address1 MemPortADDR2 1 7 }  { attention_ce1 MemPortCE2 1 1 }  { attention_q1 MemPortDOUT2 0 32 }  { attention_address2 MemPortADDR2 1 7 }  { attention_ce2 MemPortCE2 1 1 }  { attention_q2 MemPortDOUT2 0 32 }  { attention_address3 MemPortADDR2 1 7 }  { attention_ce3 MemPortCE2 1 1 }  { attention_q3 MemPortDOUT2 0 32 }  { attention_address4 MemPortADDR2 1 7 }  { attention_ce4 MemPortCE2 1 1 }  { attention_q4 MemPortDOUT2 0 32 }  { attention_address5 MemPortADDR2 1 7 }  { attention_ce5 MemPortCE2 1 1 }  { attention_q5 MemPortDOUT2 0 32 }  { attention_address6 MemPortADDR2 1 7 }  { attention_ce6 MemPortCE2 1 1 }  { attention_q6 MemPortDOUT2 0 32 }  { attention_address7 MemPortADDR2 1 7 }  { attention_ce7 MemPortCE2 1 1 }  { attention_q7 MemPortDOUT2 0 32 }  { attention_address8 MemPortADDR2 1 7 }  { attention_ce8 MemPortCE2 1 1 }  { attention_q8 MemPortDOUT2 0 32 }  { attention_address9 MemPortADDR2 1 7 }  { attention_ce9 MemPortCE2 1 1 }  { attention_q9 MemPortDOUT2 0 32 }  { attention_address10 MemPortADDR2 1 7 }  { attention_ce10 MemPortCE2 1 1 }  { attention_q10 MemPortDOUT2 0 32 }  { attention_address11 MemPortADDR2 1 7 }  { attention_ce11 MemPortCE2 1 1 }  { attention_q11 MemPortDOUT2 0 32 }  { attention_address12 MemPortADDR2 1 7 }  { attention_ce12 MemPortCE2 1 1 }  { attention_q12 MemPortDOUT2 0 32 }  { attention_address13 MemPortADDR2 1 7 }  { attention_ce13 MemPortCE2 1 1 }  { attention_q13 MemPortDOUT2 0 32 }  { attention_address14 MemPortADDR2 1 7 }  { attention_ce14 MemPortCE2 1 1 }  { attention_q14 MemPortDOUT2 0 32 }  { attention_address15 MemPortADDR2 1 7 }  { attention_ce15 MemPortCE2 1 1 }  { attention_q15 MemPortDOUT2 0 32 } } }
	embedded { ap_memory {  { embedded_address0 mem_address 1 7 }  { embedded_ce0 mem_ce 1 1 }  { embedded_q0 mem_dout 0 32 } } }
	residual1 { ap_memory {  { residual1_address0 mem_address 1 7 }  { residual1_ce0 mem_ce 1 1 }  { residual1_we0 mem_we 1 1 }  { residual1_d0 mem_din 1 32 } } }
}
