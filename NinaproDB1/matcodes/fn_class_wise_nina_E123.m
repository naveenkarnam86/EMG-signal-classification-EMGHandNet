function [p1_raw_class] =fn_class_wise_nina_E123(data_combined,n_class)
p1_raw_class=[];p1_length=[];
% class=[];
    n_class=52;
    [m,n]=size(data_combined);
    for i=1:1:n_class
    p1=data_combined(data_combined(:,n)==i,:);
    p1_raw_class=[p1_raw_class;p1];
    p1_length = [p1_length,length(p1)];
    p1 =[];
    end
    k=1:1:length(p1_length);
    stem(k,p1_length);
   
    return