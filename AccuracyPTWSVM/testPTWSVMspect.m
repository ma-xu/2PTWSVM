addpath('../data');

clear;
clc;
load('spect.mat');

%{
avg = repmat(mean(test,1), size(test,1), 1);
avg(:,1) = 0;
test = test-avg;

avg = repmat(mean(train,1), size(train,1), 1);
avg(:,1) = 0;
train = train-avg;
%}





%A  = [test;train;];
A  = [train];

AA = A(find(A(:,1)==1),:);
AA = AA(:,2:end);
BB = A(find(A(:,1)==0),:);
BB = BB(:,2:end);
 


p=0.9;  
c1 =2;
c2 =0.3;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);