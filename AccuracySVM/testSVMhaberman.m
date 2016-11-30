%∂‘∞Î≤‚ ‘

addpath('../data');
clear;clc;
load('haberman.mat');
Data = haberman(:,2:end);
Label = haberman(:,1);

trainData =Data(1:153,:);
testData = Data(154:end,:);
trainLabel = Label(1:153,:);
testLabel = Label(154:end,:);

svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
