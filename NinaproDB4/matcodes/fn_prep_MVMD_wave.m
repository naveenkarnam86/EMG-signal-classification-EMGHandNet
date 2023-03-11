function [mv_modes_data]=fn_prep_MVMD_wave(trial_data)
preprocess_data=[];
mv_modes_data=[];
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
% 
% %%%%%%%%%% 50Hz notch filtering and Butterworth band pass filtering %%%%
fs = 2000; filterOrder1 = 1;filterOrder2 = 4;% Filter order (e.g., 3 for a sixth-order Butterworth filter). Try other values too
% % fL=20;fH=380;
% % [b, a] = butter(filterOrder1, 50/(sampleRate/2)); % Generate filter classoefficlassients
% % trial_notch = filtfilt(b, a, double(trial_data));
% f0=50;Q=30;
% w0=f0/(fs/2);
% bw=w0/Q;
% [num,den]=iirnotch(w0,bw); % notch filter implementation 
% emg_notch=filter(num,den,trial_data);
% 
% 
% %%%%%%%%%% Butterworth low pass filtering %%%%
% fc=500;
% [b,a]=butter(1,fc/(fs/2));
% data_filtered=filtfilt(b,a,double(trial_data));

% [b1, a1] = butter(filterOrder2,[fL fH]/(fs/2)); % Generate filter classoefficlassients
% filteredData = filtfilt(b1, a1, double(emg_notch));
%%%%%%%%%%%%%%%%%%%%%%%
% raw noisy data plotting
% decomposition and denoising
% dec = mdwtdec('c',f1emg,3,'db44');
% [data_denoised,decDEN,THRESH] = mswden('den',dec,'sqtwolog','sln','s',true);

% data_denoised = wdenoise(trial_data,L,'Wavelet','sym8',...
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

% preprocess_data = abs(data_denoised);
trial_data_abs =abs(trial_data);
segment_length=10000;
Npat = floor(m/segment_length);
n_IMF = 4;
alpha = 1000;tau=0; K =4; DC = 0; init=1; tol= 1e-7;
% [u, u_hat, omega] = MVMD_new(signal, alpha, tau, K, DC, init, tol)
[mv_modes, u_hat, omega] = MVMD_ver1(trial_data, alpha, tau, K, DC, init, tol);
mv_modes_permute =  permute(mv_modes,[2 1 3]);
[m1,n1,p1] = size(mv_modes_permute);
mv_modes_data = reshape(mv_modes_permute,[m1,n1*p1]);
% for nx =1:Npat
%     EMD_10ch = [];
%     hht_seg =[];
%     EMD_seg_top=[];
%     parfor ch = 1:n
%         segment= trial_data((nx-1)*segment_length+1:nx*segment_length,ch);
% %         seg_resample = resample(segment,p,q);
% %           seg_down = downsample(segment,3);
% %         fs_new = fs*(p/q);
%           [imf,ort,fvs,iterNum] = emd_sssc(segment,fs);
% %         EMD_seg = emd_n(segment,n_IMF);
% %           huang=hht(imf,fs);
% %           t = linspace(1,length(huang),length(hunag))';
%           [hs,f,t] = hht(imf',fs,'FrequencyResolution',50);
% 
% %          mesh(seconds(t),f,hs,'EdgeColor','none','FaceColor','interp');
% %          xlabel('Time (s)');
% %          ylabel('Frequency (Hz)');
% %          zlabel('Instantaneous Energy');
% %           huang1= hht(imf,'FrequencyLimits',[0 1000]);
%           hht_seg = hs'; 
%           hht_seg = full(hht_seg);
% %         EMD_seg_top = EMD_seg(:,1:n_IMF);
%         
% %         [hs,f,t,imfinsf,imfinse] = hht(EMD_seg,fs,'FrequencyLimits',[0 500]);
%         EMD_10ch = [EMD_10ch hht_seg];
%         hht_seg =[];
%         EMD_seg_top=[];
% %         EMD_10ch = [EMD_10ch hs'];
%     end
%     EMD_data = [EMD_data; EMD_10ch];
% end
% % Normalize the data
% % Subtract min of each column 
% datamin = data_denoised(:,1:n) - min(data_denoised(:,1:n), [], 1); 
% % Scale to the max of each column 
% data_Norm = datamin ./ max(datamin, [], 1);
% norm_data=dataNorm;
% data_normalize=[dataNorm data_denoised(:,11)];
% preprocess_data = data_Norm;
return