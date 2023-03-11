clc;
clear all;
close all;
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\preprocess\';
fullMatFileName = fullfile(destdirectory,  'nina_sEMG_preprocess_data.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  train_data = tempdata.Training_process_data;
  test_data = tempdata.Testing_process_data;
%   valid_data = tempdata.valid_raw_data;
end
standard_Train_data=[];standard_Test_data=[];
[m,n]=size(train_data);
Train_label=train_data(:,n);
[standard_Train_data,mean_Train_data, std_Train_data] =  fn_FeatureStandardize(train_data(:,1:n-1));
standard_Train_data =[standard_Train_data,Train_label];
[m1,n1]=size(test_data);
test_label=test_data(:,n1);
standard_Test_data =  fn_TestFeatureStandardize(test_data(:,1:n1-1), mean_Train_data, std_Train_data);
standard_Test_data = [standard_Test_data,test_label];

% % Raw data for deep learning or machine learning models
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\standard';
mkdir(destdirectory);   %create the director
file = sprintf('nina_sEMG_standard_data.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'standard_Train_data','standard_Test_data');