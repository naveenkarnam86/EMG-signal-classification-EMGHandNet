function [feats_data]=fn_RMS_seg(data)
   
    Pseg  = data.^2;
    pseg_av = mean(Pseg);
    feats_data = sqrt(pseg_av);
    
return


