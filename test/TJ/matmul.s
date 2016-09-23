; ModuleID = 'matmul.c'
source_filename = "matmul.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1536 x [1536 x float]] zeroinitializer, align 16
@B = common global [1536 x [1536 x float]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@C = common global [1536 x [1536 x float]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %3

; <label>:3:                                      ; preds = %43, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 1536
  br i1 %5, label %6, label %46

; <label>:6:                                      ; preds = %3
  store i32 0, i32* %2, align 4
  br label %7

; <label>:7:                                      ; preds = %39, %6
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 1536
  br i1 %9, label %10, label %42

; <label>:10:                                     ; preds = %7
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %2, align 4
  %13 = mul nsw i32 %11, %12
  %14 = srem i32 %13, 1024
  %15 = add nsw i32 1, %14
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+00
  %18 = fptrunc double %17 to float
  %19 = load i32, i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32, i32* %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %22
  %24 = getelementptr inbounds [1536 x float], [1536 x float]* %23, i64 0, i64 %20
  store float %18, float* %24, align 4
  %25 = load i32, i32* %1, align 4
  %26 = load i32, i32* %2, align 4
  %27 = mul nsw i32 %25, %26
  %28 = srem i32 %27, 1024
  %29 = add nsw i32 1, %28
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 2.000000e+00
  %32 = fptrunc double %31 to float
  %33 = load i32, i32* %2, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32, i32* %1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %36
  %38 = getelementptr inbounds [1536 x float], [1536 x float]* %37, i64 0, i64 %34
  store float %32, float* %38, align 4
  br label %39

; <label>:39:                                     ; preds = %10
  %40 = load i32, i32* %2, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %2, align 4
  br label %7

; <label>:42:                                     ; preds = %7
  br label %43

; <label>:43:                                     ; preds = %42
  %44 = load i32, i32* %1, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %1, align 4
  br label %3

; <label>:46:                                     ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %3

; <label>:3:                                      ; preds = %34, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 1536
  br i1 %5, label %6, label %37

; <label>:6:                                      ; preds = %3
  store i32 0, i32* %2, align 4
  br label %7

; <label>:7:                                      ; preds = %28, %6
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 1536
  br i1 %9, label %10, label %31

; <label>:10:                                     ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %12 = load i32, i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32, i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %15
  %17 = getelementptr inbounds [1536 x float], [1536 x float]* %16, i64 0, i64 %13
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), double %19)
  %21 = load i32, i32* %2, align 4
  %22 = srem i32 %21, 80
  %23 = icmp eq i32 %22, 79
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %10
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %24, %10
  br label %28

; <label>:28:                                     ; preds = %27
  %29 = load i32, i32* %2, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %2, align 4
  br label %7

; <label>:31:                                     ; preds = %7
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %34

; <label>:34:                                     ; preds = %31
  %35 = load i32, i32* %1, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %1, align 4
  br label %3

; <label>:37:                                     ; preds = %3
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store i32 0, i32* %1, align 4
  call void @init_array()
  store i32 0, i32* %2, align 4
  br label %7

; <label>:7:                                      ; preds = %62, %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 1536
  br i1 %9, label %10, label %65

; <label>:10:                                     ; preds = %7
  store i32 0, i32* %3, align 4
  br label %11

; <label>:11:                                     ; preds = %58, %10
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %12, 1536
  br i1 %13, label %14, label %61

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %3, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32, i32* %2, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %18
  %20 = getelementptr inbounds [1536 x float], [1536 x float]* %19, i64 0, i64 %16
  store float 0.000000e+00, float* %20, align 4
  store i32 0, i32* %4, align 4
  br label %21

; <label>:21:                                     ; preds = %54, %14
  %22 = load i32, i32* %4, align 4
  %23 = icmp slt i32 %22, 1536
  br i1 %23, label %24, label %57

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32, i32* %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %28
  %30 = getelementptr inbounds [1536 x float], [1536 x float]* %29, i64 0, i64 %26
  %31 = load float, float* %30, align 4
  %32 = load i32, i32* %4, align 4
  %33 = sext i32 %32 to i64
  %34 = load i32, i32* %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @A, i64 0, i64 %35
  %37 = getelementptr inbounds [1536 x float], [1536 x float]* %36, i64 0, i64 %33
  %38 = load float, float* %37, align 4
  %39 = load i32, i32* %3, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32, i32* %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @B, i64 0, i64 %42
  %44 = getelementptr inbounds [1536 x float], [1536 x float]* %43, i64 0, i64 %40
  %45 = load float, float* %44, align 4
  %46 = fmul float %38, %45
  %47 = fadd float %31, %46
  %48 = load i32, i32* %3, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32, i32* %2, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1536 x [1536 x float]], [1536 x [1536 x float]]* @C, i64 0, i64 %51
  %53 = getelementptr inbounds [1536 x float], [1536 x float]* %52, i64 0, i64 %49
  store float %47, float* %53, align 4
  br label %54

; <label>:54:                                     ; preds = %24
  %55 = load i32, i32* %4, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %4, align 4
  br label %21

; <label>:57:                                     ; preds = %21
  br label %58

; <label>:58:                                     ; preds = %57
  %59 = load i32, i32* %3, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %3, align 4
  br label %11

; <label>:61:                                     ; preds = %11
  br label %62

; <label>:62:                                     ; preds = %61
  %63 = load i32, i32* %2, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %2, align 4
  br label %7

; <label>:65:                                     ; preds = %7
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.1 (http://llvm.org/git/clang.git 07307f95d5c82d453cdc5c23f9ccd53d5ff75426) (https://github.com/tj-sun/llvm.git 69e56220929e4bffe0cd01251f47e1540809c3d9)"}
