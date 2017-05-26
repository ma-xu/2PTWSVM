function [w1,w2,bias1,bias2] = svc(c,d,lamda)

[m,n]=size(c);e=ones(m,1);
[m2,n2]=size(d);e2=ones(m2,1);

H=[d -e2]'*[d -e2];
M=[c -e]'*[c -e];

G=M+lamda*speye(n+1);
L=H+lamda*speye(n2+1);

[A,B]=eig(G,H);%A是向量，B是特征值,第一列向量对应其最小特征值
B=diag(B);
[B,index1]=min(B);
wnew=A(:,index1(1,1));

G=[c -e];
H=[d -e2];

it=0;
% it=1;
delta=1e+50;
    
while(delta>0.001 && it<20)
    wold=wnew;
    sp=sign(wold'*H');
    wt=abs(wold'*G');  
        
    [cn,dn]=(find(wt<1e-20)); 
    if size(cn~=0)
        wt(cn,dn)=1e-15;
    end
    
%     Tp=G'*diag(1./wt)*G;
    Tp=G'*diag(1./(sqrt(wt.^2+1e-10)))*G;
    
    DD=(Tp+lamda*speye(n+1))\(H'*sp');
    
    wnew=(DD)./(sp*H*DD);
     
    obnew=norm(G*wnew,1)+lamda*wnew'*wnew;
%     obnew
    if it>3
        delta=obold-obnew;
    end
    obold=obnew;
    it=it+1;
w1=wnew(1:end-1,1);
bias1=wnew(end,1);
end


[A2,B2]=eig(L,M);
B2=diag(B2);
[B2,index2]=min(B2);
wnew=A2(:,index2(1,1));

% it=1;
it=0;
delta=1e+50;
while(delta>0.001 && it<20)
    wold=wnew;
    sp=sign(wold'*G');
    wt=abs(wold'*H'); 
      
    [cn,dn]=(find(wt<1e-20)); 
    if size(cn~=0)
        wt(cn,dn)=1e-15;
    end
    
%     Tp=H'*diag(1./wt)*H;
    
Tp=H'*diag(1./(sqrt(wt.^2+1e-10)))*H;

    DD=(Tp+lamda*speye(n+1))\G'*sp';
    
    wnew=(DD)/(sp*G*DD);
     
    obnew=norm(H*wnew,1)+lamda*wnew'*wnew;
   
    if it>3
        delta=obold-obnew;
    end
%      obold=obnew;
    it=it+1;
w2=wnew(1:end-1,1);
bias2=wnew(end,1);
end