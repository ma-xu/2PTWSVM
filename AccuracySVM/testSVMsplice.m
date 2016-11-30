%¶Ô°ëµÄ²âÊÔ
addpath('../data');
clear;clc;
load('splice_data.mat');
data = data';
label = label';
data = data(1:500,:);
label = label(1:500,:);

trainData = data(1:250,:);
trainLabel = label(1:250,:);
testData = data(251:end,:);
testLabel = label(251:end,:);


svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
