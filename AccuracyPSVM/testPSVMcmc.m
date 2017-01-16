addpath('../data');
clear;
clc;
load('cmc.mat');
Data = cmc(1:642,2:end);



Label  = cmc(1:642,1);
Label(Label~=1)=-1; %½«2¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,Label,10);
testCorr
cpu_time
std

