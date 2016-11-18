addpath('../data');
clear;
clc;
load('ionodata.mat');
trainX = A(1:175,:);
testX = A(176:end,:);
testLabel = d(176:end,:);



AA = trainX(find(trainX(:,1)==1),:);

BB = trainX(find(trainX(:,1)~=1),:);

 
[w1,w2,b1,b2] = svc(AA,BB,1,1);
w1 = [w1;b1;];
w2 = [w2;b2];



testLabel(testLabel~=1) = 0;
[ accuracy ] = accuracy( w1,w2,testX ,testLabel);