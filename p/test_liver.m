addpath('../data');
clear;
clc;
load('liver.mat');
A = liver;

%{
avg = repmat(mean(A,1), size(A,1), 1);
avg(:,1) = 0;
A = A-avg;
%}

trainX = A(1:163,:);
testX = A(164:end,:);

AA = trainX(find(trainX(:,1)==1),:);
AA = AA(:,2:end);
BB = trainX(find(trainX(:,1)~=1),:);
BB = BB(:,2:end);
 



c1 =1;
c2 =1;



X = testX(:,2:end);
label = testX(:,1);
label(label~=1) = 0;



accuracyList=[];
for p=0.1:0.1:2
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);
[ accuracyValue ] = accuracy( w1,w2,X ,label);
accuracyList = [accuracyList;accuracyValue];
end