addpath('../data');

clear;
clc;
load('ionodata.mat');

train = A(1:175,:);
test = A(176:end,:);

AA = train(find(train(:,1)==1),:);

BB = train(find(train(:,1)~=1),:);

label = d(176:end,1);
label(label~=1) = 0;

result=[];

%0.8750    0.8000    0.1000    0.9000
for p=0.1:0.1:2
    p
    for c1=0.1:0.1:2
        for c2=0.1:0.1:2
            [ w1] = svc( AA,BB,p,c1);
            [ w2 ] = svc( BB,AA,p,c2);
            [accuracyValue ] = accuracy( w1,w2,test ,label);
            result=[result;accuracyValue p c1 c2];
        end
    end
end
 
[max,row]=max(result(:,1));
result(row,:)

