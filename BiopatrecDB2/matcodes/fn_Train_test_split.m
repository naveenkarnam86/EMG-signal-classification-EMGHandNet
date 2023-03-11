function [train, test] = fn_Train_test_split(T, data, RG)
T = T; % total no of trials per sub
n = size(data,2); % no of Channels
[RG1 I] = fn_shuffle(RG');
RG1 = RG1';
X = floor((T*70)/100); % train data
% Z = ceil((T*10)/100); % val data
Y = T-X;           % test data  
 test_split = RG1(1:Y);
%  val_split = RG1(Y+1:Z+Y);
 train_split = RG1(Y+1:T);
 test_split_data =[];
 train_split_data = [];
%  val_split_data =[];
 for i = [1:Y]   % test data splitting
 test_split_data = [test_split_data; data(data(:,n)==test_split(i),:)];
 end
%  for k = [1:Z]    % val data splitting
%  val_split_data = [val_split_data; data(data(:,n)==val_split(k),:)];
%  end
 for  j = 1:X % train data splitting
 train_split_data = [train_split_data; data(data(:,n)==train_split(j),:)];
 end
 train  = train_split_data;
%  val = val_split_data;
 test =  test_split_data; 
 return 
 