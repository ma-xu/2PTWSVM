addpath('../data');
clear;
clc;
load('cmc.mat');
A = cmc(1:642,:);
trainX = A(1:2:end,:);
testX = A(2:2:end,:);



AA = trainX(find(trainX(:,1)==1),:);
AA = AA(:,2:end);
BB = trainX(find(trainX(:,1)~=1),:);
BB = BB(:,2:end);
 
[w1,w2,b1,b2] = svc(AA,BB,0.001,0.001);
w1 = [w1;b1;];
w2 = [w2;b2];


X = testX(:,2:end);
label = testX(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);


