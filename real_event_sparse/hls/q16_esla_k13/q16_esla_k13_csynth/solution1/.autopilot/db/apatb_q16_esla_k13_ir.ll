; ModuleID = '/home/cym/prj2/finn/notebooks/icl_thesis-master/real_event_sparse/hls/q16_esla_k13/q16_esla_k13_csynth/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_q16_esla_k13_ir([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="16" %input, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="2" %logits, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="13" %active_token_indices) local_unnamed_addr #0 {
entry:
  %input_copy = alloca [16 x [64 x i16]], align 512
  %logits_copy = alloca [2 x i16], align 512
  %active_token_indices_copy = alloca [13 x i32], align 512
  %0 = bitcast [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %input to [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]*
  %1 = bitcast %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* %logits to [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*
  %2 = bitcast i32* %active_token_indices to [13 x i32]*
  call fastcc void @copy_in([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* nonnull %0, [16 x [64 x i16]]* nonnull align 512 %input_copy, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* nonnull %1, [2 x i16]* nonnull align 512 %logits_copy, [13 x i32]* nonnull %2, [13 x i32]* nonnull align 512 %active_token_indices_copy)
  %3 = getelementptr [16 x [64 x i16]], [16 x [64 x i16]]* %input_copy, i32 0, i32 0
  %4 = getelementptr [2 x i16], [2 x i16]* %logits_copy, i32 0, i32 0
  %5 = getelementptr inbounds [13 x i32], [13 x i32]* %active_token_indices_copy, i32 0, i32 0
  call void @apatb_q16_esla_k13_hw([64 x i16]* %3, i16* %4, i32* %5)
  call void @copy_back([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, [16 x [64 x i16]]* %input_copy, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %1, [2 x i16]* %logits_copy, [13 x i32]* %2, [13 x i32]* %active_token_indices_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias readonly "unpacked"="0", [16 x [64 x i16]]* noalias align 512 "unpacked"="1", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="2", [2 x i16]* noalias nocapture align 512 "unpacked"="3.0.0.0", [13 x i32]* noalias readonly "unpacked"="4", [13 x i32]* noalias align 512 "unpacked"="5") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a16a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.152"([16 x [64 x i16]]* align 512 %1, [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([2 x i16]* align 512 %3, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %2)
  call fastcc void @onebyonecpy_hls.p0a13i32([13 x i32]* align 512 %5, [13 x i32]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a16a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias, [16 x [64 x i16]]* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, null
  %3 = icmp eq [16 x [64 x i16]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx16 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx315 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %5 = getelementptr [16 x [64 x i16]], [16 x [64 x i16]]* %1, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315
  %dst.addr5.0.0.014 = getelementptr [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]], [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315, i32 0, i32 0, i32 0
  %6 = load i16, i16* %5, align 2
  store i16 %6, i16* %dst.addr5.0.0.014, align 2
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx315, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 64
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx16, 1
  %exitcond17 = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond17, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a13i32([13 x i32]* noalias align 512, [13 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [13 x i32]* %0, null
  %3 = icmp eq [13 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [13 x i32], [13 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [13 x i32], [13 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 13
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [16 x [64 x i16]]* noalias readonly align 512 "unpacked"="1", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="2", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [13 x i32]* noalias "unpacked"="4", [13 x i32]* noalias readonly align 512 "unpacked"="5") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a16a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, [16 x [64 x i16]]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.128"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %2, [2 x i16]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a13i32([13 x i32]* %4, [13 x i32]* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.128"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="0", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2 x i16], [2 x i16]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"], [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %3, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([2 x i16]* noalias nocapture align 512 "unpacked"="0.0.0.0", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"], [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [2 x i16], [2 x i16]* %0, i64 0, i64 %for.loop.idx1
  %3 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %3, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a16a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.152"([16 x [64 x i16]]* noalias align 512, [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [16 x [64 x i16]]* %0, null
  %3 = icmp eq [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx16 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx315 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %src.addr6.0.0.013 = getelementptr [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]], [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %1, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315, i32 0, i32 0, i32 0
  %5 = getelementptr [16 x [64 x i16]], [16 x [64 x i16]]* %0, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315
  %6 = load i16, i16* %src.addr6.0.0.013, align 2
  store i16 %6, i16* %5, align 2
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx315, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 64
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx16, 1
  %exitcond17 = icmp ne i64 %for.loop.idx.next, 16
  br i1 %exitcond17, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

declare void @apatb_q16_esla_k13_hw([64 x i16]*, i16*, i32*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [16 x [64 x i16]]* noalias readonly align 512 "unpacked"="1", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="2", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [13 x i32]* noalias "unpacked"="4", [13 x i32]* noalias readonly align 512 "unpacked"="5") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.128"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %2, [2 x i16]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a13i32([13 x i32]* %4, [13 x i32]* align 512 %5)
  ret void
}

define void @q16_esla_k13_hw_stub_wrapper([64 x i16]*, i16*, i32*) #4 {
entry:
  %3 = alloca [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]
  %4 = alloca [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]
  %5 = bitcast [64 x i16]* %0 to [16 x [64 x i16]]*
  %6 = bitcast i16* %1 to [2 x i16]*
  %7 = bitcast i32* %2 to [13 x i32]*
  call void @copy_out([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3, [16 x [64 x i16]]* %5, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4, [2 x i16]* %6, [13 x i32]* null, [13 x i32]* %7)
  %8 = bitcast [16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3 to [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*
  %9 = bitcast [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4 to %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"*
  %10 = bitcast [13 x i32]* %7 to i32*
  call void @q16_esla_k13_hw_stub([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %8, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* %9, i32* %10)
  call void @copy_in([16 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3, [16 x [64 x i16]]* %5, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4, [2 x i16]* %6, [13 x i32]* null, [13 x i32]* %7)
  ret void
}

declare void @q16_esla_k13_hw_stub([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"*, i32*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
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
