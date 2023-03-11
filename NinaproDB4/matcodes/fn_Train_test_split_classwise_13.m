function [train test] = fn_Train_test_split_classwise_13(data,n_trials_per_class)
train = [];
test = [];
valid =[];
n_trials_per_sub_per_class=6;
for i = 1:n_trials_per_sub_per_class:n_trials_per_class
RG = linspace(i,i+(n_trials_per_sub_per_class-1),n_trials_per_sub_per_class);
[train_tmp test_tmp] = fn_Train_test_25(data, RG);
train = [train;train_tmp];
% valid =[valid;valid_tmp];
test = [test;test_tmp];
end
return 