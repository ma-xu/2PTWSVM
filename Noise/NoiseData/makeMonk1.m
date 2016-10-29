clear;clc;
addpath('../../data');
load('monk1.mat');
NoiseMonk1Train = randn(size(train));

NoiseMonk1Train(:,1)=0;

NoiseMonk1Test = randn(size(test));

NoiseMonk1Test(:,1)=0;