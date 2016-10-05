%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('germ.mat');
Data = A(:,2:end);
Label = A(:,1);
trainData =Data(1:500,:);
testData = Data(501:end,:);
trainLabel = Label(1:500,:);
testLabel = Label(501:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
