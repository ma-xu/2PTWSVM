%对半测试

addpath('../data');
clear;clc;
load('cmc.mat');

Label = cmc(1:642,1);
Data = cmc(1:642,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:2:end,:);
trainLabel= Label(1:2:end,:);

testData = Data(2:2:end,:);
testLabel = Label(2:2:end,:);
v =900;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)