clear;clc;
addpath('../../data');
load('spect.mat');
NoiseSpect = randn(size(test));

NoiseSpect(:,1)=0;