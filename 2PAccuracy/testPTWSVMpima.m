clear;
clc;
load('pimadata.mat');
Train = A(1:300,:);
Test = A(301:end,:);
TrainLabel = d(1:300,:);
TestLabel = d(301:end,:);

AA = Train(find(TrainLabel(:,1)==1),:);
BB = Train(find(TrainLabel(:,1)==-1),:);
 


p=3;  
c1 = 2;
c2 = 2;
[ w1 ] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = Test;
label = TestLabel(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);