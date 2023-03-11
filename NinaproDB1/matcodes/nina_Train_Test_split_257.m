% code for splitting raw data into Train and Test
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Valid_raw_data=[];Trial_length=500;
Train_process_sub_wise_data=[];Test_process_sub_wise_data=[];
Train_process_data=[];Test_process_data=[];
Total_data=[];n_class=52;
myfolder = dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise/S*');
L = length(myfolder);
for sub = 1:L
 baseFileName = myfolder(sub).name;
 fullFileName = fullfile(myfolder(sub).folder, baseFileName);
 tempdata = load(fullFileName);
 sub_data = tempdata.sub_wise;
 
[Train_raw_data Test_raw_data] = fn_final_train_test_split_257(sub_data,Trial_length,n_class);
[m,n] =size(Train_raw_data);
% no of training samples = length(Training_process_data)/trial length
N_Train_samples = floor(m/Trial_length);
[m1,n1] =size(Test_raw_data);
N_Test_samples = floor(m1/Trial_length);

Train_process_sub_wise_data = fn_raw_trial(Train_raw_data,Trial_length);
Train_process_data = [Train_process_data;Train_process_sub_wise_data];
Test_process_sub_wise_data = fn_raw_trial(Test_raw_data,Trial_length);
Test_process_data = [Test_process_data;Test_process_sub_wise_data];
[m2,n2] =size(Train_process_sub_wise_data);
N_Train_samples = floor(m2/Trial_length);
[m3,n3] =size(Test_process_sub_wise_data);
N_Test_samples = floor(m3/Trial_length);
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_naveen/sub_wise_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Train_process_sub_wise_data);
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,Test_process_sub_wise_data);
end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_naveen/Total_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('nina_pro_naveen_DB1_Train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Train_process_data);
file2 = sprintf('nina_pro_naveen_DB1_Test.csv');
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,Test_process_data);

file3 = sprintf('nina_pro_naveen_DB1_Train.mat');
fulldestination = fullfile(destdirectory, file3);
save(fulldestination, 'Train_process_data');
file4 = sprintf('nina_pro_naveen_DB1_Test.mat');
fulldestination = fullfile(destdirectory, file4);
save(fulldestination, 'Test_process_data');


