function [w_e,l]=fn_TFD_mDWT(data)
w_e=[];
[M,N]=size(data);

% for i=1:1:N
[w_e,l]= mdwtdec('c',data,7,'db44');
l=sum(l.^2);
% [c,s]=wavedec(data(:,i),7,'haar');
% sumA=sum((w_e.ca).^2);
% sumD7= sum((w_e.cd{1, 1}).^2);
% sumA7=sum(c(1:s(1)).^2);
% sumD7=sum(c(s(1)+1:s(1)+s(2)).^2);
% sumD6=sum(c(s(1)+s(2)+1:s(1)+s(2)+s(3)).^2);
% sumD5=sum(c(s(1)+s(2)+s(3)+1:s(1)+s(2)+s(3)+s(4)).^2);
% sumD4=sum(c(s(1)+s(2)+s(3)+s(4)+1:s(1)+s(2)+s(3)+s(4)+s(5)).^2);
% sumD3=sum(c(s(1)+s(2)+s(3)+s(4)+s(5)+1:s(1)+s(2)+s(3)+s(4)+s(5)+s(6)).^2);
% sumD2=sum(c(s(1)+s(2)+s(3)+s(4)+s(5)+s(6)+1:s(1)+s(2)+s(3)+s(4)+s(5)+s(6)+s(7)).^2);
% sumD1=sum(c(s(1)+s(2)+s(3)+s(4)+s(5)+s(6)+s(7)+1:s(1)+s(2)+s(3)+s(4)+s(5)+s(6)+s(7)+s(8)).^2);
% w_e=[w_e sumA7 sumD7 sumD6 sumD5 sumD4 sumD3 sumD2 sumD1];
% end
return