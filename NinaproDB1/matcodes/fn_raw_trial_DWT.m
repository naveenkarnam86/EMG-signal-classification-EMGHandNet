function [DWT_data]=fn_raw_trial_DWT(raw_data,Trail_length)
DWT_data=[];
step=Trail_length;
[m,n]=size(raw_data);
   for i=0:step:m-step
         dwt_data=fn_prep_DWT_wave(raw_data(i+1:i+step,1:n-1));
         [m1,n1]=size(dwt_data);
         class_label=raw_data(i+1,n);
         class_vec=class_label*ones(1,m1);
         class_vec=class_vec(:);
         dwt_data_class=[dwt_data,class_vec];
         DWT_data=[DWT_data; dwt_data_class];
         dwt_data_class = [];
   end
       return
