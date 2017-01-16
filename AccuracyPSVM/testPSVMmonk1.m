addpath('../data');

clear;
clc;
load('monk1.mat');
A = [test;train;];
Data = A(:,2:end);



Label  = A(:,1);
Label(Label==0)=-1; %½«2¸Ä³É£­1

[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,Label,10);
testCorr
cpu_time
std