%∑÷∫√≤‚ ‘
addpath('../data');
clear;clc;
load('spect.mat');
testData = test(:,2:end);
testLabel  = test(:,1);
trainData = train(:,2:end);
trainLabel = train(:,1);


svm_struct = svmtrain(testData,testLabel); 
Group = svmclassify(svm_struct,trainData); 

errNum = sum(Group~=trainLabel);
totalNum = length(trainLabel(:,1));
accuracy = 1-errNum/totalNum;
