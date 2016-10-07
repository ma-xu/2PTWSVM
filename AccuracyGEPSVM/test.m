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


index1 = find(trainLabel==1);
index2 = find(trainLabel==-1);
trainData1 = trainData(index1,:);
trainData2 = trainData(index2,:);
v= 1;%参数
[w1,w2,bias1,bias2] = svc(trainData1,trainData2,v);




