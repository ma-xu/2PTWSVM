clear;clc;
X = [0.1:0.1:2]';
Y=[0.8571
    0.8531
    0.8490
    0.8388
    0.8367
    0.8408
    0.8490
    0.8510
    0.8408
    0.8612
    0.8633
    0.8633
    0.8653
    0.8592
    0.8612
    0.8653
    0.8653
    0.8551
    0.8551
    0.8510];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('australian');

