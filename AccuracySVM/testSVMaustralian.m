%¶Ô°ëµÄ²âÊÔ
addpath('../data');
clear;clc;
load('australian.mat');
train =A(1:345,:);
test = A(346:end,:);
trainData = train(:,2:end);
trainLabel = train(:,1);
testData = test(:,2:end);
testLabel = test(:,1);


svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
