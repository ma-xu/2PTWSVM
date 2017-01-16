addpath('../data');
clear;
clc;
load('blood.mat');

Data = blood(:,2:end);
Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;


label = blood(:,1);
label(label~=1)=-1; %¸Ä³É£­1

[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,label,10);