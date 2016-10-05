addpath('../data');

clear;
clc;
load('monk1.mat');

A = [test;train;];

AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==0),:);
BB = BB(:,2:end);
 


p=2.8;  
c1 =0.5;
c2 =1;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = A(:,2:end);
label = A(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);