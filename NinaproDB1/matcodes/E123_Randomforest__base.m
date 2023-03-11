clc;
clear all;
close all;
train_data = []; test_data = [];
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/train_feat_AR_seg/';
fullMatFileName = fullfile(destdirectory,  'ninaDB1_sEMG_train_feat_AR_data.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  train_data = tempdata.train_feat_action_rest;
%   valid_data = tempdata.valid_raw_data;
end

X_Train =  train_data(:, 1:end-1);
Y_Train =  train_data(:, end);
key = find(Y_Train==0);
Y_Train(key,:)=2;


destdirectory1 = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/test_feat_AR_seg/';
fullMatFileName = fullfile(destdirectory1,  'ninaDB1_sEMG_test_feat_AR_data.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  test_data = tempdata.test_feat_action_rest;
%   valid_data = tempdata.valid_raw_data;
end

X_Test = test_data(:,1:end-1);
Y_Test = test_data(:,end);
key1 = find(Y_Test==0);
Y_Test(key1,:)=2;

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
% dlmwrite('scores_RF.dat', scores_RF2);
%% majority vote coding %%%%%%
[M1,N1] = size(Y_Test);
win = 5;
Y_Test_majority = []; Y_pred_majority = [];
vote_score = [];
for i1=1:1:M1-win
 L1 = Y_Test(i1:i1+win,:);  
 vote_score = majorityvote(Y_Test(i1:i1+win,:));   
 Y_Test_majority = [Y_Test_majority vote_score];
 vote_score = [];
end
Y_Test_majority = Y_Test_majority(:);
for i2=1:1:M1-win
 vote_score = majorityvote(scores_RF2(i2:i2+win,:));   
 Y_pred_majority = [Y_pred_majority vote_score];
 vote_score = [];
end
Y_pred_majority = Y_pred_majority(:);
conf_maj = confusionmat(Y_Test_majority,Y_pred_majority);
test_acc_maj = (sum(diag(conf_maj)))/(sum(sum(conf_maj)))*100;