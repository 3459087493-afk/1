# This script segment is generated automatically by AutoPilot

set name unsw_linear_transformer_fexp_32ns_32ns_32_10_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fexp} IMPL {fulldsp} LATENCY 9 ALLOW_PRAGMA 1
}


set id 63
set name unsw_linear_transformer_mul_mul_12s_20s_32_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 12
set in0_signed 1
set in1_width 20
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 32
set arg_lists {i0 {12 1 +} i1 {20 1 +} p {32 1 +} acc {0} }
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


set id 66
set name unsw_linear_transformer_mul_mul_11s_20s_31_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 11
set in0_signed 1
set in1_width 20
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 31
set arg_lists {i0 {11 1 +} i1 {20 1 +} p {31 1 +} acc {0} }
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


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ABew BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ACeG BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ADeQ BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AEe0 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AFfa BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AGfk BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AHfu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AIfE BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AJfO BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AKfY BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ALf8 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AMgi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ANgs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AOgC BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_APgM BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AQgW BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_ARg6 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AShg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AThq BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AUhA BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AVhK BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AWhU BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AXh4 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AYie BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_AZio BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A0iy BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A1iI BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A2iS BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A3i2 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A4jc BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A5jm BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A6jw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A7jG BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A8jQ BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_A9j0 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abak BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abbk BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abck BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abdk BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abek BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abfk BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abgk BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abhl BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abil BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abjl BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abkl BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abll BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_111_6_VITIS_LOOP_112_7_LAYERS_0_Abml BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 162 \
    name embedded_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename embedded_V \
    op interface \
    ports { embedded_V_address0 { O 7 vector } embedded_V_ce0 { O 1 bit } embedded_V_q0 { I 16 vector } embedded_V_address1 { O 7 vector } embedded_V_ce1 { O 1 bit } embedded_V_q1 { I 16 vector } embedded_V_address2 { O 7 vector } embedded_V_ce2 { O 1 bit } embedded_V_q2 { I 16 vector } embedded_V_address3 { O 7 vector } embedded_V_ce3 { O 1 bit } embedded_V_q3 { I 16 vector } embedded_V_address4 { O 7 vector } embedded_V_ce4 { O 1 bit } embedded_V_q4 { I 16 vector } embedded_V_address5 { O 7 vector } embedded_V_ce5 { O 1 bit } embedded_V_q5 { I 16 vector } embedded_V_address6 { O 7 vector } embedded_V_ce6 { O 1 bit } embedded_V_q6 { I 16 vector } embedded_V_address7 { O 7 vector } embedded_V_ce7 { O 1 bit } embedded_V_q7 { I 16 vector } embedded_V_address8 { O 7 vector } embedded_V_ce8 { O 1 bit } embedded_V_q8 { I 16 vector } embedded_V_address9 { O 7 vector } embedded_V_ce9 { O 1 bit } embedded_V_q9 { I 16 vector } embedded_V_address10 { O 7 vector } embedded_V_ce10 { O 1 bit } embedded_V_q10 { I 16 vector } embedded_V_address11 { O 7 vector } embedded_V_ce11 { O 1 bit } embedded_V_q11 { I 16 vector } embedded_V_address12 { O 7 vector } embedded_V_ce12 { O 1 bit } embedded_V_q12 { I 16 vector } embedded_V_address13 { O 7 vector } embedded_V_ce13 { O 1 bit } embedded_V_q13 { I 16 vector } embedded_V_address14 { O 7 vector } embedded_V_ce14 { O 1 bit } embedded_V_q14 { I 16 vector } embedded_V_address15 { O 7 vector } embedded_V_ce15 { O 1 bit } embedded_V_q15 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'embedded_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 163 \
    name query_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename query_V \
    op interface \
    ports { query_V_address0 { O 7 vector } query_V_ce0 { O 1 bit } query_V_we0 { O 1 bit } query_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'query_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 164 \
    name key_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename key_V \
    op interface \
    ports { key_V_address0 { O 7 vector } key_V_ce0 { O 1 bit } key_V_we0 { O 1 bit } key_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'key_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 165 \
    name value_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename value_V \
    op interface \
    ports { value_V_address0 { O 7 vector } value_V_ce0 { O 1 bit } value_V_we0 { O 1 bit } value_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'value_V'"
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


