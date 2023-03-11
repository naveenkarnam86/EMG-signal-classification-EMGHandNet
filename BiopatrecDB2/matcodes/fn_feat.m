function [Total_data] = fn_feat(data)
Total_data=[];
EMG_data=[];
[m,n]=size(data);
step=20000;
% step1 = 2000;
   for i=0:step:m-step

         data1 = fn_preprocessing(data(i+1:i+step,1:n-1)); % preprocessing
         class_label=data(i+1:i+step,n);
         data_filter=[data1,class_label];
         EMG_data=[EMG_data;data_filter];
      end

   Total_data = EMG_data;
   return