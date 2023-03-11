%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function SSC=fn_jSSC(data,thres)
[M,N] = size (data); SSC=[];
for j=1:1:N
    d=0;
for i=2:M-1
  if ((data(i,j) > data(i-1,j) && data(i,j) > data(i+1,j)) ||...
      (data(i,j) < data(i-1,j) && data(i,j) < data(i+1,j))) ...
      && ((abs(data(i,j)-data(i+1,j)) >= thres) || ...
      (abs(data(i,j)-data(i-1,j)) >= thres))
    d=d+1; 
  end
end
SSC=[SSC,d];
end


