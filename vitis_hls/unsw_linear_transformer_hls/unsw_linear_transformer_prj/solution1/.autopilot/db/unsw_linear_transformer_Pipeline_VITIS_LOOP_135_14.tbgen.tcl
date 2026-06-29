set moduleName unsw_linear_transformer_Pipeline_VITIS_LOOP_135_14
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
set C_modelName {unsw_linear_transformer_Pipeline_VITIS_LOOP_135_14}
set C_modelType { void 0 }
set C_modelArgList {
	{ key_value float 32 regular {array 256 { 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 } 1 1 }  }
	{ zext_ln130 int 7 regular  }
	{ attention float 32 regular {array 128 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ query_load_1 float 32 regular  }
	{ query_load_2 float 32 regular  }
	{ query_load_3 float 32 regular  }
	{ query_load_4 float 32 regular  }
	{ query_load_5 float 32 regular  }
	{ query_load_6 float 32 regular  }
	{ query_load_7 float 32 regular  }
	{ query_load_8 float 32 regular  }
	{ query_load_9 float 32 regular  }
	{ query_load_10 float 32 regular  }
	{ query_load_11 float 32 regular  }
	{ query_load_12 float 32 regular  }
	{ query_load_13 float 32 regular  }
	{ query_load_14 float 32 regular  }
	{ query_load_15 float 32 regular  }
	{ query_load_16 float 32 regular  }
	{ denominator float 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key_value", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln130", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "attention", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_load_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_4", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_5", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_7", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_8", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_9", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_10", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_12", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_13", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_14", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_15", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_load_16", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "denominator", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 224
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_value_address0 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_value_q0 sc_in sc_lv 32 signal 0 } 
	{ key_value_address1 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce1 sc_out sc_logic 1 signal 0 } 
	{ key_value_q1 sc_in sc_lv 32 signal 0 } 
	{ key_value_address2 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce2 sc_out sc_logic 1 signal 0 } 
	{ key_value_q2 sc_in sc_lv 32 signal 0 } 
	{ key_value_address3 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce3 sc_out sc_logic 1 signal 0 } 
	{ key_value_q3 sc_in sc_lv 32 signal 0 } 
	{ key_value_address4 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce4 sc_out sc_logic 1 signal 0 } 
	{ key_value_q4 sc_in sc_lv 32 signal 0 } 
	{ key_value_address5 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce5 sc_out sc_logic 1 signal 0 } 
	{ key_value_q5 sc_in sc_lv 32 signal 0 } 
	{ key_value_address6 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce6 sc_out sc_logic 1 signal 0 } 
	{ key_value_q6 sc_in sc_lv 32 signal 0 } 
	{ key_value_address7 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce7 sc_out sc_logic 1 signal 0 } 
	{ key_value_q7 sc_in sc_lv 32 signal 0 } 
	{ key_value_address8 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce8 sc_out sc_logic 1 signal 0 } 
	{ key_value_q8 sc_in sc_lv 32 signal 0 } 
	{ key_value_address9 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce9 sc_out sc_logic 1 signal 0 } 
	{ key_value_q9 sc_in sc_lv 32 signal 0 } 
	{ key_value_address10 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce10 sc_out sc_logic 1 signal 0 } 
	{ key_value_q10 sc_in sc_lv 32 signal 0 } 
	{ key_value_address11 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce11 sc_out sc_logic 1 signal 0 } 
	{ key_value_q11 sc_in sc_lv 32 signal 0 } 
	{ key_value_address12 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce12 sc_out sc_logic 1 signal 0 } 
	{ key_value_q12 sc_in sc_lv 32 signal 0 } 
	{ key_value_address13 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce13 sc_out sc_logic 1 signal 0 } 
	{ key_value_q13 sc_in sc_lv 32 signal 0 } 
	{ key_value_address14 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce14 sc_out sc_logic 1 signal 0 } 
	{ key_value_q14 sc_in sc_lv 32 signal 0 } 
	{ key_value_address15 sc_out sc_lv 8 signal 0 } 
	{ key_value_ce15 sc_out sc_logic 1 signal 0 } 
	{ key_value_q15 sc_in sc_lv 32 signal 0 } 
	{ zext_ln130 sc_in sc_lv 7 signal 1 } 
	{ attention_address0 sc_out sc_lv 7 signal 2 } 
	{ attention_ce0 sc_out sc_logic 1 signal 2 } 
	{ attention_we0 sc_out sc_logic 1 signal 2 } 
	{ attention_d0 sc_out sc_lv 32 signal 2 } 
	{ query_load_1 sc_in sc_lv 32 signal 3 } 
	{ query_load_2 sc_in sc_lv 32 signal 4 } 
	{ query_load_3 sc_in sc_lv 32 signal 5 } 
	{ query_load_4 sc_in sc_lv 32 signal 6 } 
	{ query_load_5 sc_in sc_lv 32 signal 7 } 
	{ query_load_6 sc_in sc_lv 32 signal 8 } 
	{ query_load_7 sc_in sc_lv 32 signal 9 } 
	{ query_load_8 sc_in sc_lv 32 signal 10 } 
	{ query_load_9 sc_in sc_lv 32 signal 11 } 
	{ query_load_10 sc_in sc_lv 32 signal 12 } 
	{ query_load_11 sc_in sc_lv 32 signal 13 } 
	{ query_load_12 sc_in sc_lv 32 signal 14 } 
	{ query_load_13 sc_in sc_lv 32 signal 15 } 
	{ query_load_14 sc_in sc_lv 32 signal 16 } 
	{ query_load_15 sc_in sc_lv 32 signal 17 } 
	{ query_load_16 sc_in sc_lv 32 signal 18 } 
	{ denominator sc_in sc_lv 32 signal 19 } 
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
	{ grp_fu_1206_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1206_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "key_value_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address0" }} , 
 	{ "name": "key_value_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce0" }} , 
 	{ "name": "key_value_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q0" }} , 
 	{ "name": "key_value_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address1" }} , 
 	{ "name": "key_value_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce1" }} , 
 	{ "name": "key_value_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q1" }} , 
 	{ "name": "key_value_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address2" }} , 
 	{ "name": "key_value_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce2" }} , 
 	{ "name": "key_value_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q2" }} , 
 	{ "name": "key_value_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address3" }} , 
 	{ "name": "key_value_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce3" }} , 
 	{ "name": "key_value_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q3" }} , 
 	{ "name": "key_value_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address4" }} , 
 	{ "name": "key_value_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce4" }} , 
 	{ "name": "key_value_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q4" }} , 
 	{ "name": "key_value_address5", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address5" }} , 
 	{ "name": "key_value_ce5", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce5" }} , 
 	{ "name": "key_value_q5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q5" }} , 
 	{ "name": "key_value_address6", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address6" }} , 
 	{ "name": "key_value_ce6", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce6" }} , 
 	{ "name": "key_value_q6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q6" }} , 
 	{ "name": "key_value_address7", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address7" }} , 
 	{ "name": "key_value_ce7", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce7" }} , 
 	{ "name": "key_value_q7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q7" }} , 
 	{ "name": "key_value_address8", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address8" }} , 
 	{ "name": "key_value_ce8", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce8" }} , 
 	{ "name": "key_value_q8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q8" }} , 
 	{ "name": "key_value_address9", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address9" }} , 
 	{ "name": "key_value_ce9", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce9" }} , 
 	{ "name": "key_value_q9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q9" }} , 
 	{ "name": "key_value_address10", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address10" }} , 
 	{ "name": "key_value_ce10", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce10" }} , 
 	{ "name": "key_value_q10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q10" }} , 
 	{ "name": "key_value_address11", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address11" }} , 
 	{ "name": "key_value_ce11", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce11" }} , 
 	{ "name": "key_value_q11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q11" }} , 
 	{ "name": "key_value_address12", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address12" }} , 
 	{ "name": "key_value_ce12", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce12" }} , 
 	{ "name": "key_value_q12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q12" }} , 
 	{ "name": "key_value_address13", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address13" }} , 
 	{ "name": "key_value_ce13", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce13" }} , 
 	{ "name": "key_value_q13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q13" }} , 
 	{ "name": "key_value_address14", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address14" }} , 
 	{ "name": "key_value_ce14", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce14" }} , 
 	{ "name": "key_value_q14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q14" }} , 
 	{ "name": "key_value_address15", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key_value", "role": "address15" }} , 
 	{ "name": "key_value_ce15", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_value", "role": "ce15" }} , 
 	{ "name": "key_value_q15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_value", "role": "q15" }} , 
 	{ "name": "zext_ln130", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln130", "role": "default" }} , 
 	{ "name": "attention_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "attention", "role": "address0" }} , 
 	{ "name": "attention_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "ce0" }} , 
 	{ "name": "attention_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention", "role": "we0" }} , 
 	{ "name": "attention_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention", "role": "d0" }} , 
 	{ "name": "query_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_1", "role": "default" }} , 
 	{ "name": "query_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_2", "role": "default" }} , 
 	{ "name": "query_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_3", "role": "default" }} , 
 	{ "name": "query_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_4", "role": "default" }} , 
 	{ "name": "query_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_5", "role": "default" }} , 
 	{ "name": "query_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_6", "role": "default" }} , 
 	{ "name": "query_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_7", "role": "default" }} , 
 	{ "name": "query_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_8", "role": "default" }} , 
 	{ "name": "query_load_9", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_9", "role": "default" }} , 
 	{ "name": "query_load_10", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_10", "role": "default" }} , 
 	{ "name": "query_load_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_11", "role": "default" }} , 
 	{ "name": "query_load_12", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_12", "role": "default" }} , 
 	{ "name": "query_load_13", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_13", "role": "default" }} , 
 	{ "name": "query_load_14", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_14", "role": "default" }} , 
 	{ "name": "query_load_15", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_15", "role": "default" }} , 
 	{ "name": "query_load_16", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_load_16", "role": "default" }} , 
 	{ "name": "denominator", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "denominator", "role": "default" }} , 
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
 	{ "name": "grp_fu_1206_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1206_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1206_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1206_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "unsw_linear_transformer_Pipeline_VITIS_LOOP_135_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "119", "EstimateLatencyMax" : "119",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "key_value", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln130", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_load_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "denominator", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_135_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter102", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter102", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	unsw_linear_transformer_Pipeline_VITIS_LOOP_135_14 {
		key_value {Type I LastRead 1 FirstWrite -1}
		zext_ln130 {Type I LastRead 0 FirstWrite -1}
		attention {Type O LastRead -1 FirstWrite 102}
		query_load_1 {Type I LastRead 0 FirstWrite -1}
		query_load_2 {Type I LastRead 0 FirstWrite -1}
		query_load_3 {Type I LastRead 0 FirstWrite -1}
		query_load_4 {Type I LastRead 0 FirstWrite -1}
		query_load_5 {Type I LastRead 0 FirstWrite -1}
		query_load_6 {Type I LastRead 0 FirstWrite -1}
		query_load_7 {Type I LastRead 0 FirstWrite -1}
		query_load_8 {Type I LastRead 0 FirstWrite -1}
		query_load_9 {Type I LastRead 0 FirstWrite -1}
		query_load_10 {Type I LastRead 0 FirstWrite -1}
		query_load_11 {Type I LastRead 0 FirstWrite -1}
		query_load_12 {Type I LastRead 0 FirstWrite -1}
		query_load_13 {Type I LastRead 0 FirstWrite -1}
		query_load_14 {Type I LastRead 0 FirstWrite -1}
		query_load_15 {Type I LastRead 0 FirstWrite -1}
		query_load_16 {Type I LastRead 0 FirstWrite -1}
		denominator {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "119", "Max" : "119"}
	, {"Name" : "Interval", "Min" : "119", "Max" : "119"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	key_value { ap_memory {  { key_value_address0 mem_address 1 8 }  { key_value_ce0 mem_ce 1 1 }  { key_value_q0 mem_dout 0 32 }  { key_value_address1 MemPortADDR2 1 8 }  { key_value_ce1 MemPortCE2 1 1 }  { key_value_q1 MemPortDOUT2 0 32 }  { key_value_address2 MemPortADDR2 1 8 }  { key_value_ce2 MemPortCE2 1 1 }  { key_value_q2 MemPortDOUT2 0 32 }  { key_value_address3 MemPortADDR2 1 8 }  { key_value_ce3 MemPortCE2 1 1 }  { key_value_q3 MemPortDOUT2 0 32 }  { key_value_address4 MemPortADDR2 1 8 }  { key_value_ce4 MemPortCE2 1 1 }  { key_value_q4 MemPortDOUT2 0 32 }  { key_value_address5 MemPortADDR2 1 8 }  { key_value_ce5 MemPortCE2 1 1 }  { key_value_q5 MemPortDOUT2 0 32 }  { key_value_address6 MemPortADDR2 1 8 }  { key_value_ce6 MemPortCE2 1 1 }  { key_value_q6 MemPortDOUT2 0 32 }  { key_value_address7 MemPortADDR2 1 8 }  { key_value_ce7 MemPortCE2 1 1 }  { key_value_q7 MemPortDOUT2 0 32 }  { key_value_address8 MemPortADDR2 1 8 }  { key_value_ce8 MemPortCE2 1 1 }  { key_value_q8 MemPortDOUT2 0 32 }  { key_value_address9 MemPortADDR2 1 8 }  { key_value_ce9 MemPortCE2 1 1 }  { key_value_q9 MemPortDOUT2 0 32 }  { key_value_address10 MemPortADDR2 1 8 }  { key_value_ce10 MemPortCE2 1 1 }  { key_value_q10 MemPortDOUT2 0 32 }  { key_value_address11 MemPortADDR2 1 8 }  { key_value_ce11 MemPortCE2 1 1 }  { key_value_q11 MemPortDOUT2 0 32 }  { key_value_address12 MemPortADDR2 1 8 }  { key_value_ce12 MemPortCE2 1 1 }  { key_value_q12 MemPortDOUT2 0 32 }  { key_value_address13 MemPortADDR2 1 8 }  { key_value_ce13 MemPortCE2 1 1 }  { key_value_q13 MemPortDOUT2 0 32 }  { key_value_address14 MemPortADDR2 1 8 }  { key_value_ce14 MemPortCE2 1 1 }  { key_value_q14 MemPortDOUT2 0 32 }  { key_value_address15 MemPortADDR2 1 8 }  { key_value_ce15 MemPortCE2 1 1 }  { key_value_q15 MemPortDOUT2 0 32 } } }
	zext_ln130 { ap_none {  { zext_ln130 in_data 0 7 } } }
	attention { ap_memory {  { attention_address0 mem_address 1 7 }  { attention_ce0 mem_ce 1 1 }  { attention_we0 mem_we 1 1 }  { attention_d0 mem_din 1 32 } } }
	query_load_1 { ap_none {  { query_load_1 in_data 0 32 } } }
	query_load_2 { ap_none {  { query_load_2 in_data 0 32 } } }
	query_load_3 { ap_none {  { query_load_3 in_data 0 32 } } }
	query_load_4 { ap_none {  { query_load_4 in_data 0 32 } } }
	query_load_5 { ap_none {  { query_load_5 in_data 0 32 } } }
	query_load_6 { ap_none {  { query_load_6 in_data 0 32 } } }
	query_load_7 { ap_none {  { query_load_7 in_data 0 32 } } }
	query_load_8 { ap_none {  { query_load_8 in_data 0 32 } } }
	query_load_9 { ap_none {  { query_load_9 in_data 0 32 } } }
	query_load_10 { ap_none {  { query_load_10 in_data 0 32 } } }
	query_load_11 { ap_none {  { query_load_11 in_data 0 32 } } }
	query_load_12 { ap_none {  { query_load_12 in_data 0 32 } } }
	query_load_13 { ap_none {  { query_load_13 in_data 0 32 } } }
	query_load_14 { ap_none {  { query_load_14 in_data 0 32 } } }
	query_load_15 { ap_none {  { query_load_15 in_data 0 32 } } }
	query_load_16 { ap_none {  { query_load_16 in_data 0 32 } } }
	denominator { ap_none {  { denominator in_data 0 32 } } }
}
