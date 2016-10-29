clear;clc;
addpath('../../data');
load('australian.mat');
NoiseAustralian = randn(size(A));

NoiseAustralian(:,1)=0;