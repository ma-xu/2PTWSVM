addpath('../data');

clear;
clc;
load('monk1.mat');

A = [test;train;];

AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==0),:);
BB = BB(:,2:end);
 


p=1.3;  
c1 =0.5;
c2 =0.5;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);