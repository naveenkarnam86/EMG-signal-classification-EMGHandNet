function [process_data]=fn_raw_trial_d2(raw_data,Trail_length)
process_data=[];
step=Trail_length;
[m,n]=size(raw_data);
   for i=0:step:m-step
         prep_data=fn_prep_BP(raw_data(i+1:i+step,1:n-1));
         class_label=raw_data(i+1:i+step,n);
         trial_data=[prep_data,class_label];
         data_downsampled = downsample(trial_data,2);
         process_data=[process_data; data_downsampled];
  
%        end
   end
       return
