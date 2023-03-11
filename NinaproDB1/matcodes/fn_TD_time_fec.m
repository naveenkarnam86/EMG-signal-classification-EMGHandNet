function[fec]=fn_TD_time_fec(data)
me=[];
var1=[];
ske=[];
kur=[];
[M,N]=size(data);
for i=1:1:N
m1=mean(data(:,i));
me=[me,m1];
v1=var(data(:,i));
var1=[var1,v1];
sk=skewness(data(:,i));
ske=[ske,sk];
ku=kurtosis(data(:,i));
kur=[kur,ku];
end
fec=[me log10(var1) ske kur];
end

