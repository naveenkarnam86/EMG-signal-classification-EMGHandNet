function TDPSD=fn_FD_TDPSD(data)
ts=[];
[M,N]=size(data);
for i=1:1:N
    z=sum(data(:,i).^2);
    m0=sqrt(z)/0.1;
    L = length(data(:,i));
    NFFT = 2^(nextpow2(L));
    [f]=fft(data(:,i),NFFT);
    k=length(f);
        dum=0;
        dum1=0;
        w1=0;
        w2=0;
    for j=1:1:k
        dum=(j*f(j))^2+dum;
        dum1=(j^2*f(j))^2+dum1;
        w1=abs(j*f(j))+w1;
        w2=abs(j^2*f(j))+w2;
    end
    m2=sqrt(dum/k)/0.1;
    m4=sqrt(dum1/k)/0.1;
    f1=log(m0);
    f2=log(m0-m2);
    f3=log(m0-m4);
    f4=log(m0/(sqrt(m0-m2)*sqrt(m0-m4)));
    f5=log(m2/sqrt(m0*m4));
    f6=log(w1/w2);
    ts=[ts abs(f1) abs(f2) abs(f3) abs(f4) abs(f5) abs(f6)];
end
TDPSD=ts;

return