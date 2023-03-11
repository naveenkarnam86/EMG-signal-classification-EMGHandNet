clc;
clear all;
close all;
train_process_sub_wise_data=[];
test_process_sub_wise_data=[];
train_feat_subject_wise_data = []; test_feat_data = [];
train_feat_total_data=[];test_feat_total_data=[];
N_sub = 17;Trail_length=6000;
destdirectory1 = '/media/naveen/nav/mat_codes/BioPatRec/prep_LP_EMD_hht_wave/sub_wise_process_TT/';
for sub=1:N_sub
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory1, file1);
train_process_sub_wise_data = csvread(fulldestination);
train_feat_subject_wise_data = fn_trial_EMD_hht_wave(train_process_sub_wise_data,Trail_length);
train_feat_subject_wise_data(isinf(train_feat_subject_wise_data)|isnan(train_feat_subject_wise_data))=0;
train_feat_total_data=[train_feat_total_data;train_feat_subject_wise_data];
train_feat_subject_wise_data=[];
disp(sub);
end
for sub=1:N_sub
file1 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory1, file1);
test_process_sub_wise_data = csvread(fulldestination);
test_feat_subject_wise_data = fn_trial_EMD_hht_wave(test_process_sub_wise_data,Trail_length);
test_feat_subject_wise_data(isinf(test_feat_subject_wise_data)|isnan(test_feat_subject_wise_data))=0;
test_feat_total_data=[test_feat_total_data;test_feat_subject_wise_data];
test_feat_subject_wise_data=[];
disp(sub);
end