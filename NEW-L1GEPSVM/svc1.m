function [w1,w2,bias1,bias2] = svc(c,d,v)
[m,n]=size(c);e=ones(m,1);
[m2,n2]=size(d);e2=ones(m2,1);
H=[d -e2]'*[d -e2];
G=[c -e]'*[c -e];

% G=M+v*speye(n+1);%
% L=H+v*speye(n2+1);
% G=M;
% L=H;

z1=c(1:n+1,1);%设置z1的初始值（这样取值是否有问题？？）

P=1./(z1'*G);%
P=diag(P);
P=G'*P*G;
s=sign(z1'*H');%
z2=(P+v*speye(n+1))\(H'*s')/(s*H*((P+v*speye(n+1))\(H'*s')));%计算z2的值
i=1;%记录z1，z2比较的次数
while sum(abs(z2-z1))>0.01%比较z2与z1的差值，如果差值小于0.01，则收敛。（这里z2，z1是矩阵，用差的绝对值的和与0.01做比较，是否正确？？）
%如果z2与z1的差值>0.01，则迭代循环，知道z收敛结束
z1=z2;
    
P=1./(z1'*G);%
P=diag(P);
P=G'*P*G;
s=sign(z1'*H');

z2=(P+v*speye(n+1))\(H'*s')/(s*H*((P+v*speye(n+1))\(H'*s'))); 
i=i+1;

end
%求w1，bias1（权值，偏差）
w1=z1(1:end-1,1);
bias1=z1(end,1);
fprintf(1,'i= %d\n',i);


% 以下求w2，bias2的值，和上面雷同
z11=d(1:n2+1,1);

P1=1./(z11'*H);%
P1=diag(P1);
P1=H'*P1*H;
s1=sign(z11'*G');
z22=(P1+v*speye(n2+1))\(G'*s1')/(s1*G*((P1+v*speye(n2+1))\(G'*s1')));
j=1;
while sum(abs(z22-z11))>0.01
 
z11=z22;
    
P1=1./(z11'*H);%
P1=diag(P1);
P1=H'*P1*H;
s1=sign(z11'*G');

z22=(P1+v*speye(n2+1))\(G'*s1')/(s1*G*((P1+v*speye(n2+1))\(G'*s1')));

j=j+1;

end
w2=z11(1:end-1,1);
bias2=z11(end,1);
fprintf(1,'j= %d\n',j);


