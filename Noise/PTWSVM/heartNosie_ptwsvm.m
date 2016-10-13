clear;
clc;
addpath('../../data');
load('heart.mat');

%% 生成噪声
randValue = randn(20,14);
zero = zeros(size(A,1)-size(randValue,1),14);
Noise = [zero;randValue;];
vector = randperm(270);
Noise = Noise(vector,:);
    

%% 分类
%load('../Noise.mat');
Noise(:,1) = 0;
A = A+Noise;

train = A(1:135,:);
test = A(136:end,:);

AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==2),:);
BB = BB(:,2:end);
 


p=1.3;  
c1 =0.5;
c2 =1;
[ w1 ] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);




X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
[ accuracy ] = accuracy( w1,w2,X ,label);