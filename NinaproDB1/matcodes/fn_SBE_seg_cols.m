function [feats_data]=fn_SBE_seg_cols(data)

Npwin = 2; 

[rws,cols] =size(data);

Nsl = length(data);
Npat =  floor(rws/Nsl);
feats_data = []; pseg_av =[];
Pseg  = periodogram(data);
Lp = length(Pseg);
pwn = floor(Lp/Npwin);
for px = 1:Npwin
      pwind = Pseg((px-1)*pwn+1:px*pwn,:);
      pseg_av = [pseg_av mean(pwind)];
end
       idata = log(pseg_av);   
       feats_data = [feats_data  idata];
 
return