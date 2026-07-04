# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler imgds_linear_dense_q16_linear_attention_q16_Q_V_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler imgds_linear_dense_q16_linear_attention_q16_K_V_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 3072 \
    name x_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_0 \
    op interface \
    ports { x_0_address0 { O 4 vector } x_0_ce0 { O 1 bit } x_0_we0 { O 1 bit } x_0_d0 { O 16 vector } x_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3073 \
    name x_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_1 \
    op interface \
    ports { x_1_address0 { O 4 vector } x_1_ce0 { O 1 bit } x_1_we0 { O 1 bit } x_1_d0 { O 16 vector } x_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3074 \
    name x_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_2 \
    op interface \
    ports { x_2_address0 { O 4 vector } x_2_ce0 { O 1 bit } x_2_we0 { O 1 bit } x_2_d0 { O 16 vector } x_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3075 \
    name x_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_3 \
    op interface \
    ports { x_3_address0 { O 4 vector } x_3_ce0 { O 1 bit } x_3_we0 { O 1 bit } x_3_d0 { O 16 vector } x_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3076 \
    name x_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_4 \
    op interface \
    ports { x_4_address0 { O 4 vector } x_4_ce0 { O 1 bit } x_4_we0 { O 1 bit } x_4_d0 { O 16 vector } x_4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3077 \
    name x_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_5 \
    op interface \
    ports { x_5_address0 { O 4 vector } x_5_ce0 { O 1 bit } x_5_we0 { O 1 bit } x_5_d0 { O 16 vector } x_5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3078 \
    name x_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_6 \
    op interface \
    ports { x_6_address0 { O 4 vector } x_6_ce0 { O 1 bit } x_6_we0 { O 1 bit } x_6_d0 { O 16 vector } x_6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3079 \
    name x_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_7 \
    op interface \
    ports { x_7_address0 { O 4 vector } x_7_ce0 { O 1 bit } x_7_we0 { O 1 bit } x_7_d0 { O 16 vector } x_7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3080 \
    name x_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_8 \
    op interface \
    ports { x_8_address0 { O 4 vector } x_8_ce0 { O 1 bit } x_8_we0 { O 1 bit } x_8_d0 { O 16 vector } x_8_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3081 \
    name x_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_9 \
    op interface \
    ports { x_9_address0 { O 4 vector } x_9_ce0 { O 1 bit } x_9_we0 { O 1 bit } x_9_d0 { O 16 vector } x_9_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3082 \
    name x_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_10 \
    op interface \
    ports { x_10_address0 { O 4 vector } x_10_ce0 { O 1 bit } x_10_we0 { O 1 bit } x_10_d0 { O 16 vector } x_10_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3083 \
    name x_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_11 \
    op interface \
    ports { x_11_address0 { O 4 vector } x_11_ce0 { O 1 bit } x_11_we0 { O 1 bit } x_11_d0 { O 16 vector } x_11_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3084 \
    name x_12 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_12 \
    op interface \
    ports { x_12_address0 { O 4 vector } x_12_ce0 { O 1 bit } x_12_we0 { O 1 bit } x_12_d0 { O 16 vector } x_12_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3085 \
    name x_13 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_13 \
    op interface \
    ports { x_13_address0 { O 4 vector } x_13_ce0 { O 1 bit } x_13_we0 { O 1 bit } x_13_d0 { O 16 vector } x_13_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3086 \
    name x_14 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_14 \
    op interface \
    ports { x_14_address0 { O 4 vector } x_14_ce0 { O 1 bit } x_14_we0 { O 1 bit } x_14_d0 { O 16 vector } x_14_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3087 \
    name x_15 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_15 \
    op interface \
    ports { x_15_address0 { O 4 vector } x_15_ce0 { O 1 bit } x_15_we0 { O 1 bit } x_15_d0 { O 16 vector } x_15_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_15'"
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


