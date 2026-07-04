set script_dir [file dirname [file normalize [info script]]]
set data_path [file normalize "$script_dir/../../tests/esla_k13_csim_data.bin"]
set metrics_path [file normalize "$script_dir/../../results/hls_csim_esla_k13_metrics.csv"]
set csim_args "$data_path $metrics_path"
if {[info exists ::env(ESLA_CSIM_SAMPLE_LIMIT)] &&
    $::env(ESLA_CSIM_SAMPLE_LIMIT) ne ""} {
    append csim_args " $::env(ESLA_CSIM_SAMPLE_LIMIT)"
}

open_project -reset q16_esla_k13_csim
set_top q16_esla_k13
add_files "$script_dir/src/q16_esla_k13.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/q16_esla_k13.h"
add_files "$script_dir/src/hls_params_q16.h"
add_files "$script_dir/tb/testbench.cpp" -tb -cflags "-I$script_dir/src"
open_solution -reset solution1 -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
csim_design -O -argv $csim_args
exit
