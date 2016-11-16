clear;
clc;
%{
load('A');
load('B');
plot(A(:,1),A(:,2),'o');
hold on 
plot(B(:,1),B(:,2),'x');
%}

makedata_noise;


%TWSVM
[w1,w2,b1,b2] = TWSVC(A,B,0.1,0.1);
param1 = -w1(1,1)/(w1(2,1));
param2 = -b1/(w1(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y,'--');
ylim([-1 11]);


param1 = -w2(1,1)/(w2(2,1));
param2 = -b2/(w2(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y,'--');
ylim([-1 11]);

clearvars -except A B;



%pTWSVM
[ u,distance ,SS] = svc( A,B,1.8,0.001);
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);

[ u,distance ,SS] = svc( B,A,0.2,0.001);
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);


