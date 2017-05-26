function [err ]= svcerror(w1,w2,bias1,bias2,xtest,ytest)

  p1=abs(xtest*w1+bias1)/norm([w1;bias1]);
  p2=abs(xtest*w2+bias2)/norm([w2;bias2]);
  
   mm = length(ytest);
for i=1:mm
    if p1(i,1)<p2(i,1)
        predictedY(i,1)=1;
    else
          predictedY(i,1)=-1;
    end
end
 
 
    err = sum(predictedY ~= ytest);


