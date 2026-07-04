# run_hls.tcl — Q16-S0 ap_fixed<16,6> HLS baseline
open_project imgds_linear_dense_q16
set_top    imgds_linear_dense_q16
add_files  src/imgds_linear_dense_q16.cpp
add_files  src/imgds_linear_dense_q16.h
add_files  src/hls_params_q16.h
add_files  src/eval_samples_q16.h
add_files  src/testbench.cpp -tb
open_solution solution1 -flow_target vivado
set_part   {xc7z020clg400-1}
create_clock -period 10 -name default

# CSIM
csim_design

# CSYNTH (uncomment to run)
# csynth_design

exit
