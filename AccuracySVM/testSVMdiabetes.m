%¶Ô°ëµÄ²âÊÔ
addpath('../data');
clear;clc;
load('diabetes.mat');
train =diabetes(1:384,:);
test = diabetes(385:end,:);
trainData = train(:,2:end);
trainLabel = train(:,1);
testData = test(:,2:end);
testLabel = test(:,1);


svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
