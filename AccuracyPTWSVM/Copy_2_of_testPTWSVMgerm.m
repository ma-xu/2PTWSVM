addpath('../data');

clear;
clc;
load('germ.mat');

train = A(1:500,:);
test = A(501:end,:);

AA = train(find(train(:,1)==1),:);
AA = AA(:,2:end);
BB = train(find(train(:,1)==2),:);
BB = BB(:,2:end);
 
X = test(:,2:end);
label = test(:,1);
label(label~=1) = 0;
result=[];
%0.7660    1.3000    1.3000 0.1000
for p=0.1:0.1:2
    p
    for c1 = 0.1:0.1:2
        for c2 = 0.1:0.1:2
            [ w1] = svc( AA,BB,p,c1);
            [ w2 ] = svc( BB,AA,p,c2);
            [ accuracyValue ] = accuracy( w1,w2,X ,label);
            result = [result;accuracyValue p c1 c2];
        end
    end
end




