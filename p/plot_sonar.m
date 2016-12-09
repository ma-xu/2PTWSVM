clear;clc;
X = [0.1:0.1:2]';
Y=[
    0.8798
0.899
0.899
0.9087
0.9087
0.9087
0.899
0.8894
0.8702
0.875
0.8798
0.8702
0.8942
0.8894
0.8942
0.8846
0.8942
0.8894
0.8894
0.8894
];


c = polyfit(X, Y,5);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
%plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('sonar');

