set -x
clang -S -emit-llvm test0.c -o test0.s
opt -S -polly-canonicalize test0.s > test0.preopt.ll
opt -polly-scops -analyze test0.preopt.ll -polly-process-unprofitable