%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('pimadata.mat');


trainData = A(1:384,:);
trainLabel= d(1:384,:);

testData = A(385:end,:);
testLabel = d(385:end,:);
v =10000;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)