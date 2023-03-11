function [sbp]=fn_FD_sbp_burg(data,order)
sbp=[];si=[];
[M,N]=size(data);
for j=1:1:N
    si=arburg(data(:,j),order);
%     disp(size(si));
    sbp=[sbp,si];
%     k1=length(si);
%     k2=length(si)/10;
%     k2=floor(k2);
%     k=1;
%     for i=1:k2:k1-k2
%         f1=sum(si(i:i+k2-1,:));
%         sbp=[sbp f1];
%     end
end
% disp(size(sbp));
return
    