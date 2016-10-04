addpath('../data');

clear;
clc;
load('australian.mat');
trainX = A(1:200,:);
testX = A(201:end,:);

AA = trainX(find(trainX(:,1)==1),:);
AA = AA(:,2:end);
BB = trainX(find(trainX(:,1)==0),:);
BB = BB(:,2:end);
 


p=3.2;  
c1 =1;
c2 =1;
[ w1 ,distance,SChange,SCHA] = svc2( AA,BB,p,c1);
[ w2 ] = svc2( BB,AA,p,c2);




X = testX(:,2:end);
label = testX(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);