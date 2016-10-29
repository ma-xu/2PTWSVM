function [ accuracy ] = accuracy( w1,w2,X ,label)
%ACCURACY Summary of this function goes here
%   Detailed explanation goes here
    e = ones(size(X,1),1);
    X = [X e];
    Y1 = abs(X*w1);
    Y2 = abs(X*w2);
    predict = double(Y1/norm(w1)<Y2/norm(w2));
    errNum = sum(predict~=label);
    accuracy = 1-errNum/length(label(:,1));
end

