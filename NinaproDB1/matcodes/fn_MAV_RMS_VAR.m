function [fec]=fn_MAV_RMS_VAR(data)
MAV=[];
TSE=[];
RMS=[];
Ent=[];
dft=[];
SBE=[];
VAR =[];
[rws,cols] =size(data);
divN = 5;
   
thres = 1e-3;

   MAV_10ch = []; RMS_10ch = []; VAR_10ch = []; SBE_10ch = [];
   TDPSD_10ch =[];TSE_10ch = [];LMF_10ch = []; mean_10ch = [];
   ZC_10ch =[]; SSC_10ch = []; DASDV_10ch = [];
   
   MAV_10ch = fn_MAV_seg(data);
%    SBE_10ch = fn_SBE_seg(data); 
   SBE_10ch = fn_SBE_seg_cols(data);
   TSE_10ch = fn_TSE_seg(data);
   VAR_10ch = var(data);
   RMS_10ch = fn_RMS_seg(data);
%    LMF_10ch = fn_FD_lmf_moment(data,divN);
   TDPSD_10ch =  fn_FD_TDPSD(data);
   mean_10ch = mean(data);
   ZC_10ch = fn_TD_jZC(data,thres);
   SSC_10ch = fn_TD_jSSC(data,thres);
   DASDV_10ch = fn_TD_jDASDV(data);
%     for clx = 1:cols
%     ch_mean = []; ch_RMS = []; ch_VAR = [];ch_SBE = [];
%     ch_TSE = [];
%     pattern = data(:,clx);
%     ch_mean = fn_MAV_seg(pattern);
%     MAV_10ch = [MAV_10ch  ch_mean(:)'];
%     ch_SBE = fn_SBE_seg(pattern);
%     SBE_10ch = [SBE_10ch ch_SBE(:)'];
%     ch_TSE = fn_TSE_seg(pattern);
%     TSE_10ch = [TSE_10ch ch_TSE(:)'];
%     end
  

fec =  [MAV_10ch SBE_10ch TSE_10ch VAR_10ch RMS_10ch TDPSD_10ch mean_10ch ZC_10ch SSC_10ch DASDV_10ch];
% fec=[MAV RMS VAR];
% fec_abs=abs(fec);
return