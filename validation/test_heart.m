load('../data/heart.mat');
label = A(:,1);
X = A(:,2:end);
v =5;
[ Result ] = crossvalidate( label,X,v );
