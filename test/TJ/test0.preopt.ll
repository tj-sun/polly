; ModuleID = 'test0.s'
source_filename = "test0.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@B = common global [1536 x float] zeroinitializer, align 16
@C = common global [1536 x float] zeroinitializer, align 16
@A = common global [1536 x float] zeroinitializer, align 16
@AA = common global [1536 x [1536 x float]] zeroinitializer, align 16
@BB = common global [1536 x [1536 x float]] zeroinitializer, align 16
@CC = common global [1536 x [1536 x float]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  br label %.split

.split:                                           ; preds = %2
  %3 = load i8*, i8** %1, align 8
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i64
  %6 = getelementptr inbounds [1536 x float], [1536 x float]* @B, i64 0, i64 %5
  %7 = load float, float* %6, align 4
  %8 = sext i8 %4 to i64
  %9 = getelementptr inbounds [1536 x float], [1536 x float]* @C, i64 0, i64 %8
  %10 = load float, float* %9, align 4
  %11 = fadd float %7, %10
  %12 = sext i8 %4 to i64
  %13 = getelementptr inbounds [1536 x float], [1536 x float]* @A, i64 0, i64 %12
  store float %11, float* %13, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (http://llvm.org/git/clang.git 07307f95d5c82d453cdc5c23f9ccd53d5ff75426) (https://github.com/tj-sun/llvm.git 69e56220929e4bffe0cd01251f47e1540809c3d9)"}
