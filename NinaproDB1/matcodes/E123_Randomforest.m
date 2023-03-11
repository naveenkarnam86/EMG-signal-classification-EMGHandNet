clc;clear all;
close all;
load('EMG_feat_52class.mat');
scores_RF=[];val_vec=[];Test_vec =[];F1_vec = [];
kappa_vec=[];scores=[];
M=1 ;
for i=1:1:M
[BaggedEnsemble,val_accuracy] = fn_generic_random_forests(X_Train,Y_Train,300,'classification');
val_vec=[val_vec val_accuracy];
disp(i);
scores_RF = predict(BaggedEnsemble,X_Test);
scores_RF2 = str2double(scores_RF);
conf1 = confusionmat(Y_Test,scores_RF2);
test_acc1 = (sum(diag(conf1)))/(sum(sum(conf1)))*100;
Test_vec=[Test_vec test_acc1];
kappa_acc = fn_Kappa(scores_RF2,Y_Test,52);
kappa_vec=[kappa_vec kappa_acc];
F1_measure=MyClassifyPerf(scores_RF2,Y_Test);
F1_measure1=F1_measure.F1;
F1_vec=[F1_vec F1_measure1];
end

MN_test=mean(Test_vec);
MN_F1=mean(F1_vec);
MN_kappa=mean(kappa_vec);
MN_val=mean(val_vec);
STD_test=std(Test_vec); 
STD_F1=std(F1_vec); 
STD_kappa=std(kappa_vec);
STD_val=std(val_vec);
dlmwrite('scores_RF.dat', scores_RF2);
