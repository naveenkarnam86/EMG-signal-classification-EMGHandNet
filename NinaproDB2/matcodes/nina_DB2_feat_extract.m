%%%%%%% program to extract features from raw data %%%%%%%%%
clc;
clear all;
close all;
Trail_length = 10000;
destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/prep_nl/Total_process_TT/';
fullMatFileName = fullfile(destdirectory,  'nina_pro_nl_DB2_Train_mat.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  train_data = tempdata.Train_process_data;
%   test_data = tempdata.standard_Test_data;
%   valid_data = tempdata.valid_raw_data;
end
fullMatFileName = fullfile(destdirectory,  'nina_pro_nl_DB2_Test_mat.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
%   train_data = tempdata.Train_process_data;
  test_data = tempdata.Test_process_data;
%   valid_data = tempdata.valid_raw_data;
end
% Training and Testing data feature extraction
Train_feat_E123=[];
Train_feat_E123=[Train_feat_E123;fn_feat_E123(train_data,Trail_length)];
Train_feat_E123(isinf(Train_feat_E123)|isnan(Train_feat_E123))=0;
Test_feat_E123=[];
Test_feat_E123=[Test_feat_E123;fn_feat_E123(test_data,Trail_length)];
Test_feat_E123(isinf(Test_feat_E123)|isnan(Test_feat_E123))=0;
Test_feat_E123=double(Test_feat_E123);

[m,n]=size(Train_feat_E123);
idx=randperm(m);
Train_feat_data=Train_feat_E123(idx(1:m),:);
Train_feat_data=double(Train_feat_data);
% %% Training data and Test data


[m1,n1]=size(Test_feat_E123);
% idx1=randperm(m1);
% Test_feat_data=Test_feat_E123(idx1(1:m1),:);
% Test_feat_data=double(Test_feat_data);
Test_feat_data = Test_feat_E123;
destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/feat';
mkdir(destdirectory);   %create the director
file = sprintf('nina_DB2_sEMG_feat_data.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Train_feat_data','Test_feat_data');

% %% Training and Test data for Random forest classifier
X_Train = Train_feat_data(:,1:n-1);
Y_Train = Train_feat_data(:,n);
X_Test = Test_feat_data(:,1:n1-1);
Y_Test = Test_feat_data(:,n1);
% save('EMG_feat_52class','X_Train','Y_Train','X_Test','Y_Test');