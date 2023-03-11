clc;
clear all;
close all;
%###################### Training feature extraction ###########################
dest1=dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise_AR_Train_split/S*');
n_sub = length(dest1);
seg_size = 16;
train_feat_action_rest = [];

for sub = 1:1:n_sub
    data_sub=[];
    baseFileName = dest1(sub).name;
    fullFileName = fullfile(dest1(sub).folder, baseFileName);
    tempdata = load(fullFileName);
    data_sub = tempdata.train_split_sub_wise_data;
    [m1,n1]=size(data_sub);
    x = logical(diff(data_sub(:,end)));
    L = length(x);
    count = 1;
    label_vec = [];
    index =1;
    for i=1:1:L
        if(x(i) == 0)
            if(i==L)
              count = count+1;  
              label_vec = [label_vec; index*ones(count,1)];
            else
            count = count+1;
            end
            
        else
            label_vec = [label_vec; index*ones(count,1)];
            index = index+1;
            count =1;
        end
    end
    data_sub = [data_sub(:,1:end-1) label_vec];  
    actual_trial_numbers=unique(data_sub(:,end));
    no_trials = length(actual_trial_numbers);
    actual_class_numbers=unique(data_sub(:,end-1));
    no_classes = length(actual_class_numbers);
    
    for k = 1:1:no_classes-1
        ind1 = find(data_sub(:,end-1)==k);
        data_sub(ind1,end-1)=1;
    end
    new_class_numbers=unique(data_sub(:,end-1));
    new_no_classes = length(new_class_numbers);
    for j = 1:1:no_trials
        feat_action =[];
        feat_rest =[]; feat_action_rest_trial = [];
        sub_trial_class = data_sub(data_sub(:,end) == j,:);
        Action_data = sub_trial_class(sub_trial_class(:,end-1)==1,:);
        Rest_data = sub_trial_class(sub_trial_class(:,end-1)==0,:);
        feat_action = [feat_action; fn_feat_AR(fn_prep_AR(Action_data),seg_size)];
        feat_rest = [feat_rest; fn_feat_AR(fn_prep_AR(Rest_data),seg_size)];
        feat_action_rest_trial = [feat_action; feat_rest];
        train_feat_action_rest = [train_feat_action_rest; feat_action_rest_trial];
    end                      
end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/train_feat_AR_seg/';
mkdir(destdirectory);   %create the director
file = sprintf('ninaDB1_sEMG_train_feat_AR_data.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'train_feat_action_rest');

