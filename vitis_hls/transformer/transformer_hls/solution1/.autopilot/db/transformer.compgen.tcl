# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
x0 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
x1 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
x2 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
x3 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
x4 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
x5 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
x6 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
x7 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
x8 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
x9 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
x10 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
x11 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
x12 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
x13 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
x14 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
x15 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
val_r { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 144
	offset_end 151
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename transformer_control_axilite \
			name transformer_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler transformer_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


