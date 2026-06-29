open_project -reset linear_transformer_hls
set_top transformer

add_files linear_transformer.cpp
add_files linear_transformer.h
add_files scaled_dp_params.h
add_files -tb linear_transformer_tb.cpp

open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default

csim_design
csynth_design

exit
