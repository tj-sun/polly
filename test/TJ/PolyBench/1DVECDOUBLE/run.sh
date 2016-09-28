#!/bin/bash  
# set -x
# clang -S -emit-llvm test0.c -o test0.s
debugflag="-debug"
if [[ $1 == r ]]
    then
        PATH=/home/tianjiao/projects/llvm_polly_39/build_release/install/lib:$PATH
        PATH=/home/tianjiao/projects/llvm_polly_39/build_release/install/bin:$PATH
        debugflag=""
fi
rm -f VecDouble.spir VecDouble.spir.ll VecDouble.preopt.ll VecDouble.preprocess.ll *.jscop
/home/tianjiao/projects/3.9/ComputeCpp-CE-0.1-Linux/bin/compute++ -cc1 -emit-llvm-bc -triple spir64-unknown-unknown -o VecDouble.spir VecDouble.cl -std=CL1.2 -w
llvm-dis VecDouble.spir
opt -S -load=LLVMTJ.so -polly-opencl-preprocess-module VecDouble.spir -o VecDouble.preprocess0.ll
# opt -S -load=LLVMTJ.so -polly-opencl-preprocess VecDouble.preprocess0.ll -o VecDouble.preprocess.ll
# opt -S -polly-canonicalize VecDouble.preprocess.ll > VecDouble.preopt.ll
# opt -polly-scops -analyze VecDouble.preprocess.ll -polly-process-unprofitable $debugflag -polly-opencl-kernel
# opt -polly-export-jscop VecDouble.preopt.ll -polly-process-unprofitable -polly-opencl-kernel