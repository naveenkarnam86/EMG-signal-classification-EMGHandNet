function Total_feat=fn_feat_E123(data_class,Trail_length)
Total_feat=[];EMG_feat=[];
step=Trail_length;
[m,n]=size(data_class);
   for i=0:step:m-step
%        if(i==1)
%          feat=fn_MAV_IAV_E123(data_class(1:step,1:n-1));
%          class_label=data_class(i,n);
%          feat_class=[feat,class_label];
%          EMG_feat=[EMG_feat;feat_class];
%        else
         feat=fn_MAV_TSE_SBE(data_class(i+1:i+step,1:n-1));
         feat_L=size(feat,1);
         class_label=data_class(i+1,n);
         feat_vec=class_label*ones(1,feat_L);
         feat_vec=feat_vec(:);
         feat_class=[feat,feat_vec];
         EMG_feat=[EMG_feat;feat_class];
       end
%      end
    Total_feat = EMG_feat;
return