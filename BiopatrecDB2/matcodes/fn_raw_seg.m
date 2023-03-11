function [Total_seg_data]=fn_raw_seg(raw_data,Trail_length)
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
return
