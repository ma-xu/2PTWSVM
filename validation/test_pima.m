clear;
clc;
load('../data/spect.mat');
A = [train;test];
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_spect ] = crossvalidate( d,X,v );
