

addpath('../data');
clear;clc;
load('ionodata.mat');

trainData =A(1:175,:);
trainLabel = d(1:175,:);

testData = A(176:end,:);
testLabel = d(176:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
