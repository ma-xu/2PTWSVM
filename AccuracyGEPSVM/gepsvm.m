function [ accuracy ] = gepsvm( trainData,trainLabel,testData,testLabel,v )
%GEPSVM Summary of this function goes here
%   Detailed explanation goes here

trainLabel(trainLabel~=1)=-1; %将类别标号分为1和－1
testLabel(testLabel~=1)=-1; %将类别标号分为1和－1

index1 = find(trainLabel==1);
index2 = find(trainLabel==-1);

trainData1 = trainData(index1,:);
trainData2 = trainData(index2,:);

[w1,w2,bias1,bias2] = svc(trainData1,trainData2,v);

u1 = [w1;bias1;];
u2 = [w2;bias2;];


testData = [testData ones(size(testData,1),1)];

distence1 = abs(testData*u1)/norm(u1);
distence2 = abs(testData*u2)/norm(u2);

predict = double(distence1<=distence2);
predict(predict~=1)=-1;
errnum = sum(predict~=testLabel);
accuracy = 1- errnum/length(testLabel(:,1));

end

