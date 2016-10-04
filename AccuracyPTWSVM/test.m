addpath('../data');

clear;
clc;
load('heart.mat');
AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==2),:);
BB = BB(:,2:end);

%AA = rand(50,10);
%BB = rand(60,10);


p=0.4;  
c1 = 1;
c2 = 1;
[ u1 ] = svc( AA,BB,p,c1);
[ u2 ] = svc( BB,AA,p,c2);