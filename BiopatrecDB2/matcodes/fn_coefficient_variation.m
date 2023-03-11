function [data_cv] = fn_coefficient_variation(data)
data_cv=[];
data_mean = mean(data);
data_var = var(data);
data_cv = (data_var)./(data_mean.^2);
return