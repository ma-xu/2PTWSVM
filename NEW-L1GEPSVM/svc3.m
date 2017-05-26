function [w1,w2,bias1,bias2] = svc(c,d,v)
[m,n]=size(c);e=ones(m,1);
[m2,n2]=size(d);e2=ones(m2,1);
% H=[d -e2]'*[d -e2];
% G=[c -e]'*[c -e];
H=[d e2];
G=[c e];

% G=M+v*speye(n+1);%
% L=H+v*speye(n2+1);
% G=M;
% L=H;
% z1=rand(n+1,1)

z1=c(1:n+1,1);
P=1./(z1'*G');%
P=diag(P);
P=G'*P*G;
s=sign(z1'*H');
z2=(P+v*speye(n+1))\(H'*s')/(s*H*((P+v*speye(n+1))\(H'*s')));
i=1;
while sum(abs(z2-z1))>0.01
z1=z2;    
P=1./(z1'*G');%
P=diag(P);
P=G'*P*G;
s=sign(z1'*H');
z2=(P+v*speye(n+1))\(H'*s')/(s*H*((P+v*speye(n+1))\(H'*s'))); 
i=i+1;

end
w1=z1(1:end-1,1);
bias1=z1(end,1);
i

% z11=rand(n2+1,1);
z11=d(1:n2+1,1);
P1=1./(z11'*H');%

P1=diag(P1);
P1=H'*P1*H;
s1=sign(z11'*G');

z22=(P1+v*speye(n2+1))\(G'*s1')/(s1*G*((P1+v*speye(n2+1))\(G'*s1')));
j=1;
while sum(abs(z22-z11))>0.01
z11=z22;
P1=1./(z11'*H');%

P1=diag(P1);
P1=H'*P1*H;
s1=sign(z11'*G');
z22=(P1+v*speye(n2+1))\(G'*s1')/(s1*G*((P1+v*speye(n2+1))\(G'*s1')));

j=j+1;

end
w2=z11(1:end-1,1);
bias2=z11(end,1);
j


