%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%
function MFL=fn_TD_jMFL(data)
MFL=[];
[M,N]=size(data);
for j=1:1:N
    d=0;Y=0;
    for n=1:1:M-1
        Y=Y+(data(n+1,j)-data(n,j))^2;
    end
d=log(sqrt(Y));
MFL=[MFL,d];
end
return