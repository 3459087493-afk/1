# This script segment is generated automatically by AutoPilot

set id 1415
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


set id 1432
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


set id 1687
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


set id 1703
set name imgds_linear_dense_q16_mac_muladd_16s_7ns_11ns_23_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 7
set in1_signed 0
set in2_width 11
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 23
set arg_lists {i0 {16 1 +} i1 {7 0 +} m {23 1 +} i2 {11 0 +} p {23 0 +} c_reg {1} rnd {0} acc {0} }
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


set id 1704
set name imgds_linear_dense_q16_mac_muladd_16s_10s_16ns_25_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 10
set in1_signed 1
set in2_width 16
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 25
set arg_lists {i0 {16 1 +} i1 {10 1 +} m {25 1 +} i2 {16 0 +} p {25 0 +} c_reg {1} rnd {0} acc {0} }
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


set id 1706
set name imgds_linear_dense_q16_mac_muladd_16s_9ns_16s_25_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 9
set in1_signed 0
set in2_width 16
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 25
set arg_lists {i0 {16 1 +} i1 {9 0 +} m {25 1 +} i2 {16 1 +} p {25 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1707
set name imgds_linear_dense_q16_mac_muladd_16s_9s_22s_24_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 9
set in1_signed 1
set in2_width 22
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 24
set arg_lists {i0 {16 1 +} i1 {9 1 +} m {24 1 +} i2 {22 1 +} p {24 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1708
set name imgds_linear_dense_q16_mac_muladd_16s_9ns_15s_25_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 9
set in1_signed 0
set in2_width 15
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 25
set arg_lists {i0 {16 1 +} i1 {9 0 +} m {25 1 +} i2 {15 1 +} p {25 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1709
set name imgds_linear_dense_q16_mac_muladd_16s_9ns_13s_25_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 9
set in1_signed 0
set in2_width 13
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 25
set arg_lists {i0 {16 1 +} i1 {9 0 +} m {25 1 +} i2 {13 1 +} p {25 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1710
set name imgds_linear_dense_q16_mac_muladd_16s_8s_14s_23_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 8
set in1_signed 1
set in2_width 14
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 23
set arg_lists {i0 {16 1 +} i1 {8 1 +} m {23 1 +} i2 {14 1 +} p {23 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1712
set name imgds_linear_dense_q16_mac_muladd_16s_7s_22s_23_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 7
set in1_signed 1
set in2_width 22
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 23
set arg_lists {i0 {16 1 +} i1 {7 1 +} m {23 1 +} i2 {22 1 +} p {23 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1715
set name imgds_linear_dense_q16_mac_muladd_16s_7ns_14ns_23_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 7
set in1_signed 0
set in2_width 14
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 23
set arg_lists {i0 {16 1 +} i1 {7 0 +} m {23 1 +} i2 {14 0 +} p {23 0 +} c_reg {1} rnd {0} acc {0} }
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


set id 1727
set name imgds_linear_dense_q16_mac_muladd_16s_10s_23s_25_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 10
set in1_signed 1
set in2_width 23
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 25
set arg_lists {i0 {16 1 +} i1 {10 1 +} m {25 1 +} i2 {23 1 +} p {25 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1729
set name imgds_linear_dense_q16_mac_muladd_16s_8ns_23s_26_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 8
set in1_signed 0
set in2_width 23
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 26
set arg_lists {i0 {16 1 +} i1 {8 0 +} m {25 1 +} i2 {23 1 +} p {26 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 1734
set name imgds_linear_dense_q16_mac_muladd_16s_8s_25s_26_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 8
set in1_signed 1
set in2_width 25
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 26
set arg_lists {i0 {16 1 +} i1 {8 1 +} m {24 1 +} i2 {25 1 +} p {26 1 +} c_reg {1} rnd {0} acc {0} }
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

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1922 \
    name x_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_0 \
    op interface \
    ports { x_0_address0 { O 6 vector } x_0_ce0 { O 1 bit } x_0_we0 { O 1 bit } x_0_d0 { O 16 vector } x_0_q0 { I 16 vector } x_0_address1 { O 6 vector } x_0_ce1 { O 1 bit } x_0_we1 { O 1 bit } x_0_d1 { O 16 vector } x_0_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1923 \
    name x_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_1 \
    op interface \
    ports { x_1_address0 { O 6 vector } x_1_ce0 { O 1 bit } x_1_we0 { O 1 bit } x_1_d0 { O 16 vector } x_1_q0 { I 16 vector } x_1_address1 { O 6 vector } x_1_ce1 { O 1 bit } x_1_we1 { O 1 bit } x_1_d1 { O 16 vector } x_1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1924 \
    name x_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_2 \
    op interface \
    ports { x_2_address0 { O 6 vector } x_2_ce0 { O 1 bit } x_2_we0 { O 1 bit } x_2_d0 { O 16 vector } x_2_q0 { I 16 vector } x_2_address1 { O 6 vector } x_2_ce1 { O 1 bit } x_2_we1 { O 1 bit } x_2_d1 { O 16 vector } x_2_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1925 \
    name x_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_3 \
    op interface \
    ports { x_3_address0 { O 6 vector } x_3_ce0 { O 1 bit } x_3_we0 { O 1 bit } x_3_d0 { O 16 vector } x_3_q0 { I 16 vector } x_3_address1 { O 6 vector } x_3_ce1 { O 1 bit } x_3_we1 { O 1 bit } x_3_d1 { O 16 vector } x_3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1926 \
    name Q_V_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_0 \
    op interface \
    ports { Q_V_0_address0 { O 4 vector } Q_V_0_ce0 { O 1 bit } Q_V_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1928 \
    name Q_V_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_0_1 \
    op interface \
    ports { Q_V_0_1_address0 { O 4 vector } Q_V_0_1_ce0 { O 1 bit } Q_V_0_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1930 \
    name Q_V_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_0_2 \
    op interface \
    ports { Q_V_0_2_address0 { O 4 vector } Q_V_0_2_ce0 { O 1 bit } Q_V_0_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1932 \
    name Q_V_0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_0_3 \
    op interface \
    ports { Q_V_0_3_address0 { O 4 vector } Q_V_0_3_ce0 { O 1 bit } Q_V_0_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1934 \
    name Q_V_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_1 \
    op interface \
    ports { Q_V_1_address0 { O 4 vector } Q_V_1_ce0 { O 1 bit } Q_V_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1936 \
    name Q_V_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_1_1 \
    op interface \
    ports { Q_V_1_1_address0 { O 4 vector } Q_V_1_1_ce0 { O 1 bit } Q_V_1_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1938 \
    name Q_V_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_1_2 \
    op interface \
    ports { Q_V_1_2_address0 { O 4 vector } Q_V_1_2_ce0 { O 1 bit } Q_V_1_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1940 \
    name Q_V_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_1_3 \
    op interface \
    ports { Q_V_1_3_address0 { O 4 vector } Q_V_1_3_ce0 { O 1 bit } Q_V_1_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1942 \
    name Q_V_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_2 \
    op interface \
    ports { Q_V_2_address0 { O 4 vector } Q_V_2_ce0 { O 1 bit } Q_V_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1944 \
    name Q_V_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_2_1 \
    op interface \
    ports { Q_V_2_1_address0 { O 4 vector } Q_V_2_1_ce0 { O 1 bit } Q_V_2_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1946 \
    name Q_V_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_2_2 \
    op interface \
    ports { Q_V_2_2_address0 { O 4 vector } Q_V_2_2_ce0 { O 1 bit } Q_V_2_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1948 \
    name Q_V_2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_2_3 \
    op interface \
    ports { Q_V_2_3_address0 { O 4 vector } Q_V_2_3_ce0 { O 1 bit } Q_V_2_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1950 \
    name Q_V_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_3 \
    op interface \
    ports { Q_V_3_address0 { O 4 vector } Q_V_3_ce0 { O 1 bit } Q_V_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1952 \
    name Q_V_3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_3_1 \
    op interface \
    ports { Q_V_3_1_address0 { O 4 vector } Q_V_3_1_ce0 { O 1 bit } Q_V_3_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1954 \
    name Q_V_3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_3_2 \
    op interface \
    ports { Q_V_3_2_address0 { O 4 vector } Q_V_3_2_ce0 { O 1 bit } Q_V_3_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1956 \
    name Q_V_3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename Q_V_3_3 \
    op interface \
    ports { Q_V_3_3_address0 { O 4 vector } Q_V_3_3_ce0 { O 1 bit } Q_V_3_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'Q_V_3_3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1927 \
    name sext_ln1273_153 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_153 \
    op interface \
    ports { sext_ln1273_153 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1929 \
    name sext_ln1273_154 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_154 \
    op interface \
    ports { sext_ln1273_154 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1931 \
    name sext_ln1273_155 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_155 \
    op interface \
    ports { sext_ln1273_155 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1933 \
    name sext_ln1273_156 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_156 \
    op interface \
    ports { sext_ln1273_156 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1935 \
    name sext_ln1273_157 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_157 \
    op interface \
    ports { sext_ln1273_157 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1937 \
    name sext_ln1273_158 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_158 \
    op interface \
    ports { sext_ln1273_158 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1939 \
    name sext_ln1273_159 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_159 \
    op interface \
    ports { sext_ln1273_159 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1941 \
    name sext_ln1273_160 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_160 \
    op interface \
    ports { sext_ln1273_160 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1943 \
    name sext_ln1273_161 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_161 \
    op interface \
    ports { sext_ln1273_161 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1945 \
    name sext_ln1273_162 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_162 \
    op interface \
    ports { sext_ln1273_162 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1947 \
    name sext_ln1273_163 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_163 \
    op interface \
    ports { sext_ln1273_163 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1949 \
    name sext_ln1273_164 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_164 \
    op interface \
    ports { sext_ln1273_164 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1951 \
    name sext_ln1273_165 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_165 \
    op interface \
    ports { sext_ln1273_165 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1953 \
    name sext_ln1273_166 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_166 \
    op interface \
    ports { sext_ln1273_166 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1955 \
    name sext_ln1273_167 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_167 \
    op interface \
    ports { sext_ln1273_167 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1957 \
    name sext_ln1273_168 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_168 \
    op interface \
    ports { sext_ln1273_168 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1958 \
    name sext_ln1273_169 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_169 \
    op interface \
    ports { sext_ln1273_169 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1959 \
    name sext_ln1273_170 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_170 \
    op interface \
    ports { sext_ln1273_170 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1960 \
    name sext_ln1273_171 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_171 \
    op interface \
    ports { sext_ln1273_171 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1961 \
    name sext_ln1273_172 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_172 \
    op interface \
    ports { sext_ln1273_172 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1962 \
    name sext_ln1273_173 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_173 \
    op interface \
    ports { sext_ln1273_173 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1963 \
    name sext_ln1273_174 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_174 \
    op interface \
    ports { sext_ln1273_174 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1964 \
    name sext_ln1273_175 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_175 \
    op interface \
    ports { sext_ln1273_175 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1965 \
    name sext_ln1273_176 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_176 \
    op interface \
    ports { sext_ln1273_176 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1966 \
    name sext_ln1273_177 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_177 \
    op interface \
    ports { sext_ln1273_177 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1967 \
    name sext_ln1273_178 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_178 \
    op interface \
    ports { sext_ln1273_178 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1968 \
    name sext_ln1273_179 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_179 \
    op interface \
    ports { sext_ln1273_179 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1969 \
    name sext_ln1273_180 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_180 \
    op interface \
    ports { sext_ln1273_180 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1970 \
    name sext_ln1273_181 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_181 \
    op interface \
    ports { sext_ln1273_181 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1971 \
    name sext_ln1273_182 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_182 \
    op interface \
    ports { sext_ln1273_182 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1972 \
    name sext_ln1273_183 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_183 \
    op interface \
    ports { sext_ln1273_183 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1973 \
    name sext_ln1273_184 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_184 \
    op interface \
    ports { sext_ln1273_184 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1974 \
    name sext_ln1273_185 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_185 \
    op interface \
    ports { sext_ln1273_185 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1975 \
    name sext_ln1273_186 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_186 \
    op interface \
    ports { sext_ln1273_186 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1976 \
    name sext_ln1273_187 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_187 \
    op interface \
    ports { sext_ln1273_187 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1977 \
    name sext_ln1273_188 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_188 \
    op interface \
    ports { sext_ln1273_188 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1978 \
    name sext_ln1273_189 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_189 \
    op interface \
    ports { sext_ln1273_189 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1979 \
    name sext_ln1273_190 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_190 \
    op interface \
    ports { sext_ln1273_190 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1980 \
    name sext_ln1273_191 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_191 \
    op interface \
    ports { sext_ln1273_191 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1981 \
    name sext_ln1273_192 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_192 \
    op interface \
    ports { sext_ln1273_192 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1982 \
    name sext_ln1273_193 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_193 \
    op interface \
    ports { sext_ln1273_193 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1983 \
    name sext_ln1273_194 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_194 \
    op interface \
    ports { sext_ln1273_194 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1984 \
    name sext_ln1273_195 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_195 \
    op interface \
    ports { sext_ln1273_195 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1985 \
    name sext_ln1273_196 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_196 \
    op interface \
    ports { sext_ln1273_196 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1986 \
    name sext_ln1273_197 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_197 \
    op interface \
    ports { sext_ln1273_197 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1987 \
    name sext_ln1273_198 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_198 \
    op interface \
    ports { sext_ln1273_198 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1988 \
    name sext_ln1273_199 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_199 \
    op interface \
    ports { sext_ln1273_199 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1989 \
    name sext_ln1273_200 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_200 \
    op interface \
    ports { sext_ln1273_200 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1990 \
    name sext_ln1273_201 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_201 \
    op interface \
    ports { sext_ln1273_201 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1991 \
    name sext_ln1273_202 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_202 \
    op interface \
    ports { sext_ln1273_202 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1992 \
    name sext_ln1273_203 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_203 \
    op interface \
    ports { sext_ln1273_203 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1993 \
    name sext_ln1273_204 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_204 \
    op interface \
    ports { sext_ln1273_204 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1994 \
    name sext_ln1273_205 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_205 \
    op interface \
    ports { sext_ln1273_205 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1995 \
    name sext_ln1273_206 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_206 \
    op interface \
    ports { sext_ln1273_206 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1996 \
    name sext_ln1273_207 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_207 \
    op interface \
    ports { sext_ln1273_207 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1997 \
    name sext_ln1273_208 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_208 \
    op interface \
    ports { sext_ln1273_208 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1998 \
    name sext_ln1273_209 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_209 \
    op interface \
    ports { sext_ln1273_209 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1999 \
    name sext_ln1273_210 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_210 \
    op interface \
    ports { sext_ln1273_210 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2000 \
    name sext_ln1273_211 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_211 \
    op interface \
    ports { sext_ln1273_211 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2001 \
    name sext_ln1273_212 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_212 \
    op interface \
    ports { sext_ln1273_212 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2002 \
    name sext_ln1273_213 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_213 \
    op interface \
    ports { sext_ln1273_213 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2003 \
    name sext_ln1273_214 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_214 \
    op interface \
    ports { sext_ln1273_214 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2004 \
    name sext_ln1273_215 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_215 \
    op interface \
    ports { sext_ln1273_215 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2005 \
    name sext_ln1273_216 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_216 \
    op interface \
    ports { sext_ln1273_216 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2006 \
    name sext_ln1273_217 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_217 \
    op interface \
    ports { sext_ln1273_217 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2007 \
    name sext_ln1273_218 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_218 \
    op interface \
    ports { sext_ln1273_218 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2008 \
    name sext_ln1273_219 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_219 \
    op interface \
    ports { sext_ln1273_219 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2009 \
    name sext_ln1273_220 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_220 \
    op interface \
    ports { sext_ln1273_220 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2010 \
    name sext_ln1273_221 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_221 \
    op interface \
    ports { sext_ln1273_221 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2011 \
    name sext_ln1273_222 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_222 \
    op interface \
    ports { sext_ln1273_222 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2012 \
    name sext_ln1273_223 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_223 \
    op interface \
    ports { sext_ln1273_223 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2013 \
    name sext_ln1273_224 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_224 \
    op interface \
    ports { sext_ln1273_224 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2014 \
    name sext_ln1273_225 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_225 \
    op interface \
    ports { sext_ln1273_225 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2015 \
    name sext_ln1273_226 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_226 \
    op interface \
    ports { sext_ln1273_226 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2016 \
    name sext_ln1273_227 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_227 \
    op interface \
    ports { sext_ln1273_227 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2017 \
    name sext_ln1273_228 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_228 \
    op interface \
    ports { sext_ln1273_228 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2018 \
    name sext_ln1273_229 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_229 \
    op interface \
    ports { sext_ln1273_229 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2019 \
    name sext_ln1273_230 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_230 \
    op interface \
    ports { sext_ln1273_230 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2020 \
    name sext_ln1273_231 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_231 \
    op interface \
    ports { sext_ln1273_231 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2021 \
    name sext_ln1273_232 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_232 \
    op interface \
    ports { sext_ln1273_232 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2022 \
    name sext_ln1273_233 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_233 \
    op interface \
    ports { sext_ln1273_233 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2023 \
    name sext_ln1273_234 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_234 \
    op interface \
    ports { sext_ln1273_234 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2024 \
    name sext_ln1273_235 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_235 \
    op interface \
    ports { sext_ln1273_235 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2025 \
    name sext_ln1273_236 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_236 \
    op interface \
    ports { sext_ln1273_236 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2026 \
    name sext_ln1273_237 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_237 \
    op interface \
    ports { sext_ln1273_237 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2027 \
    name sext_ln1273_238 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_238 \
    op interface \
    ports { sext_ln1273_238 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2028 \
    name sext_ln1273_239 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_239 \
    op interface \
    ports { sext_ln1273_239 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2029 \
    name sext_ln1273_240 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_240 \
    op interface \
    ports { sext_ln1273_240 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2030 \
    name sext_ln1273_241 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_241 \
    op interface \
    ports { sext_ln1273_241 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2031 \
    name sext_ln1273_242 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_242 \
    op interface \
    ports { sext_ln1273_242 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2032 \
    name sext_ln1273_244 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_244 \
    op interface \
    ports { sext_ln1273_244 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2033 \
    name sext_ln1273_246 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_246 \
    op interface \
    ports { sext_ln1273_246 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2034 \
    name sext_ln1273_248 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_248 \
    op interface \
    ports { sext_ln1273_248 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2035 \
    name sext_ln1273_250 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_250 \
    op interface \
    ports { sext_ln1273_250 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2036 \
    name sext_ln1273_252 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_252 \
    op interface \
    ports { sext_ln1273_252 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2037 \
    name sext_ln1273_254 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_254 \
    op interface \
    ports { sext_ln1273_254 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2038 \
    name sext_ln1273_256 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_256 \
    op interface \
    ports { sext_ln1273_256 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2039 \
    name sext_ln1273_258 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_258 \
    op interface \
    ports { sext_ln1273_258 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2040 \
    name sext_ln1273_260 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_260 \
    op interface \
    ports { sext_ln1273_260 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2041 \
    name sext_ln1273_262 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_262 \
    op interface \
    ports { sext_ln1273_262 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2042 \
    name sext_ln1273_264 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_264 \
    op interface \
    ports { sext_ln1273_264 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2043 \
    name sext_ln1273_266 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_266 \
    op interface \
    ports { sext_ln1273_266 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2044 \
    name sext_ln1273_268 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_268 \
    op interface \
    ports { sext_ln1273_268 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2045 \
    name sext_ln1273_270 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_270 \
    op interface \
    ports { sext_ln1273_270 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2046 \
    name sext_ln1273_272 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_272 \
    op interface \
    ports { sext_ln1273_272 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2047 \
    name sext_ln1273_273 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_273 \
    op interface \
    ports { sext_ln1273_273 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2048 \
    name sext_ln1273_274 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_274 \
    op interface \
    ports { sext_ln1273_274 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2049 \
    name sext_ln1273_275 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_275 \
    op interface \
    ports { sext_ln1273_275 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2050 \
    name sext_ln1273_276 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_276 \
    op interface \
    ports { sext_ln1273_276 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2051 \
    name sext_ln1273_277 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_277 \
    op interface \
    ports { sext_ln1273_277 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2052 \
    name sext_ln1273_278 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_278 \
    op interface \
    ports { sext_ln1273_278 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2053 \
    name sext_ln1273_279 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_279 \
    op interface \
    ports { sext_ln1273_279 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2054 \
    name sext_ln1273_280 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_280 \
    op interface \
    ports { sext_ln1273_280 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2055 \
    name sext_ln1273_281 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_281 \
    op interface \
    ports { sext_ln1273_281 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2056 \
    name sext_ln1273_282 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_282 \
    op interface \
    ports { sext_ln1273_282 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2057 \
    name sext_ln1273_283 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_283 \
    op interface \
    ports { sext_ln1273_283 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2058 \
    name sext_ln1273_284 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_284 \
    op interface \
    ports { sext_ln1273_284 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2059 \
    name sext_ln1273_285 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_285 \
    op interface \
    ports { sext_ln1273_285 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2060 \
    name sext_ln1273_286 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_286 \
    op interface \
    ports { sext_ln1273_286 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2061 \
    name sext_ln1273_287 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_287 \
    op interface \
    ports { sext_ln1273_287 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2062 \
    name sext_ln1273_288 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_288 \
    op interface \
    ports { sext_ln1273_288 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2063 \
    name sext_ln1273_289 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_289 \
    op interface \
    ports { sext_ln1273_289 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2064 \
    name sext_ln1273_290 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_290 \
    op interface \
    ports { sext_ln1273_290 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2065 \
    name sext_ln1273_291 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_291 \
    op interface \
    ports { sext_ln1273_291 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2066 \
    name sext_ln1273_292 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_292 \
    op interface \
    ports { sext_ln1273_292 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2067 \
    name sext_ln1273_293 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_293 \
    op interface \
    ports { sext_ln1273_293 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2068 \
    name sext_ln1273_294 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_294 \
    op interface \
    ports { sext_ln1273_294 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2069 \
    name sext_ln1273_295 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_295 \
    op interface \
    ports { sext_ln1273_295 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2070 \
    name sext_ln1273_296 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_296 \
    op interface \
    ports { sext_ln1273_296 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2071 \
    name sext_ln1273_297 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_297 \
    op interface \
    ports { sext_ln1273_297 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2072 \
    name sext_ln1273_298 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_298 \
    op interface \
    ports { sext_ln1273_298 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2073 \
    name sext_ln1273_299 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_299 \
    op interface \
    ports { sext_ln1273_299 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2074 \
    name sext_ln1273_300 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_300 \
    op interface \
    ports { sext_ln1273_300 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2075 \
    name sext_ln1273_301 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_301 \
    op interface \
    ports { sext_ln1273_301 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2076 \
    name sext_ln1273_302 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_302 \
    op interface \
    ports { sext_ln1273_302 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2077 \
    name sext_ln1273_303 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_303 \
    op interface \
    ports { sext_ln1273_303 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2078 \
    name sext_ln1273_304 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_304 \
    op interface \
    ports { sext_ln1273_304 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2079 \
    name sext_ln1273_307 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_307 \
    op interface \
    ports { sext_ln1273_307 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2080 \
    name sext_ln1273_308 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_308 \
    op interface \
    ports { sext_ln1273_308 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2081 \
    name sext_ln1273_309 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_309 \
    op interface \
    ports { sext_ln1273_309 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2082 \
    name sext_ln1273_310 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_310 \
    op interface \
    ports { sext_ln1273_310 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2083 \
    name sext_ln1273_311 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_311 \
    op interface \
    ports { sext_ln1273_311 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2084 \
    name sext_ln1273_312 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_312 \
    op interface \
    ports { sext_ln1273_312 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2085 \
    name sext_ln1273_313 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_313 \
    op interface \
    ports { sext_ln1273_313 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2086 \
    name sext_ln1273_314 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_314 \
    op interface \
    ports { sext_ln1273_314 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2087 \
    name sext_ln1273_315 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_315 \
    op interface \
    ports { sext_ln1273_315 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2088 \
    name sext_ln1273_316 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_316 \
    op interface \
    ports { sext_ln1273_316 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2089 \
    name sext_ln1273_317 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_317 \
    op interface \
    ports { sext_ln1273_317 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2090 \
    name sext_ln1273_318 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_318 \
    op interface \
    ports { sext_ln1273_318 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2091 \
    name sext_ln1273_319 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_319 \
    op interface \
    ports { sext_ln1273_319 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2092 \
    name sext_ln1273_320 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_320 \
    op interface \
    ports { sext_ln1273_320 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2093 \
    name sext_ln1273_321 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_321 \
    op interface \
    ports { sext_ln1273_321 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2094 \
    name sext_ln1273_322 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_322 \
    op interface \
    ports { sext_ln1273_322 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2095 \
    name sext_ln1273_323 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_323 \
    op interface \
    ports { sext_ln1273_323 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2096 \
    name sext_ln1273_324 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_324 \
    op interface \
    ports { sext_ln1273_324 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2097 \
    name sext_ln1273_325 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_325 \
    op interface \
    ports { sext_ln1273_325 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2098 \
    name sext_ln1273_326 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_326 \
    op interface \
    ports { sext_ln1273_326 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2099 \
    name sext_ln1273_327 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_327 \
    op interface \
    ports { sext_ln1273_327 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2100 \
    name sext_ln1273_328 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_328 \
    op interface \
    ports { sext_ln1273_328 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2101 \
    name sext_ln1273_329 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_329 \
    op interface \
    ports { sext_ln1273_329 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2102 \
    name sext_ln1273_330 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_330 \
    op interface \
    ports { sext_ln1273_330 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2103 \
    name sext_ln1273_331 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_331 \
    op interface \
    ports { sext_ln1273_331 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2104 \
    name sext_ln1273_332 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_332 \
    op interface \
    ports { sext_ln1273_332 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2105 \
    name sext_ln1273_333 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_333 \
    op interface \
    ports { sext_ln1273_333 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2106 \
    name sext_ln1273_334 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_334 \
    op interface \
    ports { sext_ln1273_334 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2107 \
    name sext_ln1273_335 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_335 \
    op interface \
    ports { sext_ln1273_335 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2108 \
    name sext_ln1273_336 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_336 \
    op interface \
    ports { sext_ln1273_336 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2109 \
    name sext_ln1273_337 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_337 \
    op interface \
    ports { sext_ln1273_337 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2110 \
    name sext_ln1273_338 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_338 \
    op interface \
    ports { sext_ln1273_338 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2111 \
    name sext_ln1273_340 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_340 \
    op interface \
    ports { sext_ln1273_340 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2112 \
    name sext_ln1273_341 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_341 \
    op interface \
    ports { sext_ln1273_341 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2113 \
    name sext_ln1273_342 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_342 \
    op interface \
    ports { sext_ln1273_342 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2114 \
    name sext_ln1273_343 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_343 \
    op interface \
    ports { sext_ln1273_343 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2115 \
    name sext_ln1273_344 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_344 \
    op interface \
    ports { sext_ln1273_344 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2116 \
    name sext_ln1273_345 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_345 \
    op interface \
    ports { sext_ln1273_345 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2117 \
    name sext_ln1273_346 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_346 \
    op interface \
    ports { sext_ln1273_346 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2118 \
    name sext_ln1273_347 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_347 \
    op interface \
    ports { sext_ln1273_347 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2119 \
    name sext_ln1273_348 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_348 \
    op interface \
    ports { sext_ln1273_348 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2120 \
    name sext_ln1273_349 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_349 \
    op interface \
    ports { sext_ln1273_349 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2121 \
    name sext_ln1273_350 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_350 \
    op interface \
    ports { sext_ln1273_350 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2122 \
    name sext_ln1273_351 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_351 \
    op interface \
    ports { sext_ln1273_351 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2123 \
    name sext_ln1273_352 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_352 \
    op interface \
    ports { sext_ln1273_352 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2124 \
    name sext_ln1273_353 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_353 \
    op interface \
    ports { sext_ln1273_353 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2125 \
    name sext_ln1273_354 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_354 \
    op interface \
    ports { sext_ln1273_354 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2126 \
    name sext_ln1273_355 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_355 \
    op interface \
    ports { sext_ln1273_355 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2127 \
    name sext_ln1273_356 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_356 \
    op interface \
    ports { sext_ln1273_356 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2128 \
    name sext_ln1273_357 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_357 \
    op interface \
    ports { sext_ln1273_357 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2129 \
    name sext_ln1273_358 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_358 \
    op interface \
    ports { sext_ln1273_358 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2130 \
    name sext_ln1273_359 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_359 \
    op interface \
    ports { sext_ln1273_359 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2131 \
    name sext_ln1273_360 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_360 \
    op interface \
    ports { sext_ln1273_360 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2132 \
    name sext_ln1273_361 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_361 \
    op interface \
    ports { sext_ln1273_361 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2133 \
    name sext_ln1273_362 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_362 \
    op interface \
    ports { sext_ln1273_362 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2134 \
    name sext_ln1273_363 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_363 \
    op interface \
    ports { sext_ln1273_363 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2135 \
    name sext_ln1273_364 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_364 \
    op interface \
    ports { sext_ln1273_364 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2136 \
    name sext_ln1273_365 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_365 \
    op interface \
    ports { sext_ln1273_365 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2137 \
    name sext_ln1273_366 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_366 \
    op interface \
    ports { sext_ln1273_366 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2138 \
    name sext_ln1273_367 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_367 \
    op interface \
    ports { sext_ln1273_367 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2139 \
    name sext_ln1273_368 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_368 \
    op interface \
    ports { sext_ln1273_368 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2140 \
    name sext_ln1273_369 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_369 \
    op interface \
    ports { sext_ln1273_369 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2141 \
    name sext_ln1273_370 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_370 \
    op interface \
    ports { sext_ln1273_370 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2142 \
    name sext_ln1273_371 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_371 \
    op interface \
    ports { sext_ln1273_371 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2143 \
    name sext_ln1273_372 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_372 \
    op interface \
    ports { sext_ln1273_372 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2144 \
    name sext_ln1273_374 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_374 \
    op interface \
    ports { sext_ln1273_374 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2145 \
    name sext_ln1273_375 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_375 \
    op interface \
    ports { sext_ln1273_375 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2146 \
    name sext_ln1273_376 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_376 \
    op interface \
    ports { sext_ln1273_376 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2147 \
    name sext_ln1273_377 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_377 \
    op interface \
    ports { sext_ln1273_377 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2148 \
    name sext_ln1273_378 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_378 \
    op interface \
    ports { sext_ln1273_378 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2149 \
    name sext_ln1273_379 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_379 \
    op interface \
    ports { sext_ln1273_379 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2150 \
    name sext_ln1273_380 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_380 \
    op interface \
    ports { sext_ln1273_380 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2151 \
    name sext_ln1273_381 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_381 \
    op interface \
    ports { sext_ln1273_381 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2152 \
    name sext_ln1273_382 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_382 \
    op interface \
    ports { sext_ln1273_382 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2153 \
    name sext_ln1273_383 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_383 \
    op interface \
    ports { sext_ln1273_383 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2154 \
    name sext_ln1273_384 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_384 \
    op interface \
    ports { sext_ln1273_384 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2155 \
    name sext_ln1273_385 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_385 \
    op interface \
    ports { sext_ln1273_385 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2156 \
    name sext_ln1273_386 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_386 \
    op interface \
    ports { sext_ln1273_386 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2157 \
    name sext_ln1273_387 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_387 \
    op interface \
    ports { sext_ln1273_387 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2158 \
    name sext_ln1273_388 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_388 \
    op interface \
    ports { sext_ln1273_388 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2159 \
    name sext_ln1273_389 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_389 \
    op interface \
    ports { sext_ln1273_389 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2160 \
    name sext_ln1273_390 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_390 \
    op interface \
    ports { sext_ln1273_390 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2161 \
    name sext_ln1273_391 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_391 \
    op interface \
    ports { sext_ln1273_391 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2162 \
    name sext_ln1273_392 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_392 \
    op interface \
    ports { sext_ln1273_392 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2163 \
    name sext_ln1273_393 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_393 \
    op interface \
    ports { sext_ln1273_393 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2164 \
    name sext_ln1273_394 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_394 \
    op interface \
    ports { sext_ln1273_394 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2165 \
    name sext_ln1273_395 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_395 \
    op interface \
    ports { sext_ln1273_395 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2166 \
    name sext_ln1273_396 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_396 \
    op interface \
    ports { sext_ln1273_396 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2167 \
    name sext_ln1273_397 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_397 \
    op interface \
    ports { sext_ln1273_397 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2168 \
    name sext_ln1273_398 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_398 \
    op interface \
    ports { sext_ln1273_398 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2169 \
    name sext_ln1273_399 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_399 \
    op interface \
    ports { sext_ln1273_399 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2170 \
    name sext_ln1273_400 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_400 \
    op interface \
    ports { sext_ln1273_400 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2171 \
    name sext_ln1273_401 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_401 \
    op interface \
    ports { sext_ln1273_401 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2172 \
    name sext_ln1273_402 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_402 \
    op interface \
    ports { sext_ln1273_402 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2173 \
    name sext_ln1273_403 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_403 \
    op interface \
    ports { sext_ln1273_403 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2174 \
    name sext_ln1273_404 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_404 \
    op interface \
    ports { sext_ln1273_404 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2175 \
    name sext_ln1273_405 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_405 \
    op interface \
    ports { sext_ln1273_405 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2176 \
    name sext_ln1273_406 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_406 \
    op interface \
    ports { sext_ln1273_406 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2177 \
    name sext_ln1273_408 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_408 \
    op interface \
    ports { sext_ln1273_408 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2178 \
    name sext_ln1273_409 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_409 \
    op interface \
    ports { sext_ln1273_409 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2179 \
    name sext_ln1273_410 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_410 \
    op interface \
    ports { sext_ln1273_410 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2180 \
    name sext_ln1273_411 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_411 \
    op interface \
    ports { sext_ln1273_411 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2181 \
    name sext_ln1273_412 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_412 \
    op interface \
    ports { sext_ln1273_412 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2182 \
    name sext_ln1273_413 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_413 \
    op interface \
    ports { sext_ln1273_413 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2183 \
    name sext_ln1273_414 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_414 \
    op interface \
    ports { sext_ln1273_414 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2184 \
    name sext_ln1273_415 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_415 \
    op interface \
    ports { sext_ln1273_415 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2185 \
    name sext_ln1273_416 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_416 \
    op interface \
    ports { sext_ln1273_416 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2186 \
    name sext_ln1273_417 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_417 \
    op interface \
    ports { sext_ln1273_417 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2187 \
    name sext_ln1273_418 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_418 \
    op interface \
    ports { sext_ln1273_418 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2188 \
    name sext_ln1273_419 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_419 \
    op interface \
    ports { sext_ln1273_419 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2189 \
    name sext_ln1273_420 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_420 \
    op interface \
    ports { sext_ln1273_420 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2190 \
    name sext_ln1273_421 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_421 \
    op interface \
    ports { sext_ln1273_421 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2191 \
    name sext_ln1273_422 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_422 \
    op interface \
    ports { sext_ln1273_422 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2192 \
    name sext_ln1273_423 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_423 \
    op interface \
    ports { sext_ln1273_423 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2193 \
    name sext_ln1273_424 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_424 \
    op interface \
    ports { sext_ln1273_424 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2194 \
    name sext_ln1273_425 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_425 \
    op interface \
    ports { sext_ln1273_425 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2195 \
    name sext_ln1273_426 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_426 \
    op interface \
    ports { sext_ln1273_426 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2196 \
    name sext_ln1273_427 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_427 \
    op interface \
    ports { sext_ln1273_427 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2197 \
    name sext_ln1273_428 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_428 \
    op interface \
    ports { sext_ln1273_428 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2198 \
    name sext_ln1273_429 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_429 \
    op interface \
    ports { sext_ln1273_429 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2199 \
    name sext_ln1273_430 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_430 \
    op interface \
    ports { sext_ln1273_430 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2200 \
    name sext_ln1273_431 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_431 \
    op interface \
    ports { sext_ln1273_431 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2201 \
    name sext_ln1273_432 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_432 \
    op interface \
    ports { sext_ln1273_432 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2202 \
    name sext_ln1273_433 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_433 \
    op interface \
    ports { sext_ln1273_433 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2203 \
    name sext_ln1273_434 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_434 \
    op interface \
    ports { sext_ln1273_434 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2204 \
    name sext_ln1273_435 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_435 \
    op interface \
    ports { sext_ln1273_435 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2205 \
    name sext_ln1273_436 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_436 \
    op interface \
    ports { sext_ln1273_436 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2206 \
    name sext_ln1273_437 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_437 \
    op interface \
    ports { sext_ln1273_437 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2207 \
    name sext_ln1273_438 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_438 \
    op interface \
    ports { sext_ln1273_438 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2208 \
    name sext_ln1273_439 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_439 \
    op interface \
    ports { sext_ln1273_439 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2209 \
    name sext_ln1273_440 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_440 \
    op interface \
    ports { sext_ln1273_440 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2210 \
    name sext_ln1273_442 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_442 \
    op interface \
    ports { sext_ln1273_442 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2211 \
    name sext_ln1273_443 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_443 \
    op interface \
    ports { sext_ln1273_443 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2212 \
    name sext_ln1273_444 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_444 \
    op interface \
    ports { sext_ln1273_444 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2213 \
    name sext_ln1273_445 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_445 \
    op interface \
    ports { sext_ln1273_445 { I 16 vector } } \
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


