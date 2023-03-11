%-------------------------------------------------------------------------%
%  Electromyography (EMG) Feature Extraction source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function LD=fn_TD_jLD(data)
LD=[];
[M,N]=size(data);
for j=1:1:N
    d=0; Y=0;
    for k=1:1:M
        Y=Y+log(abs(data(k,j))); 
    end
    d=exp(Y/M);
    LD=[LD,d];
end
return

