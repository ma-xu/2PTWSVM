addpath('../data');
clear;
clc;
load('australian.mat');

%{
avg = repmat(mean(A,1), size(A,1), 1);
avg(:,1) = 0;
A = A-avg;
%}

trainX = A(1:200,:);
testX = A(201:end,:);

AA = trainX(find(trainX(:,1)==1),:);
AA = AA(:,2:end);
BB = trainX(find(trainX(:,1)==0),:);
BB = BB(:,2:end);
 
CC=[AA;BB];

p=1.4;
c1 =0.08;
c2 =0.08;
options.t=2000;
options.KernelType='Gaussian';


AA = constructKernel(AA,CC,options);
BB = constructKernel(BB,CC,options);
[ w1] = svc( AA,BB,p,c1);
[ w2] = svc( BB,AA,p,c2);




X = testX(:,2:end);
label = testX(:,1);
label(label~=1) = 0;
XX = constructKernel(X,CC,options);
[ accuracyValue ] = accuracy( w1,w2,XX ,label);