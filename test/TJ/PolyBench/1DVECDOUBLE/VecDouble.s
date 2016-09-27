; ModuleID = 'VecDouble.cl'
source_filename = "VecDouble.cl"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @Convolution2D_kernel(float* nocapture %A, float* nocapture readonly %B, i32 %ni, i32 %nj) local_unnamed_addr #0 !kernel_arg_addr_space !1 !kernel_arg_access_qual !2 !kernel_arg_type !3 !kernel_arg_base_type !4 !kernel_arg_type_qual !5 {
entry:
  %call = tail call i32 (i32, ...) bitcast (i32 (...)* @get_global_id to i32 (i32, ...)*)(i32 0) #2
  %idxprom = sext i32 %call to i64
  %arrayidx = getelementptr inbounds float, float* %B, i64 %idxprom
  %0 = load float, float* %arrayidx, align 4, !tbaa !6
  %mul = fmul float %0, 2.000000e+00
  %arrayidx2 = getelementptr inbounds float, float* %A, i64 %idxprom
  store float %mul, float* %arrayidx2, align 4, !tbaa !6
  ret void
}

declare i32 @get_global_id(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (http://llvm.org/git/clang.git 07307f95d5c82d453cdc5c23f9ccd53d5ff75426) (https://github.com/tj-sun/llvm.git 805bc7c089155ab329a63b926e11904e118c35d5)"}
!1 = !{i32 0, i32 0, i32 0, i32 0}
!2 = !{!"none", !"none", !"none", !"none"}
!3 = !{!"DATA_TYPE*", !"DATA_TYPE*", !"int", !"int"}
!4 = !{!"float*", !"float*", !"int", !"int"}
!5 = !{!"", !"", !"", !""}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
