clc;
clear all;
close all;
load('nina_Train_valid_Test.mat');
train_data=[];test_data=[];valid_data=[];
train_data =fnb_final_train_test_split_E123(Training_raw_E123);
test_data =fnb_final_train_test_split_E123(Test_raw_data);
valid_data =fnb_final_train_test_split_E123(valid_raw_E123);
save('raw_data_python.mat','train_data', 'test_data', 'valid_data');
 