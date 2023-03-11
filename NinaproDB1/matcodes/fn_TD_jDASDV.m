%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%
function DASDV=fn_TD_jDASDV(data)
DASDV=[];
[M,N]=size(data);
for j=1:1:N
    d=0;Y=0;
    for i=1:1:M-1
        Y=Y+(data(i+1,j)-data(i,j))^2;
    end
    d=sqrt(Y/(M-1));
    DASDV=[DASDV,d];
end
return