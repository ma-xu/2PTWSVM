clear;
clc;
load('heart.mat');
AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==2),:);
BB = BB(:,2:end);


p=0.4;  
[w1,w2,b1,b2] = svc(AA,BB,1,1);





