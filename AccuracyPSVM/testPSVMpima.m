addpath('../data');

clear;
clc;
load('pimadata.mat');
Data =A;
[w,gamma, trainCorr, testCorr, cpu_time, nu,testcorrstd]=psvm2(Data,d,10);
testCorr
cpu_time
testcorrstd