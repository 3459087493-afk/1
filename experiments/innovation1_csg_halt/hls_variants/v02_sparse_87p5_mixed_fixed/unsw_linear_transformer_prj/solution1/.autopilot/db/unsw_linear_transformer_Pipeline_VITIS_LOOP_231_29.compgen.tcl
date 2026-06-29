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
    id 518 \
    name logits \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename logits \
    op interface \
    ports { logits_address0 { O 1 vector } logits_ce0 { O 1 bit } logits_we0 { O 1 bit } logits_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'logits'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 502 \
    name normalized_output_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load \
    op interface \
    ports { normalized_output_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 503 \
    name normalized_output_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_1 \
    op interface \
    ports { normalized_output_load_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 504 \
    name normalized_output_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_2 \
    op interface \
    ports { normalized_output_load_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 505 \
    name normalized_output_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_3 \
    op interface \
    ports { normalized_output_load_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 506 \
    name normalized_output_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_4 \
    op interface \
    ports { normalized_output_load_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 507 \
    name normalized_output_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_5 \
    op interface \
    ports { normalized_output_load_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 508 \
    name normalized_output_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_6 \
    op interface \
    ports { normalized_output_load_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 509 \
    name normalized_output_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_7 \
    op interface \
    ports { normalized_output_load_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 510 \
    name normalized_output_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_8 \
    op interface \
    ports { normalized_output_load_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name normalized_output_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_9 \
    op interface \
    ports { normalized_output_load_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name normalized_output_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_10 \
    op interface \
    ports { normalized_output_load_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name normalized_output_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_11 \
    op interface \
    ports { normalized_output_load_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name normalized_output_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_12 \
    op interface \
    ports { normalized_output_load_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name normalized_output_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_13 \
    op interface \
    ports { normalized_output_load_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name normalized_output_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_14 \
    op interface \
    ports { normalized_output_load_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name normalized_output_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_normalized_output_load_15 \
    op interface \
    ports { normalized_output_load_15 { I 32 vector } } \
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


