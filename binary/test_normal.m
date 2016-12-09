clear;
clc;
makedata;


%TWSVM
[w1,w2,b1,b2] = TWSVC(A,B,0.1,0.1);
param1 = -w1(1,1)/(w1(2,1));
param2 = -b1/(w1(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);


param1 = -w2(1,1)/(w2(2,1));
param2 = -b2/(w2(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);

clearvars -except A B;


%pTWSVM
[ u ] = svc( A,B,1,1);
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);

[ u ] = svc( B,A,1,1);
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);


