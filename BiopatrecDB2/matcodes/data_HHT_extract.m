% code to save HHT into a single file
clc; clear all; close all;
train_process_sub_wise_data=[];
test_process_sub_wise_data=[];
train_process_data = []; test_process_data = [];
N_sub = 17;
destdirectory1 = '/media/naveen/nav/mat_codes/BioPatRec/prep_LP_EMD_hht_wave/sub_wise_process_TT/';
for sub=1:N_sub
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory1, file1);
train_process_sub_wise_data = csvread(fulldestination);
train_process_data=[train_process_data;train_process_sub_wise_data];
train_process_sub_wise_data=[];
disp(sub);
end

destdirectory2 = '/media/naveen/nav/mat_codes/BioPatRec/prep_LP_EMD_hht_wave/Total_process_TT/';
mkdir(destdirectory2);   %create the directory
file1 = sprintf('Biopatrec_26c_17s_LP_EMD_hht_wave_train.csv');
fulldestination = fullfile(destdirectory2, file1);%name file relative to that directory
csvwrite(fulldestination, train_process_data); 

file3 = sprintf('Biopatrec_26c_17s_LP_EMD_hht_wave_train_mat.mat');
fulldestination = fullfile(destdirectory2, file3);
save(fulldestination, 'train_process_data');
train_process_data = [];

for sub=1:N_sub
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory1, file2);
test_process_sub_wise_data = csvread(fulldestination);
test_process_data=[test_process_data;test_process_sub_wise_data];
test_process_sub_wise_data=[];
disp(sub);
end

file2 = sprintf('Biopatrec_26c_17s_LP_EMD_hht_wave_test.csv');
fulldestination = fullfile(destdirectory2, file2);%name file relative to that directory
csvwrite(fulldestination, test_process_data); 

file4 = sprintf('Biopatrec_26c_17s_LP_EMD_hht_wave_test_mat.mat');
fulldestination = fullfile(destdirectory2, file4);
save(fulldestination, 'test_process_data');
test_process_data = [];