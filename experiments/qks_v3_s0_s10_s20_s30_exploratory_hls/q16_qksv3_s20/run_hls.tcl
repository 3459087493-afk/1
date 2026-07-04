set script_dir [file dirname [file normalize [info script]]]
open_project -reset q16_qksv3_s20_hls
set_top q16_qksv3_s20
add_files "$script_dir/src/q16_qksv3_s20.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/q16_qksv3_s20.h"
add_files "$script_dir/src/qks_v3_params_q16_qksv3_s20.h"
add_files -tb "$script_dir/src/tb.cpp" -cflags "-I$script_dir/src"
open_solution -reset solution1 -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
csim_design
csynth_design
exit
