function [fec_abs]=fn_MAV_IAV_E123(data)
MAV1=[];
IAV1=[];
RMS=[];
Ent=[];
[N,M]=size(data);
for i=1:1:M
    m1=sum(abs(data(:,i)));
    MAV1=[MAV1,m1];
% disp(size(mean1));
    m2=mean(abs(data(:,i)));
    IAV1=[IAV1,m2];
% disp(size(mean2));
    e1=entropy(data(:,i));
    Ent=[Ent,e1];
    rms=sqrt(sum((data(:,i).*data(:,i)))/N);
    RMS=[RMS,rms];
% disp(size(RMS));
end
SBP=fn_FD_sbp_burg(data,4);
TD=fn_TD_time_fec(data);
% disp(size(SBP));
d1=[];
WL=[];
d2=[];
% WAVEFORM LENGTH
for j=1:1:M
    d3=0;d4=0;
    for i=2:1:N
        d3=abs(data(i,j)-data(i-1,j));
        d4=d4+d3;
    end
    d2=[d2,d4];
end
WL=d2;
% disp(size(WL));
LMF=fn_FD_lmf_moment(data,6);
% LBP=fn_TD_LBP_feat(data,6);
ICS=fn_TD_ics_fec(data);
% TDPSD=fn_time_powerspectral(data);
WD=fn_TFD_wavedec(data);
% [l,WD]=fn_TFD_mDWT(data);
% WA=fn_jWAMP(data,0.001);
LD=fn_TD_jLD(data);
% SSC=fn_TD_jSSC(data,0.01);
ZC=fn_TD_jZC(data,0.01);
EMAV=fn_TD_jEMAV(data);
DASDV=fn_TD_jDASDV(data);
MFL=fn_TD_jMFL(data);
TDPSD=fn_TD_TDPSD(data);
% % fec=[MAV1 IAV1 RMS WL Ent SBP WD LD TD TDPSD ICS ZC LMF LBP EMAV DASDV MFL];
fec=[MAV1 IAV1 RMS WL Ent LD EMAV DASDV MFL SBP WD TDPSD ICS LMF];
% fec=[MAV1 RMS WL Ent];
% fec=[MAV1];
fec_abs=abs(fec);
return