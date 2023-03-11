function  [trial_wisedata] =fnb_final_train_test_split_E123(rawdata)
trial_wisedata=[];
for i=1:1:52     
        classwisedata=rawdata(rawdata(:,11)==i,:);
[T class_trial] = fnb_trial_wise_labeling(classwisedata);
trial_wisedata =[trial_wisedata; class_trial];
class_trial=[];
    end
    end
