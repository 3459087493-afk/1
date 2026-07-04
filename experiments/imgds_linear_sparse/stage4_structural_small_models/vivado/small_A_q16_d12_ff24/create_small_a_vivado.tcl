set origin_dir [file normalize [file dirname [info script]]]
set project_dir [file join /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24 small_a_vivado_prj]
set ip_repo_dir /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/hls/small_A_q16_d12_ff24/hls/imgds_linear_small_a_axi/solution1/impl/ip
set board_repo  /home/cym/prj2/finn/deps/board_files
set design_name imgds_linear_small_a_design

puts "=== small_A Vivado Build ==="
puts "IP repo: $ip_repo_dir"
puts "Project: $project_dir"

set_param board.repoPaths [list $board_repo]
create_project small_a_vivado_prj $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list $ip_repo_dir] [current_project]
update_ip_catalog

create_bd_design $design_name
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} [get_bd_cells processing_system7_0]
set_property -dict [list CONFIG.PCW_USE_M_AXI_GP0 {1} CONFIG.PCW_USE_S_AXI_HP0 {1}] [get_bd_cells processing_system7_0]

create_bd_cell -type ip -vlnv xilinx.com:hls:imgds_linear_small_a:1.0 imgds_linear_small_a_0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Master "/processing_system7_0/M_AXI_GP0" Slave "/imgds_linear_small_a_0/s_axi_control" Clk_master "/processing_system7_0/FCLK_CLK0 (100 MHz)" Clk_slave "/processing_system7_0/FCLK_CLK0 (100 MHz)" Clk_xbar "/processing_system7_0/FCLK_CLK0 (100 MHz)" intc_ip "New AXI Interconnect" master_apm "0" } [get_bd_intf_pins imgds_linear_small_a_0/s_axi_control]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_interconnect
set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {2}] [get_bd_cells axi_mem_interconnect]
connect_bd_intf_net [get_bd_intf_pins imgds_linear_small_a_0/m_axi_gmem0] [get_bd_intf_pins axi_mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins imgds_linear_small_a_0/m_axi_gmem1] [get_bd_intf_pins axi_mem_interconnect/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins axi_mem_interconnect/ACLK] [get_bd_pins axi_mem_interconnect/S00_ACLK] [get_bd_pins axi_mem_interconnect/S01_ACLK] [get_bd_pins axi_mem_interconnect/M00_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] [get_bd_pins axi_mem_interconnect/ARESETN] [get_bd_pins axi_mem_interconnect/S00_ARESETN] [get_bd_pins axi_mem_interconnect/S01_ARESETN] [get_bd_pins axi_mem_interconnect/M00_ARESETN]

assign_bd_address
validate_bd_design
save_bd_design
puts "BD validated."

set bd_file [get_files ${design_name}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir small_a_vivado_prj.gen sources_1 bd $design_name hdl ${design_name}_wrapper.v]
update_compile_order -fileset sources_1

puts "Launching synthesis + implementation..."
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"

set uf [file join $project_dir small_a_vivado_prj.runs impl_1 ${design_name}_wrapper_utilization_placed.rpt]
if {[file exists $uf]} {
    puts "=== UTILIZATION ==="
    set fh [open $uf r]; set ut [read $fh]; close $fh; set in_t 0
    foreach l [split $ut "\n"] {
        if {[string match "*Slice Logic*" $l] || [string match "*| Ref Name*" $l]} { set in_t 1 }
        if {$in_t} { if {[string length $l] < 3} { set in_t 0 }; puts $l }
    }
}

set bit_src [file join $project_dir small_a_vivado_prj.runs impl_1 ${design_name}_wrapper.bit]
set hwh_src [file join $project_dir small_a_vivado_prj.gen sources_1 bd $design_name hw_handoff ${design_name}.hwh]
if {[file exists $bit_src]} { file copy -force $bit_src [file join /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24 small_a.bit]; puts "BIT: [file join /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24 small_a.bit]" }
if {[file exists $hwh_src]} { file copy -force $hwh_src [file join /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24 small_a.hwh]; puts "HWH: [file join /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/stage4_structural_small_models/vivado/small_A_q16_d12_ff24 small_a.hwh]" }

puts "small_A Vivado build complete."
exit
