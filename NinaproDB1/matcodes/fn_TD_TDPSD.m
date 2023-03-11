function TDPSD=fn_TD_TDPSD(data)
ts=[];lambda=0.1;data1=[];
[M,N]=size(data);
for i=1:1:N
    z=sum(data(:,i).^2);
    m0_bar=sqrt(z);
    L = length(data(:,i));
    NFFT = 2^(nextpow2(L));
    [f] = fft(data(:,i),NFFT);
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
    m0=m0_bar/lambda;
    m2_bar=sqrt(dum/k);
    m2=m2_bar/lambda;
    m4_bar=sqrt(dum1/k);
    m4=m4_bar/lambda;
    a1=log(m0);
    a2=log(m0-m2);
    a3=log(m0-m4);
    a4=log(m0/(sqrt(m0-m2)*sqrt(m0-m4)));
    a5=log(m2/sqrt(m0*m4));
    a6=log(w1/w2);
    
    %     non linear b1,b2,b3,b4,b5,b6 calculation
    data1=log(data(:,i).^2);
    z=sum(data1.^2);
    m0_bar=sqrt(z);
    f=fft(data1);
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
    m0=m0_bar/lambda;
    m2_bar=sqrt(dum/k);
    m2=m2_bar/lambda;
    m4_bar=sqrt(dum1/k);
    m4=m4_bar/lambda;
    b1=log(m0);
    b2=log(m0-m2);
    b3=log(m0-m4);
    b4=log(m0/(sqrt(m0-m2)*sqrt(m0-m4)));
    b5=log(m2/sqrt(m0*m4));
    b6=log(w1/w2);
    
    f1=(-2*a1*b1)/((a1^2)+(b1^2));
    f2=(-2*a2*b2)/((a2^2)+(b2^2));
    f3=(-2*a3*b3)/((a3^2)+(b3^2));
    f4=(-2*a4*b4)/((a4^2)+(b4^2));
    f5=(-2*a5*b5)/((a5^2)+(b5^2));
    f6=(-2*a6*b6)/((a6^2)+(b6^2));
    
    ts=[ts f1 f2 f3 f4 f5 f6];

end
TDPSD=ts;

return