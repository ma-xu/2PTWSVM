addpath('../data');
clear;
clc;
load('ionodata.mat');

Data = A;

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;

[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,d,10);