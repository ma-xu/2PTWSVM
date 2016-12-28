addpath('../data');

clear;
clc;
load('pimadata.mat');

avg = repmat(mean(A,1), size(A,1), 1);
A = A-avg;


Train = A(1:300,:);
Test = A(301:end,:);
TrainLabel = d(1:300,:);
TestLabel = d(301:end,:);

AA = Train(find(TrainLabel(:,1)==1),:);
BB = Train(find(TrainLabel(:,1)==-1),:);
 

X = Test;
label = TestLabel(:,1);
label(label~=1) = 0;
result=[];
%0.8013 2 1.4 0.3
for p = 0.1:0.1:2
    p
    for c1 = 0.1:0.1:2
        for c2 =0.1:0.1:2
            [ w1 ] = svc( AA,BB,p,c1);
            [ w2 ] = svc( BB,AA,p,c2);
            [ accuracyValue ] = accuracy( w1,w2,X ,label); 
            result = [result; accuracyValue p c1 c2];
            
        end
    end
end




