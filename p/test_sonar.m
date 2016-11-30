%样本太少会奇异，只能全部
addpath('../data');

clear;
clc;
load('sonar.mat');

%{
avg = repmat(mean(A,1), size(A,1), 1);
avg(:,1) = 0;
A = A-avg;
%}
%{
Train = A(1:2:end,2:end);
Test = A(2:2:end,2:end);
TrainLabel = A(1:2:end,1);
TestLabel = A(2:2:end,1);

AA = Train(find(TrainLabel(:,1)==1),:);
BB = Train(find(TrainLabel(:,1)==0),:);
 
%}

Data = A(:,2:end);
Label = A(:,1);
AA = Data(find(Label(:,1)==1),:);
BB = Data(find(Label(:,1)==0),:);



  
c1 =0.1;
c2 =0.1;



%{
X = Test;
label = TestLabel(:,1);
label(label~=1) = 0;
%}

accuracyList=[];
for p=0.1:0.1:2
[ w1 ,distance,SS] = svc( AA,BB,p,c1);
[ w2 ,distance,SS] = svc( BB,AA,p,c2);
[ accuracyValue ] = accuracy( w1,w2,Data ,Label);
accuracyList = [accuracyList;accuracyValue];
end