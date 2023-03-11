% code for splitting raw data into Train and Test
clc;
clear all;
close all;
Test_raw_data=[];Train_raw_data=[];Valid_raw_data=[];Trial_length=500;
train_process_data = []; test_process_data = [];
train_process_sub_wise_data=[];
test_process_sub_wise_data=[];
train_raw_data=[];test_raw_data=[];
Total_data=[];n_class=52;
myfolder = dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise/S*');
L = length(myfolder);
for sub = 1:L
 baseFileName = myfolder(sub).name;
 fullFileName = fullfile(myfolder(sub).folder, baseFileName);
 tempdata = load(fullFileName);
 sub_data = tempdata.sub_wise;
 
[Train_raw_data Test_raw_data] = fn_final_train_test_split_257(sub_data,Trial_length,n_class);
 train_process_sub_wise_data= fn_raw_trial_DWT(Train_raw_data,Trial_length);
 train_process_data=[train_process_data;train_process_sub_wise_data];
 
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/prep_DWT_wave/sub_wise_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,train_process_sub_wise_data);
train_process_sub_wise_data=[];

test_process_sub_wise_data= fn_raw_trial_DWT(Test_raw_data,Trial_length);
test_process_data=[test_process_data;test_process_sub_wise_data];
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,test_process_sub_wise_data);
test_process_sub_wise_data=[];
disp(sub);
end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/prep_DWT_wave/Total_process_TT/';
mkdir(destdirectory);   %create the directory
file1 = sprintf('nina_pro_naveen_DB1_DWT_wave_train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
csvwrite(fulldestination, train_process_data); 
file2 = sprintf('nina_pro_naveen_DB1_DWT_wave_test.csv');
fulldestination = fullfile(destdirectory, file2);%name file relative to that directory
csvwrite(fulldestination, test_process_data); 

file3 = sprintf('nina_pro_naveen_DB1_DWT_wave_train_mat.mat');
fulldestination = fullfile(destdirectory, file3);
save(fulldestination, 'train_process_data');
file4 = sprintf('nina_pro_naveen_DB1_DWT_wave_test_mat.mat');
fulldestination = fullfile(destdirectory, file4);
save(fulldestination, 'test_process_data');


