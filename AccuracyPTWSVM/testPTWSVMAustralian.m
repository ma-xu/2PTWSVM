addpath('../data');
clear;
clc;
load('m.mat');


avg = repmat(mean(A,1), size(A,1), 1);
avg(:,1) = 0;
A = A-avg;


trainX = A(1:200,:);
testX = A(201:end,:);

AA = trainX(find(trainX(:,1)==1),:);
AA = AA(:,2:end);
BB = trainX(find(trainX(:,1)==0),:);
BB = BB(:,2:end);
 


p=1.6;  
c1 =1;
c2 =2;
[ w1,distance,SChange,SCHA ] = svc2( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = testX(:,2:end);
label = testX(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);