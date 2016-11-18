%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('cancer.mat');


trainData = A(1:341,2:end);
trainLabel= A(1:341,1);

testData = A(342:end,2:end);
testLabel = A(342:end,1);
v =10000000;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)