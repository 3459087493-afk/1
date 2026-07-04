# This script segment is generated automatically by AutoPilot

set id 2373
set name imgds_linear_dense_q16_mac_muladd_16s_16s_30ns_30_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 16
set in1_signed 1
set in2_width 30
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 30
set arg_lists {i0 {16 1 +} i1 {16 1 +} m {30 1 +} i2 {30 0 +} p {30 0 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2375 \
    name Q_V_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_load \
    op interface \
    ports { Q_V_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2376 \
    name Q_V_1_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_1_load \
    op interface \
    ports { Q_V_1_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2377 \
    name Q_V_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_2_load \
    op interface \
    ports { Q_V_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2378 \
    name Q_V_3_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_3_load \
    op interface \
    ports { Q_V_3_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2379 \
    name Q_V_4_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_4_load \
    op interface \
    ports { Q_V_4_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2380 \
    name Q_V_5_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_5_load \
    op interface \
    ports { Q_V_5_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2381 \
    name Q_V_6_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_6_load \
    op interface \
    ports { Q_V_6_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2382 \
    name Q_V_7_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_7_load \
    op interface \
    ports { Q_V_7_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2383 \
    name Q_V_8_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_8_load \
    op interface \
    ports { Q_V_8_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2384 \
    name Q_V_9_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_9_load \
    op interface \
    ports { Q_V_9_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2385 \
    name Q_V_10_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_10_load \
    op interface \
    ports { Q_V_10_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2386 \
    name Q_V_11_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_11_load \
    op interface \
    ports { Q_V_11_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2387 \
    name Q_V_12_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_12_load \
    op interface \
    ports { Q_V_12_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2388 \
    name Q_V_13_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_13_load \
    op interface \
    ports { Q_V_13_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2389 \
    name Q_V_14_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_14_load \
    op interface \
    ports { Q_V_14_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2390 \
    name Q_V_15_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Q_V_15_load \
    op interface \
    ports { Q_V_15_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2391 \
    name K_sum_V_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_reload \
    op interface \
    ports { K_sum_V_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2392 \
    name K_sum_V_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_1_reload \
    op interface \
    ports { K_sum_V_1_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2393 \
    name K_sum_V_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_2_reload \
    op interface \
    ports { K_sum_V_2_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2394 \
    name K_sum_V_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_3_reload \
    op interface \
    ports { K_sum_V_3_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2395 \
    name K_sum_V_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_4_reload \
    op interface \
    ports { K_sum_V_4_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2396 \
    name K_sum_V_5_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_5_reload \
    op interface \
    ports { K_sum_V_5_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2397 \
    name K_sum_V_6_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_6_reload \
    op interface \
    ports { K_sum_V_6_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2398 \
    name K_sum_V_7_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_7_reload \
    op interface \
    ports { K_sum_V_7_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2399 \
    name K_sum_V_8_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_8_reload \
    op interface \
    ports { K_sum_V_8_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2400 \
    name K_sum_V_9_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_9_reload \
    op interface \
    ports { K_sum_V_9_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2401 \
    name K_sum_V_10_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_10_reload \
    op interface \
    ports { K_sum_V_10_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2402 \
    name K_sum_V_11_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_11_reload \
    op interface \
    ports { K_sum_V_11_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2403 \
    name K_sum_V_12_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_12_reload \
    op interface \
    ports { K_sum_V_12_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2404 \
    name K_sum_V_13_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_13_reload \
    op interface \
    ports { K_sum_V_13_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2405 \
    name K_sum_V_14_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_14_reload \
    op interface \
    ports { K_sum_V_14_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2406 \
    name K_sum_V_15_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_K_sum_V_15_reload \
    op interface \
    ports { K_sum_V_15_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2407 \
    name normalizer_V_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_normalizer_V_2_out \
    op interface \
    ports { normalizer_V_2_out { O 24 vector } normalizer_V_2_out_ap_vld { O 1 bit } } \
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
set InstName imgds_linear_dense_q16_flow_control_loop_pipe_sequential_init_U
set CompName imgds_linear_dense_q16_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix imgds_linear_dense_q16_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


