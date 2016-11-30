nValue <-c(0,	0.5,	1,	1.5,	2,	2.5,	3,	3.5,	4,	4.5, 5);
pTWSVM_heart<-c(0.8741,	0.8815,	0.837,	0.8074,	0.7926,	0.7481,	0.7185,	0.6963,	0.6889,	0.6889,	0.6889);
TWSVM_heart<-c(0.8296,	0.8,	0.7111,	0.7778,	0.6889,	0.6148,	0.5852,	0.5704,	0.5704,	0.5704,	0.5778);

plot(nValue,pTWSVM_heart,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o');
lines(nValue,TWSVM_heart,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o',lty=2);
title('heart');
legend(0.1,0.5,expression(" pTWSVM" , "TWSVM "  ),lty=1:2,box.lty=0,cex = 0.8,y.intersp=1.5);



