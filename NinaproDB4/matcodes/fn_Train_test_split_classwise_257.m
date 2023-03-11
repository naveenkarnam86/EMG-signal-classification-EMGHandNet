function [train test] = fn_Train_test_split_classwise_257(data,Total_trials)
train = [];
test = [];
valid =[];
for i = 1:6:Total_trials
RG = linspace(i,i+5,6);
[train_tmp test_tmp] = fn_Train_test_257(data, RG);
train = [train;train_tmp];
% valid =[valid;valid_tmp];
test = [test;test_tmp];
end
return 