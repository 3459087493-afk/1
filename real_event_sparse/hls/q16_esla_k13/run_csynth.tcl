# run_csynth.tcl — Q16-ESLA-K13 token event sparse HLS C synthesis only
# Do NOT run cosim, export, or Vivado.

set script_dir [file dirname [file normalize [info script]]]

open_project -reset q16_esla_k13_csynth
set_top q16_esla_k13
add_files "$script_dir/src/q16_esla_k13.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/q16_esla_k13.h"
add_files "$script_dir/src/hls_params_q16.h"
add_files "$script_dir/tb/testbench.cpp" -tb -cflags "-I$script_dir/src"
open_solution -reset solution1 -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
csynth_design
exit
