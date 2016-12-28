addpath('../data');

clear;
clc;
load('cancer.mat');

Train = A(1:341,2:end);
Test = A(342:end,2:end);
TrainLabel = A(1:341,1);
TestLabel = A(342:end,1);

AA = Train(find(TrainLabel(:,1)==1),:);
BB = Train(find(TrainLabel(:,1)~=1),:);

TestLabel(TestLabel~=1) = 0;
result=[];
% 0.9708 0.6 0.1 0.4
for p = 0.1:0.1:2
    p
    for c1 = 0.1:0.1:2
        for c2 = 0.1:0.1:2
            [ w1] = svc( AA,BB,p,c1);
            [ w2 ] = svc( BB,AA,p,c2);
            [ accuracyvalue ] = accuracy( w1,w2,Test ,TestLabel); 
            result=[result; accuracyvalue p c1 c2];
        end
    end
end


