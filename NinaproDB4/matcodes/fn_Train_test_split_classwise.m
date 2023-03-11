function [train valid test] = fn_Train_test_split_classwise(data)
train = [];
test = [];
valid =[];
for i = 11:6:65
RG = linspace(i,i+5,6);
[train_tmp valid_tmp test_tmp] = fn_Train_test_split(data, RG);
train = [train;train_tmp];
valid =[valid;valid_tmp];
test = [test;test_tmp];
end
return 