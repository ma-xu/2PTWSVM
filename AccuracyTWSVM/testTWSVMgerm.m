addpath('../data');

clear;
clc;
load('germ.mat');
AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==2),:);
BB = BB(:,2:end);
 
[w1,w2,b1,b2] = svc(AA,BB,1,1);
w1 = [w1;b1;];
w2 = [w2;b2];


X = A(:,2:end);
label = A(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);