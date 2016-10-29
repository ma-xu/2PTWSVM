clear;clc;
addpath('../../data');
load('germ.mat');
NoiseGerm = randn(size(A));

NoiseGerm(:,1)=0;