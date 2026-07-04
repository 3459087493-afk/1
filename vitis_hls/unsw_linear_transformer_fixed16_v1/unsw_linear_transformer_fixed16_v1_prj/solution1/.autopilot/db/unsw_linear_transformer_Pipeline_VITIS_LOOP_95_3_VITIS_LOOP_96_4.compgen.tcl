# This script segment is generated automatically by AutoPilot

set id 4
set name unsw_linear_transformer_mul_mul_14s_20s_34_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 14
set in0_signed 1
set in1_width 20
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 34
set arg_lists {i0 {14 1 +} i1 {20 1 +} p {34 1 +} acc {0} }
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


set id 8
set name unsw_linear_transformer_mul_mul_13s_20s_33_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 13
set in0_signed 1
set in1_width 20
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 33
set arg_lists {i0 {13 1 +} i1 {20 1 +} p {33 1 +} acc {0} }
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


set id 11
set name unsw_linear_transformer_mul_mul_15s_20s_35_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 15
set in0_signed 1
set in1_width 20
set in1_signed 1
set ce_width 1
set ce_signed 0
set out_width 35
set arg_lists {i0 {15 1 +} i1 {20 1 +} p {35 1 +} acc {0} }
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
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECbkb BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECcud BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECdEe BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECeOg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECfYi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECg8j BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJEChbi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECibs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECjbC BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECkbM BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJEClbW BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECmb6 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECncg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECocq BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECpcA BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECqcK BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECrcU BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECsc4 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECtde BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECudo BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECvdy BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECwdI BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECxdS BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECyd2 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_INPUT_PROJECzec BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_95_3_VITIS_LOOP_96_4_POSITION_EMBAem BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 57 \
    name input_fp_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_fp_V \
    op interface \
    ports { input_fp_V_address0 { O 8 vector } input_fp_V_ce0 { O 1 bit } input_fp_V_q0 { I 16 vector } input_fp_V_address1 { O 8 vector } input_fp_V_ce1 { O 1 bit } input_fp_V_q1 { I 16 vector } input_fp_V_address2 { O 8 vector } input_fp_V_ce2 { O 1 bit } input_fp_V_q2 { I 16 vector } input_fp_V_address3 { O 8 vector } input_fp_V_ce3 { O 1 bit } input_fp_V_q3 { I 16 vector } input_fp_V_address4 { O 8 vector } input_fp_V_ce4 { O 1 bit } input_fp_V_q4 { I 16 vector } input_fp_V_address5 { O 8 vector } input_fp_V_ce5 { O 1 bit } input_fp_V_q5 { I 16 vector } input_fp_V_address6 { O 8 vector } input_fp_V_ce6 { O 1 bit } input_fp_V_q6 { I 16 vector } input_fp_V_address7 { O 8 vector } input_fp_V_ce7 { O 1 bit } input_fp_V_q7 { I 16 vector } input_fp_V_address8 { O 8 vector } input_fp_V_ce8 { O 1 bit } input_fp_V_q8 { I 16 vector } input_fp_V_address9 { O 8 vector } input_fp_V_ce9 { O 1 bit } input_fp_V_q9 { I 16 vector } input_fp_V_address10 { O 8 vector } input_fp_V_ce10 { O 1 bit } input_fp_V_q10 { I 16 vector } input_fp_V_address11 { O 8 vector } input_fp_V_ce11 { O 1 bit } input_fp_V_q11 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_fp_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 58 \
    name embedded_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename embedded_V \
    op interface \
    ports { embedded_V_address0 { O 7 vector } embedded_V_ce0 { O 1 bit } embedded_V_we0 { O 1 bit } embedded_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'embedded_V'"
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


