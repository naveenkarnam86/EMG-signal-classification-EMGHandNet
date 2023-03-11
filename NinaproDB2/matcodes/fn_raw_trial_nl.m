function [process_data]=fn_raw_trial_nl(raw_data,Trail_length)
process_data=[];
step=Trail_length;
[m,n]=size(raw_data);
   for i=0:step:m-step
         norm_data=fn_prep_notch_lp(raw_data(i+1:i+step,1:n-1));
         class_label=raw_data(i+1:i+step,n);
         filter_data=[norm_data,class_label];
         process_data=[process_data; filter_data];
   end
   return
