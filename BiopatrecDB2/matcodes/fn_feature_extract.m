function [fec]=fn_feature_extract(data)
MAV_IA=[];
TSE=[];
SBE=[];
[N,M]=size(data);
% step1=floor(N/2);

MAV_IA = fn_Mean_Absolute_Value(data);
SD_IA = fn_standard_deviation(data);
data_energy_IA = fn_mean_energy(data);
data_cv_IA = fn_coefficient_variation(data);
% min_value_IA = min(data);
% max_value_IA = max(data);
mean_IF = fn_mean_IF(data);
% mean_abs_deviation = fn_mean_abs_deviation(data);
% SD_IF = fn_sd_IF(data);


% TSE = fn_TSE(data);
% SBE = fn_SBE(data);
% for j = 0:step1:N-step1
%     m1=mean(abs(data(j+1:j+step1,:)));
%     MAV=[MAV m1];
% end
% step2=floor(N/4);
% for j = 0:step2:N-step2
%     m2=sum(pow2(abs(data(j+1:j+step2,:))));
%     TSE=[TSE m2];
% end
%     
% dft = fft(data);
% for j = 0:step2:N-step2
%     m3=mean(pow2(abs(dft(j+1:j+step2,:))));
%     SBE=[SBE m3];
% end
fec=[MAV_IA data_energy_IA mean_IF];
% fec_abs=abs(fec);
return