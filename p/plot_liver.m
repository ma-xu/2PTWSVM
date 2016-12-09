clear;clc;
X = [0.1:0.1:2]';
Y=[
0.4573
0.4634
0.4634
0.4634
0.4634
0.4634
0.4634
0.4573
0.4634
0.4634
0.4756
0.4756
0.6098
0.689
0.5488
0.5427
0.561
0.6707
0.6463
0.6098    
];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('liver');

