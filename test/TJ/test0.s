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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 0
  %1 = load i8*, i8** %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i8, i8* %1, i64 0
  %2 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %2 to i32
  store i32 %conv, i32* %q, align 4
  %3 = load i32, i32* %q, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [1536 x float], [1536 x float]* @B, i64 0, i64 %idxprom
  %4 = load float, float* %arrayidx2, align 4
  %5 = load i32, i32* %q, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [1536 x float], [1536 x float]* @C, i64 0, i64 %idxprom3
  %6 = load float, float* %arrayidx4, align 4
  %add = fadd float %4, %6
  %7 = load i32, i32* %q, align 4
  %idxprom5 = sext i32 %7 to i64
  %arrayidx6 = getelementptr inbounds [1536 x float], [1536 x float]* @A, i64 0, i64 %idxprom5
  store float %add, float* %arrayidx6, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (http://llvm.org/git/clang.git 07307f95d5c82d453cdc5c23f9ccd53d5ff75426) (https://github.com/tj-sun/llvm.git 805bc7c089155ab329a63b926e11904e118c35d5)"}
