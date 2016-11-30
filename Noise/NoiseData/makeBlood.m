clear;clc;
addpath('../../data');
load('blood.mat');
NoiseBlood = randn(size(blood));

NoiseBlood(:,1)=0;