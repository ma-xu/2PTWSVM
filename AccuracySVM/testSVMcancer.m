%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('cancer.mat');
Data = A(:,2:end);
Label = A(:,1);
trainData =Data(1:341,:);
testData = Data(342:end,:);
trainLabel = Label(1:341,:);
testLabel = Label(342:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
