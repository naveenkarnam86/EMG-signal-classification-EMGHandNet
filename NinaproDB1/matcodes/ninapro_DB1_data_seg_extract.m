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
  n_trial = 10;
  n_sub=27;
  s=1;
%   for s = 1:1:n_sub
destdirectory = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Data_whole_asitis/sub_wise/';
mkdir(destdirectory);
 sub_wise =[];     
  for j = 1:1:length(data)
  rep = [data(j).repetition];
  sti = [data(j).stimulus];
  data_t = [data(j).emg rep sti];
  ind = find (rep == 1);    
  data_vec = data_t(ind(1,1):length(sti),:); %ind(1,1):):
  [p,q]=size(data_vec);

  if (mod(j,3)==0)
    file = sprintf('S%d.mat',s);
    fulldestination = fullfile(destdirectory, file);%name file relative to that directory
    sub_wise=[sub_wise;data_vec];
    save(fulldestination, 'sub_wise');
    s=s+1;
    sub_wise =[]; 
  else
    sub_wise=[sub_wise;data_vec];
  end
  rep =[];
  sti =[];
  data_t =[];
  data_vec=[];
  end
  
    dest1 = dir('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Data_whole_asitis/sub_wise/S*');
    l1 = length(dest1);
    destdirectory1 = '/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Data_Trial_labelled/sub_wise/';
    mkdir(destdirectory1);
   for sub = 1:1:n_sub
    data_sub=[];
%    y1=fullfile('/media/naveen/nav/mat_codes/nina_DB1_codes/nina_prep_python/Data_whole_asitis/sub_wise/S%d.mat',sub);
%    data_sub = load(y1);
    baseFileName = dest1(sub).name;
    fullFileName = fullfile(dest1(sub).folder, baseFileName);
    tempdata = load(fullFileName);
    data_sub = tempdata.sub_wise;
    [p,q] = size(data_sub);
    Trial_data = []; count =0; count_vec=[];
      for i = 1:1:n_class
      for k = 1:1:n_trial
        if(k==n_trial & i==n_class)
            ind1 = find(data_sub(:,end-1)==k & data_sub(:,end)==i);
            L1 =length(ind1);
            first_pos = ind1(end,1)+1;
%             ind2 = find(data_sub(:,end-1)==1 & data_sub(:,end)==i+1);
            second_pos = length(data_sub);
            L = second_pos-first_pos;
            trial_vec = k*ones(L+1,1);
            trial_vec = trial_vec(:);
            data_sub(first_pos:second_pos,end-1)=trial_vec;
            f1_pos = ind1(1,1);
            count = count+1;
            count_vec = count*ones(L1+L+1,1);
            data_vec = data_sub(f1_pos:second_pos,:);
            t1_data = [data_vec count_vec];
            Trial_data = [Trial_data; t1_data];
            file = sprintf('S%d.mat',sub);
            fulldestination = fullfile(destdirectory1, file);%name file relative to that directory
            save(fulldestination, 'Trial_data');
        else if(k==n_trial)
            ind1 = find(data_sub(:,end-1)==k & data_sub(:,end)==i);
            L1 =length(ind1);
            first_pos = ind1(end,1)+1;
            ind2 = find(data_sub(:,end-1)==1 & data_sub(:,end)==i+1);
            second_pos = ind2(1,1)-1;
            L = second_pos-first_pos;
            trial_vec = k*ones(L+1,1);
            trial_vec = trial_vec(:);
            data_sub(first_pos:second_pos,end-1)=trial_vec; 
            f1_pos = ind1(1,1);
            count = count+1;
            count_vec = count*ones(L1+L+1,1);
            data_vec = data_sub(f1_pos:second_pos,:);
            t1_data = [data_vec count_vec];
            Trial_data = [Trial_data; t1_data];
        else
            ind1 = find(data_sub(:,end-1)==k & data_sub(:,end)==i);
            L1 =length(ind1);
            first_pos = ind1(end,1)+1;
            ind2 = find(data_sub(:,end-1)==k+1 & data_sub(:,end)==i);
            second_pos = ind2(1,1)-1;
            L = second_pos-first_pos;
            trial_vec = k*ones(L+1,1);
            trial_vec = trial_vec(:);
            data_sub(first_pos:second_pos,end-1)=trial_vec;
            f1_pos = ind1(1,1);
            count = count+1;
            count_vec = count*ones(L1+L+1,1);
            data_vec = data_sub(f1_pos:second_pos,:);
            t1_data = [data_vec count_vec];
            Trial_data = [Trial_data; t1_data];
            end
        end
      end
      end
   end

