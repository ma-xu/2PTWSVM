%对半测试

addpath('../data');
clear;clc;
load('liver.mat');

Label = liver(:,1);
Data = liver(:,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:163,:);
trainLabel= Label(1:163,:);

testData = Data(164:end,:);
testLabel = Label(164:end,:);
v =9000;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)