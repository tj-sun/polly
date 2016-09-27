# set -x
# clang -S -emit-llvm test0.c -o test0.s
/home/tianjiao/projects/3.9/ComputeCpp-CE-0.1-Linux/bin/compute++ -cc1 -emit-llvm-bc -triple spir64-unknown-unknown -o VecDouble.spir VecDouble.cl -std=CL1.2
llvm-dis VecDouble.spir
opt -S -polly-canonicalize VecDouble.spir.ll > VecDouble.preopt.ll
opt -polly-scops -analyze VecDouble.preopt.ll -polly-process-unprofitable -polly-opencl-kernel -debug