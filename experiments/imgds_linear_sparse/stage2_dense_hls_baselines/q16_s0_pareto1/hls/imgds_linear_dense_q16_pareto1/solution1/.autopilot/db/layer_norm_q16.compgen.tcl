# This script segment is generated automatically by AutoPilot

set name imgds_linear_dense_q16_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name imgds_linear_dense_q16_fsqrt_32ns_32ns_32_16_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fsqrt} IMPL {fabric} LATENCY 15 ALLOW_PRAGMA 1
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
    id 2286 \
    name x_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_0 \
    op interface \
    ports { x_0_address0 { O 6 vector } x_0_ce0 { O 1 bit } x_0_we0 { O 1 bit } x_0_d0 { O 16 vector } x_0_q0 { I 16 vector } x_0_address1 { O 6 vector } x_0_ce1 { O 1 bit } x_0_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2288 \
    name x_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_1 \
    op interface \
    ports { x_1_address0 { O 6 vector } x_1_ce0 { O 1 bit } x_1_we0 { O 1 bit } x_1_d0 { O 16 vector } x_1_q0 { I 16 vector } x_1_address1 { O 6 vector } x_1_ce1 { O 1 bit } x_1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2290 \
    name x_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_2 \
    op interface \
    ports { x_2_address0 { O 6 vector } x_2_ce0 { O 1 bit } x_2_we0 { O 1 bit } x_2_d0 { O 16 vector } x_2_q0 { I 16 vector } x_2_address1 { O 6 vector } x_2_ce1 { O 1 bit } x_2_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2292 \
    name x_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_3 \
    op interface \
    ports { x_3_address0 { O 6 vector } x_3_ce0 { O 1 bit } x_3_we0 { O 1 bit } x_3_d0 { O 16 vector } x_3_q0 { I 16 vector } x_3_address1 { O 6 vector } x_3_ce1 { O 1 bit } x_3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2294 \
    name gamma \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gamma \
    op interface \
    ports { gamma_address0 { O 4 vector } gamma_ce0 { O 1 bit } gamma_q0 { I 11 vector } gamma_address1 { O 4 vector } gamma_ce1 { O 1 bit } gamma_q1 { I 11 vector } gamma_address2 { O 4 vector } gamma_ce2 { O 1 bit } gamma_q2 { I 11 vector } gamma_address3 { O 4 vector } gamma_ce3 { O 1 bit } gamma_q3 { I 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gamma'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2295 \
    name beta \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename beta \
    op interface \
    ports { beta_address0 { O 4 vector } beta_ce0 { O 1 bit } beta_q0 { I 8 vector } beta_address1 { O 4 vector } beta_ce1 { O 1 bit } beta_q1 { I 8 vector } beta_address2 { O 4 vector } beta_ce2 { O 1 bit } beta_q2 { I 8 vector } beta_address3 { O 4 vector } beta_ce3 { O 1 bit } beta_q3 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'beta'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2287 \
    name x_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_0_offset \
    op interface \
    ports { x_0_offset { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2289 \
    name x_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_1_offset \
    op interface \
    ports { x_1_offset { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2291 \
    name x_2_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_2_offset \
    op interface \
    ports { x_2_offset { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2293 \
    name x_3_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_3_offset \
    op interface \
    ports { x_3_offset { I 4 vector } } \
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


