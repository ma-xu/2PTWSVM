clear;
clc;
iter=[1:1:50]';
load('del_spect.mat')

plot(iter,delList,'*-');
axis([0 50 0.0 0.2]); % 设置坐标轴在指定的区间
xlabel('number of iterations');
ylabel('Accuracy difference value');
title('spect');






