addpath('../data');
clear;
clc;
load('splice_data.mat');
data = data';
label = label';
data = data(1:1000,:);
label = label(1:1000,:);

[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(data,label,10);