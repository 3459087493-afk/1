# This script segment is generated automatically by AutoPilot

set id 2424
set name imgds_linear_dense_q16_mul_mul_16s_16s_30_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 16
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 30
set arg_lists {i0 {16 1 +} i1 {16 1 +} p {30 1 +} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mul
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
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 2440
set name imgds_linear_dense_q16_mul_mul_24s_16s_30_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 24
set in0_signed 1
set in1_width 16
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 30
set arg_lists {i0 {24 1 +} i1 {16 1 +} p {30 1 +} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mul
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
    id 2443 \
    name KV_V_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load \
    op interface \
    ports { KV_V_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2444 \
    name KV_V_1_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load \
    op interface \
    ports { KV_V_1_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2445 \
    name KV_V_2_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load \
    op interface \
    ports { KV_V_2_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2446 \
    name KV_V_3_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load \
    op interface \
    ports { KV_V_3_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2447 \
    name KV_V_4_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load \
    op interface \
    ports { KV_V_4_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2448 \
    name KV_V_5_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load \
    op interface \
    ports { KV_V_5_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2449 \
    name KV_V_6_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load \
    op interface \
    ports { KV_V_6_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2450 \
    name KV_V_7_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load \
    op interface \
    ports { KV_V_7_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2451 \
    name KV_V_8_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load \
    op interface \
    ports { KV_V_8_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2452 \
    name KV_V_9_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load \
    op interface \
    ports { KV_V_9_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2453 \
    name KV_V_10_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load \
    op interface \
    ports { KV_V_10_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2454 \
    name KV_V_11_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load \
    op interface \
    ports { KV_V_11_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2455 \
    name KV_V_12_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load \
    op interface \
    ports { KV_V_12_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2456 \
    name KV_V_13_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load \
    op interface \
    ports { KV_V_13_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2457 \
    name KV_V_14_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load \
    op interface \
    ports { KV_V_14_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2458 \
    name KV_V_15_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load \
    op interface \
    ports { KV_V_15_load { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2459 \
    name sext_ln818_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln818_2 \
    op interface \
    ports { sext_ln818_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2460 \
    name KV_V_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_1 \
    op interface \
    ports { KV_V_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2461 \
    name KV_V_1_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_1 \
    op interface \
    ports { KV_V_1_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2462 \
    name KV_V_2_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_1 \
    op interface \
    ports { KV_V_2_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2463 \
    name KV_V_3_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_1 \
    op interface \
    ports { KV_V_3_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2464 \
    name KV_V_4_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_1 \
    op interface \
    ports { KV_V_4_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2465 \
    name KV_V_5_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_1 \
    op interface \
    ports { KV_V_5_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2466 \
    name KV_V_6_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_1 \
    op interface \
    ports { KV_V_6_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2467 \
    name KV_V_7_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_1 \
    op interface \
    ports { KV_V_7_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2468 \
    name KV_V_8_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_1 \
    op interface \
    ports { KV_V_8_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2469 \
    name KV_V_9_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_1 \
    op interface \
    ports { KV_V_9_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2470 \
    name KV_V_10_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_1 \
    op interface \
    ports { KV_V_10_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2471 \
    name KV_V_11_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_1 \
    op interface \
    ports { KV_V_11_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2472 \
    name KV_V_12_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_1 \
    op interface \
    ports { KV_V_12_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2473 \
    name KV_V_13_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_1 \
    op interface \
    ports { KV_V_13_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2474 \
    name KV_V_14_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_1 \
    op interface \
    ports { KV_V_14_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2475 \
    name KV_V_15_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_1 \
    op interface \
    ports { KV_V_15_load_1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2476 \
    name sext_ln1347_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_52 \
    op interface \
    ports { sext_ln1347_52 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2477 \
    name KV_V_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_2 \
    op interface \
    ports { KV_V_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2478 \
    name KV_V_1_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_2 \
    op interface \
    ports { KV_V_1_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2479 \
    name KV_V_2_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_2 \
    op interface \
    ports { KV_V_2_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2480 \
    name KV_V_3_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_2 \
    op interface \
    ports { KV_V_3_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2481 \
    name KV_V_4_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_2 \
    op interface \
    ports { KV_V_4_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2482 \
    name KV_V_5_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_2 \
    op interface \
    ports { KV_V_5_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2483 \
    name KV_V_6_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_2 \
    op interface \
    ports { KV_V_6_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2484 \
    name KV_V_7_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_2 \
    op interface \
    ports { KV_V_7_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2485 \
    name KV_V_8_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_2 \
    op interface \
    ports { KV_V_8_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2486 \
    name KV_V_9_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_2 \
    op interface \
    ports { KV_V_9_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2487 \
    name KV_V_10_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_2 \
    op interface \
    ports { KV_V_10_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2488 \
    name KV_V_11_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_2 \
    op interface \
    ports { KV_V_11_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2489 \
    name KV_V_12_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_2 \
    op interface \
    ports { KV_V_12_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2490 \
    name KV_V_13_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_2 \
    op interface \
    ports { KV_V_13_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2491 \
    name KV_V_14_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_2 \
    op interface \
    ports { KV_V_14_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2492 \
    name KV_V_15_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_2 \
    op interface \
    ports { KV_V_15_load_2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2493 \
    name sext_ln1347_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_53 \
    op interface \
    ports { sext_ln1347_53 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2494 \
    name KV_V_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_3 \
    op interface \
    ports { KV_V_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2495 \
    name KV_V_1_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_3 \
    op interface \
    ports { KV_V_1_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2496 \
    name KV_V_2_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_3 \
    op interface \
    ports { KV_V_2_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2497 \
    name KV_V_3_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_3 \
    op interface \
    ports { KV_V_3_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2498 \
    name KV_V_4_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_3 \
    op interface \
    ports { KV_V_4_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2499 \
    name KV_V_5_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_3 \
    op interface \
    ports { KV_V_5_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2500 \
    name KV_V_6_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_3 \
    op interface \
    ports { KV_V_6_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2501 \
    name KV_V_7_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_3 \
    op interface \
    ports { KV_V_7_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2502 \
    name KV_V_8_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_3 \
    op interface \
    ports { KV_V_8_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2503 \
    name KV_V_9_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_3 \
    op interface \
    ports { KV_V_9_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2504 \
    name KV_V_10_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_3 \
    op interface \
    ports { KV_V_10_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2505 \
    name KV_V_11_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_3 \
    op interface \
    ports { KV_V_11_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2506 \
    name KV_V_12_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_3 \
    op interface \
    ports { KV_V_12_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2507 \
    name KV_V_13_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_3 \
    op interface \
    ports { KV_V_13_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2508 \
    name KV_V_14_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_3 \
    op interface \
    ports { KV_V_14_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2509 \
    name KV_V_15_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_3 \
    op interface \
    ports { KV_V_15_load_3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2510 \
    name sext_ln1347_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_54 \
    op interface \
    ports { sext_ln1347_54 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2511 \
    name KV_V_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_4 \
    op interface \
    ports { KV_V_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2512 \
    name KV_V_1_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_4 \
    op interface \
    ports { KV_V_1_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2513 \
    name KV_V_2_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_4 \
    op interface \
    ports { KV_V_2_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2514 \
    name KV_V_3_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_4 \
    op interface \
    ports { KV_V_3_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2515 \
    name KV_V_4_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_4 \
    op interface \
    ports { KV_V_4_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2516 \
    name KV_V_5_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_4 \
    op interface \
    ports { KV_V_5_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2517 \
    name KV_V_6_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_4 \
    op interface \
    ports { KV_V_6_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2518 \
    name KV_V_7_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_4 \
    op interface \
    ports { KV_V_7_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2519 \
    name KV_V_8_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_4 \
    op interface \
    ports { KV_V_8_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2520 \
    name KV_V_9_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_4 \
    op interface \
    ports { KV_V_9_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2521 \
    name KV_V_10_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_4 \
    op interface \
    ports { KV_V_10_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2522 \
    name KV_V_11_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_4 \
    op interface \
    ports { KV_V_11_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2523 \
    name KV_V_12_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_4 \
    op interface \
    ports { KV_V_12_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2524 \
    name KV_V_13_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_4 \
    op interface \
    ports { KV_V_13_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2525 \
    name KV_V_14_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_4 \
    op interface \
    ports { KV_V_14_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2526 \
    name KV_V_15_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_4 \
    op interface \
    ports { KV_V_15_load_4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2527 \
    name sext_ln1347_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_55 \
    op interface \
    ports { sext_ln1347_55 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2528 \
    name KV_V_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_5 \
    op interface \
    ports { KV_V_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2529 \
    name KV_V_1_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_5 \
    op interface \
    ports { KV_V_1_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2530 \
    name KV_V_2_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_5 \
    op interface \
    ports { KV_V_2_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2531 \
    name KV_V_3_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_5 \
    op interface \
    ports { KV_V_3_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2532 \
    name KV_V_4_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_5 \
    op interface \
    ports { KV_V_4_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2533 \
    name KV_V_5_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_5 \
    op interface \
    ports { KV_V_5_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2534 \
    name KV_V_6_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_5 \
    op interface \
    ports { KV_V_6_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2535 \
    name KV_V_7_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_5 \
    op interface \
    ports { KV_V_7_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2536 \
    name KV_V_8_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_5 \
    op interface \
    ports { KV_V_8_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2537 \
    name KV_V_9_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_5 \
    op interface \
    ports { KV_V_9_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2538 \
    name KV_V_10_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_5 \
    op interface \
    ports { KV_V_10_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2539 \
    name KV_V_11_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_5 \
    op interface \
    ports { KV_V_11_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2540 \
    name KV_V_12_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_5 \
    op interface \
    ports { KV_V_12_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2541 \
    name KV_V_13_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_5 \
    op interface \
    ports { KV_V_13_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2542 \
    name KV_V_14_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_5 \
    op interface \
    ports { KV_V_14_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2543 \
    name KV_V_15_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_5 \
    op interface \
    ports { KV_V_15_load_5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2544 \
    name sext_ln1347_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_56 \
    op interface \
    ports { sext_ln1347_56 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2545 \
    name KV_V_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_6 \
    op interface \
    ports { KV_V_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2546 \
    name KV_V_1_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_6 \
    op interface \
    ports { KV_V_1_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2547 \
    name KV_V_2_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_6 \
    op interface \
    ports { KV_V_2_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2548 \
    name KV_V_3_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_6 \
    op interface \
    ports { KV_V_3_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2549 \
    name KV_V_4_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_6 \
    op interface \
    ports { KV_V_4_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2550 \
    name KV_V_5_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_6 \
    op interface \
    ports { KV_V_5_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2551 \
    name KV_V_6_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_6 \
    op interface \
    ports { KV_V_6_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2552 \
    name KV_V_7_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_6 \
    op interface \
    ports { KV_V_7_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2553 \
    name KV_V_8_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_6 \
    op interface \
    ports { KV_V_8_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2554 \
    name KV_V_9_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_6 \
    op interface \
    ports { KV_V_9_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2555 \
    name KV_V_10_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_6 \
    op interface \
    ports { KV_V_10_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2556 \
    name KV_V_11_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_6 \
    op interface \
    ports { KV_V_11_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2557 \
    name KV_V_12_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_6 \
    op interface \
    ports { KV_V_12_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2558 \
    name KV_V_13_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_6 \
    op interface \
    ports { KV_V_13_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2559 \
    name KV_V_14_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_6 \
    op interface \
    ports { KV_V_14_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2560 \
    name KV_V_15_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_6 \
    op interface \
    ports { KV_V_15_load_6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2561 \
    name sext_ln1347_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_57 \
    op interface \
    ports { sext_ln1347_57 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2562 \
    name KV_V_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_7 \
    op interface \
    ports { KV_V_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2563 \
    name KV_V_1_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_7 \
    op interface \
    ports { KV_V_1_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2564 \
    name KV_V_2_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_7 \
    op interface \
    ports { KV_V_2_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2565 \
    name KV_V_3_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_7 \
    op interface \
    ports { KV_V_3_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2566 \
    name KV_V_4_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_7 \
    op interface \
    ports { KV_V_4_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2567 \
    name KV_V_5_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_7 \
    op interface \
    ports { KV_V_5_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2568 \
    name KV_V_6_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_7 \
    op interface \
    ports { KV_V_6_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2569 \
    name KV_V_7_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_7 \
    op interface \
    ports { KV_V_7_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2570 \
    name KV_V_8_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_7 \
    op interface \
    ports { KV_V_8_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2571 \
    name KV_V_9_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_7 \
    op interface \
    ports { KV_V_9_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2572 \
    name KV_V_10_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_7 \
    op interface \
    ports { KV_V_10_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2573 \
    name KV_V_11_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_7 \
    op interface \
    ports { KV_V_11_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2574 \
    name KV_V_12_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_7 \
    op interface \
    ports { KV_V_12_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2575 \
    name KV_V_13_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_7 \
    op interface \
    ports { KV_V_13_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2576 \
    name KV_V_14_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_7 \
    op interface \
    ports { KV_V_14_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2577 \
    name KV_V_15_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_7 \
    op interface \
    ports { KV_V_15_load_7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2578 \
    name sext_ln1347_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_58 \
    op interface \
    ports { sext_ln1347_58 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2579 \
    name KV_V_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_8 \
    op interface \
    ports { KV_V_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2580 \
    name KV_V_1_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_8 \
    op interface \
    ports { KV_V_1_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2581 \
    name KV_V_2_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_8 \
    op interface \
    ports { KV_V_2_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2582 \
    name KV_V_3_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_8 \
    op interface \
    ports { KV_V_3_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2583 \
    name KV_V_4_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_8 \
    op interface \
    ports { KV_V_4_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2584 \
    name KV_V_5_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_8 \
    op interface \
    ports { KV_V_5_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2585 \
    name KV_V_6_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_8 \
    op interface \
    ports { KV_V_6_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2586 \
    name KV_V_7_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_8 \
    op interface \
    ports { KV_V_7_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2587 \
    name KV_V_8_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_8 \
    op interface \
    ports { KV_V_8_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2588 \
    name KV_V_9_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_8 \
    op interface \
    ports { KV_V_9_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2589 \
    name KV_V_10_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_8 \
    op interface \
    ports { KV_V_10_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2590 \
    name KV_V_11_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_8 \
    op interface \
    ports { KV_V_11_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2591 \
    name KV_V_12_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_8 \
    op interface \
    ports { KV_V_12_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2592 \
    name KV_V_13_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_8 \
    op interface \
    ports { KV_V_13_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2593 \
    name KV_V_14_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_8 \
    op interface \
    ports { KV_V_14_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2594 \
    name KV_V_15_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_8 \
    op interface \
    ports { KV_V_15_load_8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2595 \
    name sext_ln1347_59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_59 \
    op interface \
    ports { sext_ln1347_59 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2596 \
    name KV_V_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_9 \
    op interface \
    ports { KV_V_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2597 \
    name KV_V_1_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_9 \
    op interface \
    ports { KV_V_1_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2598 \
    name KV_V_2_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_9 \
    op interface \
    ports { KV_V_2_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2599 \
    name KV_V_3_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_9 \
    op interface \
    ports { KV_V_3_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2600 \
    name KV_V_4_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_9 \
    op interface \
    ports { KV_V_4_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2601 \
    name KV_V_5_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_9 \
    op interface \
    ports { KV_V_5_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2602 \
    name KV_V_6_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_9 \
    op interface \
    ports { KV_V_6_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2603 \
    name KV_V_7_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_9 \
    op interface \
    ports { KV_V_7_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2604 \
    name KV_V_8_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_9 \
    op interface \
    ports { KV_V_8_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2605 \
    name KV_V_9_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_9 \
    op interface \
    ports { KV_V_9_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2606 \
    name KV_V_10_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_9 \
    op interface \
    ports { KV_V_10_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2607 \
    name KV_V_11_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_9 \
    op interface \
    ports { KV_V_11_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2608 \
    name KV_V_12_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_9 \
    op interface \
    ports { KV_V_12_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2609 \
    name KV_V_13_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_9 \
    op interface \
    ports { KV_V_13_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2610 \
    name KV_V_14_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_9 \
    op interface \
    ports { KV_V_14_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2611 \
    name KV_V_15_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_9 \
    op interface \
    ports { KV_V_15_load_9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2612 \
    name sext_ln1347_60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_60 \
    op interface \
    ports { sext_ln1347_60 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2613 \
    name KV_V_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_10 \
    op interface \
    ports { KV_V_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2614 \
    name KV_V_1_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_10 \
    op interface \
    ports { KV_V_1_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2615 \
    name KV_V_2_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_10 \
    op interface \
    ports { KV_V_2_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2616 \
    name KV_V_3_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_10 \
    op interface \
    ports { KV_V_3_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2617 \
    name KV_V_4_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_10 \
    op interface \
    ports { KV_V_4_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2618 \
    name KV_V_5_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_10 \
    op interface \
    ports { KV_V_5_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2619 \
    name KV_V_6_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_10 \
    op interface \
    ports { KV_V_6_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2620 \
    name KV_V_7_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_10 \
    op interface \
    ports { KV_V_7_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2621 \
    name KV_V_8_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_10 \
    op interface \
    ports { KV_V_8_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2622 \
    name KV_V_9_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_10 \
    op interface \
    ports { KV_V_9_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2623 \
    name KV_V_10_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_10 \
    op interface \
    ports { KV_V_10_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2624 \
    name KV_V_11_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_10 \
    op interface \
    ports { KV_V_11_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2625 \
    name KV_V_12_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_10 \
    op interface \
    ports { KV_V_12_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2626 \
    name KV_V_13_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_10 \
    op interface \
    ports { KV_V_13_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2627 \
    name KV_V_14_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_10 \
    op interface \
    ports { KV_V_14_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2628 \
    name KV_V_15_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_10 \
    op interface \
    ports { KV_V_15_load_10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2629 \
    name sext_ln1347_61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_61 \
    op interface \
    ports { sext_ln1347_61 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2630 \
    name KV_V_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_11 \
    op interface \
    ports { KV_V_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2631 \
    name KV_V_1_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_11 \
    op interface \
    ports { KV_V_1_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2632 \
    name KV_V_2_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_11 \
    op interface \
    ports { KV_V_2_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2633 \
    name KV_V_3_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_11 \
    op interface \
    ports { KV_V_3_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2634 \
    name KV_V_4_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_11 \
    op interface \
    ports { KV_V_4_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2635 \
    name KV_V_5_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_11 \
    op interface \
    ports { KV_V_5_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2636 \
    name KV_V_6_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_11 \
    op interface \
    ports { KV_V_6_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2637 \
    name KV_V_7_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_11 \
    op interface \
    ports { KV_V_7_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2638 \
    name KV_V_8_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_11 \
    op interface \
    ports { KV_V_8_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2639 \
    name KV_V_9_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_11 \
    op interface \
    ports { KV_V_9_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2640 \
    name KV_V_10_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_11 \
    op interface \
    ports { KV_V_10_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2641 \
    name KV_V_11_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_11 \
    op interface \
    ports { KV_V_11_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2642 \
    name KV_V_12_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_11 \
    op interface \
    ports { KV_V_12_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2643 \
    name KV_V_13_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_11 \
    op interface \
    ports { KV_V_13_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2644 \
    name KV_V_14_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_11 \
    op interface \
    ports { KV_V_14_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2645 \
    name KV_V_15_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_11 \
    op interface \
    ports { KV_V_15_load_11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2646 \
    name sext_ln1347_62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_62 \
    op interface \
    ports { sext_ln1347_62 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2647 \
    name KV_V_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_12 \
    op interface \
    ports { KV_V_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2648 \
    name KV_V_1_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_12 \
    op interface \
    ports { KV_V_1_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2649 \
    name KV_V_2_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_12 \
    op interface \
    ports { KV_V_2_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2650 \
    name KV_V_3_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_12 \
    op interface \
    ports { KV_V_3_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2651 \
    name KV_V_4_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_12 \
    op interface \
    ports { KV_V_4_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2652 \
    name KV_V_5_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_12 \
    op interface \
    ports { KV_V_5_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2653 \
    name KV_V_6_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_12 \
    op interface \
    ports { KV_V_6_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2654 \
    name KV_V_7_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_12 \
    op interface \
    ports { KV_V_7_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2655 \
    name KV_V_8_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_12 \
    op interface \
    ports { KV_V_8_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2656 \
    name KV_V_9_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_12 \
    op interface \
    ports { KV_V_9_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2657 \
    name KV_V_10_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_12 \
    op interface \
    ports { KV_V_10_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2658 \
    name KV_V_11_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_12 \
    op interface \
    ports { KV_V_11_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2659 \
    name KV_V_12_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_12 \
    op interface \
    ports { KV_V_12_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2660 \
    name KV_V_13_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_12 \
    op interface \
    ports { KV_V_13_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2661 \
    name KV_V_14_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_12 \
    op interface \
    ports { KV_V_14_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2662 \
    name KV_V_15_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_12 \
    op interface \
    ports { KV_V_15_load_12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2663 \
    name sext_ln1347_63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_63 \
    op interface \
    ports { sext_ln1347_63 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2664 \
    name KV_V_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_13 \
    op interface \
    ports { KV_V_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2665 \
    name KV_V_1_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_13 \
    op interface \
    ports { KV_V_1_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2666 \
    name KV_V_2_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_13 \
    op interface \
    ports { KV_V_2_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2667 \
    name KV_V_3_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_13 \
    op interface \
    ports { KV_V_3_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2668 \
    name KV_V_4_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_13 \
    op interface \
    ports { KV_V_4_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2669 \
    name KV_V_5_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_13 \
    op interface \
    ports { KV_V_5_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2670 \
    name KV_V_6_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_13 \
    op interface \
    ports { KV_V_6_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2671 \
    name KV_V_7_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_13 \
    op interface \
    ports { KV_V_7_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2672 \
    name KV_V_8_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_13 \
    op interface \
    ports { KV_V_8_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2673 \
    name KV_V_9_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_13 \
    op interface \
    ports { KV_V_9_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2674 \
    name KV_V_10_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_13 \
    op interface \
    ports { KV_V_10_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2675 \
    name KV_V_11_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_13 \
    op interface \
    ports { KV_V_11_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2676 \
    name KV_V_12_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_13 \
    op interface \
    ports { KV_V_12_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2677 \
    name KV_V_13_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_13 \
    op interface \
    ports { KV_V_13_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2678 \
    name KV_V_14_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_13 \
    op interface \
    ports { KV_V_14_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2679 \
    name KV_V_15_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_13 \
    op interface \
    ports { KV_V_15_load_13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2680 \
    name sext_ln1347_64 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_64 \
    op interface \
    ports { sext_ln1347_64 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2681 \
    name KV_V_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_14 \
    op interface \
    ports { KV_V_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2682 \
    name KV_V_1_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_14 \
    op interface \
    ports { KV_V_1_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2683 \
    name KV_V_2_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_14 \
    op interface \
    ports { KV_V_2_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2684 \
    name KV_V_3_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_14 \
    op interface \
    ports { KV_V_3_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2685 \
    name KV_V_4_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_14 \
    op interface \
    ports { KV_V_4_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2686 \
    name KV_V_5_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_14 \
    op interface \
    ports { KV_V_5_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2687 \
    name KV_V_6_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_14 \
    op interface \
    ports { KV_V_6_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2688 \
    name KV_V_7_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_14 \
    op interface \
    ports { KV_V_7_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2689 \
    name KV_V_8_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_14 \
    op interface \
    ports { KV_V_8_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2690 \
    name KV_V_9_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_14 \
    op interface \
    ports { KV_V_9_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2691 \
    name KV_V_10_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_14 \
    op interface \
    ports { KV_V_10_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2692 \
    name KV_V_11_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_14 \
    op interface \
    ports { KV_V_11_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2693 \
    name KV_V_12_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_14 \
    op interface \
    ports { KV_V_12_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2694 \
    name KV_V_13_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_14 \
    op interface \
    ports { KV_V_13_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2695 \
    name KV_V_14_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_14 \
    op interface \
    ports { KV_V_14_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2696 \
    name KV_V_15_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_14 \
    op interface \
    ports { KV_V_15_load_14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2697 \
    name sext_ln1347_65 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_65 \
    op interface \
    ports { sext_ln1347_65 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2698 \
    name KV_V_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_load_15 \
    op interface \
    ports { KV_V_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2699 \
    name KV_V_1_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_1_load_15 \
    op interface \
    ports { KV_V_1_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2700 \
    name KV_V_2_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_2_load_15 \
    op interface \
    ports { KV_V_2_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2701 \
    name KV_V_3_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_3_load_15 \
    op interface \
    ports { KV_V_3_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2702 \
    name KV_V_4_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_4_load_15 \
    op interface \
    ports { KV_V_4_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2703 \
    name KV_V_5_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_5_load_15 \
    op interface \
    ports { KV_V_5_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2704 \
    name KV_V_6_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_6_load_15 \
    op interface \
    ports { KV_V_6_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2705 \
    name KV_V_7_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_7_load_15 \
    op interface \
    ports { KV_V_7_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2706 \
    name KV_V_8_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_8_load_15 \
    op interface \
    ports { KV_V_8_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2707 \
    name KV_V_9_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_9_load_15 \
    op interface \
    ports { KV_V_9_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2708 \
    name KV_V_10_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_10_load_15 \
    op interface \
    ports { KV_V_10_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2709 \
    name KV_V_11_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_11_load_15 \
    op interface \
    ports { KV_V_11_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2710 \
    name KV_V_12_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_12_load_15 \
    op interface \
    ports { KV_V_12_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2711 \
    name KV_V_13_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_13_load_15 \
    op interface \
    ports { KV_V_13_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2712 \
    name KV_V_14_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_14_load_15 \
    op interface \
    ports { KV_V_14_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2713 \
    name KV_V_15_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_KV_V_15_load_15 \
    op interface \
    ports { KV_V_15_load_15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2714 \
    name sext_ln1347_66 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1347_66 \
    op interface \
    ports { sext_ln1347_66 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2715 \
    name sext_ln1270_80 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1270_80 \
    op interface \
    ports { sext_ln1270_80 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2716 \
    name attended_V_15_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_15_out \
    op interface \
    ports { attended_V_15_out { O 16 vector } attended_V_15_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2717 \
    name attended_V_14_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_14_out \
    op interface \
    ports { attended_V_14_out { O 16 vector } attended_V_14_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2718 \
    name attended_V_13_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_13_out \
    op interface \
    ports { attended_V_13_out { O 16 vector } attended_V_13_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2719 \
    name attended_V_12_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_12_out \
    op interface \
    ports { attended_V_12_out { O 16 vector } attended_V_12_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2720 \
    name attended_V_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_11_out \
    op interface \
    ports { attended_V_11_out { O 16 vector } attended_V_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2721 \
    name attended_V_10_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_10_out \
    op interface \
    ports { attended_V_10_out { O 16 vector } attended_V_10_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2722 \
    name attended_V_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_9_out \
    op interface \
    ports { attended_V_9_out { O 16 vector } attended_V_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2723 \
    name attended_V_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_8_out \
    op interface \
    ports { attended_V_8_out { O 16 vector } attended_V_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2724 \
    name attended_V_7_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_7_out \
    op interface \
    ports { attended_V_7_out { O 16 vector } attended_V_7_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2725 \
    name attended_V_6_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_6_out \
    op interface \
    ports { attended_V_6_out { O 16 vector } attended_V_6_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2726 \
    name attended_V_5_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_5_out \
    op interface \
    ports { attended_V_5_out { O 16 vector } attended_V_5_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2727 \
    name attended_V_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_4_out \
    op interface \
    ports { attended_V_4_out { O 16 vector } attended_V_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2728 \
    name attended_V_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_3_out \
    op interface \
    ports { attended_V_3_out { O 16 vector } attended_V_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2729 \
    name attended_V_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_2_out \
    op interface \
    ports { attended_V_2_out { O 16 vector } attended_V_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2730 \
    name attended_V_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_1_out \
    op interface \
    ports { attended_V_1_out { O 16 vector } attended_V_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2731 \
    name attended_V_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_attended_V_out \
    op interface \
    ports { attended_V_out { O 16 vector } attended_V_out_ap_vld { O 1 bit } } \
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


