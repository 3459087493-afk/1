# This script segment is generated automatically by AutoPilot

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


