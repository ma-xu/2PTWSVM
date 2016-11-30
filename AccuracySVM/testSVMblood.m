%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('blood.mat');
Data = blood(:,2:end);
Label = blood(:,1);
trainData =Data(1:374,:);
testData = Data(375:end,:);
trainLabel = Label(1:374,:);
testLabel = Label(375:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
