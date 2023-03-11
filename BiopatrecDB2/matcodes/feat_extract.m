%%%%%%% program to extract features from raw data %%%%%%%%%
clc;
clear all;
close all;
Trail_length = 20000;
destdirectory = 'D:\EMG\mat_codes\Ramikushaba\prep_Total_data\';
fullMatFileName = fullfile(destdirectory,  'rami_15class_8sub_TT.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
 tempdata = load(fullMatFileName);
  train_data = tempdata.train_process_data;
  test_data = tempdata.test_process_data;
 end
% Training and Testing data feature extraction
Train_feat=[];
Train_feat=[Train_feat;fn_feat_E123(train_data,Trail_length)];
Train_feat(isinf(Train_feat)|isnan(Train_feat))=0;

Test_feat=[];
Test_feat=[Test_feat;fn_feat_E123(test_data,Trail_length)];
Test_feat(isinf(Test_feat)|isnan(Test_feat))=0;

Test_feat_E123=abs(Test_feat);
Train_test_comined=[];
Train_test_comined=[Train_feat;Test_feat];
[m,n]=size(Train_feat);
idx=randperm(m);
Training_data_E123=Train_feat(idx(1:m),:);
% Training_data_E123=abs(Training_data_E123);

% %% Training data and Test data
[m2,n2]=size(Test_feat);
idx2=randperm(m2);
Testing_data_E123=Test_feat(idx2(1:m2),:);
Testing_data_E123=abs(Testing_data_E123);

[trainedClassifier_KNN, validationAccuracy_KNN] = trainClassifier_KNN(Train_feat);
[trainedClassifier_SVM, validationAccuracy_SVM] = trainClassifier_CSVM(Train_feat);

disp('validation Accuracy Cubic SVM');
disp(validationAccuracy_SVM*100);
pred1 = predict(trainedClassifier_SVM.ClassificationSVM,Test_feat(:,1:n2-1));
conf1 = confusionmat(pred1,Test_feat(:,n2));
figure();
conf_chart = confusionchart(pred1,Test_feat(:,n2));
acc1 = (sum(diag(conf1)))/(sum(sum(conf1)))*100;
disp('Testing Accuracy of Cubic SVM');
disp(acc1);
disp('validation Accuracy KNN');
disp(validationAccuracy_KNN*100);
pred2 = predict(trainedClassifier_KNN.ClassificationKNN,Test_feat(:,1:n2-1));
conf2 = confusionmat(pred2,Test_feat(:,n2));
figure();
conf_chart = confusionchart(pred2,Test_feat(:,n2));
acc2 = (sum(diag(conf2)))/(sum(sum(conf2)))*100;
disp('Testing Accuracy of KNN');
disp(acc2);