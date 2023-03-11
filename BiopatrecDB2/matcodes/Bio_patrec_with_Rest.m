clc;
clear all;
close all;
aggressive_data=[];
sub_wise_data=[];
rawdata=[];
main=dir('/media/naveen/nav/mat_codes/BioPatRec/17sub_27class_3trials/*');
L=length(main);
% Agressive data loading
% z1_agg=fullfile('D:\EMG\mat_codes\Ramikushaba\',main(3).name,'/*');
% sub_agg=dir(z1_agg);
Trial_length_WR=36000;
Trial_length=6000;
for i=3:1:L
  z2_agg=fullfile('/media/naveen/nav/mat_codes/BioPatRec/17sub_27class_3trials/',main(i).name); 
  sub1_agg=dir(z2_agg);
  data_whole=load(z2_agg);
  data1=data_whole.recSession.tdata;
  [m1,n1,p1]=size(data1);
  data2 = permute(data1,[2,1,3]);
  data3 = data2(:,:)';
  [m2,n2]=size(data3);
  class_label=1;
%   for k=0:m1:m2
    for j=0:Trial_length_WR:m2-Trial_length_WR
      class_vec=class_label*ones(Trial_length_WR,1);
      trial_data=data3(j+1:j+Trial_length_WR,:);
      trial_cl=[trial_data class_vec];
      sub_wise_data=[sub_wise_data;trial_cl];
      class_label=class_label+1; 

  end
      
destdirectory = '/media/naveen/nav/mat_codes/BioPatRec/sub_wise_WR';
mkdir(destdirectory);   %create the director
file = sprintf('S%d.mat',i-2);
fulldestination = fullfile(destdirectory, file);%name file relative to that directory
save(fulldestination, 'sub_wise_data');
sub_wise_data=[];
end