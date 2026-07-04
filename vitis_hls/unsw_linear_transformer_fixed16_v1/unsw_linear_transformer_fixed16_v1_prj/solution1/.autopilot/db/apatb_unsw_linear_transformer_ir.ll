; ModuleID = '/home/cym/prj2/finn/notebooks/icl_thesis-master/vitis_hls/unsw_linear_transformer_fixed16_v1/unsw_linear_transformer_fixed16_v1_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: argmemonly noinline
define void @apatb_unsw_linear_transformer_ir([24 x float]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8" %input, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="2" %logits) local_unnamed_addr #0 {
entry:
  %input_copy = alloca [8 x [24 x float]], align 512
  %logits_copy = alloca [2 x float], align 512
  %0 = bitcast [24 x float]* %input to [8 x [24 x float]]*
  %1 = bitcast float* %logits to [2 x float]*
  call fastcc void @copy_in([8 x [24 x float]]* nonnull %0, [8 x [24 x float]]* nonnull align 512 %input_copy, [2 x float]* nonnull %1, [2 x float]* nonnull align 512 %logits_copy)
  %2 = getelementptr inbounds [8 x [24 x float]], [8 x [24 x float]]* %input_copy, i32 0, i32 0
  %3 = getelementptr inbounds [2 x float], [2 x float]* %logits_copy, i32 0, i32 0
  call void @apatb_unsw_linear_transformer_hw([24 x float]* %2, float* %3)
  call void @copy_back([8 x [24 x float]]* %0, [8 x [24 x float]]* %input_copy, [2 x float]* %1, [2 x float]* %logits_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([8 x [24 x float]]* noalias readonly, [8 x [24 x float]]* noalias align 512, [2 x float]* noalias readonly, [2 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8a24f32([8 x [24 x float]]* align 512 %1, [8 x [24 x float]]* %0)
  call fastcc void @onebyonecpy_hls.p0a2f32([2 x float]* align 512 %3, [2 x float]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a8a24f32([8 x [24 x float]]* noalias align 512, [8 x [24 x float]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [8 x [24 x float]]* %0, null
  %3 = icmp eq [8 x [24 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57 = getelementptr [8 x [24 x float]], [8 x [24 x float]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %src.addr68 = getelementptr [8 x [24 x float]], [8 x [24 x float]]* %1, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %5 = load float, float* %src.addr68, align 4
  store float %5, float* %dst.addr57, align 4
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 24
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a2f32([2 x float]* noalias align 512, [2 x float]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x float]* %0, null
  %3 = icmp eq [2 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x float], [2 x float]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [2 x float], [2 x float]* %1, i64 0, i64 %for.loop.idx1
  %5 = load float, float* %src.addr, align 4
  store float %5, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([8 x [24 x float]]* noalias, [8 x [24 x float]]* noalias readonly align 512, [2 x float]* noalias, [2 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8a24f32([8 x [24 x float]]* %0, [8 x [24 x float]]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a2f32([2 x float]* %2, [2 x float]* align 512 %3)
  ret void
}

declare void @apatb_unsw_linear_transformer_hw([24 x float]*, float*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([8 x [24 x float]]* noalias, [8 x [24 x float]]* noalias readonly align 512, [2 x float]* noalias, [2 x float]* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2f32([2 x float]* %2, [2 x float]* align 512 %3)
  ret void
}

define void @unsw_linear_transformer_hw_stub_wrapper([24 x float]*, float*) #4 {
entry:
  %2 = bitcast [24 x float]* %0 to [8 x [24 x float]]*
  %3 = bitcast float* %1 to [2 x float]*
  call void @copy_out([8 x [24 x float]]* null, [8 x [24 x float]]* %2, [2 x float]* null, [2 x float]* %3)
  %4 = bitcast [8 x [24 x float]]* %2 to [24 x float]*
  %5 = bitcast [2 x float]* %3 to float*
  call void @unsw_linear_transformer_hw_stub([24 x float]* %4, float* %5)
  call void @copy_in([8 x [24 x float]]* null, [8 x [24 x float]]* %2, [2 x float]* null, [2 x float]* %3)
  ret void
}

declare void @unsw_linear_transformer_hw_stub([24 x float]*, float*)

attributes #0 = { argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
