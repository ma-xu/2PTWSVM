clear;clc;
X = [0.1:0.1:2]';
Y=[0.7526
0.7578
0.7682
0.7474
0.7734
0.7604
0.7812
0.8021
0.7839
0.7917
0.7969
0.7995
0.8021
0.8021
0.7995
0.7995
0.7995
0.8021
0.8047
0.7969];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r');
hold on ;
%plot(X, Y,'*'); 


xlabel('p value');
ylabel('accuracy');
title('diabetes');

