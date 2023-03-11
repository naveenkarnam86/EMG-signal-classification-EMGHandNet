function [idata]=fn_TD_bin_dist(data)
idata=[];
for i=1:1:10
%     y=histfit(data(:,i),10,'normal');
%     idata=[idata y];
    idata=[idata hist(data(:,i),10)];
end
return