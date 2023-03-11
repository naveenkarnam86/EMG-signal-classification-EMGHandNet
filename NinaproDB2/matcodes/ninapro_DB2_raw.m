%%%%%%%%% program for raw data extraction from dataset and to split train
%%%%%%%%% and test
clc;
clear all;
close all;
data=[];    
main=dir('/media/naveen/nav/mat_codes/nina_DB2_codes/DB2/*');
% for i=3:1:length(main)
data=[];
for i=3:1:length(main)
z1=fullfile('/media/naveen/nav/mat_codes/nina_DB2_codes/DB2',main(i).name,'/*.mat');
ninaDB2=dir(z1);
%     for m=3:1:length(ninaDB4)
 d1=[];d2=[];d2_struct=[];
   for m=1:1:length(ninaDB2)
    z1a=fullfile('/media/naveen/nav/mat_codes/nina_DB2_codes/DB2',main(i).name,ninaDB2(m).name);
    d1=importdata(z1a);
%     l=size(d1.emg,1);
%     exercise=d1.exercise.*(ones(l,1));
    d2={d1.emg, d1.stimulus, d1.repetition};
    rowHeadings = {'emg', 'stimulus','repetition'};
    d2_struct =cell2struct(d2,rowHeadings,2);
%     d2_struct=double(d2_struct);
    data=[data;d2_struct];
%     data=double(data);
    d1=[];d2=[];d2_struct=[];
   end
 end
% end
%  

% % Replacing class labels of 1,2,3,...12 to 18,19,...29 for exrecise 2
% % Replacing class labels of 1,2,3,...23 to 30,31,...52 for exrecise 3
% for j=1:1:length(data)
%       if(data(j).exercise==2)
%          d2=data(j).stimulus;
%          newvalue=[18,19,20,21,22,23,24,25,26,27,28,29];
%          oldvalue=[1,2,3,4,5,6,7,8,9,10,11,12];
%          d4=changem(d2,newvalue,oldvalue);
%          data(j).stimulus=d4;
%         end
%        if(data(j).exercise==3)
%          d3=data(j).stimulus;
%          newvalue=[30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52];
%          oldvalue=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
%          d5=changem(d3,newvalue,oldvalue);
%          data(j).stimulus=d5;
%        end
% end 
  data_combined=[]; 
  d1=[];data_t=[];
  Trial_length=10000;
  n_class = 49;
  n_trail = 6;
  for j = 1:3:length(data)
  rep = [data(j).repetition;data(j+1).repetition;data(j+2).repetition];
  sti = [data(j).stimulus;data(j+1).stimulus;data(j+2).stimulus];
  data_t = [double(data(j).emg) double(data(j).stimulus);...
      double(data(j+1).emg) double(data(j+1).stimulus);...
      double(data(j+2).emg) double(data(j+2).stimulus)];
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
  data_combined = [data_combined;d1(1:Trial_length,:)];
  d1=[];
  end
  end
   end
  
  
% class wise data combined
data_class_Total=[];
data_class_Total=[data_class_Total;fn_class_wise_nina_DB2(data_combined,n_class)];

destdirectory = '/media/naveen/nav/mat_codes/nina_DB2_codes/rawdata/';
mkdir(destdirectory);   %create the director
file = sprintf('nina_DB2_classwise.mat');
fulldestination = fullfile(destdirectory, file);
save(fulldestination, 'data_class_Total', '-v7.3');


