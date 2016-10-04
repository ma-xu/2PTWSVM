addpath('../data');
clear;
clc;
load('australian.mat');
Data = A(:,2:end);
Label  = A(:,1);
Label(Label==0)=-1; %½«2¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,Label,10);