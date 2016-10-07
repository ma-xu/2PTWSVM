%分好

addpath('../data');
clear;clc;
load('monk1.mat');

trainData = train(:,2:end);
trainLabel= train(:,1);
trainLabel(trainLabel~=1)=-1; %将类别标号分为1和－1

testData = test(:,2:end);
testLabel = test(:,1);
testLabel(testLabel~=1)=-1; %将类别标号分为1和－1

v =100;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)