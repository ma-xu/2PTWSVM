addpath('../data');
clear;
clc;
load('cmc.mat');
Data = cmc(1:642,2:end);

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;

Label  = cmc(1:642,1);
Label(Label~=1)=-1; %½«2¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,Label,10);