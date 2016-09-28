// #if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
// #elif defined(cl_amd_fp64)  // AMD extension available?
// #pragma OPENCL EXTENSION cl_amd_fp64 : enable
// #endif

#include "opencl_spir.h"

typedef float DATA_TYPE;

__kernel void Add1D_kernel(__global DATA_TYPE *A, __global DATA_TYPE *B, int ni) 
{
    int i = get_global_id(0);
    // int i = ni;
    A[i] = 2*B[i];
    // for (int t=0;t<100;t++) {
    //     A[i*50+j] = B[i*50+j]*2;
    // }
}
