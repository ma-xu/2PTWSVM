%对半测试

addpath('../data');
clear;clc;
load('blood.mat');

Label = blood(:,1);
Data = blood(:,2:end);
Label(Label~=1)=-1; %将类别标号分为1和－1

trainData = Data(1:374,:);
trainLabel= Label(1:374,:);

testData = Data(375:end,:);
testLabel = Label(375:end,:);
v =90;

[accuracy ] = gepsvm(trainData,trainLabel,testData,testLabel,v)