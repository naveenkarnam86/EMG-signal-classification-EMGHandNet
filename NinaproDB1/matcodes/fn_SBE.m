function [feats_data]=fn_SBE(data)
% clc
% clear
% close all
% %%
% % load test_data_NP52.mat
% load train_data_NP52.mat
% %%
Nsl = 500;
% % combo = combnk(1:5,2);
% ModelOrder = 2;
Npwin = 4; % worked great 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:cols
    pattern = double(data((nx-1)*Nsl+1:nx*Nsl,clx));
% winLen = floor(Nw/8);
% Noverlap = winLen-10;
%        Pseg = pwelch(abseg,winLen,Noverlap)0;
Pseg  = periodogram(pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = Pseg((px-1)*pwn+1:px*pwn);
            pseg_av(px) = mean(pwind);
       end
       idata = log(pseg_av);   
       feats_10ch = [feats_10ch  idata(:)'];
    end
    feats_data(nx,:) = feats_10ch;
end
return


