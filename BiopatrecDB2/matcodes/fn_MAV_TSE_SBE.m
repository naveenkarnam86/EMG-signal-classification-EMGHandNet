function [fec]=fn_MAV_TSE_SBE(data)
MAV=[];
TSE=[];
SBE=[];
[N,M]=size(data);
% step1=floor(N/2);

MAV = fn_MAV(data);
TSE = fn_TSE(data);
SBE = fn_SBE(data);
% for j = 0:step1:N-step1
%     m1=mean(abs(data(j+1:j+step1,:)));
%     MAV=[MAV m1];
% end
% step2=floor(N/4);
% for j = 0:step2:N-step2
%     m2=sum(pow2(abs(data(j+1:j+step2,:))));
%     TSE=[TSE m2];
% end
%     
% dft = fft(data);
% for j = 0:step2:N-step2
%     m3=mean(pow2(abs(dft(j+1:j+step2,:))));
%     SBE=[SBE m3];
% end
fec=[MAV TSE SBE];
% fec_abs=abs(fec);
return