nValue <-c(0,	0.5,	1,	1.5,	2,	2.5,	3,	3.5,	4,	4.5, 5);
pTWSVM_monk1<-c(0.75,	0.6273,	0.6319,	0.5463,	0.5324,	0.5069,	0.5093,	0.5023,	0.5069,	0.5046,	0.5069);
TWSVM_monk1<-c(0.6667,	0.6412,	0.5694,	0.5463,	0.5301,	0.5231,	0.5023,	0.5139,	0.5046,	0.4954,	0.4931);

plot(nValue,pTWSVM_monk1,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o');
lines(nValue,TWSVM_monk1,xlab = "noise factor value",ylab = "accuracy",ylim=c(0,1),type='o',lty=2);
title('monk1');
legend(0.1,0.5,expression(" pTWSVM" , "TWSVM "  ),lty=1:2,box.lty=0,cex = 0.8,y.intersp=1.5);



