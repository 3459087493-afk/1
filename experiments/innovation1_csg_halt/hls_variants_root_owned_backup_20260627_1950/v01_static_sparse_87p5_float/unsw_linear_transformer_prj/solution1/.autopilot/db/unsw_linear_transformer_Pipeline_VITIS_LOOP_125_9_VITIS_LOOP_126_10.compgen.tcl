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
    id 212 \
    name sparse_key \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename sparse_key \
    op interface \
    ports { sparse_key_address0 { O 7 vector } sparse_key_ce0 { O 1 bit } sparse_key_q0 { I 32 vector } sparse_key_address1 { O 7 vector } sparse_key_ce1 { O 1 bit } sparse_key_q1 { I 32 vector } sparse_key_address2 { O 7 vector } sparse_key_ce2 { O 1 bit } sparse_key_q2 { I 32 vector } sparse_key_address3 { O 7 vector } sparse_key_ce3 { O 1 bit } sparse_key_q3 { I 32 vector } sparse_key_address4 { O 7 vector } sparse_key_ce4 { O 1 bit } sparse_key_q4 { I 32 vector } sparse_key_address5 { O 7 vector } sparse_key_ce5 { O 1 bit } sparse_key_q5 { I 32 vector } sparse_key_address6 { O 7 vector } sparse_key_ce6 { O 1 bit } sparse_key_q6 { I 32 vector } sparse_key_address7 { O 7 vector } sparse_key_ce7 { O 1 bit } sparse_key_q7 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sparse_key'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 213 \
    name value_r \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename value_r \
    op interface \
    ports { value_r_address0 { O 7 vector } value_r_ce0 { O 1 bit } value_r_q0 { I 32 vector } value_r_address1 { O 7 vector } value_r_ce1 { O 1 bit } value_r_q1 { I 32 vector } value_r_address2 { O 7 vector } value_r_ce2 { O 1 bit } value_r_q2 { I 32 vector } value_r_address3 { O 7 vector } value_r_ce3 { O 1 bit } value_r_q3 { I 32 vector } value_r_address4 { O 7 vector } value_r_ce4 { O 1 bit } value_r_q4 { I 32 vector } value_r_address5 { O 7 vector } value_r_ce5 { O 1 bit } value_r_q5 { I 32 vector } value_r_address6 { O 7 vector } value_r_ce6 { O 1 bit } value_r_q6 { I 32 vector } value_r_address7 { O 7 vector } value_r_ce7 { O 1 bit } value_r_q7 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'value_r'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 214 \
    name key_value \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename key_value \
    op interface \
    ports { key_value_address0 { O 8 vector } key_value_ce0 { O 1 bit } key_value_we0 { O 1 bit } key_value_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'key_value'"
}
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


