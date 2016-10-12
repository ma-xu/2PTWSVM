clear;
clc;
addpath('../../data');
load('heart.mat');
load('../Noise.mat');
Noise(:,1) = 0;
%A = A+0.2*Noise;

train = A(1:135,:);
test = A(136:end,:);



AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==2),:);
BB = BB(:,2:end);
 
[w1,w2,b1,b2] = svc(AA,BB,1,1);
w1 = [w1;b1;];
w2 = [w2;b2];


X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);