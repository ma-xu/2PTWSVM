addpath('../data');

clear;
clc;
load('haberman.mat');
Data = haberman(:,2:end);

Max=max(max(Data));
Min=min(min(Data));
Data=2*(Data-Min)./(Max-Min)-1;

Label  = haberman(:,1);
Label(Label==2)=-1; %½«2¸Ä³É£­1

[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,Label,10);
testCorr
cpu_time
std
