% code for splitting raw data into Train and Test
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Valid_raw_data=[];Trial_length=10000;
Train_process_sub_wise_data=[];Test_process_sub_wise_data=[];
Train_process_data=[];Test_process_data=[];
Total_data=[];n_class=49;
myfolder = dir('/media/naveen/nav/mat_codes/nina_DB2_codes/olsson_DB2/sub_wise/S*');
L = length(myfolder);
% for sub = 1:length(myfolder)
for sub = 1:length(myfolder)
 baseFileName = myfolder(sub).name;
 fullFileName = fullfile(myfolder(sub).folder, baseFileName);
 tempdata = load(fullFileName);
 sub_data = tempdata.sub_wise_data;
 
[Train_raw_data Test_raw_data] = fn_final_train_test_split_25(sub_data,Trial_length,n_class);
[m,n] =size(Train_raw_data);
% no of training samples = length(Training_process_data)/trial length
N_Train_samples = floor(m/Trial_length);
[m1,n1] =size(Test_raw_data);
N_Test_samples = floor(m1/Trial_length);

% Train_process_sub_wise_data = fn_raw_trial_nb(Train_raw_data,Trial_length);
Train_process_data = [Train_process_data;Train_raw_data];
% Test_process_sub_wise_data = fn_raw_trial_nb(Test_raw_data,Trial_length);
Test_process_data = [Test_process_data;Test_raw_data];
% new_Trial_length = 10000;
% [m2,n2] =size(Train_process_sub_wise_data);
% N_Train_samples_pp = floor(m2/new_Trial_length);
% [m3,n3] =size(Test_process_sub_wise_data);
% N_Test_samples_pp = floor(m3/new_Trial_length);
destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/prep_no_prep/sub_wise_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Train_raw_data);
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,Test_raw_data);
disp(sub);
end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/prep_no_prep/Total_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('nina_pro_noprep_DB2_Train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,Train_process_data);
file2 = sprintf('nina_pro_noprep_DB2_Test.csv');
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,Test_process_data);

