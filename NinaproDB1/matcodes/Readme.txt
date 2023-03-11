nina_dataset.rar consists of ninapro DB1 dataset.

The folder contains the following files.

1) ninapro_DB_raw.m is the main file in which dataset is loaded. The data is preprocessed and generates the nina_sEMG_raw_data.mat file which contains the training and testing sample data. training data size is 5762016 (11232*513) X 11 and testing data size is 1440504 (2808*513) X 11. 

2) fn_raw_trial.m - This file extracts the trial wise data (513 X 10) from the class wise data and calls the function fn_preprocessing.m. 
3) fn_preprocessing.m - This file preprocess the trial wise data. The preprocessing includes moving average filtering, wavelet decomposition, and denoising processes.

4) fn_final_train_test_split_E123.m - This function calls the function fn_trial_labelling_E123.m which provides trial wise labelling for the whole class data. The trial labelled data is provided to the function fn_Train_test_split_classwise.m

5) fn_trial_labelling_E123.m - This function generates trial wise labelling for the classwise data 

6) fn_Train_test_split_classwise.m - This function calls the function fn_Train_test_split.m which splits the data according to trials. 

7) fn_Train_test_split.m - This function splits the data into trianing and testing 

8) fn_shuffle.m - This function shuffles the trial count




