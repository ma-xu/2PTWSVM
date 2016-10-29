addpath('../../data');

clear;
clc;
load('germ.mat');
load('../NoiseData/NoiseGerm.mat');
A = A + 5*NoiseGerm;

train = A(1:500,:);
test = A(501:end,:);

AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==2),:);
BB = BB(:,2:end);
 


p=1.6;  
c1 =0.1;
c2 =0.1;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);