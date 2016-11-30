addpath('../../data');

clear;
clc;
load('monk1.mat');
load('../NOiseData/NoiseMonk1Train.mat');
load('../NOiseData/NoiseMonk1Test.mat');



train  = train+0*NoiseMonk1Train;
test  = test+0*NoiseMonk1Test;

A  = [train;test];


AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==0),:);
BB = BB(:,2:end);
 


p=1.3;  
c1 =0.1;
c2 =0.1;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = A(:,2:end);
label = A(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);