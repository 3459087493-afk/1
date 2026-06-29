# This script segment is generated automatically by AutoPilot

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
    id 260 \
    name key_value \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename key_value \
    op interface \
    ports { key_value_address0 { O 8 vector } key_value_ce0 { O 1 bit } key_value_q0 { I 32 vector } key_value_address1 { O 8 vector } key_value_ce1 { O 1 bit } key_value_q1 { I 32 vector } key_value_address2 { O 8 vector } key_value_ce2 { O 1 bit } key_value_q2 { I 32 vector } key_value_address3 { O 8 vector } key_value_ce3 { O 1 bit } key_value_q3 { I 32 vector } key_value_address4 { O 8 vector } key_value_ce4 { O 1 bit } key_value_q4 { I 32 vector } key_value_address5 { O 8 vector } key_value_ce5 { O 1 bit } key_value_q5 { I 32 vector } key_value_address6 { O 8 vector } key_value_ce6 { O 1 bit } key_value_q6 { I 32 vector } key_value_address7 { O 8 vector } key_value_ce7 { O 1 bit } key_value_q7 { I 32 vector } key_value_address8 { O 8 vector } key_value_ce8 { O 1 bit } key_value_q8 { I 32 vector } key_value_address9 { O 8 vector } key_value_ce9 { O 1 bit } key_value_q9 { I 32 vector } key_value_address10 { O 8 vector } key_value_ce10 { O 1 bit } key_value_q10 { I 32 vector } key_value_address11 { O 8 vector } key_value_ce11 { O 1 bit } key_value_q11 { I 32 vector } key_value_address12 { O 8 vector } key_value_ce12 { O 1 bit } key_value_q12 { I 32 vector } key_value_address13 { O 8 vector } key_value_ce13 { O 1 bit } key_value_q13 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'key_value'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 262 \
    name attention \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename attention \
    op interface \
    ports { attention_address0 { O 7 vector } attention_ce0 { O 1 bit } attention_we0 { O 1 bit } attention_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'attention'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 261 \
    name zext_ln148 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln148 \
    op interface \
    ports { zext_ln148 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 263 \
    name sparse_query_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_1 \
    op interface \
    ports { sparse_query_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 264 \
    name sparse_query_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_2 \
    op interface \
    ports { sparse_query_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name sparse_query_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_3 \
    op interface \
    ports { sparse_query_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name sparse_query_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_4 \
    op interface \
    ports { sparse_query_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name sparse_query_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_5 \
    op interface \
    ports { sparse_query_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name sparse_query_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_6 \
    op interface \
    ports { sparse_query_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name sparse_query_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_7 \
    op interface \
    ports { sparse_query_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 270 \
    name sparse_query_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_8 \
    op interface \
    ports { sparse_query_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 271 \
    name sparse_query_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_9 \
    op interface \
    ports { sparse_query_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 272 \
    name sparse_query_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_10 \
    op interface \
    ports { sparse_query_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 273 \
    name sparse_query_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_11 \
    op interface \
    ports { sparse_query_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name sparse_query_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_12 \
    op interface \
    ports { sparse_query_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name sparse_query_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_13 \
    op interface \
    ports { sparse_query_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 276 \
    name sparse_query_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sparse_query_load_14 \
    op interface \
    ports { sparse_query_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 277 \
    name denominator \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_denominator \
    op interface \
    ports { denominator { I 32 vector } } \
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


