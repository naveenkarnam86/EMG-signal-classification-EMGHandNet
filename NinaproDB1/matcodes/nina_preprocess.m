%%%%%%% program to do preprocessing for raw data %%%%%%%%%
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Trial_length=512;
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\Train_Test_split_data_257\';
fullMatFileName = fullfile(destdirectory,  'nina_sEMG_Train_Test_split_257.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  Train_raw_data = tempdata.Train_raw_data;
%   Valid_raw_data = tempdata.Valid_raw_data;
  Test_raw_data = tempdata.Test_raw_data;
%   valid_data = tempdata.valid_raw_data;
end

% raw data plotting
figure();
subplot(3,1,1);
plot(Train_raw_data(1:3000,1),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
title('Raw sEMG data plot');
subplot(3,1,2);
plot(Train_raw_data(1:3000,2),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
subplot(3,1,3);
plot(Train_raw_data(1:3000,3),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');

Training_process_data=[]; Testing_process_data=[];
Training_process_data=[Training_process_data;fn_raw_trial(Train_raw_data,Trial_length)];
% Validation_process_data=[Validation_process_data;fn_raw_trial(Valid_raw_data,Trial_length)];
Testing_process_data=[Testing_process_data;fn_raw_trial(Test_raw_data,Trial_length)];

% preprocess data plotting
figure();
subplot(3,1,1);
plot(Training_process_data(1:3000,1),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
title('Preprocessed sEMG data plot');
subplot(3,1,2);
plot(Training_process_data(1:3000,2),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
subplot(3,1,3);
plot(Training_process_data(1:3000,3),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');

% Raw data for deep learning or machine learning models
destdirectory = 'C:\Users\Naveen\Google Drive\codes\nina_prep_python\preprocess\';
mkdir(destdirectory);   %create the director
file = sprintf('nina_sEMG_preprocess_data.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Training_process_data','Testing_process_data');

% destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/preprocess/';
% mkdir(destdirectory);   %create the director
file1 = sprintf('nina_pro_DB1_Train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Training_process_data);

file2 = sprintf('nina_pro_DB1_Test.csv');
fulldestination = fullfile(destdirectory, file2);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Testing_process_data);

[m,n] =size(Training_process_data);
% no of training samples = length(Training_process_data)/Trail length
N_Train_samples = floor(m/Trial_length);
% [m1,n1] =size(Validation_process_data);
% % no of validation samples = length(Training_process_data)/trial length
% N_valid_samples = floor(m1/Trial_length);
% no of training samples = length(Training_process_data)/Trail length
[m2,n2] =size(Testing_process_data);
N_Test_samples = floor(m2/Trial_length);
