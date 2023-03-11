% function [train, test] = fn_final_Train_test_split
clc;clear all;close all;
train = []; test = []; val =[]; sub_count =0; 
train_raw_data=[]; test_raw_data=[]; valid_raw_data =[];
for sub = [1:8] % taking individual subjects into consideration
    destdirectory = 'D:\EMG\mat_codes\Ramikushaba\sub_wise';
    file = sprintf('S%d.mat',sub);
    fullMatFileName = fullfile(destdirectory,  file)
    tempdata = load(fullMatFileName);
    gesture_data = tempdata.Total_data;
    [m,n]=size(gesture_data);
for i = 1:15 % taking individual class into consideration
%     i=class_label
data1=gesture_data(gesture_data(:,n)==i,:); % one class data
L = length(data1);
    samples_per_trial = 20000;
    nbTrials = floor(L/samples_per_trial);
    nbChannels = size(data1,2);
    nbSamples = nbTrials*samples_per_trial;
    data2 = data1(1:nbSamples,:); % one tyrail dATA
[T class_trial] = fn_trial_wise_labeling(data2,samples_per_trial);
RG = linspace(1,T,T);
[train_tmp test_tmp] = fn_Train_test_split(T, class_trial, RG);
train = [train;train_tmp];
test =  [test;test_tmp];
% val =   [val;val_tmp];
end
train = train(:,1:n);
test = test(:,1:n);
% val =val(:,1:n);
destdirectory = 'D:\EMG\mat_codes\Ramikushaba\subwise_15classdata';
mkdir(destdirectory);   %create the directory
file = sprintf('S%d.mat',sub);
fulldestination = fullfile(destdirectory, file);%name file relative to that directory
save(fulldestination, 'train','test');
sub_count = sub_count+1;
fprintf('sub_count:%d\n',sub_count);
train_raw_data = [train_raw_data;train];
test_raw_data = [test_raw_data;test];
% valid_raw_data = [valid_raw_data;val];
train_tmp =[]; test_tmp =[]; val_tmp=[]; train=[]; test=[]; val =[];
end
destdirectory = 'D:\EMG\mat_codes\Ramikushaba\subwise_15classdata';
mkdir(destdirectory);   %create the directory
file = sprintf('gesture_rawdata.mat');
fulldestination = fullfile(destdirectory, file);%name file relative to that directory
save(fulldestination, 'train_raw_data','test_raw_data'); 
