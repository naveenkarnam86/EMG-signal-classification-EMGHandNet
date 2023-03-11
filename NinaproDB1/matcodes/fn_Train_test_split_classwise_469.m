function [train test] = fn_Train_test_split_classwise_469(data)
train = [];
test = [];
valid =[];
for i = 11:10:271
RG = linspace(i,i+9,10);
[train_tmp test_tmp] = fn_Train_test_469(data, RG);
train = [train;train_tmp];
% valid =[valid;valid_tmp];
test = [test;test_tmp];
end
return 