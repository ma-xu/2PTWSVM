clear;
clc;
pGraid=[0.1:0.2:1.9]';
% heart=[0.8148;0.8296;0.8148;0.8333;0.8222;0.8333;
%   0.8259;0.8333;0.8296;0.8222;];

% sonar=[0.7167;0.7167;0.7312;0.7170;0.7215;0.7023;
%     0.7117;0.6928;0.7117;0.7117];

% spect=[0.7941;0.7941;0.7941;0.7941;0.7904;
%     0.7941;0.7941;0.7904;0.7717;0.7904;];

% wpbc=[0.7628;0.7628;0.7730;0.7804;0.7733;
%     0.7885;0.7733;0.7938;0.7885;0.7988;];


% bupa=[0.5826;0.5797;0.6087;0.6493;0.6174;
%       0.6754;0.6870;0.6609;0.6261;0.6783;];




% ionodata=[0.9003;0.8946;0.8832;0.8975;0.8918;
%           0.8889;0.8973;0.8946;0.8946;0.8975];

%load('acc_australian.mat');
%load('acc_blood.mat')
load('acc_bupadata.mat')
 %load('acc_checkdata.mat')
%load('acc_haberman.mat')
 %load('acc_heart.mat')
%load('acc_ionodata.mat')
%load('acc_monk1.mat')
%load('acc_monk2.mat')
%load('acc_monk3.mat')
%load('acc_pimadata.mat')
%load('acc_sonar.mat')
%load('acc_spect.mat')
%load('acc_wpbc.mat')
plot(pGraid,acc_bupadata,'*-');
axis([0 2 0.45 0.80]); % 设置坐标轴在指定的区间
xlabel('p value');
ylabel('accuracy');
title('bupadata');






