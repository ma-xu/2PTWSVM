A = [
 0 10;
 1 9;
 2 8;
 3 7;
 4 6;
 6 4;
 7 3;
 8 2;
 9 1;
 10 0;
];



B  = [
 0 0;
 1 1;
 2 2;
 3 3;
 4 4;
 6 6;
 7 7;
 8 8;
 9 9;
 10 10;  
];

%加噪声程度（比例，程度）
rate = 0.2;
degree = 3;
num = fix(length(A)*rate);
randIndex = A(randperm(length(A),num));
noiseA = rand(num,2)-rand(num,2);
A(randIndex,:) = A(randIndex,:)+degree*noiseA;

noiseB = rand(num,2)-rand(num,2);
B(randIndex,:) = B(randIndex,:)+degree*noiseB;


plot(A(:,1),A(:,2),'o');
hold on ;
plot(B(:,1),B(:,2),'x');

