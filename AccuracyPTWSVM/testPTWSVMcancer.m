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


 


p=1.2;  
c1 =0.2;
c2 =0.2;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);





TestLabel(TestLabel~=1) = 0;
[ accuracy ] = accuracy( w1,w2,Test ,TestLabel);