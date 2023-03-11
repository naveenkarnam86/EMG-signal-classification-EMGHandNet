function [train valid test] = fn_Train_test_split_classwise(data)
train = [];
test = [];
valid =[];
for i = 11:10:271
RG = linspace(i,i+9,10);
[train_tmp valid_tmp test_tmp] = fn_Train_test_257(data, RG);
train = [train;train_tmp];
valid =[valid;valid_tmp];
test = [test;test_tmp];
end
return 