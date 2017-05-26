%clear al4
%clear al4
clear;clc;
load /Users/melody/Desktop/2PTWSVM/data/monk1.mat;

B=[test;train];


cla=1;
A=B(1:end,2:end);
Max=max(max(A));
Min=min(min(A));
A=2*(A-Min)./(Max-Min)-1;%归一化
d=(B(1:end,1)==cla)*2-1; %二分类


r=find(d>0);
r1=setdiff(1:length(A(:,1)),r);
Y1=d(r,:);
Y2=d(r1,:);
cc=A(r,:);
dd=A(r1,:);
[u1,delList]=svc(cc,dd,1,1);
save('del_monk1.mat','delList');







