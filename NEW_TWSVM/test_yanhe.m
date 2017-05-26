%clear al4
% addpath 'C:\Program Files (x86)\Mosek\5\toolbox\r2006a'
% load pidd;
% B=[train;test];
load /Users/melody/Desktop/2PTWSVM/data/heart.mat

B=A;
% load pidd;
% B=[train;test];
% load ticdata.mat; 
% B=[d,A];
% load data44;
% B=train;
% load NDC-4k;
% B=[outtrain;outtest];
% A=B(1:end,end);
% C=B(1:end,1:end-1);
% B=[A,C];

cla=1;
A=B(1:end,2:end);
Max=max(max(A));
Min=min(min(A));
A=2*(A-Min)./(Max-Min)-1;%归一化
d=(B(1:end,1)==cla)*2-1;

ker='linear'
%ker ='rbf'
k=5;output=1;
%迭代次数
iteration1=0;
iteration2=0;
iteration=0;
a=50;%input('the state=');
%多次运行,生成相同的随机数方法
rand('state',a);
r=randperm(size(d,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dd=d(r,:);
AA=A(r,:); 
dtrain=dd(1:fix(size(r,2)),:);
Ctrain=AA(1:fix(size(r,2)),:);
Result=hibiscus(dtrain,Ctrain,k);
 C1=Result.Best_C1;
 C2=Result.Best_C2;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[sm sn]=size(A);
cpu_time = 0;
indx = [0:k];
indx = floor(sm*indx/k);    %last row numbers for all 'segments'
% split trainining set from test set

trainCorr=0;
testCorr=0;

a=20;%input('the state=');
rand('state',a);
r=randperm(size(d,1));
d=d(r,:);
A=A(r,:); 
 for i = 1:k
Ctest = []; dtest = [];Ctrain = []; dtrain = [];

Ctest = A((indx(i)+1:indx(i+1)),:);
dtest = d(indx(i)+1:indx(i+1));
Ctrain = A(1:indx(i),:);
Ctrain = [Ctrain;A(indx(i+1)+1:sm,:)];
dtrain = [d(1:indx(i));d(indx(i+1)+1:sm,:)];
%验证加入D值后的分辨率
%加入噪声后对比
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rand('state',a);
r=randperm(size(Ctrain,1));
dtrain=dtrain(r,:);
% r2=randperm(size(Ctrain,1));
Ctrain=Ctrain(r,:);

classNumber=2;
outratio=0.2;
nf=0.1;
for jjk=1:classNumber %%%%%%partion points of each class into k parts.
Inde=(find(dtrain==jjk));
randn('state',jjk*1000);
% randn('state',a);
outn=fix(size(Inde,1)*outratio);
Mm=sqrt(1)*randn(outn,size(Ctrain,2));
% Ctrain(Inde(1:outn,:),:)=Ctrain(Inde(1:outn,:),:)+nf*(norm(Ctrain(Inde(1:outn,:),:),'fro')/norm(Mm,'fro'))*Mm;
Ctrain(Inde(1:outn,:),:)=Ctrain(Inde(1:outn,:),:)+nf*(norm(Ctrain(Inde(1:outn,:),:),'fro')/(norm(Mm,'fro')+eps))*Mm;
% if jjk==1
% tempdata=Ctrain(Inde(1:outn,:),:);
% end
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=find(dtrain>0);
r1=setdiff(1:length(Ctrain(:,1)),r);
Y1=dtrain(r,:);
Y2=dtrain(r1,:);
cc=Ctrain(r,:);
dd=Ctrain(r1,:);
% NDC dataset 参数C1=1,C2=1
% C1=1;
% C2=1;
% Result=hibiscus(dtrain,Ctrain,k);
% C1=Result.Best_C1;
% C2=Result.Best_C2;
 
tic
[w1,w2,bias1,bias2,number1,number2]=svc(cc,dd,C1,C2);
thistoc(i,1)=toc;
iteration1=iteration1+number1;
iteration2=iteration2+number2;

[err ]= svcerror(w1,w2,bias1,bias2,Ctest,dtest);
tmpTestCorr(i,1)=1-err/length(Ctest(:,1));

[err ]= svcerror(w1,w2,bias1,bias2,Ctrain,dtrain);
tmpTrainCorr(i,1)=1-err/length(Ctrain(:,1));

 if output==1
fprintf(1,'________________________________________________\n');
fprintf(1,'Fold %d\n',i);
fprintf(1,'Training set correctness: %3.2f%%\n',tmpTrainCorr(i,1)*100);
fprintf(1,'Testing set correctness: %3.2f%%\n',tmpTestCorr(i,1)*100);
fprintf(1,'Elapse time: %10.4f\n',thistoc(i,1));
 end

end % end of for (looping through test sets)

     trainCorr = sum(tmpTrainCorr*100)/k;
     testCorr = sum(tmpTestCorr*100)/k;
     cpu_time=sum(thistoc)/k;
     iteration=(iteration1+iteration2)/(2*k);

if output == 1
fprintf(1,'==============================================');
fprintf(1,'\nTraining set correctness: %3.2f%%',trainCorr);
fprintf(1,'\nTesting set correctness: %3.2f%%',testCorr);
fprintf(1,'\nAverage cpu_time: %10.4f\n',cpu_time);
fprintf(1,'\nAverage iteration number: %.0f\n',iteration);
end

testcorrstd=std(100*tmpTestCorr,1)
clear;
