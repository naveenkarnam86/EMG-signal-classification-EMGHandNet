function [data_energy] = fn_mean_energy(data)
data_energy=[];
data_square = abs(data.^2);
data_log = mean(data_square);
data_energy = log(data_log);
return