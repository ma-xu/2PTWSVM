%对半测试

addpath('../data');
clear;clc;
load('germ.mat');

Label = A(:,1);
Data = A(:,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:500,:);
trainLabel= Label(1:500,:);

testData = Data(501:end,:);
testLabel = Label(501:end,:);
v =5;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)