function  [Train_all Test_all] =fn_final_train_test_split_25_featmap(rawdata,Trial_length,n_class)
Train_all=[];
valid_all=[];
Test_all=[];
n_class=n_class;
selected_class=[1,10,25,30,40,52];
[m,n]=size(rawdata);
% step = Trial_length;
    for i=1:numl(selected_class)    
        classwisedata=rawdata(rawdata(:,n)==i,:);
         [classwisedata_TS,Total_trials_perclass]=fn_trial_labelling_DB4(classwisedata,Trial_length);
       [train test] = fn_Train_test_split_classwise_25_featmap(classwisedata_TS,Total_trials_perclass);
%         Trial = fn_trial_wise_data_split_E123(classwisedata_TS)
        Train_all=[Train_all;train];
%         valid_all=[valid_all;valid];
        Test_all=[Test_all;test];
    end
   Train_all = Train_all(:, 1:n);
%    valid_all =valid_all(:, 1:11);
   Test_all = Test_all(:, 1:n);
return 