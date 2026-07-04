# This script segment is generated automatically by AutoPilot

set id 2254
set name imgds_linear_dense_q16_am_submul_16s_16s_16s_26_4_1
set corename simcore_am
set op am
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 16
set in1_signed 1
set in2_width 16
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 26
set arg_lists {i0 {16 1 +} i1 {16 1 -} s {17 1 +} i2 {16 1 +} p {26 1 +} c_expval {c} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op am
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


set id 2258
set name imgds_linear_dense_q16_mac_muladd_16s_11ns_18s_26_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 11
set in1_signed 0
set in2_width 18
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 26
set arg_lists {i0 {16 1 +} i1 {11 0 +} m {26 1 +} i2 {18 1 +} p {26 1 +} c_reg {1} rnd {0} acc {0} }
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
    id 2266 \
    name x_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_0 \
    op interface \
    ports { x_0_address0 { O 6 vector } x_0_ce0 { O 1 bit } x_0_we0 { O 1 bit } x_0_d0 { O 16 vector } x_0_address1 { O 6 vector } x_0_ce1 { O 1 bit } x_0_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2269 \
    name x_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_1 \
    op interface \
    ports { x_1_address0 { O 6 vector } x_1_ce0 { O 1 bit } x_1_we0 { O 1 bit } x_1_d0 { O 16 vector } x_1_address1 { O 6 vector } x_1_ce1 { O 1 bit } x_1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2272 \
    name x_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_2 \
    op interface \
    ports { x_2_address0 { O 6 vector } x_2_ce0 { O 1 bit } x_2_we0 { O 1 bit } x_2_d0 { O 16 vector } x_2_address1 { O 6 vector } x_2_ce1 { O 1 bit } x_2_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2275 \
    name x_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename x_3 \
    op interface \
    ports { x_3_address0 { O 6 vector } x_3_ce0 { O 1 bit } x_3_we0 { O 1 bit } x_3_d0 { O 16 vector } x_3_address1 { O 6 vector } x_3_ce1 { O 1 bit } x_3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2278 \
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
    id 2279 \
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
    id 2264 \
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
    id 2265 \
    name trunc_ln837_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln837_9 \
    op interface \
    ports { trunc_ln837_9 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2267 \
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
    id 2268 \
    name trunc_ln837_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln837_6 \
    op interface \
    ports { trunc_ln837_6 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2270 \
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
    id 2271 \
    name trunc_ln837_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln837_3 \
    op interface \
    ports { trunc_ln837_3 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2273 \
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
    id 2274 \
    name trunc_ln837 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln837 \
    op interface \
    ports { trunc_ln837 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2276 \
    name sext_ln1348 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1348 \
    op interface \
    ports { sext_ln1348 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2277 \
    name sext_ln1273_530 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1273_530 \
    op interface \
    ports { sext_ln1273_530 { I 16 vector } } \
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


