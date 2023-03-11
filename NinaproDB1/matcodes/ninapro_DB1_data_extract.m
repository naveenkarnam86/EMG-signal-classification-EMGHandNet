%%%%%%%%% program for raw data extraction from dataset and to split train
%%%%%%%%% and test
clc;
clear all;
close all;
data=[];    
main=dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Ninapro/*');
z1=fullfile('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Ninapro',main(3).name,'/*');
ninaDB1=dir(z1); 
%loading data from mat files
% length(ninaDB1)
for i=3:1:length(ninaDB1)
     
    z2=fullfile('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Ninapro',main(3).name,ninaDB1(i).name,'/*.mat');
    nina_s=dir(z2);
    for m1=1:1:length(nina_s)
        z4pa=fullfile('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Ninapro',main(3).name,ninaDB1(i).name,nina_s(m1).name);
        d1=importdata(z4pa);
        data=[data;d1];
    end
  
end
d2=[];
% Replacing class labels of 1,2,3,...17 to 13,14,...29 for exrecise 2
% Replacing class labels of 1,2,3,...23 to 30,31,...52 for exrecise 3
for j=1:1:length(data)
      if(data(j).exercise==2)
         d2=data(j).stimulus;
         newvalue=[13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];
         oldvalue=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
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
  Trial_length=500;
  n_class = 52;
  n_trail = 10;
  n_sub=27;
  s=1;
  for j = 1:3:length(data)
  sub_wise=[];    
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
  sub_wise=[sub_wise;d1(1:Trial_length,:)];
  data_combined = [data_combined;d1(1:Trial_length,:)];
  d1=[];
  end
  end
  
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/sub_wise/';
mkdir(destdirectory);   %create the director
file = sprintf('S%d.mat',s);
fulldestination = fullfile(destdirectory, file);%name file relative to that directory
save(fulldestination, 'sub_wise');
s=s+1;
  end
 
% % class wise data combined
data_class_Total=[];
data_class_Total=[data_class_Total;fn_class_wise_nina_E123(data_combined,n_class)];

destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/rawdata/';
mkdir(destdirectory);   %create the director
file = sprintf('nina_sEMG_raw_data_classwise.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'data_class_Total');

