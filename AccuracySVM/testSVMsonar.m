%对半测试
addpath('../data');
clear;clc;
load('sonar.mat');
%将矩阵按行重新排列
B(1:size(A,1),:)=A(randperm(size(A,1))',:);
trainData =B(1:104,2:end);
testData = B(105:end,2:end);
trainLabel = B(1:104,1);
testLabel = B(105:end,1);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
