nValue <-c(0,	0.5,	1,	1.5,	2,	2.5,	3,	3.5,	4,	4.5, 5);
pTWSVM_australian<-c(0.8633,	0.7306,	0.7102,	0.6531,	0.6347,	0.6367,	0.6347,	0.6327,	0.6327,	0.6327,	0.6327);
TWSVM_australian<-c(0.8041,	0.7184,	0.5673,	0.5327,	0.5265,	0.5755,	0.6082,	0.6041,	0.6,	0.6061,	0.6061);

plot(nValue,pTWSVM_australian,xlab = "noise factor value",ylab = "accuracy",ylim=c(0.5,1),type='o');
lines(nValue,TWSVM_australian,xlab = "noise factor value",ylab = "accuracy",ylim=c(0.5,1),type='o',lty=2);
title('australian');
legend(0.1,0.5,expression(" pTWSVM" , "TWSVM "  ),lty=1:2,box.lty=0,cex = 0.8,y.intersp=1.5);


