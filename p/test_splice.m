addpath('../data');
clear;
clc;
load('splice_data.mat');
data = data';
label = label';
data = data(1:1000,:);
label = label(1:1000,:);

avg = repmat(mean(data,1), size(data,1), 1);

data = data-avg;


trainX = data(1:500,:);
testX = data(501:end,:);

AA = trainX(find(trainX(:,1)==1),:);

BB = trainX(find(trainX(:,1)~=1),:);


c1 =1;
c2 =1;


label=label(501:end,:);
label(label~=1) = 0;


accuracyList=[];
for p=0.1:0.1:2
[ w1] = svc( AA,BB,p,c1);
[ w2 ] = svc( BB,AA,p,c2);
[ accuracyValue ] = accuracy( w1,w2,testX ,label);
accuracyList = [accuracyList;accuracyValue];
end
accuracyList