
addpath('../data');
clear;clc;
load('haberman.mat');


trainData = haberman(1:153,2:end);
trainLabel= haberman(1:153,1);

testData = haberman(154:end,2:end);
testLabel = haberman(154:end,1);
v =1000;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)