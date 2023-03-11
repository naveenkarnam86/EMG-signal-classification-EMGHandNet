function [EMD_data_feat]=fn_feat_extract_wave(trial_data)
[m,n]=size(trial_data);
segment_length=500;
EMD_data_feat =[];
Npat = floor(m/segment_length);
for nx =1:Npat
    EMD_seg_feat=[];
    segment= trial_data((nx-1)*segment_length+1:nx*segment_length,:);
    EMD_seg_feat = fn_feature_extract(segment);
    EMD_data_feat = [EMD_data_feat; EMD_seg_feat];
end
return