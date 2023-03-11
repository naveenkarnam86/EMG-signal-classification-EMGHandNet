function [process_window_data]=fn_BP_D2_over(Total_seg_data,Trail_length)
process_data=[];process_window_data=[];
step=Trail_length;
new_trial=step/2;
% [m,n]=size(raw_data);
time_window=150;
overlap=50;

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
