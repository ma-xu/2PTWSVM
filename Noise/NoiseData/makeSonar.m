clear;clc;
addpath('../../data');
load('sonar.mat');
NoiseSonar = randn(size(A));

NoiseSonar(:,1)=0;