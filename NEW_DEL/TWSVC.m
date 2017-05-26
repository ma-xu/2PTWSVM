function [w1,w2,b1,b2] = svc(c,d,C1,C2)

echo off

[m,n]=size(c);e1=ones(m,1);
[m2,n2]=size(d);e2=ones(m2,1);
H=[c e1];
G=[d e2];
dd=H'*H+1e-7*eye(n+1);
H1=G*(dd\G');
H1=(H1+H1')/2;
H1=H1+(1e-7)*speye(size(H1,2));
    c1 = -ones(m2,1);  
    vlb = sparse(m2,1);      % Set the bounds: alphas >= 0
    vub = C1*ones(m2,1);     %                 alphas <= C
   
 a=sparse(1,m2);
  
    [res]=mskqpopt(H1,c1,a,[],[],vlb,vub,[],'minimize echo(0)');
    %[res]=mskqpopt(H1,c1,a,[],[],vlb,vub,[],'echo(0)');
 alpha=res.sol.itr.xx;
 %alpha=qpSOR(H1,0.7,C1,0.05);
    u=-(dd\G')*alpha;
   w1=u(1:n,1);
   b1=u(n+1,1);
    

  dd2=G'*G+1e-7*eye(n+1);
  H2=H*(dd2\H'); 
  H2=(H2+H2')/2;
  H2=H2+(1e-7)*speye(size(H2,2));
  
     c2 = -ones(m,1);  
    vlb2 = zeros(m,1);      % Set the bounds: alphas >= 0
    vub2 = C2*ones(m,1);     %                 alphas <= C
                            % The starting point is [0 0 0   0]
    
 a=sparse(1,m);
     [res]=mskqpopt(H2,c2,a,[],[],vlb2,vub2,[],'minimize echo(0)'); 
     %[res]=mskqpopt(H2,c2,a,[],[],vlb2,vub2,[],'echo(0)'); 
     alpha2=res.sol.itr.xx;
%alpha2=qpSOR(H2,0.7,C2,0.05);
   v=(dd2\H')*alpha2;
   w2=v(1:n,1);
   b2=v(n+1,1);

