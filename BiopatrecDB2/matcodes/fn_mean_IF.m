function [data_IF_mean] = fn_mean_IF(data)
data_IF_mean=[];
data_transpose = data';
[m,n] = size(data_transpose);
step =21;
for i =0:step:m-step
    data_seg_mean = mean(data_transpose(i+1:i+step,:));
    data_IF_mean = [data_IF_mean data_seg_mean];
end
return