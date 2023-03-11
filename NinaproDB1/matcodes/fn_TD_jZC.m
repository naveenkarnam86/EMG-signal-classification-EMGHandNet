%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function ZC=fn_TD_jZC(data,thres)
[M,N]=size(data); ZC=[];
for j=1:1:N
    d=0;
for i=1:M-1
  if ((data(i,j) > 0 && data(i+1,j) < 0) || ...
          (data(i,j) < 0 && data(i+1,j) > 0)) ...
      && (abs(data(i,j)-data(i+1,j)) >= thres)
    d=d+1;
  end
end
ZC=[ZC,d];
end

