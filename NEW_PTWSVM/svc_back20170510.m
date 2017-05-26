function [unew] = svc( A,B,p,c1)
    
    e1 = ones(size(A,1),1);
    e2 = ones(size(B,1),1);
    H = [A e1];
    G = [B e2];
  
    [w1,w2,b1,b2] = TWSVC(A,B,c1,c1);
    unew = [w1;b1];
    delta = inf;
    itear = 1;
    
    
    while delta>0.001 && itear<=18

        S = norm(H*unew).^(p-2); 
        %正则化因子
        gamma = 1e-7*speye(size(H,2));
        HH = (1/S)*G*((H'*H+gamma)\G');
        HH = (HH+HH')/2;
        alpha = qpSOR(HH,0.7,c1,0.05);
       
        %u_new = -inv(S*H'*H+gamma)*G'*alpha;
        unew = -(1/S)*((H'*H+gamma)\G')*alpha;
        %compute objective value
        q=max(G*unew+e2,0);
        OBJVAL(1,itear) = 0.5*norm(H*unew).^p+c1*e2'*q;
        if itear >1
            delta = abs(OBJVAL(1,itear)-OBJVAL(1,itear-1));
        end
        itear = itear+1;
    end
    

end

