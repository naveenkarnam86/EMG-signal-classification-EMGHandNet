%%%%%%% program to extract features from raw data %%%%%%%%%
clc;
clear all;
close all;
Trail_length = 512;
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\Train_Test_split_data_257\';
fullMatFileName = fullfile(destdirectory,  'nina_sEMG_Train_Test_split_257.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
 tempdata = load(fullMatFileName);
  train_data = tempdata.Train_raw_data;
  test_data = tempdata.Test_raw_data;
%   valid_data = tempdata.Valid_raw_data;
end
% Training and Testing data feature extraction
Train_feat_E123=[];
% Train_feat_E123=[Train_feat_E123;fn_feat_E123(train_data,Trail_length)];
Train_feat_E123=[Train_feat_E123;fn_feat_spectrogram(train_data,Trail_length)];
Train_feat_E123(isinf(Train_feat_E123)|isnan(Train_feat_E123))=0;
% Valid_feat_E123=[];
% Valid_feat_E123=[Valid_feat_E123;fn_feat_E123(valid_data,Trail_length)];
% Train_feat_E123(isinf(Valid_feat_E123)|isnan(Valid_feat_E123))=0;
Test_feat_E123=[];
% Test_feat_E123=[Test_feat_E123;fn_feat_E123(test_data,Trail_length)];
Test_feat_E123=[Test_feat_E123;fn_feat_spectrogram(test_data,Trail_length)];
Test_feat_E123(isinf(Test_feat_E123)|isnan(Test_feat_E123))=0;
% Test_feat_E123=abs(Test_feat_E123);
% Train_test_comined=[];
% Train_test_comined=[Train_feat_E123;Test_feat_E123];
% [m,n]=size(Train_feat_E123);
% idx=randperm(m);
% Training_data_E123=Train_feat_E123(idx(1:m),:);
% % Training_data_E123=abs(Training_data_E123);
% [m1,n1]=size(valid_feat_E123);
% idx1=randperm(m1);
% Validating_data_E123=valid_feat_E123(idx1(1:m1),:);
% % %% Training data and Test data
% [m2,n2]=size(Test_feat_E123);
% idx2=randperm(m2);
% Testing_data_E123=Test_feat_E123(idx2(1:m2),:);
% Testing_data_E123=abs(Testing_data_E123);

destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\feat\raw\';
mkdir(destdirectory);   %create the director
file = sprintf('nina_sEMG_feat_data.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Train_feat_E123','Test_feat_E123');

% %% Training and Test data for Random forest classifier
% X_Train = Training_data_E123(:,1:n-1);
% Y_Train = Training_data_E123(:,n);
% X_Test = Testing_data_E123(:,1:n1-1);
% Y_Test = Testing_data_E123(:,n1);
% save('EMG_feat_52class','X_Train','Y_Train','X_Test','Y_Test');

