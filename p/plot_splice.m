clear;clc;
X = [0.1:0.1:2]';
Y=[
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598
0.598    
];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
%plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('splice');

