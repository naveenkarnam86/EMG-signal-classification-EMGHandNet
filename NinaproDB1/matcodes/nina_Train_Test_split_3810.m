% code for splitting raw data into Train and Test
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Valid_raw_data=[];Trial_length=512;
Total_data=[];
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\rawdata_classwise\';
fullMatFileName = fullfile(destdirectory,  'nina_sEMG_raw_data_classwise.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  Total_data = tempdata.data_class_Total;
end
[Train_raw_data Test_raw_data] =fn_final_train_test_split_3810(Total_data,Trial_length);
[m,n] =size(Train_raw_data);
% no of training samples = length(Training_process_data)/trial length
N_Train_samples = floor(m/Trial_length);
% [m1,n1] =size(Valid_raw_data);
% no of validation samples = length(Training_process_data)/trial length
% N_valid_samples = floor(m1/Trial_length);
% no of testing samples = length(Training_process_data)/trial length
[m2,n2] =size(Test_raw_data);
N_Test_samples = floor(m2/Trial_length);

destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\Train_Test_split_data_3810\';
mkdir(destdirectory);   %create the director
file = sprintf('nina_sEMG_Train_Test_split_3810.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Train_raw_data','Test_raw_data');
