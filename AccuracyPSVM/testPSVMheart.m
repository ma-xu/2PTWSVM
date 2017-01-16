addpath('../data');
clear;
clc;
load('heart.mat');
Data = A(:,2:end);



Label  = A(:,1);
Label(Label==2)=-1; %½«2¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu,testcorrstd]=psvm2(Data,Label,10);
testCorr
cpu_time
testcorrstd