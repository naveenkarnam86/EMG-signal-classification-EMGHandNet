%%%%%%%%% program for raw data extraction from dataset and to split train
%%%%%%%%% and test
clc;
clear all;
close all;
data=[];    
main=dir('/media/naveen/nav/mat_codes/nina_DB4_codes/DB4/*');
% for i=3:1:length(main)
for i=3:1:length(main)
z1=fullfile('/media/naveen/nav/mat_codes/nina_DB4_codes/DB4',main(i).name,'/*.mat');
ninaDB4=dir(z1);
%     for m=3:1:length(ninaDB4)
    for m=1:1:length(ninaDB4)
    z1a=fullfile('/media/naveen/nav/mat_codes/nina_DB4_codes/DB4',main(i).name,ninaDB4(m).name);
    d1=importdata(z1a);
    data=[data;d1];
    end
   
end
%  

% Replacing class labels of 1,2,3,...12 to 18,19,...29 for exrecise 2
% Replacing class labels of 1,2,3,...23 to 30,31,...52 for exrecise 3
for j=1:1:length(data)
      if(data(j).exercise==2)
         d2=data(j).stimulus;
         newvalue=[18,19,20,21,22,23,24,25,26,27,28,29];
         oldvalue=[1,2,3,4,5,6,7,8,9,10,11,12];
         d4=changem(d2,newvalue,oldvalue);
         data(j).stimulus=d4;
        end
       if(data(j).exercise==3)
         d3=data(j).stimulus;
         newvalue=[30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52];
         oldvalue=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
         d5=changem(d3,newvalue,oldvalue);
         data(j).stimulus=d5;
       end
end 
  data_combined=[]; 
  data1=[];d1=[];
  Trial_length=10000;
  n_class = 52;
  n_trail = 6;
  n_sub = 40;
  s=1;
  for j = 1:3:length(data)
  sub_wise_data=[];
  rep = [data(j).repetition; data(j+1).repetition; data(j+2).repetition];
  sti = [data(j).stimulus;data(j+1).stimulus;data(j+2).stimulus];
  data_t = [data(j).emg data(j).stimulus;...
      data(j+1).emg data(j+1).stimulus;...
      data(j+2).emg data(j+2).stimulus];
  for i = 1:1:n_class
  for k = 1:1:n_trail    
  ind = find (rep == k & sti == i);    
  data_vec = data_t(ind,:);
  [p,q]=size(data_vec);
  L = abs(Trial_length-p);
  class_vec = i*ones(L,1);
  zero_vec = zeros(L,q-1);
  zero_padd = [zero_vec class_vec];
%   class_label = data_vec(:,q);
  d1= [data_vec;zero_padd];   
  sub_wise_data=[sub_wise_data;d1(1:Trial_length,:)];
  data_combined = [data_combined;d1(1:Trial_length,:)];
  d1=[];
  end
  end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/olsson_DB4/sub_wise/';
mkdir(destdirectory);   %create the director
file = sprintf('S%d.mat',s);
fulldestination = fullfile(destdirectory, file);%name file relative to that directory
save(fulldestination, 'sub_wise_data');
s=s+1;
  end
  
  
% class wise data combined
data_class_Total=[];
data_class_Total=[data_class_Total;fn_class_wise_nina_E123(data_combined)];

destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/rawdata/';
mkdir(destdirectory);   %create the director
file = sprintf('nina_DB4_sEMG_classwise.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'data_class_Total');


