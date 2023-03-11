function [EMG_feat]=fn_trial_EMD_hht_wave(raw_data,Trail_length)
process_data=[];
step=Trail_length;
[m,n]=size(raw_data);
feat_data=[];
EMG_feat = [];
   for i=0:step:m-step
         feat_data=fn_feat_extract_wave(raw_data(i+1:i+step,1:n-1));
         [m1,n1]=size(feat_data);
         class_label=raw_data(i+1,n);
         feat_vec=class_label*ones(1,m1);
         feat_vec=feat_vec(:);
         feat_data_class=[feat_data,feat_vec];
         EMG_feat=[EMG_feat;feat_data_class];
         feat_data=[];
       end

  return
