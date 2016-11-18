addpath('../data');

clear;
clc;
load('cancer.mat');
Train = A(1:341,2:end);
Test = A(342:end,2:end);
TrainLabel = A(1:341,1);
TestLabel = A(342:end,1);

AA = Train(find(TrainLabel(:,1)==1),:);
BB = Train(find(TrainLabel(:,1)~=1),:);
 
[w1,w2,b1,b2] = svc(AA,BB,0.1,0.1);
w1 = [w1;b1;];
w2 = [w2;b2];


TestLabel(TestLabel~=1) = 0;
[ accuracy ] = accuracy( w1,w2,Test ,TestLabel);