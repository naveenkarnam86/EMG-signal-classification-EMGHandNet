% code for splitting raw data into Train and Test
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Trial_length=10000;
Total_data=[];
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/rawdata/';
fullMatFileName = fullfile(destdirectory,  'nina_DB4_sEMG_classwise.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  Total_data = tempdata.data_class_Total;
end
[Train_raw_data Test_raw_data] =fn_final_train_test_split_257(Total_data,Trial_length);
[m,n] =size(Train_raw_data);
% no of training samples = length(Training_process_data)/trial length
N_Train_samples = floor(m/Trial_length);
% [m1,n1] =size(Valid_raw_data);
% no of validation samples = length(Training_process_data)/trial length
% N_valid_samples = floor(m1/Trial_length);
% no of testing samples = length(Training_process_data)/trial length
[m2,n2] =size(Test_raw_data);
N_Test_samples = floor(m2/Trial_length);

destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/Train_Test_split_data_25/';
mkdir(destdirectory);   %create the director
file = sprintf('nina_DB4_TTsplit_25.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Train_raw_data','Test_raw_data');
