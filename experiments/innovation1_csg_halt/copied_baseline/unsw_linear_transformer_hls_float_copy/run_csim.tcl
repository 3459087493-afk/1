open_project -reset unsw_linear_transformer_prj
set_top unsw_linear_transformer
add_files src/unsw_linear_transformer.cpp
add_files src/unsw_linear_transformer.h
add_files src/weights.h
add_files -tb src/testbench.cpp
add_files -tb src/test_vectors.h
open_solution "solution1"
set_part xc7z020clg400-1
create_clock -period 10 -name default
csim_design
exit
