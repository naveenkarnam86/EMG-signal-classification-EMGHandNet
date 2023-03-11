function [spectro_data]=fn_spectrogram(data)
spectro_data=[];
[M,N]=size(data);
for i=1:1:N
spectro=spectrogram(data(:,i));
spectro_data=[spectro_data spectro];
spectro=[];
end
return