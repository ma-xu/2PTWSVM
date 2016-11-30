nValue <-c(0,	0.5,	1,	1.5,	2,	2.5,	3,	3.5,	4,	4.5, 5);
pTWSVM_blood<-c(0.8476,	0.8396,	0.8422,	0.8422,	0.8396,	0.8422,	0.8369,	0.8342,	0.8289,	0.8262,	0.8209);
TWSVM_blood<-c(0.8182,	0.8102,	0.8075,	0.8102,	0.8075,	0.8102,	0.8262,	0.8235,	0.8182,	0.8155,	0.8075);

plot(nValue,pTWSVM_blood,xlab = "noise factor value",ylab = "accuracy",ylim=c(0.5,1),type='o');
lines(nValue,TWSVM_blood,xlab = "noise factor value",ylab = "accuracy",ylim=c(0.5,1),type='o',lty=2);
title('blood');
legend(0.1,0.5,expression(" pTWSVM" , "TWSVM "  ),lty=1:2,box.lty=0,cex = 0.8,y.intersp=1.5);


