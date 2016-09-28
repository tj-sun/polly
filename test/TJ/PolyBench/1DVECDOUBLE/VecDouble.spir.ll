; ModuleID = 'VecDouble.spir'
source_filename = "VecDouble.spir"
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir64-unknown-unknown"

; Function Attrs: nounwind
define spir_kernel void @Add1D_kernel(float addrspace(1)* nocapture %A, float addrspace(1)* nocapture readonly %B, i32 %ni) #0 {
  %1 = tail call spir_func i64 @_Z13get_global_idj(i32 0) #2
  %sext = shl i64 %1, 32
  %2 = ashr exact i64 %sext, 32
  %3 = getelementptr inbounds float, float addrspace(1)* %B, i64 %2
  %4 = load float, float addrspace(1)* %3, align 4, !tbaa !7
  %5 = fmul float %4, 2.000000e+00
  %6 = getelementptr inbounds float, float addrspace(1)* %A, i64 %2
  store float %5, float addrspace(1)* %6, align 4, !tbaa !7
  ret void
}

; Function Attrs: nounwind readnone
declare spir_func i64 @_Z13get_global_idj(i32) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-realign-stack" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-realign-stack" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!opencl.kernels = !{!0}
!opencl.spir.version = !{}
!opencl.ocl.version = !{}
!opencl.used.optional.core.features = !{}
!opencl.used.extensions = !{}
!opencl.compiler.options = !{}
!llvm.ident = !{!6}

!0 = !{void (float addrspace(1)*, float addrspace(1)*, i32)* @Add1D_kernel, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"DATA_TYPE*", !"DATA_TYPE*", !"int"}
!4 = !{!"kernel_arg_base_type", !"float*", !"float*", !"int"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !""}
!6 = !{!"Codeplay ComputeCpp - CE 0.1 Device Compiler - clang version 3.6.0 (git@git.office.codeplay.com:sycl/clang.git d84b391561311963956b2f0a9f72c1f0ef903095) (git@git.office.codeplay.com:sycl/llvm.git 68059a31a37a9f5466da25a2f5c77bca8d0073af) (based on LLVM 3.6.0svn)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
