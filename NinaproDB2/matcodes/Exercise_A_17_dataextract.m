clc;
clear all;
close all;
EA_17class_train_Total_data = [];
EA_17class_test_Total_data = [];

destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/prep_nl/Total_process_TT/';
% mkdir(destdirectory);
file1 = sprintf('nina_pro_nl_DB2_Train.csv');
fulldestination1 = fullfile(destdirectory, file1);%name file relative to that directory
Train_process_data = csvread(fulldestination1);
[m,n] = size(Train_process_data);
for i =1:1:17
EA_class_wise_train_data = Train_process_data(Train_process_data(:,n)==i,:);
EA_17class_train_Total_data = [EA_17class_train_Total_data;EA_class_wise_train_data];
end

file2 = sprintf('nina_pro_nl_DB2_Test.csv');
fulldestination2 = fullfile(destdirectory, file2);
Test_process_data = csvread(fulldestination2);
[m1,n1] = size(Test_process_data);
for i =1:1:17
EA_class_wise_test_data =[];
EA_class_wise_test_data = Test_process_data(Test_process_data(:,n)==i,:);
EA_17class_test_Total_data = [EA_17class_test_Total_data;EA_class_wise_test_data];
end

destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/prep_nl/Total_process_17class/';
mkdir(destdirectory);   %create the director
file1 = sprintf('nina_pro_nl_DB2_17class_Train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
csvwrite(fulldestination,EA_17class_train_Total_data);
file2 = sprintf('nina_pro_nl_DB2_17class_Test.csv');
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,EA_17class_test_Total_data);