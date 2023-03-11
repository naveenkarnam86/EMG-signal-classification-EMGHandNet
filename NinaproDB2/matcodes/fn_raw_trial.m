function [process_data]=fn_raw_trial(raw_data,Trail_length)
process_data=[];
step=Trail_length;
[m,n]=size(raw_data);
   for i=0:step:m-step
%        if(i==1)
%          norm_data=fn_preprocessing(raw_data(1:step,1:n-1));
%          class_label=raw_data(1:step,n);
%          trial_data=[norm_data,class_label];
%          process_data=[process_data; trial_data];
%        else
         norm_data=fn_preprocessing(raw_data(i+1:i+step,1:n-1));
         class_label=raw_data(i+1:i+step,n);
         trial_data=[norm_data,class_label];
         process_data=[process_data; trial_data];
%        end
   end
       return
