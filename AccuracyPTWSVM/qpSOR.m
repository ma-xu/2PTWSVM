function bestalpha=qpSOR(Q,t,C,smallvalue)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Q是输入矩阵；
%    t是（0，2）的参数；
%    C是上界；
%    smallvalue是终止条件；
%    bestalpha是输出
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初始化参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(Q);
alpha0=zeros(m,1);
% i=0;
L=tril(Q);
E=diag(Q);
twinalpha=alpha0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%判断
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:n
%     i=i+1;
    twinalpha(j,1)=alpha0(j,1)-(t/E(j,1))*(Q(j,:)*twinalpha(:,1)-1+L(j,:)*(twinalpha(:,1)-alpha0));
    if twinalpha(j,1)<0
        twinalpha(j,1)=0;
    elseif twinalpha(j,1)>C
        twinalpha(j,1)=C;
%         twinalpha(j,1)=C(j,1);
    else
        ;
    end
%     twinalpha(j,1)=tmp_alpha;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%循环
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=[alpha0,twinalpha];
ite=0;
while norm(alpha(:,2)-alpha(:,1))>smallvalue && ite<100
    ite=ite+1;
    for j=1:n
        twinalpha(j,1)=alpha(j,2)-(t/E(j,1))*(Q(j,:)*twinalpha(:,1)-1+L(j,:)*(twinalpha(:,1)-alpha(:,2)));
        if twinalpha(j,1)<0
            twinalpha(j,1)=0;
        elseif twinalpha(j,1)>C
            twinalpha(j,1)=C;
%               twinalpha(j,1)=C(j,1);
        else
            ;
        end
%         twinalpha(j,1)=tmp_alpha;
    end
    alpha(:,1)=[];
    alpha=[alpha,twinalpha];
%     twinalpha=alpha(:,2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%输出
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bestalpha=alpha(:,2);


