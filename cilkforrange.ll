; ModuleID = 'cilkforrange.cpp'
source_filename = "cilkforrange.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int> >::_Vector_impl" = type { i32*, i32*, i32* }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_cilkforrange.cpp, i8* null }]

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #0

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @_Z22functionwithuniquenameSt6vectorIiSaIiEE(%"class.std::vector"* nocapture readonly %v) local_unnamed_addr #3 {
entry:
  %sum = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start()
  %sum.0.sum.0..sroa_cast = bitcast i32* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %sum.0.sum.0..sroa_cast)
  store i32 0, i32* %sum, align 4, !tbaa !2
  %0 = getelementptr %"class.std::vector", %"class.std::vector"* %v, i64 0, i32 0, i32 0, i32 0
  %1 = load i32*, i32** %0, align 8, !tbaa !6
  %_M_finish.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %v, i64 0, i32 0, i32 0, i32 1
  %2 = load i32*, i32** %_M_finish.i, align 8, !tbaa !6
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin1.sroa.0.0 = phi i32* [ %1, %entry ], [ %incdec.ptr.i, %pfor.inc ]
  %3 = load i32, i32* %__begin1.sroa.0.0, align 4, !tbaa !2
  detach within %syncreg, label %pfor.body, label %pfor.inc

pfor.body:                                        ; preds = %pfor.cond
  %sum.0.load17 = load i32, i32* %sum, align 4
  %add = add nsw i32 %sum.0.load17, %3
  store i32 %add, i32* %sum, align 4, !tbaa !2
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.body, %pfor.cond
  %incdec.ptr.i = getelementptr inbounds i32, i32* %__begin1.sroa.0.0, i64 1
  %cmp.i = icmp eq i32* %incdec.ptr.i, %2
  br i1 %cmp.i, label %pfor.cond.cleanup, label %pfor.cond, !llvm.loop !8

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %sync.continue

sync.continue:                                    ; preds = %pfor.cond.cleanup
  %sum.0.load18 = load i32, i32* %sum, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %sum.0.sum.0..sroa_cast)
  ret i32 %sum.0.load18
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: norecurse nounwind readonly uwtable
define dso_local i32 @_Z23functionwithuniquename2St6vectorIiSaIiEE(%"class.std::vector"* nocapture readonly %v) local_unnamed_addr #3 {
entry:
  %sum = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start()
  %sum.0.sum.0..sroa_cast = bitcast i32* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %sum.0.sum.0..sroa_cast)
  store i32 0, i32* %sum, align 4, !tbaa !2
  %_M_finish.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %v, i64 0, i32 0, i32 0, i32 1
  %0 = bitcast i32** %_M_finish.i to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !10
  %2 = bitcast %"class.std::vector"* %v to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !13
  %sub.ptr.sub.i = sub i64 %1, %3
  %4 = lshr exact i64 %sub.ptr.sub.i, 2
  %conv = trunc i64 %4 to i32
  %cmp = icmp sgt i32 %conv, 0
  %5 = inttoptr i64 %3 to i32*
  br i1 %cmp, label %pfor.cond.preheader, label %cleanup

pfor.cond.preheader:                              ; preds = %entry
  %wide.trip.count = and i64 %4, 4294967295
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %pfor.cond.preheader
  %indvars.iv = phi i64 [ 0, %pfor.cond.preheader ], [ %indvars.iv.next, %pfor.inc ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  detach within %syncreg, label %pfor.body, label %pfor.inc

pfor.body:                                        ; preds = %pfor.cond
  %add.ptr.i = getelementptr inbounds i32, i32* %5, i64 %indvars.iv
  %6 = load i32, i32* %add.ptr.i, align 4, !tbaa !2
  %sum.0.load22 = load i32, i32* %sum, align 4
  %add5 = add nsw i32 %sum.0.load22, %6
  store i32 %add5, i32* %sum, align 4, !tbaa !2
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.body, %pfor.cond
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %pfor.cond.cleanup, label %pfor.cond, !llvm.loop !14

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup

cleanup:                                          ; preds = %pfor.cond.cleanup, %entry
  %sum.0.load23 = load i32, i32* %sum, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %sum.0.sum.0..sroa_cast)
  ret i32 %sum.0.load23
}

; Function Attrs: norecurse uwtable
define dso_local i32 @main() local_unnamed_addr #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %call2.i.i.i.i3.i.i20 = invoke i8* @_Znwm(i64 256)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %0 = bitcast i8* %call2.i.i.i.i3.i.i20 to i32*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(256) %call2.i.i.i.i3.i.i20, i8 0, i64 256, i1 false)
  br label %for.body

_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i.i: ; preds = %for.body
  %call2.i.i.i.i3.i19.i29 = invoke i8* @_Znwm(i64 256)
          to label %if.then.i.i.i33 unwind label %_ZNSt6vectorIiSaIiEED2Ev.exit

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup
  %2 = extractvalue { i8*, i32 } %1, 0
  %3 = extractvalue { i8*, i32 } %1, 1
  br label %ehcleanup8

for.body:                                         ; preds = %for.body, %invoke.cont
  %indvars.iv = phi i64 [ 0, %invoke.cont ], [ %indvars.iv.next.7, %for.body ]
  %add.ptr.i = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %4 = trunc i64 %indvars.iv to i32
  store i32 %4, i32* %add.ptr.i, align 4, !tbaa !2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %add.ptr.i.1 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %5 = trunc i64 %indvars.iv.next to i32
  store i32 %5, i32* %add.ptr.i.1, align 4, !tbaa !2
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %add.ptr.i.2 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  %6 = trunc i64 %indvars.iv.next.1 to i32
  store i32 %6, i32* %add.ptr.i.2, align 4, !tbaa !2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %add.ptr.i.3 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.2
  %7 = trunc i64 %indvars.iv.next.2 to i32
  store i32 %7, i32* %add.ptr.i.3, align 4, !tbaa !2
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %add.ptr.i.4 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.3
  %8 = trunc i64 %indvars.iv.next.3 to i32
  store i32 %8, i32* %add.ptr.i.4, align 4, !tbaa !2
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %add.ptr.i.5 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.4
  %9 = trunc i64 %indvars.iv.next.4 to i32
  store i32 %9, i32* %add.ptr.i.5, align 4, !tbaa !2
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %add.ptr.i.6 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.5
  %10 = trunc i64 %indvars.iv.next.5 to i32
  store i32 %10, i32* %add.ptr.i.6, align 4, !tbaa !2
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %add.ptr.i.7 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.6
  %11 = trunc i64 %indvars.iv.next.6 to i32
  store i32 %11, i32* %add.ptr.i.7, align 4, !tbaa !2
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 64
  br i1 %exitcond.7, label %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i.i, label %for.body

if.then.i.i.i33:                                  ; preds = %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i.i
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(256) %call2.i.i.i.i3.i19.i29, i8* nonnull align 4 dereferenceable(256) %call2.i.i.i.i3.i.i20, i64 256, i1 false) #9
  tail call void @_ZdlPv(i8* nonnull %call2.i.i.i.i3.i19.i29) #9
  tail call void @_ZdlPv(i8* nonnull %call2.i.i.i.i3.i.i20) #9
  ret i32 0

_ZNSt6vectorIiSaIiEED2Ev.exit:                    ; preds = %_ZNSt16allocator_traitsISaIiEE8allocateERS0_m.exit.i.i.i.i
  %12 = landingpad { i8*, i32 }
          cleanup
  %13 = extractvalue { i8*, i32 } %12, 0
  %14 = extractvalue { i8*, i32 } %12, 1
  tail call void @_ZdlPv(i8* nonnull %call2.i.i.i.i3.i.i20) #9
  br label %ehcleanup8

ehcleanup8:                                       ; preds = %_ZNSt6vectorIiSaIiEED2Ev.exit, %lpad
  %exn.slot.1 = phi i8* [ %13, %_ZNSt6vectorIiSaIiEED2Ev.exit ], [ %2, %lpad ]
  %ehselector.slot.1 = phi i32 [ %14, %_ZNSt6vectorIiSaIiEED2Ev.exit ], [ %3, %lpad ]
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.1, 0
  %lpad.val10 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.1, 1
  resume { i8*, i32 } %lpad.val10
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nofree
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #6

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) local_unnamed_addr #7

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_cilkforrange.cpp() #8 section ".text.startup" {
entry:
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %0 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #9
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind }
attributes #3 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (/EBS/mount/arvid/opencilk-project/clang fc34e4f55bf031cf7cbc136247561c2f3aab07c9)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = distinct !{!8, !9}
!9 = !{!"tapir.loop.spawn.strategy", i32 1}
!10 = !{!11, !7, i64 8}
!11 = !{!"_ZTSSt12_Vector_baseIiSaIiEE", !12, i64 0}
!12 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE12_Vector_implE", !7, i64 0, !7, i64 8, !7, i64 16}
!13 = !{!11, !7, i64 0}
!14 = distinct !{!14, !9}
