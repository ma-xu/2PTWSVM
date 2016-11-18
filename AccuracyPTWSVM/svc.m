function [u,distance,SS] = svc( A,B,p,c1)
    
    e1 = ones(size(A,1),1);
    e2 = ones(size(B,1),1);
    H = [A e1];
    G = [B e2];
    I = diag(ones(size(H,2),1));
    %初始化u
    u = zeros(size(H,2),1);
    %u_new = -pinv(G)*(ones(size(G,1),1));
    %u_new = ones(size(H,2),1);
    [w1,w2,b1,b2] = TWSVC(A,B,c1,c1);
    u_new = [w1;b1];
    itear = 0;
    distance =[];
    SS=[];
    
    while norm(u-u_new)>0.001 && itear<=100
        distance = [distance;norm(u-u_new)];
        norm(u-u_new)
        u = u_new;  
        S = norm(H*u).^(p-2);
        SS=[SS;S];
        %S = 0.5*(p-2)*norm(H*u).^(p-2);

        %HH = G*(S*H'*H)^(-1)*G';
        %正则化因子
        gamma = 1e-7*speye(size(H,2));
        %%HH = 0.5*G*inv(S*H'*H+gamma)*G';
        %HH = (1/S)*G*inv(H'*H+gamma)*G';
        HH = (1/S)*G*((H'*H+gamma)\G');
        HH = (HH+HH')/2;
        AA = diag(e2) ;
        bb = c1*e2;
        %alpha = quadprog(HH,-0.5*e2,AA,bb);
        %alpha = quadprog(HH,-0.5*e2,[],[]);
        alpha = qpSOR(HH,0.7,c1,0.05);
       
        %u_new = -inv(S*H'*H+gamma)*G'*alpha;
        u_new = -(1/S)*((H'*H+gamma)\G')*alpha;
        itear = itear+1
    end
    

end

