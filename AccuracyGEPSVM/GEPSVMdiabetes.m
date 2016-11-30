%对半测试

addpath('../data');
clear;clc;
load('diabetes.mat');

Label = diabetes(:,1);
Data = diabetes(:,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:384,:);
trainLabel= Label(1:384,:);

testData = Data(385:end,:);
testLabel = Label(385:end,:);
v =10000;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)