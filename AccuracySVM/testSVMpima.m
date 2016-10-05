%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('pimadata.mat');
trainData =A(1:384,:);
testData = A(385:end,:);
trainLabel = d(1:384,:);
testLabel = d(385:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
