
addpath('../data');
clear;clc;
load('cmc.mat');
Data = cmc(1:642,2:end);
label  = cmc(1:642,1);
trainData = Data(1:2:end,:);
testData = Data(2:2:end,:);

trainLabel = label(1:2:end,:);
testLabel = label(2:2:end,:);



svm_struct = svmtrain(trainData,trainLabel); 
Group = svmclassify(svm_struct,testData); 

errNum = sum(Group~=testLabel);
totalNum = length(testLabel(:,1));
accuracy = 1-errNum/totalNum;
