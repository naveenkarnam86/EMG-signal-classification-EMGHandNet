function [preprocess_data]=fn_prep_AR(trial_data)
preprocess_data=[];
[m,n]=size(trial_data);
data = trial_data(:,1:n-3);
label_info = trial_data(:,n-2:n);
% trial_data = Train_raw_data(1027:1539,5);
% figure();
% subplot(4,1,1);
% plot(trial_data,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('Raw sEMG data');
% class data filtering

% %%%%%%%%%% Moving Average filter %%%%%%%%%%%
% windowSize = 25;
% b = (1/windowSize)*ones(1,windowSize); a = 1; 
% f1emg= filter(b,a,trial_data);
L=floor(log2(m));
% NFFT = 2^(nextpow2(m));
% preprocess_data = abs(fft(f1emg));
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% Butterworth low pass filtering %%%%
% fc=1;
% fs=100;
% [b,a]=butter(1,fc/(fs/2));
% data_filtered=filtfilt(b,a,trial_data);
%%%%%%%%%%%%%%%%%%%%%%%
% subplot(4,1,2);
% plot(f1emg,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('filtered sEMG data plot');
% raw noisy data plotting
% decomposition and denoising
% dec = mdwtdec('c',f1emg,3,'db44');
% [data_denoised,decDEN,THRESH] = mswden('den',dec,'sqtwolog','sln','s',true);
data_denoised = wdenoise(data,L,'Wavelet','sym8',...
    'DenoisingMethod', 'UniversalThreshold'); 
%     'ThresholdRule', 'soft', ...
%     'NoiseEstimate', 'LevelIndependent'
% data_denoised=[data_X,data_class(:,11)];

% subplot(4,1,3);
% plot(data_denoised,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('dwt sEMG data plot');

% dec = mdwtdec('c',trial_data,3,'db44');
% [data_denoised,decDEN,THRESH] = mswden('den',dec,'sqtwolog','sln','s',true);
% 
% subplot(4,1,4);
% plot(f1emg,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('org dwt sEMG data plot');

% abs_data = abs(data_denoised);
preprocess_data = [data_denoised label_info];
% % Normalize the data
% % Subtract min of each column 
% datamin = data_denoised(:,1:n) - min(data_denoised(:,1:n), [], 1); 
% % Scale to the max of each column 
% data_Norm = datamin ./ max(datamin, [], 1);
% norm_data=dataNorm;
% data_normalize=[dataNorm data_denoised(:,11)];
% preprocess_data = data_Norm;
return