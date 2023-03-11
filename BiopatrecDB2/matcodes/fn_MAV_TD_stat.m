function [feat]=fn_MAV_TD_stat(data)
MAV=[];
TD_stat=[];
[M,N]=size(data);

MAV=mean(abs(data));
TD_stat=fn_TD_time_stat(data);
feat=[MAV TD_stat];

return