clear;clc;
X = [0.1:0.1:2]';
Y=[0.7567
0.7834
0.7834
0.7861
0.7834
0.7914
0.7888
0.8128
0.8209
0.8503
0.8529
0.8449
0.8476
0.8476
0.8476
0.8476
0.8476
0.8476
0.8476
0.8476];


c = polyfit(X, Y,4);  %������ϣ�cΪ2����Ϻ��ϵ��
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
%plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('blood');
