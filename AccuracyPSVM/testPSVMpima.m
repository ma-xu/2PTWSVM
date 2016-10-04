addpath('../data');

clear;
clc;
load('pimadata.mat');
[w,gamma, trainCorr, testCorr, cpu_time, nu]=psvm(A,d,10);