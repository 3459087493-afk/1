#!/usr/bin/env python3
"""Build Vivado bitstreams for all sparse configs."""
import subprocess, os, sys, shutil
from pathlib import Path

BOARD_REPO = "/home/cym/prj2/finn/deps/board_files"
BASE = Path("/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/imgds_linear_sparse/final_paper_experiments/experiment1_sparse_board")
HLS_BASE = BASE / "hls_projects"
PKG_BASE = BASE / "pynq_packages"

CONFIGS = [
    {"code": "q16_s10_attn_sparse", "top": "imgds_linear_dense_q16", "vl": "xilinx.com:hls:imgds_linear_dense_q16:1.0"},
    {"code": "q16_s20_attn_sparse", "top": "imgds_linear_dense_q16", "vl": "xilinx.com:hls:imgds_linear_dense_q16:1.0"},
    {"code": "q16_s30_attn_sparse", "top": "imgds_linear_dense_q16", "vl": "xilinx.com:hls:imgds_linear_dense_q16:1.0"},
    {"code": "q8_s30_attn_sparse",  "top": "imgds_linear_dense_q8",  "vl": "xilinx.com:hls:imgds_linear_dense_q8:1.0"},
]

def build_one(cfg):
    code = cfg["code"]
    top  = cfg["top"]
    vlnv = cfg["vl"]

    hls_dir = HLS_BASE / code
    ip_dir = hls_dir / code / "solution1" / "impl" / "ip"
    if not (ip_dir / "component.xml").exists():
        print(f"  SKIP {code}: IP not found")
        return False

    vivado_dir = hls_dir / "vivado"
    vivado_dir.mkdir(parents=True, exist_ok=True)
    prj_dir = vivado_dir / f"{code}_vivado_prj"
    design_name = f"{top}_{code}_design"
    ip_path = str(ip_dir.resolve())

    tcl = f'''# Vivado TCL for {code} — auto-generated
set origin_dir [file normalize [file dirname [info script]]]
set project_dir [file join $origin_dir {code}_vivado_prj]
set board_repo  {BOARD_REPO}
set design_name {design_name}

puts "============================================"
puts "{code} Vivado Build"
puts "============================================"
puts "IP repo : {ip_path}"
puts "Board   : {BOARD_REPO}"

set_param board.repoPaths [list $board_repo]
create_project {code}_vivado_prj $project_dir -part xc7z020clg400-1 -force
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property ip_repo_paths [list {ip_path}] [current_project]
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
create_bd_cell -type ip -vlnv {vlnv} {top}_0

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

# ---- Clock for memory interconnect ----
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
    [get_bd_pins axi_mem_interconnect/ACLK] \
    [get_bd_pins axi_mem_interconnect/S00_ACLK] \
    [get_bd_pins axi_mem_interconnect/S01_ACLK] \
    [get_bd_pins axi_mem_interconnect/M00_ACLK] \
    [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]

# ---- Reset for memory interconnect ----
connect_bd_net [get_bd_pins rst_ps7_0_100M/peripheral_aresetn] \
    [get_bd_pins axi_mem_interconnect/ARESETN] \
    [get_bd_pins axi_mem_interconnect/S00_ARESETN] \
    [get_bd_pins axi_mem_interconnect/S01_ARESETN] \
    [get_bd_pins axi_mem_interconnect/M00_ARESETN]

# ---- Address assignment ----
assign_bd_address
validate_bd_design
save_bd_design

puts "Block diagram created and validated."

# ---- Generate HDL wrapper ----
set bd_file [get_files ${{design_name}}.bd]
make_wrapper -files $bd_file -top
add_files -norecurse [file join $project_dir {code}_vivado_prj.gen sources_1 bd $design_name hdl ${{design_name}}_wrapper.v]
update_compile_order -fileset sources_1

puts "HDL wrapper generated. Starting synthesis..."

# ---- Launch synthesis → implementation → bitstream ----
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

set impl_status [get_property STATUS [get_runs impl_1]]
puts "IMPL_STATUS=$impl_status"
if {{![string match "*Complete*" $impl_status]}} {{
    error "Implementation did not complete successfully: $impl_status"
}}

puts "Implementation complete. Exporting bitstream and HWH..."

# ---- Copy .bit and .hwh ----
set bit_file [file join $project_dir {code}_vivado_prj.runs impl_1 ${{design_name}}_wrapper.bit]
set hwh_file [file join $project_dir {code}_vivado_prj.gen sources_1 bd $design_name hw_handoff ${{design_name}}.hwh]

if {{![file exists $bit_file]}} {{ error "Bitstream NOT found: $bit_file" }}
if {{![file exists $hwh_file]}} {{ error "HWH NOT found: $hwh_file" }}

file copy -force $bit_file [file join $origin_dir {code}.bit]
file copy -force $hwh_file [file join $origin_dir {code}.hwh]

puts "BIT: [file join $origin_dir {code}.bit]"
puts "HWH: [file join $origin_dir {code}.hwh]"

puts "============================================"
puts "{code} Vivado build COMPLETE"
puts "Bit: [file join $origin_dir {code}.bit]"
puts "HWH: [file join $origin_dir {code}.hwh]"
puts "============================================"

close_project
exit
'''

    tcl_path = vivado_dir / f"create_{code}_vivado.tcl"
    tcl_path.write_text(tcl)
    return tcl_path


def main():
    args = sys.argv[1:]
    if not args:
        print("Usage: build_vivado_all.py [q16_s10|q16_s20|q16_s30|q8_s30|all]")
        sys.exit(1)

    target = args[0]
    cfgs = CONFIGS if target == "all" else [c for c in CONFIGS if c["code"].startswith(target)]

    # Source Vivado
    settings = "/tools/Xilinx/Vivado/2022.2/settings64.sh"
    vivado_bin = "/tools/Xilinx/Vivado/2022.2/bin/vivado"

    for cfg in cfgs:
        code = cfg["code"]
        print(f"\n{'='*60}")
        print(f"BUILDING {code}")
        print(f"{'='*60}")

        tcl_path = build_one(cfg)
        vivado_dir = tcl_path.parent

        cmd = f"source {settings} 2>/dev/null && cd {vivado_dir} && {vivado_bin} -mode batch -source {tcl_path.name} 2>&1"
        print(f"Running Vivado...")
        print(f"Log: {vivado_dir}/{code}_vivado.log")

        with open(f"{vivado_dir}/{code}_vivado.log", "w") as log:
            proc = subprocess.run(["bash", "-c", cmd], stdout=log, stderr=subprocess.STDOUT, timeout=7200)

        if proc.returncode == 0:
            bit = vivado_dir / f"{code}.bit"
            hwh = vivado_dir / f"{code}.hwh"
            if bit.exists():
                pkg = PKG_BASE / code
                pkg.mkdir(parents=True, exist_ok=True)
                shutil.copy2(bit, pkg / f"{code}.bit")
                shutil.copy2(hwh, pkg / f"{code}.hwh")
                print(f"  ✅ {code}: bit={bit.stat().st_size} bytes, hwh={hwh.stat().st_size} bytes")
                print(f"  → Copied to {pkg}")
            else:
                print(f"  ❌ {code}: bit not generated. Check log.")
        else:
            print(f"  ❌ {code}: Vivado failed (exit={proc.returncode})")
            print(f"  Tail of log:")
            log_path = vivado_dir / f"{code}_vivado.log"
            if log_path.exists():
                lines = log_path.read_text().split('\n')
                for l in lines[-15:]:
                    print(f"    {l}")

if __name__ == "__main__":
    main()
