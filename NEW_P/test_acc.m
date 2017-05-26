
load /Users/melody/Documents/svm/twotypesData/wisconson/bupadata.mat;
B=[d A];
[ acc_bupadata ] = helpAcc( 'bupadata',B );
acc_bupadata
save('acc_bupadata.mat','acc_bupadata');
clear;

load /Users/melody/Desktop/2PTWSVM/data/heart.mat;
B=A;
[ acc_heart ] = helpAcc( 'heart',B );
acc_heart
save('acc_heart.mat','acc_heart');
clear;



load /Users/melody/Desktop/2PTWSVM/data/ionodata.mat;
B=[d A];
[ acc_ionodata ] = helpAcc( 'ionodata',B );
acc_ionodata
save('acc_ionodata.mat','acc_ionodata');
clear;


load /Users/melody/Desktop/2PTWSVM/data/sonar.mat;
B=A;
[ acc_sonar ] = helpAcc( 'sonar',B );
acc_sonar
save('acc_sonar.mat','acc_sonar');
clear;

load /Users/melody/Desktop/2PTWSVM/data/spect.mat;    
B=[test; train];
[ acc_spect ] = helpAcc( 'spect',B );
acc_spect
save('acc_spect.mat','acc_spect');
clear;


load /Users/melody/Documents/svm/twotypesData/UCITWO/wpbc.mat;
B=[test;train];
[ acc_wpbc ] = helpAcc( 'wpbc',B );
acc_wpbc
save('acc_wpbc.mat','acc_wpbc');
clear;


load /Users/melody/Desktop/2PTWSVM/data/monk1.mat;
B=[test;train];
[ acc_monk1 ] = helpAcc( 'monk1',B );
acc_monk1
save('acc_monk1.mat','acc_monk1');
clear;

load /Users/melody/Documents/svm/twotypesData/UCITWO/monk2.mat;
B=[test;train];
[ acc_monk2 ] = helpAcc( 'monk2',B );
acc_monk2
save('acc_monk2.mat','acc_monk2');
clear;


load /Users/melody/Documents/svm/twotypesData/UCITWO/monk3.mat;
B=[test;train];
[ acc_monk3 ] = helpAcc( 'monk3',B );
acc_monk3
save('acc_monk3.mat','acc_monk3');
clear;



load /Users/melody/Desktop/2PTWSVM/data/haberman.mat;
B=[haberman];
[ acc_haberman ] = helpAcc( 'haberman',B );
acc_haberman
save('acc_haberman.mat','acc_haberman');
clear;



load /Users/melody/Documents/svm/twotypesData/wisconson/checkdata.mat;
B=[d A];
[ acc_checkdata ] = helpAcc( 'checkdata',B );
acc_checkdata
save('acc_checkdata.mat','acc_checkdata');
clear;


load /Users/melody/Desktop/2PTWSVM/data/pimadata.mat;
B=[d A];
[ acc_pimadata ] = helpAcc( 'pimadata',B );
acc_pimadata
save('acc_pimadata.mat','acc_pimadata');
clear;



load /Users/melody/Desktop/2PTWSVM/data/australian.mat;
B=A;
[ acc_australian ] = helpAcc( 'australian',B );
acc_australian
save('acc_australian.mat','acc_australian');
clear;


load /Users/melody/Desktop/2PTWSVM/data/blood.mat;
B=[blood];
[ acc_blood ] = helpAcc( 'blood',B );
acc_blood
save('acc_blood.mat','acc_blood');
clear;
