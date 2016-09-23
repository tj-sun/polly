; ModuleID = 'test0.c'
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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load i8**, i8*** %4, align 8
  %7 = getelementptr inbounds i8*, i8** %6, i64 0
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  store i32 %11, i32* %5, align 4
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1536 x float], [1536 x float]* @B, i64 0, i64 %13
  %15 = load float, float* %14, align 4
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1536 x float], [1536 x float]* @C, i64 0, i64 %17
  %19 = load float, float* %18, align 4
  %20 = fadd float %15, %19
  %21 = load i32, i32* %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [1536 x float], [1536 x float]* @A, i64 0, i64 %22
  store float %20, float* %23, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (http://llvm.org/git/clang.git 07307f95d5c82d453cdc5c23f9ccd53d5ff75426) (https://github.com/tj-sun/llvm.git 69e56220929e4bffe0cd01251f47e1540809c3d9)"}
