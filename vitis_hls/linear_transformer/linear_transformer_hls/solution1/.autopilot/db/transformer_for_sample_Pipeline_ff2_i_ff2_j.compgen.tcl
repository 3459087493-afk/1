# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEUhA BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEVhK BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEWhU BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEXh4 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEYie BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEZio BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE0iy BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE1iI BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE2iS BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE3i2 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE4jc BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE5jm BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE6jw BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE7jG BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE8jQ BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINE9j0 BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_transformer_for_sample_Pipeline_ff2_i_ff2_j_TRANSFORMER_ENCODER_LAYERS_0_LINEbak BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 365 \
    name ff1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename ff1 \
    op interface \
    ports { ff1_address0 { O 7 vector } ff1_ce0 { O 1 bit } ff1_q0 { I 32 vector } ff1_address1 { O 7 vector } ff1_ce1 { O 1 bit } ff1_q1 { I 32 vector } ff1_address2 { O 7 vector } ff1_ce2 { O 1 bit } ff1_q2 { I 32 vector } ff1_address3 { O 7 vector } ff1_ce3 { O 1 bit } ff1_q3 { I 32 vector } ff1_address4 { O 7 vector } ff1_ce4 { O 1 bit } ff1_q4 { I 32 vector } ff1_address5 { O 7 vector } ff1_ce5 { O 1 bit } ff1_q5 { I 32 vector } ff1_address6 { O 7 vector } ff1_ce6 { O 1 bit } ff1_q6 { I 32 vector } ff1_address7 { O 7 vector } ff1_ce7 { O 1 bit } ff1_q7 { I 32 vector } ff1_address8 { O 7 vector } ff1_ce8 { O 1 bit } ff1_q8 { I 32 vector } ff1_address9 { O 7 vector } ff1_ce9 { O 1 bit } ff1_q9 { I 32 vector } ff1_address10 { O 7 vector } ff1_ce10 { O 1 bit } ff1_q10 { I 32 vector } ff1_address11 { O 7 vector } ff1_ce11 { O 1 bit } ff1_q11 { I 32 vector } ff1_address12 { O 7 vector } ff1_ce12 { O 1 bit } ff1_q12 { I 32 vector } ff1_address13 { O 7 vector } ff1_ce13 { O 1 bit } ff1_q13 { I 32 vector } ff1_address14 { O 7 vector } ff1_ce14 { O 1 bit } ff1_q14 { I 32 vector } ff1_address15 { O 7 vector } ff1_ce15 { O 1 bit } ff1_q15 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'ff1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 366 \
    name attn_residual \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename attn_residual \
    op interface \
    ports { attn_residual_address0 { O 6 vector } attn_residual_ce0 { O 1 bit } attn_residual_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'attn_residual'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 367 \
    name encoder_out \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename encoder_out \
    op interface \
    ports { encoder_out_address0 { O 6 vector } encoder_out_ce0 { O 1 bit } encoder_out_we0 { O 1 bit } encoder_out_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'encoder_out'"
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
set InstName transformer_flow_control_loop_pipe_sequential_init_U
set CompName transformer_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix transformer_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


