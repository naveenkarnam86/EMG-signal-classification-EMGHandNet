function[w_e]=fn_TFD_wavedec(data)
w_e=[];
[M,N]=size(data);
for i=1:1:N
[c,s]=wavedec(data(:,i),3,'haar');
sumA3=sum(c(1:s(1)).^2);
sumD3=sum(c(s(1)+1:s(1)+s(2)).^2);
sumD2=sum(c(s(1)+s(2)+1:s(1)+s(2)+s(3)).^2);
sumD1=sum(c(s(1)+s(2)+s(3)+1:s(1)+s(2)+s(3)+s(4)).^2);
w_e=[w_e sumA3 sumD3 sumD2 sumD1];
end
return