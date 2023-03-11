% code for taking random trial data for plots
clc;
clear all;
close all;
myfolder = dir('/media/naveen/nav/mat_codes/nina_DB4_codes/naveen_prep_nlw/sub_wise_process_TT/S*_tt.csv');
sub_list = [1,2,3,4,5,6,7,8,9,10];
no_of_subjects=10;
for sub = [1,2,3,4,5,6,7,8,9,10]
%  myfolder = dir('/media/naveen/nav/mat_codes/nina_DB4_codes/naveen_prep_nlw/sub_wise_process_TT/S*_tr.csv',sub);
 baseFileName = myfolder(sub).name;
 fullFileName = fullfile(myfolder(sub).folder, baseFileName);
 tempdata = load(fullFileName);
%  sub_data = tempdata.Train_process_sub_wise_data;
%  S%d_tr.csv
 [m,n]= size(tempdata);
 if( sub==1 )
      s1_c1_data = tempdata(tempdata(:,n)==1,:);
      destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/featmap_trials/';
      mkdir(destdirectory);   %create the director

      s1_c10_data = tempdata(tempdata(:,n)==6,:);
      s1_c15_data = tempdata(tempdata(:,n)==18,:);
      s1_c25_data = tempdata(tempdata(:,n)==26,:);
      s1_c35_data = tempdata(tempdata(:,n)==28,:);
      s1_c40_data = tempdata(tempdata(:,n)==37,:);
      s1_c45_data = tempdata(tempdata(:,n)==44,:);
      s1_c1_15_data=[s1_c1_data; s1_c10_data ; s1_c15_data ;s1_c25_data; s1_c35_data;s1_c40_data ; s1_c45_data];
 end
   if(sub==2)
      s2_c1_data = tempdata(tempdata(:,n)==1,:);
      s2_c10_data = tempdata(tempdata(:,n)==6,:);
      s2_c15_data = tempdata(tempdata(:,n)==18,:);
      s2_c25_data = tempdata(tempdata(:,n)==26,:);
      s2_c35_data = tempdata(tempdata(:,n)==28,:);
      s2_c40_data = tempdata(tempdata(:,n)==37,:);
      s2_c45_data = tempdata(tempdata(:,n)==44,:);
      s2_c1_15_data=[s2_c1_data; s2_c10_data ; s2_c15_data ; s2_c25_data; s2_c35_data;s2_c40_data ; s2_c45_data];
   end
    if(sub==3)
      s3_c1_data = tempdata(tempdata(:,n)==1,:);
      s3_c10_data = tempdata(tempdata(:,n)==6,:);
      s3_c15_data = tempdata(tempdata(:,n)==18,:);
      s3_c25_data = tempdata(tempdata(:,n)==26,:);
      s3_c35_data = tempdata(tempdata(:,n)==28,:);
      s3_c40_data = tempdata(tempdata(:,n)==37,:);
      s3_c45_data = tempdata(tempdata(:,n)==44,:);
      s3_c1_15_data=[s3_c1_data; s3_c10_data ; s3_c15_data ;s3_c25_data; s3_c35_data;s3_c40_data ; s3_c45_data];
    end
      if(sub==4)
      s4_c1_data = tempdata(tempdata(:,n)==1,:);
      s4_c10_data = tempdata(tempdata(:,n)==6,:);
      s4_c15_data = tempdata(tempdata(:,n)==18,:);
      s4_c25_data = tempdata(tempdata(:,n)==26,:);
      s4_c35_data = tempdata(tempdata(:,n)==28,:);
      s4_c40_data = tempdata(tempdata(:,n)==37,:);
      s4_c45_data = tempdata(tempdata(:,n)==44,:);
      s4_c1_15_data=[s4_c1_data; s4_c10_data ; s4_c15_data ;s4_c25_data; s4_c35_data;s4_c40_data ; s4_c45_data];
      end
      if(sub==5)
      s5_c1_data = tempdata(tempdata(:,n)==1,:);
      s5_c10_data = tempdata(tempdata(:,n)==6,:);
      s5_c15_data = tempdata(tempdata(:,n)==18,:);
      s5_c25_data = tempdata(tempdata(:,n)==26,:);
      s5_c35_data = tempdata(tempdata(:,n)==28,:);
      s5_c40_data = tempdata(tempdata(:,n)==37,:);
      s5_c45_data = tempdata(tempdata(:,n)==44,:);
      s5_c1_15_data=[s5_c1_data; s5_c10_data ; s5_c15_data ;s5_c25_data; s5_c35_data;s5_c40_data ; s5_c45_data];
      end
  if(sub==6)
      s6_c1_data = tempdata(tempdata(:,n)==1,:);
      s6_c10_data = tempdata(tempdata(:,n)==6,:);
      s6_c15_data = tempdata(tempdata(:,n)==18,:);
      s6_c25_data = tempdata(tempdata(:,n)==26,:);
      s6_c35_data = tempdata(tempdata(:,n)==28,:);
      s6_c40_data = tempdata(tempdata(:,n)==37,:);
      s6_c45_data = tempdata(tempdata(:,n)==44,:);
      s6_c1_15_data=[s6_c1_data; s6_c10_data ; s6_c15_data ; s2_c25_data;s6_c35_data;s6_c40_data ; s6_c45_data];
  end

  if(sub==7)
     s7_c1_data = tempdata(tempdata(:,n)==1,:);
      s7_c10_data = tempdata(tempdata(:,n)==6,:);
      s7_c15_data = tempdata(tempdata(:,n)==18,:);
      s7_c25_data = tempdata(tempdata(:,n)==26,:);
      s7_c35_data = tempdata(tempdata(:,n)==28,:);
      s7_c40_data = tempdata(tempdata(:,n)==37,:);
      s7_c45_data = tempdata(tempdata(:,n)==44,:);
      s7_c1_15_data=[s7_c1_data; s7_c10_data ; s7_c15_data ;s7_c25_data; s7_c35_data;s7_c40_data ; s7_c45_data];
  end
      if(sub==8)
      s8_c1_data = tempdata(tempdata(:,n)==1,:);
      s8_c10_data = tempdata(tempdata(:,n)==6,:);
      s8_c15_data = tempdata(tempdata(:,n)==18,:);
      s8_c25_data = tempdata(tempdata(:,n)==26,:);
      s8_c35_data = tempdata(tempdata(:,n)==28,:);
      s8_c40_data = tempdata(tempdata(:,n)==37,:);
      s8_c45_data = tempdata(tempdata(:,n)==44,:);
      s8_c1_15_data=[s8_c1_data; s8_c10_data ; s8_c15_data ;s8_c25_data; s8_c35_data;s8_c40_data ; s8_c45_data];
      end
      if(sub==9)
      s9_c1_data = tempdata(tempdata(:,n)==1,:);
      s9_c10_data = tempdata(tempdata(:,n)==6,:);
      s9_c15_data = tempdata(tempdata(:,n)==18,:);
      s9_c25_data = tempdata(tempdata(:,n)==26,:);
      s9_c35_data = tempdata(tempdata(:,n)==28,:);
      s9_c40_data = tempdata(tempdata(:,n)==37,:);
      s9_c45_data = tempdata(tempdata(:,n)==44,:);
      s9_c1_15_data=[s9_c1_data; s9_c10_data ; s9_c15_data ;s9_c25_data; s9_c35_data;s9_c40_data ; s9_c45_data];
     end
      if(sub==10)
      s10_c1_data = tempdata(tempdata(:,n)==1,:);
      s10_c10_data = tempdata(tempdata(:,n)==6,:);
      s10_c15_data = tempdata(tempdata(:,n)==18,:);
      s10_c25_data = tempdata(tempdata(:,n)==26,:);
      s10_c35_data = tempdata(tempdata(:,n)==28,:);
      s10_c40_data = tempdata(tempdata(:,n)==37,:);
      s10_c45_data = tempdata(tempdata(:,n)==44,:);
      s10_c1_15_data=[s10_c1_data; s10_c10_data ; s10_c15_data ;s10_c25_data; s10_c35_data;s10_c40_data ; s10_c45_data];
      end
end
  sall_30_data=[s1_c1_15_data; s2_c1_15_data; s3_c1_15_data; ...
      s4_c1_15_data; s5_c1_15_data; s6_c1_15_data;s7_c1_15_data;...
      s8_c1_15_data; s9_c1_15_data;s10_c1_15_data];
   file1 = sprintf('sall_trial_test.csv');
   fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
      % save(fulldestination, 'Train_process_data','Test_process_data');
   csvwrite(fulldestination,sall_30_data);
