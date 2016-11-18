%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('ionodata.mat');



trainData = A(1:175,:);
trainLabel= d(1:175,:);

testData = A(176:end,:);
testLabel = d(176:end,:);
v =90;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)