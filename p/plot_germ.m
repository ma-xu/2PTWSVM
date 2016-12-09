clear;clc;
X = [0.1:0.1:2]';
Y=[0.674
0.678
0.676
0.676
0.674
0.674
0.672
0.67
0.67
0.682
0.7
0.746
0.758
0.744
0.738
0.724
0.72
0.72
0.696
0.694];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r');
hold on ;
plot(X, Y,'*'); 


xlabel('p value');
ylabel('accuracy');
title('germ');

