%∂‘∞Î≤‚ ‘
addpath('../data');
clear;clc;
load('heart.mat');
Data = A(:,2:end);
label  = A(:,1);
trainData = Data(1:135,:);
testData = Data(136:end,:);

trainLabel = label(1:135,:);
testLabel = label(136:end,:);



svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
