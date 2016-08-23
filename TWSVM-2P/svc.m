function [ u ] = svc( A,B,p,c1)
    e1 = ones(size(A,1),1);
    e2 = ones(size(B,1),1);
    H = [A e1];
    G = [B e2];
    I = diag(ones(size(H,2),1));
    %初始化u
    u = zeros(size(H,2),1);
    %u_new = -pinv(G)*(ones(size(G,1),1));
    %u_new = ones(size(H,2),1);
    u_new = [0.0061
   -0.2165
   -0.1322
   -0.0042
   -0.0010
    0.1660
   -0.0438
    0.0040
   -0.1474
   -0.0530
   -0.1062
   -0.2358
   -0.1007
   0.6844];
    itear = 0;
    
    
    while norm(u-u_new)>0.001
        
        u = u_new;
        S = 0.5*p*norm(H*u).^(p-2);

        %HH = G*(S*H'*H)^(-1)*G';
        HH = G*inv(S*H'*H)*G';
        HH = (HH+HH')/2;
        AA = diag(e2) ;
        bb = c1*e2;
        alpha = quadprog(HH,-e2,AA,bb);
        %正则化因子
        gamma = 1e-7*speye(size(H,2));
        u_new = -(S*H'*H+gamma)^(-1)*G'*alpha;
        itear = itear+1
    end
    

end

