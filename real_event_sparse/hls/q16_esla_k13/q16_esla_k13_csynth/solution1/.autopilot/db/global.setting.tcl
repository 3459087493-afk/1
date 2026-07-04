
set TopModule "q16_esla_k13"
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
set RtlSubPrefix q16_esla_k13_
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
set SourceFiles {sc {} c /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/src/q16_esla_k13.cpp}
set SourceFlags {sc {} c -I/home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/src}
set DirectiveFile /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/q16_esla_k13_csynth/solution1/solution1.directive
set TBFiles {verilog /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/tb/testbench.cpp bc /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/tb/testbench.cpp vhdl /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/tb/testbench.cpp sc /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/tb/testbench.cpp cas /home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/tb/testbench.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
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
