vec=[]; 
  data1=[];
  trial_length=485;
  n_class = 52;
  n_trail = 10;
  for j = 1:3:length(data)
  rep = [data(j).repetition; data(j+1).repetition; data(j+2).repetition];
  sti = [data(j).stimulus;data(j+1).stimulus;data(j+2).stimulus];
  data_t = [data(j).emg data(j).stimulus;...
      data(j+1).emg data(j+1).stimulus;...
      data(j+2).emg data(j+2).stimulus];
  for i = 1:1:n_class
  for k = 1:1:n_trail    
  ind = find (rep == k & sti == i);    
  data_vec = data_t(ind,:);
  d1= data_vec(1:trial_length,:);    
  vec = [vec;d1];
  end
  end
  end

 