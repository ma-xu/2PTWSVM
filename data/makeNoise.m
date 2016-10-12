clear;
clc;
load('heart.mat');
average = mean(A,1);
randValue = randn(20,14);
randValue(:,2) = randValue(:,2)*10;
randValue(:,5) = randValue(:,5)*10;
randValue(:,6) = randValue(:,6)*20;
randValue(:,9) = randValue(:,9)*10;
randValue(:,11) = randValue(:,11)*0.1;
zero = zeros(250,14);
noise = [zero;randValue;];

vector = randperm(270);
for i=1:14
    vector = randperm(270);
    noise(:,i) = noise(vector,i);
    
    
end





