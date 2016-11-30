addpath('../data');
clear;
clc;
load('blood.mat');

data = blood(:,2:end);
label = blood(:,1);
label(label~=1)=-1; %¸Ä³É£­1

[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(data,label,10);