%%%%%%% program to do preprocessing for raw data %%%%%%%%%
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Trial_length=10000;
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/Train_Test_split_data_25/';
fullMatFileName = fullfile(destdirectory,  'nina_DB4_TTsplit_25.mat')
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  tempdata = load(fullMatFileName);
  Train_raw_data = tempdata.Train_raw_data;
  Test_raw_data = tempdata.Test_raw_data;
%   valid_data = tempdata.valid_raw_data;
end

% raw data plotting
figure();
subplot(2,1,1);
plot(Train_raw_data(1:20000,1),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
title('Raw sEMG data plot');
subplot(2,1,2);
plot(Train_raw_data(1:20000,2),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
% subplot(3,1,3);
% plot(Train_raw_data(1:6000,3),'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');

Training_process_data=[]; Testing_process_data=[];
Training_process_data=[Training_process_data;fn_raw_trial(Train_raw_data,Trial_length)];
Testing_process_data=[Testing_process_data;fn_raw_trial(Test_raw_data,Trial_length)];

% preprocess data plotting
figure();
subplot(2,1,1);
plot(Training_process_data(1:20000,1),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
title('Preprocessed sEMG data plot');
subplot(2,1,2);
plot(Training_process_data(1:20000,2),'LineWidth',2);
xlabel('no of samples');
ylabel('Amplitude');
% subplot(3,1,3);
% plot(Training_process_data(1:6000,3),'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');

% Raw data for deep learning or machine learning models
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/preprocess/';
mkdir(destdirectory);   %create the director
file = sprintf('nina_DB4_prep.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'Training_process_data','Testing_process_data');

[m,n] =size(Training_process_data);
% no of training samples = length(Training_process_data)/Trail length
N_Train_samples = floor(m/Trial_length);
% no of training samples = length(Training_process_data)/Trail length
[m1,n1] =size(Testing_process_data);
N_Test_samples = floor(m1/Trial_length);
