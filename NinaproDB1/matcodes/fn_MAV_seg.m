function [feats_data]=fn_MAV_seg(data)
   
    Pseg  = abs(data);
    pseg_av = mean(Pseg);
    feats_data = pseg_av;
    
return


