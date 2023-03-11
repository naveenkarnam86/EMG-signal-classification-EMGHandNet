function [preprocess_data]=fn_prep_notch_bp(trial_data)
preprocess_data=[];
[m,n]=size(trial_data);
% trial_data = Train_raw_data(1027:1539,5);
% figure();
% subplot(4,1,1);
% plot(trial_data,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('Raw sEMG data');
% class data filtering
% windowSize = 30;
% b = (1/windowSize)*ones(1,windowSize); a = 1; 
% f1emg= filter(b,a,trial_data);
L=floor(log2(m));
% subplot(4,1,2);
% plot(f1emg,'LineWidth',2);
% xlabel('no of samples');
% ylabel('Amplitude');
% title('filtered sEMG data plot');

%%%%%%%%%% 50Hz notch filtering and Butterworth band pass filtering %%%%
fs = 2000; filterOrder1 = 1;filterOrder2 = 4;% Filter order (e.g., 3 for a sixth-order Butterworth filter). Try other values too
fL=20;fH=380;
% [b, a] = butter(filterOrder1, 50/(sampleRate/2)); % Generate filter classoefficlassients
% trial_notch = filtfilt(b, a, double(trial_data));
f0=50;Q=30;
w0=f0/(fs/2);
bw=w0/Q;
[num,den]=iirnotch(w0,bw); % notch filter implementation 
emg_notch=filter(num,den,trial_data);

[b1, a1] = butter(filterOrder2,[fL fH]/(fs/2)); % Generate filter classoefficlassients
filteredData = filtfilt(b1, a1, double(emg_notch));
%%%%%%%%%%%%%%%%%%%%%%%
% raw noisy data plotting
% decomposition and denoising
% dec = mdwtdec('c',f1emg,3,'db44');
% [data_denoised,decDEN,THRESH] = mswden('den',dec,'sqtwolog','sln','s',true);
% data_denoised = wdenoise(filteredData,L,'Wavelet','sym8',...
%     'DenoisingMethod', 'UniversalThreshold'); 
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

preprocess_data = abs(filteredData);
% % Normalize the data
% % Subtract min of each column 
% datamin = data_denoised(:,1:n) - min(data_denoised(:,1:n), [], 1); 
% % Scale to the max of each column 
% data_Norm = datamin ./ max(datamin, [], 1);
% norm_data=dataNorm;
% data_normalize=[dataNorm data_denoised(:,11)];
% preprocess_data = data_Norm;
return