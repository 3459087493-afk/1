# This script segment is generated automatically by AutoPilot

set id 389
set name unsw_linear_transformer_mul_mul_14s_19ns_33_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 14
set in0_signed 1
set in1_width 19
set in1_signed 0
set ce_width 1
set ce_signed 0
set out_width 33
set arg_lists {i0 {14 1 +} i1 {19 0 +} p {33 1 +} acc {0} }
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


set id 390
set name unsw_linear_transformer_mul_mul_13s_19ns_32_4_1
set corename simcore_mul
set op mul
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 13
set in0_signed 1
set in1_width 19
set in1_signed 0
set ce_width 1
set ce_signed 0
set out_width 32
set arg_lists {i0 {13 1 +} i1 {19 0 +} p {32 1 +} acc {0} }
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
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0bVr BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0bWr BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0bXr BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0bYs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0bZs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b0s BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b1s BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b2s BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b3s BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b4t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b5t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b6t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b7t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b8t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0b9t BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cau BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cbu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0ccu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cdu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0ceu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cfu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cgu BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0chv BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0civ BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cjv BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0ckv BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0clv BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cmv BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cnw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cow BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cpw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0cqw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler unsw_linear_transformer_unsw_linear_transformer_Pipeline_VITIS_LOOP_222_24_VITIS_LOOP_223_25_LAYERS_0crw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 456 \
    name feedforward_hidden_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename feedforward_hidden_V \
    op interface \
    ports { feedforward_hidden_V_address0 { O 8 vector } feedforward_hidden_V_ce0 { O 1 bit } feedforward_hidden_V_q0 { I 15 vector } feedforward_hidden_V_address1 { O 8 vector } feedforward_hidden_V_ce1 { O 1 bit } feedforward_hidden_V_q1 { I 15 vector } feedforward_hidden_V_address2 { O 8 vector } feedforward_hidden_V_ce2 { O 1 bit } feedforward_hidden_V_q2 { I 15 vector } feedforward_hidden_V_address3 { O 8 vector } feedforward_hidden_V_ce3 { O 1 bit } feedforward_hidden_V_q3 { I 15 vector } feedforward_hidden_V_address4 { O 8 vector } feedforward_hidden_V_ce4 { O 1 bit } feedforward_hidden_V_q4 { I 15 vector } feedforward_hidden_V_address5 { O 8 vector } feedforward_hidden_V_ce5 { O 1 bit } feedforward_hidden_V_q5 { I 15 vector } feedforward_hidden_V_address6 { O 8 vector } feedforward_hidden_V_ce6 { O 1 bit } feedforward_hidden_V_q6 { I 15 vector } feedforward_hidden_V_address7 { O 8 vector } feedforward_hidden_V_ce7 { O 1 bit } feedforward_hidden_V_q7 { I 15 vector } feedforward_hidden_V_address8 { O 8 vector } feedforward_hidden_V_ce8 { O 1 bit } feedforward_hidden_V_q8 { I 15 vector } feedforward_hidden_V_address9 { O 8 vector } feedforward_hidden_V_ce9 { O 1 bit } feedforward_hidden_V_q9 { I 15 vector } feedforward_hidden_V_address10 { O 8 vector } feedforward_hidden_V_ce10 { O 1 bit } feedforward_hidden_V_q10 { I 15 vector } feedforward_hidden_V_address11 { O 8 vector } feedforward_hidden_V_ce11 { O 1 bit } feedforward_hidden_V_q11 { I 15 vector } feedforward_hidden_V_address12 { O 8 vector } feedforward_hidden_V_ce12 { O 1 bit } feedforward_hidden_V_q12 { I 15 vector } feedforward_hidden_V_address13 { O 8 vector } feedforward_hidden_V_ce13 { O 1 bit } feedforward_hidden_V_q13 { I 15 vector } feedforward_hidden_V_address14 { O 8 vector } feedforward_hidden_V_ce14 { O 1 bit } feedforward_hidden_V_q14 { I 15 vector } feedforward_hidden_V_address15 { O 8 vector } feedforward_hidden_V_ce15 { O 1 bit } feedforward_hidden_V_q15 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'feedforward_hidden_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 457 \
    name norm1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename norm1 \
    op interface \
    ports { norm1_address0 { O 7 vector } norm1_ce0 { O 1 bit } norm1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'norm1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 458 \
    name residual2_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename residual2_V \
    op interface \
    ports { residual2_V_address0 { O 7 vector } residual2_V_ce0 { O 1 bit } residual2_V_we0 { O 1 bit } residual2_V_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'residual2_V'"
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


