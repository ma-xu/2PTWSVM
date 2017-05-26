function [ accList ] = helpAcc( dataName,B )
    fprintf(1,'%s%s%s','=============',dataName,'=============');
    cla=1;
    A=B(1:end,2:end);
    Max=max(max(A));
    Min=min(min(A));
    A=2*(A-Min)./(Max-Min)-1;%归一化
    d=(B(1:end,1)==cla)*2-1; %二分类
    r=randperm(size(d,1));
    d=d(r,:);
    A=A(r,:); 
    k=5;
    a=50;
    output=1;
    [sm sn]=size(A);
    accuIter = 0;
    cpu_time = 0;
    indx = [0:k];
    indx = floor(sm*indx/k);    %last row numbers for all 'segments'
    % split trainining set from test set
    trainCorr=0;
    testCorr=0;
    %打乱随机排序
    accList=[];


    tip='p=0.1'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus1(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;
        p=0.1;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];




    tip='p=0.3'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus3(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;
        p=0.3;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];




    tip='p=0.5'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus5(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;
        p=0.5;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);  
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];





    tip='p=0.7'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus7(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=0.7;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];




    tip='p=0.9'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus9(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=0.9;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];





    tip='p=1.1'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus11(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=1.1;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];




    tip='p=1.3'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus13(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=1.3;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];





    tip='p=1.5'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus15(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=1.5;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];






    tip='p=1.7'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus17(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=1.7;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];





    tip='p=1.9'
    for i = 1:k
        Ctest = []; dtest = [];Ctrain = []; dtrain = [];

        Ctest  = A((indx(i)+1:indx(i+1)),:);
        dtest  = d(indx(i)+1:indx(i+1));
        Ctrain = A(1:indx(i),:);
        Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
        dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
        r=find(dtrain>0);
        r1=setdiff(1:length(Ctrain(:,1)),r);
        Y1=dtrain(r,:);
        Y2=dtrain(r1,:);
        cc=Ctrain(r,:);
        dd=Ctrain(r1,:);
%         Result=hibiscus19(dtrain,Ctrain,k);
%         C=Result.Best_C1;
%         p=Result.Best_p;
        C=1;p=1.9;
        tic
        [u1]=svc(cc,dd,p,C);
        [u2]=svc(dd,cc,p,C);
        [w1]=u1(1:end-1,1);
        [bias1]=u1(end,1);
        [w2]=u2(1:end-1,1);
        [bias2]=u2(end,1);
        thistoc(i,1)=toc;
        [err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
        tmpTestCorr(i,1)=1-err/length(Ctest(:,1));
        [err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
        tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));
    end % end of for (looping through test sets)
    trainCorr = sum(tmpTrainCorr*100)/k;
    testCorr = sum(tmpTestCorr*100)/k;
    cpu_time=sum(thistoc)/k;
    if output == 1
        fprintf(1,'==============================================');
        fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
    end
    testcorrstd=std(100*tmpTestCorr,1)
    accList=[accList;testCorr/100;];
    accList



end

