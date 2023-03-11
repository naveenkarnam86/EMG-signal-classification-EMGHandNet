function [process_window_data]=fn_raw_trial_nb_d2_over(raw_data,Trail_length)
process_data=[];process_window_data=[];
step=Trail_length;
new_trial=step/2;
[m,n]=size(raw_data);
time_window=100;
overlap=50;
   for i=0:step:m-step
         prep_data=fn_prep_notch_nb(raw_data(i+1:i+step,1:n-1));
         class_label=raw_data(i+1:i+step,n);
         trial_data=[prep_data,class_label];
         data_downsampled = downsample(trial_data,2);
         process_data=[process_data; data_downsampled];
  
%        end
   end
       [m2,n2]=size(process_data);
    for i=0:new_trial:m2-new_trial
        data_window=[];
        data_new_step=process_data(i+1:i+new_trial,1:n2);
        for j=0:overlap:new_trial-time_window
            data_window=data_new_step(j+1:j+time_window,1:n2);
            process_window_data=[process_window_data;data_window];
            data_window=[];
        end
        data_new_step=[];
    end
       return