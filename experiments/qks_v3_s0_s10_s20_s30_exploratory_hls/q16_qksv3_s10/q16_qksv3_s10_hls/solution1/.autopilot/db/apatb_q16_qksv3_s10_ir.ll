; ModuleID = '/home/cym/prj2/finn/notebooks/icl_thesis-master/experiments/qks_v3_s0_s10_s20_s30_exploratory_hls/q16_qksv3_s10/q16_qksv3_s10_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_q16_qksv3_s10_ir([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="14" %input, %"struct.ap_uint<4>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="14" %token_indices, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="2" %logits) local_unnamed_addr #0 {
entry:
  %input_copy = alloca [14 x [64 x i16]], align 512
  %token_indices_copy = alloca [14 x i4], align 512
  %logits_copy = alloca [2 x i16], align 512
  %0 = bitcast [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %input to [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]*
  %1 = bitcast %"struct.ap_uint<4>"* %token_indices to [14 x %"struct.ap_uint<4>"]*
  %2 = bitcast %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* %logits to [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*
  call fastcc void @copy_in([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* nonnull %0, [14 x [64 x i16]]* nonnull align 512 %input_copy, [14 x %"struct.ap_uint<4>"]* nonnull %1, [14 x i4]* nonnull align 512 %token_indices_copy, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* nonnull %2, [2 x i16]* nonnull align 512 %logits_copy)
  %3 = getelementptr [14 x [64 x i16]], [14 x [64 x i16]]* %input_copy, i32 0, i32 0
  %4 = getelementptr [14 x i4], [14 x i4]* %token_indices_copy, i32 0, i32 0
  %5 = getelementptr [2 x i16], [2 x i16]* %logits_copy, i32 0, i32 0
  call void @apatb_q16_qksv3_s10_hw([64 x i16]* %3, i4* %4, i16* %5)
  call void @copy_back([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, [14 x [64 x i16]]* %input_copy, [14 x %"struct.ap_uint<4>"]* %1, [14 x i4]* %token_indices_copy, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %2, [2 x i16]* %logits_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias readonly "unpacked"="0", [14 x [64 x i16]]* noalias align 512 "unpacked"="1", [14 x %"struct.ap_uint<4>"]* noalias readonly "unpacked"="2", [14 x i4]* noalias nocapture align 512 "unpacked"="3.0.0.0", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias readonly "unpacked"="4", [2 x i16]* noalias nocapture align 512 "unpacked"="5.0.0.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a14a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([14 x [64 x i16]]* align 512 %1, [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a14struct.ap_uint<4>.173"([14 x i4]* align 512 %3, [14 x %"struct.ap_uint<4>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([2 x i16]* align 512 %5, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a14a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"([14 x [64 x i16]]* noalias align 512, [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [14 x [64 x i16]]* %0, null
  %3 = icmp eq [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx16 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx315 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %src.addr6.0.0.013 = getelementptr [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]], [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %1, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315, i32 0, i32 0, i32 0
  %5 = getelementptr [14 x [64 x i16]], [14 x [64 x i16]]* %0, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315
  %6 = load i16, i16* %src.addr6.0.0.013, align 2
  store i16 %6, i16* %5, align 2
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx315, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 64
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx16, 1
  %exitcond17 = icmp ne i64 %for.loop.idx.next, 14
  br i1 %exitcond17, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [14 x [64 x i16]]* noalias readonly align 512 "unpacked"="1", [14 x %"struct.ap_uint<4>"]* noalias "unpacked"="2", [14 x i4]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a14a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.198"([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, [14 x [64 x i16]]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a14struct.ap_uint<4>"([14 x %"struct.ap_uint<4>"]* %2, [14 x i4]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.149"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4, [2 x i16]* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.149"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="0", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0a14struct.ap_uint<4>.173"([14 x i4]* noalias nocapture align 512 "unpacked"="0.0.0.0", [14 x %"struct.ap_uint<4>"]* noalias readonly "unpacked"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [14 x %"struct.ap_uint<4>"]* %1, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [14 x %"struct.ap_uint<4>"], [14 x %"struct.ap_uint<4>"]* %1, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [14 x i4], [14 x i4]* %0, i64 0, i64 %for.loop.idx1
  %3 = bitcast i4* %src.addr.0.0.05 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i4
  store i4 %5, i4* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 14
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a14struct.ap_uint<4>"([14 x %"struct.ap_uint<4>"]* noalias "unpacked"="0", [14 x i4]* noalias nocapture readonly align 512 "unpacked"="1.0.0.0") unnamed_addr #2 {
entry:
  %2 = icmp eq [14 x %"struct.ap_uint<4>"]* %0, null
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [14 x i4], [14 x i4]* %1, i64 0, i64 %for.loop.idx1
  %dst.addr.0.0.06 = getelementptr [14 x %"struct.ap_uint<4>"], [14 x %"struct.ap_uint<4>"]* %0, i64 0, i64 %for.loop.idx1, i32 0, i32 0, i32 0
  %3 = bitcast i4* %src.addr.0.0.05 to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i4
  store i4 %5, i4* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 14
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a14a64struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.198"([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias, [14 x [64 x i16]]* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, null
  %3 = icmp eq [14 x [64 x i16]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx16 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx315 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %5 = getelementptr [14 x [64 x i16]], [14 x [64 x i16]]* %1, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315
  %dst.addr5.0.0.014 = getelementptr [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]], [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %0, i64 0, i64 %for.loop.idx16, i64 %for.loop.idx315, i32 0, i32 0, i32 0
  %6 = load i16, i16* %5, align 2
  store i16 %6, i16* %dst.addr5.0.0.014, align 2
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx315, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 64
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx16, 1
  %exitcond17 = icmp ne i64 %for.loop.idx.next, 14
  br i1 %exitcond17, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

declare void @apatb_q16_qksv3_s10_hw([64 x i16]*, i4*, i16*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* noalias "unpacked"="0", [14 x [64 x i16]]* noalias readonly align 512 "unpacked"="1", [14 x %"struct.ap_uint<4>"]* noalias "unpacked"="2", [14 x i4]* noalias nocapture readonly align 512 "unpacked"="3.0.0.0", [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* noalias "unpacked"="4", [2 x i16]* noalias nocapture readonly align 512 "unpacked"="5.0.0.0") unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>.149"([2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %4, [2 x i16]* align 512 %5)
  ret void
}

define void @q16_qksv3_s10_hw_stub_wrapper([64 x i16]*, i4*, i16*) #4 {
entry:
  %3 = alloca [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]
  %4 = alloca [14 x %"struct.ap_uint<4>"]
  %5 = alloca [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]
  %6 = bitcast [64 x i16]* %0 to [14 x [64 x i16]]*
  %7 = bitcast i4* %1 to [14 x i4]*
  %8 = bitcast i16* %2 to [2 x i16]*
  call void @copy_out([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3, [14 x [64 x i16]]* %6, [14 x %"struct.ap_uint<4>"]* %4, [14 x i4]* %7, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %5, [2 x i16]* %8)
  %9 = bitcast [14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3 to [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*
  %10 = bitcast [14 x %"struct.ap_uint<4>"]* %4 to %"struct.ap_uint<4>"*
  %11 = bitcast [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %5 to %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"*
  call void @q16_qksv3_s10_hw_stub([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %9, %"struct.ap_uint<4>"* %10, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"* %11)
  call void @copy_in([14 x [64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]]* %3, [14 x [64 x i16]]* %6, [14 x %"struct.ap_uint<4>"]* %4, [14 x i4]* %7, [2 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]* %5, [2 x i16]* %8)
  ret void
}

declare void @q16_qksv3_s10_hw_stub([64 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"]*, %"struct.ap_uint<4>"*, %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"*)

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
