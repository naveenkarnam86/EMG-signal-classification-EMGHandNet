clc; clear all; close all;
Train_process_data = []; Test_process_data = [];
train_process_sub_wise_data=[];
test_process_sub_wise_data=[];
Train_raw_data=[];Test_raw_data=[];
% valid_process_data = [];
n_class=26;Trial_length=6000;
myfolder = dir('/media/naveen/nav/mat_codes/BioPatRec/sub_wise/S*');
% fullMatFileName = fullfile(destdirectory,  'gesture_rawdata.mat')
L=length(myfolder);
for sub=1:L
 basefilename=myfolder(sub).name;
 fullfilename=fullfile(myfolder(sub).folder,basefilename);
 tempdata=load(fullfilename);
 sub_data=tempdata.sub_wise_data; 
 
 [Train_raw_data Test_raw_data]=fn_final_train_test_split_13(sub_data,Trial_length,n_class);
 
% Train_process_sub_wise_data = fn_raw_trial_nb(Train_raw_data,Trial_length);
Train_process_data = [Train_process_data;Train_raw_data];
% Test_process_sub_wise_data = fn_raw_trial_nb(Test_raw_data,Trial_length);
Test_process_data = [Test_process_data;Test_raw_data];
 
destdirectory = '/media/naveen/nav/mat_codes/BioPatRec/no_prep/sub_wise_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination, Train_raw_data);
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination, Test_raw_data);
disp(sub);
end
destdirectory = '/media/naveen/nav/mat_codes/BioPatRec/no_prep/Total_process_TT/';
mkdir(destdirectory);   %create the directory
file1 = sprintf('Biopatrec_26class_17sub_train_no_prep.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
csvwrite(fulldestination, Train_process_data); 
file2 = sprintf('Biopatrec_26class_17sub_test_no_prep.csv');
fulldestination = fullfile(destdirectory, file2);%name file relative to that directory
csvwrite(fulldestination, Test_process_data); 
% file3=sprintf('rami_15class_8sub_TT.mat');
% fulldestination = fullfile(destdirectory, file3);
% save(fulldestination, 'train_process_data','test_process_data');
