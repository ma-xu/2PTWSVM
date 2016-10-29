addpath('../data');

clear;
clc;
load('heart.mat');

%% 是否需要中心化

avg = repmat(mean(A,1), size(A,1), 1);
avg(:,1) = 0;
A = A-avg;




train = A(1:135,:);
test = A(136:end,:);

AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==2),:);
BB = BB(:,2:end);
 


p=1.5;  
c1 =0.5;
c2 =1;
[ w1 ] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);