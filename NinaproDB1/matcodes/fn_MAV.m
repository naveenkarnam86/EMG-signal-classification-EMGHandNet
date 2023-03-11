function [feats_data]=fn_MAV(data)
% clc
% clear
% close all
% %%
% % load train_data_NP52.mat
% % load train_data_NP52.mat
% load train_data_comp.mat
train_data = data;
%%
Nsl = 500;
% combo = combnk(1:5,2);
ModelOrder = 2;
Npwin = 2; % worked great 
% Npwin = 6; 
% Lp = 129;

[rws,cols] =size(train_data);

Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:cols
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
    Pseg  = abs(pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = abs((Pseg((px-1)*pwn+1:px*pwn)));
            pseg_av(px) = mean(pwind);
       end
       idata = (pseg_av); 


       feats_10ch = [feats_10ch  idata(:)'];
    
%    R feats_10ch = [feats_10ch  idata(:)'];
    end
%      stem(feats_10ch);
%      drawnow;
%      pause(0.1)
     feats_data(nx,:) = feats_10ch;
end
return


