addpath('../data');

clear;
clc;
load('ionodata.mat');

Data = A;
Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;

[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,d,10);
testCorr
cpu_time

std

