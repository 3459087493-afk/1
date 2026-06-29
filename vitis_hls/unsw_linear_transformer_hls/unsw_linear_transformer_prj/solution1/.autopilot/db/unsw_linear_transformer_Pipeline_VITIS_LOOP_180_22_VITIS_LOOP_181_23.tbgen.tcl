set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23}
set C_modelType { void 0 }
set C_modelArgList {
	{ feedforward_hidden float 32 regular {array 256 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ norm1 float 32 regular {array 128 { 1 3 } 1 1 }  }
	{ residual2 float 32 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "feedforward_hidden", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "norm1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 210
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ feedforward_hidden_address0 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce0 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q0 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address1 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce1 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q1 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address2 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce2 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q2 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address3 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce3 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q3 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address4 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce4 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q4 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address5 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce5 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q5 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address6 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce6 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q6 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address7 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce7 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q7 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address8 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce8 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q8 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address9 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce9 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q9 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address10 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce10 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q10 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address11 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce11 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q11 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address12 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce12 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q12 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address13 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce13 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q13 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address14 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce14 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q14 sc_in sc_lv 32 signal 0 } 
	{ feedforward_hidden_address15 sc_out sc_lv 8 signal 0 } 
	{ feedforward_hidden_ce15 sc_out sc_logic 1 signal 0 } 
	{ feedforward_hidden_q15 sc_in sc_lv 32 signal 0 } 
	{ norm1_address0 sc_out sc_lv 7 signal 1 } 
	{ norm1_ce0 sc_out sc_logic 1 signal 1 } 
	{ norm1_q0 sc_in sc_lv 32 signal 1 } 
	{ residual2_address0 sc_out sc_lv 7 signal 2 } 
	{ residual2_ce0 sc_out sc_logic 1 signal 2 } 
	{ residual2_we0 sc_out sc_logic 1 signal 2 } 
	{ residual2_d0 sc_out sc_lv 32 signal 2 } 
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
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "feedforward_hidden_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address0" }} , 
 	{ "name": "feedforward_hidden_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce0" }} , 
 	{ "name": "feedforward_hidden_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q0" }} , 
 	{ "name": "feedforward_hidden_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address1" }} , 
 	{ "name": "feedforward_hidden_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce1" }} , 
 	{ "name": "feedforward_hidden_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q1" }} , 
 	{ "name": "feedforward_hidden_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address2" }} , 
 	{ "name": "feedforward_hidden_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce2" }} , 
 	{ "name": "feedforward_hidden_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q2" }} , 
 	{ "name": "feedforward_hidden_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address3" }} , 
 	{ "name": "feedforward_hidden_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce3" }} , 
 	{ "name": "feedforward_hidden_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q3" }} , 
 	{ "name": "feedforward_hidden_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address4" }} , 
 	{ "name": "feedforward_hidden_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce4" }} , 
 	{ "name": "feedforward_hidden_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q4" }} , 
 	{ "name": "feedforward_hidden_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address5" }} , 
 	{ "name": "feedforward_hidden_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce5" }} , 
 	{ "name": "feedforward_hidden_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q5" }} , 
 	{ "name": "feedforward_hidden_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address6" }} , 
 	{ "name": "feedforward_hidden_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce6" }} , 
 	{ "name": "feedforward_hidden_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q6" }} , 
 	{ "name": "feedforward_hidden_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address7" }} , 
 	{ "name": "feedforward_hidden_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce7" }} , 
 	{ "name": "feedforward_hidden_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q7" }} , 
 	{ "name": "feedforward_hidden_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address8" }} , 
 	{ "name": "feedforward_hidden_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce8" }} , 
 	{ "name": "feedforward_hidden_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q8" }} , 
 	{ "name": "feedforward_hidden_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address9" }} , 
 	{ "name": "feedforward_hidden_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce9" }} , 
 	{ "name": "feedforward_hidden_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q9" }} , 
 	{ "name": "feedforward_hidden_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address10" }} , 
 	{ "name": "feedforward_hidden_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce10" }} , 
 	{ "name": "feedforward_hidden_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q10" }} , 
 	{ "name": "feedforward_hidden_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address11" }} , 
 	{ "name": "feedforward_hidden_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce11" }} , 
 	{ "name": "feedforward_hidden_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q11" }} , 
 	{ "name": "feedforward_hidden_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address12" }} , 
 	{ "name": "feedforward_hidden_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce12" }} , 
 	{ "name": "feedforward_hidden_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q12" }} , 
 	{ "name": "feedforward_hidden_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address13" }} , 
 	{ "name": "feedforward_hidden_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce13" }} , 
 	{ "name": "feedforward_hidden_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q13" }} , 
 	{ "name": "feedforward_hidden_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address14" }} , 
 	{ "name": "feedforward_hidden_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce14" }} , 
 	{ "name": "feedforward_hidden_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q14" }} , 
 	{ "name": "feedforward_hidden_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "address15" }} , 
 	{ "name": "feedforward_hidden_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "ce15" }} , 
 	{ "name": "feedforward_hidden_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feedforward_hidden", "role": "q15" }} , 
 	{ "name": "norm1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "norm1", "role": "address0" }} , 
 	{ "name": "norm1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "norm1", "role": "ce0" }} , 
 	{ "name": "norm1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "norm1", "role": "q0" }} , 
 	{ "name": "residual2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "residual2", "role": "address0" }} , 
 	{ "name": "residual2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2", "role": "ce0" }} , 
 	{ "name": "residual2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual2", "role": "we0" }} , 
 	{ "name": "residual2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual2", "role": "d0" }} , 
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
 	{ "name": "grp_fu_2004_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_2004_p_ce", "role": "default" }} , 
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
 	{ "name": "grp_fu_1948_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1948_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "427", "EstimateLatencyMax" : "427",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "feedforward_hidden", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "norm1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "residual2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_BIAS", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "LAYERS_0_FEEDFORWARD_3_WEIGHT_31", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_180_22_VITIS_LOOP_181_23", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter85", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter85", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_BIAS_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_2_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_3_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_4_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_5_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_6_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_7_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_8_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_9_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_10_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_11_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_12_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_13_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_14_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_15_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_16_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_17_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_18_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_19_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_20_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_21_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_22_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_23_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_24_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_25_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_26_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_27_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_28_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_29_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_30_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.LAYERS_0_FEEDFORWARD_3_WEIGHT_31_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_180_22_VITIS_LOOP_181_23 {
		feedforward_hidden {Type I LastRead 2 FirstWrite -1}
		norm1 {Type I LastRead 163 FirstWrite -1}
		residual2 {Type O LastRead -1 FirstWrite 171}
		LAYERS_0_FEEDFORWARD_3_BIAS {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_0 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_1 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_2 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_3 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_4 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_5 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_6 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_7 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_8 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_9 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_10 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_11 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_12 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_13 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_14 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_15 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_16 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_17 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_18 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_19 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_20 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_21 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_22 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_23 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_24 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_25 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_26 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_27 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_28 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_29 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_30 {Type I LastRead -1 FirstWrite -1}
		LAYERS_0_FEEDFORWARD_3_WEIGHT_31 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "427", "Max" : "427"}
	, {"Name" : "Interval", "Min" : "427", "Max" : "427"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	feedforward_hidden { ap_memory {  { feedforward_hidden_address0 mem_address 1 8 }  { feedforward_hidden_ce0 mem_ce 1 1 }  { feedforward_hidden_q0 mem_dout 0 32 }  { feedforward_hidden_address1 MemPortADDR2 1 8 }  { feedforward_hidden_ce1 MemPortCE2 1 1 }  { feedforward_hidden_q1 MemPortDOUT2 0 32 }  { feedforward_hidden_address2 MemPortADDR2 1 8 }  { feedforward_hidden_ce2 MemPortCE2 1 1 }  { feedforward_hidden_q2 MemPortDOUT2 0 32 }  { feedforward_hidden_address3 MemPortADDR2 1 8 }  { feedforward_hidden_ce3 MemPortCE2 1 1 }  { feedforward_hidden_q3 MemPortDOUT2 0 32 }  { feedforward_hidden_address4 MemPortADDR2 1 8 }  { feedforward_hidden_ce4 MemPortCE2 1 1 }  { feedforward_hidden_q4 MemPortDOUT2 0 32 }  { feedforward_hidden_address5 MemPortADDR2 1 8 }  { feedforward_hidden_ce5 MemPortCE2 1 1 }  { feedforward_hidden_q5 MemPortDOUT2 0 32 }  { feedforward_hidden_address6 MemPortADDR2 1 8 }  { feedforward_hidden_ce6 MemPortCE2 1 1 }  { feedforward_hidden_q6 MemPortDOUT2 0 32 }  { feedforward_hidden_address7 MemPortADDR2 1 8 }  { feedforward_hidden_ce7 MemPortCE2 1 1 }  { feedforward_hidden_q7 MemPortDOUT2 0 32 }  { feedforward_hidden_address8 MemPortADDR2 1 8 }  { feedforward_hidden_ce8 MemPortCE2 1 1 }  { feedforward_hidden_q8 MemPortDOUT2 0 32 }  { feedforward_hidden_address9 MemPortADDR2 1 8 }  { feedforward_hidden_ce9 MemPortCE2 1 1 }  { feedforward_hidden_q9 MemPortDOUT2 0 32 }  { feedforward_hidden_address10 MemPortADDR2 1 8 }  { feedforward_hidden_ce10 MemPortCE2 1 1 }  { feedforward_hidden_q10 MemPortDOUT2 0 32 }  { feedforward_hidden_address11 MemPortADDR2 1 8 }  { feedforward_hidden_ce11 MemPortCE2 1 1 }  { feedforward_hidden_q11 MemPortDOUT2 0 32 }  { feedforward_hidden_address12 MemPortADDR2 1 8 }  { feedforward_hidden_ce12 MemPortCE2 1 1 }  { feedforward_hidden_q12 MemPortDOUT2 0 32 }  { feedforward_hidden_address13 MemPortADDR2 1 8 }  { feedforward_hidden_ce13 MemPortCE2 1 1 }  { feedforward_hidden_q13 MemPortDOUT2 0 32 }  { feedforward_hidden_address14 MemPortADDR2 1 8 }  { feedforward_hidden_ce14 MemPortCE2 1 1 }  { feedforward_hidden_q14 MemPortDOUT2 0 32 }  { feedforward_hidden_address15 MemPortADDR2 1 8 }  { feedforward_hidden_ce15 MemPortCE2 1 1 }  { feedforward_hidden_q15 MemPortDOUT2 0 32 } } }
	norm1 { ap_memory {  { norm1_address0 mem_address 1 7 }  { norm1_ce0 mem_ce 1 1 }  { norm1_q0 mem_dout 0 32 } } }
	residual2 { ap_memory {  { residual2_address0 mem_address 1 7 }  { residual2_ce0 mem_ce 1 1 }  { residual2_we0 mem_we 1 1 }  { residual2_d0 mem_din 1 32 } } }
}
