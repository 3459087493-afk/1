# This script segment is generated automatically by AutoPilot

set name unsw_linear_transformer_mul_22s_28s_50_3_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set name unsw_linear_transformer_sdiv_44ns_28ns_44_48_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sdiv} IMPL {auto} LATENCY 47 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 204 \
    name key_value_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename key_value_V \
    op interface \
    ports { key_value_V_address0 { O 8 vector } key_value_V_ce0 { O 1 bit } key_value_V_q0 { I 28 vector } key_value_V_address1 { O 8 vector } key_value_V_ce1 { O 1 bit } key_value_V_q1 { I 28 vector } key_value_V_address2 { O 8 vector } key_value_V_ce2 { O 1 bit } key_value_V_q2 { I 28 vector } key_value_V_address3 { O 8 vector } key_value_V_ce3 { O 1 bit } key_value_V_q3 { I 28 vector } key_value_V_address4 { O 8 vector } key_value_V_ce4 { O 1 bit } key_value_V_q4 { I 28 vector } key_value_V_address5 { O 8 vector } key_value_V_ce5 { O 1 bit } key_value_V_q5 { I 28 vector } key_value_V_address6 { O 8 vector } key_value_V_ce6 { O 1 bit } key_value_V_q6 { I 28 vector } key_value_V_address7 { O 8 vector } key_value_V_ce7 { O 1 bit } key_value_V_q7 { I 28 vector } key_value_V_address8 { O 8 vector } key_value_V_ce8 { O 1 bit } key_value_V_q8 { I 28 vector } key_value_V_address9 { O 8 vector } key_value_V_ce9 { O 1 bit } key_value_V_q9 { I 28 vector } key_value_V_address10 { O 8 vector } key_value_V_ce10 { O 1 bit } key_value_V_q10 { I 28 vector } key_value_V_address11 { O 8 vector } key_value_V_ce11 { O 1 bit } key_value_V_q11 { I 28 vector } key_value_V_address12 { O 8 vector } key_value_V_ce12 { O 1 bit } key_value_V_q12 { I 28 vector } key_value_V_address13 { O 8 vector } key_value_V_ce13 { O 1 bit } key_value_V_q13 { I 28 vector } key_value_V_address14 { O 8 vector } key_value_V_ce14 { O 1 bit } key_value_V_q14 { I 28 vector } key_value_V_address15 { O 8 vector } key_value_V_ce15 { O 1 bit } key_value_V_q15 { I 28 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'key_value_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 206 \
    name attention_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename attention_V \
    op interface \
    ports { attention_V_address0 { O 7 vector } attention_V_ce0 { O 1 bit } attention_V_we0 { O 1 bit } attention_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'attention_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name zext_ln837_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln837_5 \
    op interface \
    ports { zext_ln837_5 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name sext_ln837_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_1 \
    op interface \
    ports { sext_ln837_1 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name sext_ln837_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_2 \
    op interface \
    ports { sext_ln837_2 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name sext_ln837_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_3 \
    op interface \
    ports { sext_ln837_3 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name sext_ln837_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_4 \
    op interface \
    ports { sext_ln837_4 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name sext_ln837_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_5 \
    op interface \
    ports { sext_ln837_5 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name sext_ln837_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_6 \
    op interface \
    ports { sext_ln837_6 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name sext_ln837_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_7 \
    op interface \
    ports { sext_ln837_7 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name sext_ln837_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_8 \
    op interface \
    ports { sext_ln837_8 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name sext_ln837_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_9 \
    op interface \
    ports { sext_ln837_9 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name sext_ln837_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_10 \
    op interface \
    ports { sext_ln837_10 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name sext_ln837_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_11 \
    op interface \
    ports { sext_ln837_11 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name sext_ln837_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_12 \
    op interface \
    ports { sext_ln837_12 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name sext_ln837_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_13 \
    op interface \
    ports { sext_ln837_13 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name sext_ln837_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_14 \
    op interface \
    ports { sext_ln837_14 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name sext_ln837_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln837_15 \
    op interface \
    ports { sext_ln837_15 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name sext_ln174 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln174 \
    op interface \
    ports { sext_ln174 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name conv_i2287 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv_i2287 \
    op interface \
    ports { conv_i2287 { I 27 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName unsw_linear_transformer_flow_control_loop_pipe_sequential_init_U
set CompName unsw_linear_transformer_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix unsw_linear_transformer_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


