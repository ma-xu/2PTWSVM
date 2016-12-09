%% pima
load('../data/pimadata.mat');
v =5;
[ Result_pima ] = crossvalidate( d,A,v );
save('Result_pima.mat','Result_pima');

%% spect
clear;
clc;
load('../data/spect.mat');
A = [train;test];
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_spect ] = crossvalidate( d,X,v );
save('Result_spect.mat','Result_spect');

%% germ
clear;clc;
load('../data/germ.mat');
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_germ ] = crossvalidate( d,X,v );
save('Result_germ.mat','Result_germ');




%% monk1
clear;clc;
load('../data/monk1.mat');
A = [train;test];
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_monk1 ] = crossvalidate( d,X,v );
save('Result_monk1.mat','Result_monk1');


%% cancer
clear;clc;
load('../data/cancer.mat');
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_cancer ] = crossvalidate( d,X,v );
save('Result_cancer.mat','Result_cancer');

%% ionodata
clear;clc;
load('../data/ionodata.mat');
v =5;
[ Result_ionodata ] = crossvalidate( d,A,v );
save('Result_ionodata.mat','Result_ionodata');

%% splice
clear;clc;
load('../data/splice_data.mat');
v =5;
[ Result_splice ] = crossvalidate( label',data',v );
save('Result_splice.mat','Result_splice');


%% CMC
clear;clc;
load('../data/cmc.mat');
A = cmc(1:642,:);
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_CMC ] = crossvalidate( d,X,v );
save('Result_CMC.mat','Result_CMC');


%% haberman
clear;clc;
load('../data/haberman.mat');
A = haberman;
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_haberman ] = crossvalidate( d,X,v );
save('Result_haberman.mat','Result_haberman');


%% liver
clear;clc;
load('../data/liver.mat');
A = liver;
X = A(:,2:end);
d = A(:,1);
v =5;
[ Result_liver ] = crossvalidate( d,X,v );
save('Result_liver.mat','Result_liver');



