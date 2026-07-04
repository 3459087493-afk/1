# run_export_ip.tcl — q16_qksv2_d13 — export HLS IP for Vivado
set script_dir [file dirname [file normalize [info script]]]

open_project -reset q16_qksv2_d13_csynth
set_top q16_qksv2_d13
add_files "$script_dir/src/q16_qksv2_d13.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/q16_qksv2_d13.h"
add_files "$script_dir/src/qks_v2_params_q16_qksv2_d13.h"
open_solution -reset solution1 -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
csynth_design
export_design -format ip_catalog -version 1.0
exit
