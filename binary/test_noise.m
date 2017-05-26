clear;
clc;

makedata;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=50;
rand('state',a);


uniqued = unique(d);
outratio=0.2;
nf=0.1;
for jjk=1:size(uniqued,1) %%%%%%partion points of each class into k parts.
    Inde=(find(d==uniqued(jjk,1)));
    randn('state',jjk*1000);
    % randn('state',a);
    outn=fix(size(Inde,1)*outratio);
    Mm= sqrt(1)*randn(outn,size(C,2));
    % Ctrain(Inde(1:outn,:),:)=Ctrain(Inde(1:outn,:),:)+nf*(norm(Ctrain(Inde(1:outn,:),:),'fro')/norm(Mm,'fro'))*Mm;
    C(Inde(1:outn,:),:)=C(Inde(1:outn,:),:)+nf*(norm(C(Inde(1:outn,:),:),'fro')/(norm(Mm,'fro')+eps))*Mm;
    % if jjk==1
    % tempdata=Ctrain(Inde(1:outn,:),:);
    % end
end
r=randperm(size(C,1));
d=d(r,:);
% r2=randperm(size(Ctrain,1));
c=C(r,:);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=find(d>0);
r1=setdiff(1:length(C(:,1)),r);
Y1=d(r,:);
Y2=d(r1,:);
A=C(r,:);
B=C(r1,:);



%makedata_noise;

%{
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
%}


%pTWSVM
[ u] = svc( A,B,0.1,1000    );
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);

[ u] = svc( B,A,1.5,0.1);
param1 = -u(1,1)/(u(2,1));
param2 = -u(3,1)/(u(2,1));
x=linspace(0,10,20);
y = param1*x+param2;
plot(x,y);
ylim([-1 11]);


