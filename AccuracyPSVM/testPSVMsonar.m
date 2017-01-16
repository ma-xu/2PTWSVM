addpath('../data');
clear;
clc;
load('sonar.mat');

Data = A(:,2:end);

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;


Label  = A(:,1);
Label(Label==0)=-1; %½«0¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu,testcorrstd]=psvm2(Data,Label,10);
testCorr
cpu_time
testcorrstd