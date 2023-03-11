function [lmf_fft] = fn_FD_lmf_moment(data,divN)
%this function extracts energy from each block of fourier transform
%vector
%divN specifies the number of divisions in the spectrum 
lmf_fft=[];
if isempty(divN)
    divN = 5;
end
% sum2=0;
[M,N]=size(data);
for i=1:1:N
    L = length(data(:,i));
    NFFT = 2^(nextpow2(L));
    [c] = fft(data(:,i),NFFT);
    Ns = length(c);
    si=abs(c).^2;
    for j=1:1:7
        sum2=0;
           for k=1:1:Ns
            sum2= sum2+(k.^j)* (si(k));
           end
        g(j)= sqrt(sum2); 
    end
f(1)=log(g(1));
f(2)=log(g(3));
f(3)=log(g(5));
f(4)=log(g(1))-0.5*log(g(1)-g(3))-0.5*log(g(1)-g(5));
f(5)=log(g(3))-0.5*log(g(1)*g(5));
f(6)=log(g(1))-0.25*log(g(2)*g(4));
f(7)=log(g(1))-0.25*log(g(3)*g(7));
n=8;
for i=1:1:4
    for j=i+1:1:5
        f(n)=log(g(i+1)*g(j+1));
        n=n+1;
    end
end
% lmf_fft=[lmf_fft f(1) f(2) f(3) f(4) f(5) f(6) f(7) f(8) f(9) f(10) f(11) f(12) f(13) f(14) f(15) f(16) f(17)];
lmf_fft=[lmf_fft abs(f(1)) abs(f(2)) abs(f(3)) abs(f(4)) abs(f(5)) abs(f(6)) abs(f(7)) abs(f(8)) abs(f(9)) abs(f(10)) abs(f(11)) abs(f(12)) abs(f(13)) abs(f(14)) abs(f(15)) abs(f(16)) abs(f(17))];
end
return;