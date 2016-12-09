clear;clc;
X = [0.1:0.1:2]';
Y=[
0.9386
0.9386
0.9386
0.9474
0.9503
0.9503
0.9503
0.9561
0.9561
0.9591
0.962
0.9678
0.9649
0.9649
0.9649
0.962
0.9649
0.962
0.9591
0.962    
];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
%plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('cancer');

