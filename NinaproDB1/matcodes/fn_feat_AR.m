function Total_feat=fn_feat_AR(data_trial,seg_size)
Total_feat=[];EMG_feat=[];
[m,n]=size(data_trial);
step = seg_size;
   for i=0:step:m-step
         feat=fn_MAV_RMS_VAR(data_trial(i+1:i+step,1:n-3));
         feat_L=size(feat,1);
         class_label=data_trial(i+1,n-1);
         feat_vec=class_label*ones(1,feat_L);
         feat_vec=feat_vec(:);
         feat_class=[feat,feat_vec];
         EMG_feat=[EMG_feat;feat_class];
       end
%      end
Total_feat = EMG_feat;

return