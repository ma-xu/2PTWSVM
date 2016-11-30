addpath('../data');
clear;
clc;
load('splice_data.mat');
data = data';
label = label';
train = data(1:500,:);
test = data(501:1000,:);



AA = train(find(train(:,1)==1),:);

BB = train(find(train(:,1)~=1),:);

 
[w1,w2,b1,b2] = svc(AA,BB,1,1);
w1 = [w1;b1;];
w2 = [w2;b2];


testLabel = label(501:1000,:);
testLabel(testLabel~=1) = 0;
[ accuracy ] = accuracy( w1,w2,test ,testLabel);