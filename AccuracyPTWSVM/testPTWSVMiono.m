addpath('../data');

clear;
clc;
load('ionodata.mat');

train = A(1:175,:);
test = A(176:end,:);

AA = train(find(train(:,1)==1),:);

BB = train(find(train(:,1)~=1),:);

 


p=1.3;  
c1 =0.01;
c2 =0.01;
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);


label = d(176:end,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,test ,label);