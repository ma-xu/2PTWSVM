clear;clc;
X = [0.1:0.1:2]';
Y=[0.8519
0.8444
0.8444
0.8593
0.8593
0.8741
0.8815
0.8741
0.8815
0.8741
0.8741
0.8741
0.8741
0.8667
0.8667
0.8667
0.8593
0.8593
0.8593
0.8593];


c = polyfit(X, Y,5);  %������ϣ�cΪ2����Ϻ��ϵ��
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('heart');
