nValue <-c(0,	0.5,	1,	1.5,	2,	2.5,	3,	3.5,	4,	4.5, 5);

pTWSVM_pima<-c(0.7906,	0.7521,	0.7436,	0.7543,	0.7479,	0.7415,	0.7372,	0.7265,	0.7201,	0.7137,	0.7179);
TWSVM_pima<-c(0.7037,	0.6795,	0.6667,	0.6795,	0.6816,	0.6709,	0.6731,	0.6667,	0.6603,	0.6603,	0.656);

plot(nValue,pTWSVM_pima,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o');
lines(nValue,TWSVM_pima,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o',lty=2);
title('pima');
legend(0.1,0.5,expression(" pTWSVM" , "TWSVM "  ),lty=1:2,box.lty=0,cex = 0.8,y.intersp=1.5);


