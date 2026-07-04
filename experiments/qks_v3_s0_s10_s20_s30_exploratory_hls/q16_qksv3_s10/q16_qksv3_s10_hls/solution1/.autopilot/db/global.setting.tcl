
set TopModule "q16_qksv3_s10"
set ClockPeriod 10
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 1
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 1
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix q16_qksv3_s10_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xc7z020:-clg400:-1
set SourceFiles {sc {} c {/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/qks_v3_params_q16_qksv3_s10.h /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/q16_qksv3_s10.h /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/q16_qksv3_s10.cpp}}
set SourceFlags {sc {} c {{ } {} { } {} { -I/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src } {}}}
set DirectiveFile /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/q16_qksv3_s10_hls/solution1/solution1.directive
set TBFiles {verilog /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/tb.cpp bc /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/tb.cpp sc /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/tb.cpp vhdl /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/tb.cpp c {} cas /home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/src/tb.cpp}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynq/zynq}}}
set HPFPO 0
