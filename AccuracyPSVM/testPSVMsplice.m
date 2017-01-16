addpath('../data');
clear;
clc;
load('splice_data.mat');
data = data';
label = label';
Data= data(1:1000,:);

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;


label = label(1:1000,:);

[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,label,10);