#!/usr/bin/env python3
"""
QKS-v2 Phase 6: Generate Vivado build scripts for all 4 configs.
Creates export_design TCL and Vivado TCL for each config.
Then runs export_design for each (before Vivado).
"""
import os, sys, shutil
from pathlib import Path

PROJ_ROOT = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master")
EXP_DIR   = PROJ_ROOT / "experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune"
HLS_DIR   = EXP_DIR / "hls_projects"
BOARD_REPO = "/home/cym/prj2/finn/deps/board_files"

CONFIGS = [
    {"code": "q16_qksv2_d16", "attn_dim": 16, "top": "q16_qksv2_d16"},
    {"code": "q16_qksv2_d14", "attn_dim": 14, "top": "q16_qksv2_d14"},
    {"code": "q16_qksv2_d13", "attn_dim": 13, "top": "q16_qksv2_d13"},
    {"code": "q16_qksv2_d11", "attn_dim": 11, "top": "q16_qksv2_d11"},
]

# ── Generate export_design TCL for each config ────────────────────
for cfg in CONFIGS:
    code = cfg["code"]
    top = cfg["top"]
    src_dir = HLS_DIR / code / "src"
    tcl_path = HLS_DIR / code / "run_export_ip.tcl"

    with open(tcl_path, "w") as f:
        f.write(f"""# run_export_ip.tcl — {code} — export HLS IP for Vivado
set script_dir [file dirname [file normalize [info script]]]

open_project -reset {code}_csynth
set_top {top}
add_files "$script_dir/src/{top}.cpp" -cflags "-I$script_dir/src"
add_files "$script_dir/src/{top}.h"
add_files "$script_dir/src/qks_v2_params_{code}.h"
open_solution -reset solution1 -flow_target vivado
set_part {{xc7z020-clg400-1}}
create_clock -period 10 -name default
csynth_design
export_design -format ip_catalog -version 1.0
exit
""")

    # ── Generate Vivado TCL ────────────────────────────────────────
    vivado_dir = HLS_DIR / code / "vivado"
    vivado_dir.mkdir(parents=True, exist_ok=True)
    design_name = f"{top}_design"
    project_name = f"{code}_vivado"

    with open(vivado_dir / f"create_{code}_vivado.tcl", "w") as f:
        f.write(f"""# Vivado TCL for {code} — QKS-v2 ATTN_DIM={cfg['attn_dim']}
set script_dir [file dirname [file normalize [info script]]]
set project_dir [file join $script_dir {project_name}]
set board_repo  {BOARD_REPO}
set design_name {design_name}

puts "============================================"
puts "{code} Vivado Build — ATTN_DIM={cfg['attn_dim']}"
puts "============================================"
puts "IP repo : {HLS_DIR}/{code}/{code}_csynth/solution1/impl/ip"
puts "Board   : {BOARD_REPO}"

set_param board.repoPaths [list $board_repo]
create_project {project_name} $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_qks_v2_physical_prune/hls_projects/{code}/{code}_csynth/solution1/impl/ip] [current_project]
update_ip_catalog

create_bd_design $design_name

# ZYNQ7 PS
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \\
    -config {{make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"}} \\
    [get_bd_cells processing_system7_0]
set_property -dict [list \\
    CONFIG.PCW_USE_M_AXI_GP0 {{1}} \\
    CONFIG.PCW_USE_S_AXI_HP0 {{1}} \\
] [get_bd_cells processing_system7_0]

# HLS IP
create_bd_cell -type ip -vlnv xilinx.com:hls:{top}:1.0 {top}_0

# s_axi_control → M_AXI_GP0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \\
    -config {{ \\
        Master "/processing_system7_0/M_AXI_GP0" \\
        Slave  "/{top}_0/s_axi_control" \\
        Clk_master "/processing_system7_0/FCLK_CLK0 (100 MHz)" \\
        Clk_slave  "/processing_system7_0/FCLK_CLK0 (100 MHz)" \\
        Clk_xbar   "/processing_system7_0/FCLK_CLK0 (100 MHz)" \\
        intc_ip "New AXI Interconnect" \\
        master_apm "0" \\
    }} \\
    [get_bd_intf_pins {top}_0/s_axi_control]

# m_axi_gmem0 + gmem1 → S_AXI_HP0 via AXI Interconnect
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_interconnect
set_property -dict [list CONFIG.NUM_MI {{1}} CONFIG.NUM_SI {{2}}] [get_bd_cells axi_mem_interconnect]

connect_bd_intf_net [get_bd_intf_pins {top}_0/m_axi_gmem0] [get_bd_intf_pins axi_mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins {top}_0/m_axi_gmem1] [get_bd_intf_pins axi_mem_interconnect/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_mem_interconnect/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# Clock for memory interconnect
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins axi_mem_interconnect/ACLK] [get_bd_pins axi_mem_interconnect/S00_ACLK] [get_bd_pins axi_mem_interconnect/S01_ACLK] [get_bd_pins axi_mem_interconnect/M00_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]

# Reset for memory interconnect
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] [get_bd_pins axi_mem_interconnect/ARESETN] [get_bd_pins axi_mem_interconnect/S00_ARESETN] [get_bd_pins axi_mem_interconnect/S01_ARESETN] [get_bd_pins axi_mem_interconnect/M00_ARESETN]

assign_bd_address
validate_bd_design
save_bd_design

puts "Block diagram created and validated."

# Generate HDL wrapper
set bd_file [get_files ${{design_name}}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir {project_name}.gen sources_1 bd $design_name hdl ${{design_name}}_wrapper.v]
update_compile_order -fileset sources_1

puts "HDL wrapper generated. Starting synthesis → implementation → bitstream..."

# Launch full flow
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"
if {{![string match "*Complete*" $impl_status]}} {{
    error "Implementation did not complete successfully: $impl_status"
}}

puts "Implementation complete. Copying .bit and .hwh..."

set bit_file [file join $project_dir {project_name}.runs impl_1 ${{design_name}}_wrapper.bit]
set hwh_file [file join $project_dir {project_name}.gen sources_1 bd $design_name hw_handoff ${{design_name}}.hwh]

if {{![file exists $bit_file]}} {{ error "Bitstream NOT found: $bit_file" }}
if {{![file exists $hwh_file]}} {{ error "HWH NOT found: $hwh_file" }}

file copy -force $bit_file [file join $script_dir {code}.bit]
file copy -force $hwh_file [file join $script_dir {code}.hwh]

puts "BIT: [file join $script_dir {code}.bit]"
puts "HWH: [file join $script_dir {code}.hwh]"

puts "============================================"
puts "{code} Vivado build COMPLETE"
puts "============================================"

close_project
exit
""")

    print(f"✅ {code}: export TCL + Vivado TCL generated")

print(f"\nAll 4 Vivado build scripts ready under: {HLS_DIR}/*/vivado/")
print("\nNext: Run export_design for each (vitis_hls -f run_export_ip.tcl)")
print("Then: Run Vivado for each (vivado -mode batch -source create_*_vivado.tcl)")
