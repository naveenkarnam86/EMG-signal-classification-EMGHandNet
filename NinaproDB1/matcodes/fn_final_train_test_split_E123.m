function  [Train_all valid_all Test_all] =fn_final_train_test_split(rawdata,Trial_length)
Train_all=[];
valid_all=[];
Test_all=[];
% step = Trial_length;
    for i=1:1:52    
        classwisedata=rawdata(rawdata(:,11)==i,:);
         classwisedata_TS=fn_trial_labelling_E123(classwisedata,Trial_length);
       [train valid test] = fn_Train_test_split_classwise(classwisedata_TS);
%         Trial = fn_trial_wise_data_split_E123(classwisedata_TS)
        Train_all=[Train_all;train];
        valid_all=[valid_all;valid];
        Test_all=[Test_all;test];
    end
   Train_all = Train_all(:, 1:11);
   valid_all =valid_all(:, 1:11);
   Test_all = Test_all(:, 1:11);
return 