clc;
clear all;
close all;
dest1=dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Data_Trial_labelled/sub_wise/S*');
n_sub = length(dest1);
Train_split_Total_data=[];
Test_split_Total_data=[];
for sub = 1:1:n_sub
    data_sub=[];
    baseFileName = dest1(sub).name;
    fullFileName = fullfile(dest1(sub).folder, baseFileName);
    tempdata = load(fullFileName);
    data_sub = tempdata.Trial_data;
    [m1,n1]=size(data_sub);
    test_split = [2,5,7];
    train_split = [1,3,4,6,8,9,10];
    test_split_sub_wise_data =[];
    train_split_sub_wise_data = [];
    
    data_vec1 = data_sub(data_sub(:,n1-2) == 1,:);
    data_vec2 = data_sub(data_sub(:,n1-2) == 2,:);
    data_vec3 = data_sub(data_sub(:,n1-2) == 3,:);
    data_vec4 = data_sub(data_sub(:,n1-2) == 4,:);
    data_vec5 = data_sub(data_sub(:,n1-2) == 5,:);
    data_vec6 = data_sub(data_sub(:,n1-2) == 6,:);
    data_vec7 = data_sub(data_sub(:,n1-2) == 7,:);
    data_vec8 = data_sub(data_sub(:,n1-2) == 8,:);
    data_vec9 = data_sub(data_sub(:,n1-2) == 9,:);
    data_vec10 = data_sub(data_sub(:,n1-2) == 10,:);

  
    test_split_sub_wise_data = [data_vec2;data_vec5;data_vec7];
    train_split_sub_wise_data = [data_vec1;data_vec3;data_vec4;data_vec6;data_vec8;data_vec9;data_vec10];
   
   Train_split_Total_data = [Train_split_Total_data;train_split_sub_wise_data];
   Test_split_Total_data = [Test_split_Total_data;test_split_sub_wise_data];
   destdirectory1 = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise_AR_Train_split/';
   mkdir(destdirectory1);   %create the director
   file1 = sprintf('S%d_tr.mat',sub);
   fulldestination = fullfile(destdirectory1, file1);%name file relative to that directory
   save(fulldestination, 'train_split_sub_wise_data');
   destdirectory2 = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise_AR_Test_split/';
   mkdir(destdirectory2);
   file2 = sprintf('S%d_tt.mat',sub);
   fulldestination = fullfile(destdirectory2, file2);
   save(fulldestination, 'test_split_sub_wise_data');
end

destdirectory3 = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Total_process_AR_TT_split/';
mkdir(destdirectory3); 
file3 = sprintf('nina_pro_naveen_DB1_AR_Train.mat');
fulldestination = fullfile(destdirectory3, file3);
save(fulldestination, 'Train_split_Total_data');
file4 = sprintf('nina_pro_naveen_DB1_AR_Test.mat');
fulldestination = fullfile(destdirectory3, file4);
save(fulldestination, 'Test_split_Total_data');