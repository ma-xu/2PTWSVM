addpath('../data');
clear;
clc;
load('liver.mat');
Data = liver(:,2:end);

Label  = liver(:,1);
Label(Label~=1)=-1; %��2�ĳɣ�1
[w,gamma, trainCorr, testCorr, cpu_time, nu,std]=psvm2(Data,Label,10);
testCorr
cpu_time
std

