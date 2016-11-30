addpath('../data');
clear;
clc;
load('diabetes.mat');
Data = diabetes(:,2:end);
Label  = diabetes(:,1);
Label(Label~=1)=-1; %½«2¸Ä³É£­1
[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(Data,Label,10);