%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%
function EMAV=fn_TD_jEMAV(data)
N=length(data); 
[M,N]=size(data);
EMAV=[];
for j=1:1:N
    d=0;Y=zeros(1,M);
for i=1:1:M
  if i >= 0.2*M && i <= 0.8*M
    p=0.75;
  else
    p=0.5;
  end
  Y(i)=abs((data(i,j))^p);
end
EMAV=[EMAV,mean(Y)];
end
return
