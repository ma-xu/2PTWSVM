addpath('../data');
clear;
clc;
load('splice_data.mat');
data = data';
label = label';
Data= data;

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;


label = label;

[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,label,10);
testCorr
cpu_time
std
