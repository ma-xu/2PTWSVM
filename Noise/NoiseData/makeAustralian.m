clear;clc;
addpath('../../data');
load('heart.mat');
NoiseHeart = randn(size(A));

NoiseHeart(:,1)=0;