function [feats_data]=fn_TSE_seg(data)


    Pseg  = abs(data);
    Pseg_sqr = pow2(Pseg); 
    Pseg_sqr_sum = sum(Pseg_sqr);
    feats_data = Pseg_sqr_sum;

return


