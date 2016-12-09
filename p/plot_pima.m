clear;clc;
X = [0.1:0.1:2]';
Y=[
0.7543
0.7607
0.7329
0.7308
0.7457
0.7628
0.7564
0.7628
0.7628
0.7714
0.7821
0.7885
0.7821
0.7756
0.7756
0.7906
0.7863
0.7799
0.7821
0.7778    
];


c = polyfit(X, Y,6);  %进行拟合，c为2次拟合后的系数
d = polyval(c, X, 1); 
plot(X, d, 'r'); 
hold on ;
plot(X, Y,'*'); 

xlabel('p value');
ylabel('accuracy');
title('pima');

