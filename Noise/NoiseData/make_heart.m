clear;clc;
addpath('../../data');
load('heart.mat');
%加噪声程度（比例，程度）
rate = 0.3;
degree = 3;
num = fix(length(A)*rate);
randIndex = randperm(length(A),num);
noise_Heart = zeros(size(A));
randNoise = rand(num,size(A,2))-rand(num,size(A,2));
noise_Heart(randIndex,:) = noise_Heart(randIndex,:)+randNoise;
noise_Heart(:,1)=0;



%NoiseHeart = randn(size(A));

%NoiseHeart(:,1)=0;