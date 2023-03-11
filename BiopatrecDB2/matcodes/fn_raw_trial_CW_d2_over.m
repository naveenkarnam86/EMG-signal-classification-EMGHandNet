function [process_window_data]=fn_raw_trial_CW_d2_over(raw_data,Trail_length)
process_data=[];process_window_data=[];Total_seg_data=[];
step=Trail_length;
new_trial=2100;
[m,n]=size(raw_data);
time_window=150;
overlap=50;
   for i=0:step:m-step
         seg_data=raw_data(i+1+900:i+step-900,1:n-1);
         class_label=raw_data(i+1+900:i+step-900,n);
         trial_data=[seg_data,class_label];
         Total_seg_data=[Total_seg_data;trial_data];
         
   end
   [m1,n1]=size(Total_seg_data);
   filter_data=fn_prep_BP(Total_seg_data(:,1:n1-1));
   filter_classlb=Total_seg_data(:,n1);
   filter_data_classlb=[filter_data filter_classlb];
   
   data_downsampled = downsample(filter_data_classlb,2);
   process_data=[process_data; data_downsampled];
  
%        end
%    end
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
