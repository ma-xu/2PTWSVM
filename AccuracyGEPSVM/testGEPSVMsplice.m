
addpath('../data');
clear;clc;
load('splice_data.mat');
data = data';
label = label';
data = data(1:1000,:);
label = label(1:1000,:);



trainData = data(1:500,:);
trainLabel= label(1:500,:);

testData = data(501:end,:);
testLabel = label(501:end,:);
v =90;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)