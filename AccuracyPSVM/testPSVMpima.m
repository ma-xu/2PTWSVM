addpath('../data');

clear;
clc;
load('pimadata.mat');
Data =A;
Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;
[w,gamma, trainCorr, testCorr, cpu_time, nu,testcorrstd]=psvm2(Data,d,10);
testCorr
cpu_time
testcorrstd