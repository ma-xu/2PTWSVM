%对半测试

addpath('../data');
clear;clc;
load('heart.mat');

Label = A(:,1);
Data = A(:,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:135,:);
trainLabel= Label(1:135,:);

testData = Data(136:end,:);
testLabel = Label(136:end,:);
v =15;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)