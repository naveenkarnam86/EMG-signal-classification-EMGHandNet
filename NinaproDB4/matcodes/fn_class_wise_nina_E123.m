function p1_raw_class =fn_class_wise_nina_E123(data_combined)
p1_raw_class=[];
% class=[];
    n_class=52;
    [m,n]=size(data_combined);
    
    for i=1:1:n_class
    p1=data_combined(data_combined(:,n)==i,:);
    p1_raw_class=[p1_raw_class;p1];
    p1_length(i) = length(p1);
    p1 =[];
    end
    
    k=1:1:length(p1_length);
    stem(k,p1_length);
    
%     p1_01=data_combined(data_combined(:,11)==1,:);
%     p1_02=data_combined(data_combined(:,11)==2,:);
%     p1_03=data_combined(data_combined(:,11)==3,:);
%     p1_04=data_combined(data_combined(:,11)==4,:);
%     p1_05=data_combined(data_combined(:,11)==5,:);
%     p1_06=data_combined(data_combined(:,11)==6,:);
%     p1_07=data_combined(data_combined(:,11)==7,:);
%     p1_08=data_combined(data_combined(:,11)==8,:);
%     p1_09=data_combined(data_combined(:,11)==9,:);
%     p1_10=data_combined(data_combined(:,11)==10,:);
%     p1_11=data_combined(data_combined(:,11)==11,:);
%     p1_12=data_combined(data_combined(:,11)==12,:);
%     p1_13=data_combined(data_combined(:,11)==13,:);
%     p1_14=data_combined(data_combined(:,11)==14,:);
%     p1_15=data_combined(data_combined(:,11)==15,:);
%     p1_16=data_combined(data_combined(:,11)==16,:);
%     p1_17=data_combined(data_combined(:,11)==17,:);
%     p1_18=data_combined(data_combined(:,11)==18,:);
%     p1_19=data_combined(data_combined(:,11)==19,:);
%     p1_20=data_combined(data_combined(:,11)==20,:);
%     p1_21=data_combined(data_combined(:,11)==21,:);
%     p1_22=data_combined(data_combined(:,11)==22,:);
%     p1_23=data_combined(data_combined(:,11)==23,:);
%     p1_24=data_combined(data_combined(:,11)==24,:);
%     p1_25=data_combined(data_combined(:,11)==25,:);
%     p1_26=data_combined(data_combined(:,11)==26,:);
%     p1_27=data_combined(data_combined(:,11)==27,:);
%     p1_28=data_combined(data_combined(:,11)==28,:);
%     p1_29=data_combined(data_combined(:,11)==29,:);
%     p1_30=data_combined(data_combined(:,11)==30,:);
%     p1_31=data_combined(data_combined(:,11)==31,:);
%     p1_32=data_combined(data_combined(:,11)==32,:);
%     p1_33=data_combined(data_combined(:,11)==33,:);
%     p1_34=data_combined(data_combined(:,11)==34,:);
%     p1_35=data_combined(data_combined(:,11)==35,:);
%     p1_36=data_combined(data_combined(:,11)==36,:);
%     p1_37=data_combined(data_combined(:,11)==37,:);
%     p1_38=data_combined(data_combined(:,11)==38,:);
%     p1_39=data_combined(data_combined(:,11)==39,:);
%     p1_40=data_combined(data_combined(:,11)==40,:);
%     p1_41=data_combined(data_combined(:,11)==41,:);
%     p1_42=data_combined(data_combined(:,11)==42,:);
%     p1_43=data_combined(data_combined(:,11)==43,:);
%     p1_44=data_combined(data_combined(:,11)==44,:);
%     p1_45=data_combined(data_combined(:,11)==45,:);
%     p1_46=data_combined(data_combined(:,11)==46,:);
%     p1_47=data_combined(data_combined(:,11)==47,:);
%     p1_48=data_combined(data_combined(:,11)==48,:);
%     p1_49=data_combined(data_combined(:,11)==49,:);
%     p1_50=data_combined(data_combined(:,11)==50,:);
%     p1_51=data_combined(data_combined(:,11)==51,:);
%     p1_52=data_combined(data_combined(:,11)==52,:);
%     length of each class
%     p1_00_l=length(p1_00);p1_01_l=length(p1_01);
%     p1_02_l=length(p1_02);p1_03_l=length(p1_03);
%     p1_04_l=length(p1_04);p1_05_l=length(p1_05);
%     p1_06_l=length(p1_06);p1_07_l=length(p1_07);
%     p1_08_l=length(p1_08);p1_09_l=length(p1_09);
%     p1_10_l=length(p1_10);p1_11_l=length(p1_11);
%     p1_12_l=length(p1_12);p1_13_l=length(p1_13);
%     p1_14_l=length(p1_14);p1_15_l=length(p1_15);
%     p1_16_l=length(p1_16);p1_17_l=length(p1_17);
%     p1_18_l=length(p1_18);p1_19_l=length(p1_19);
%     p1_20_l=length(p1_20);p1_21_l=length(p1_21);
%     p1_22_l=length(p1_22);p1_23_l=length(p1_23);
%     p1_24_l=length(p1_24);p1_25_l=length(p1_25);
%     p1_26_l=length(p1_26);p1_27_l=length(p1_27);
%     p1_28_l=length(p1_28);p1_29_l=length(p1_29);
%     p1_30_l=length(p1_30);p1_31_l=length(p1_31);
%     p1_32_l=length(p1_32);p1_33_l=length(p1_33);
%     p1_34_l=length(p1_34);p1_35_l=length(p1_35);
%     p1_36_l=length(p1_36);p1_37_l=length(p1_37);
%     p1_38_l=length(p1_38);p1_39_l=length(p1_39);
%     p1_40_l=length(p1_40);p1_41_l=length(p1_41);
%     p1_42_l=length(p1_42);p1_43_l=length(p1_43);
%     p1_44_l=length(p1_44);p1_45_l=length(p1_45);
%     p1_46_l=length(p1_46);p1_47_l=length(p1_47);
%     p1_48_l=length(p1_48);p1_49_l=length(p1_49);
%     p1_50_l=length(p1_50);p1_51_l=length(p1_51);
%     p1_52_l=length(p1_52);

     
%     p1_l=[p1_01_l,p1_02_l,p1_03_l,p1_04_l,p1_05_l,p1_06_l,p1_07_l,...
%         p1_08_l,p1_09_l,p1_10_l,p1_11_l,p1_12_l,p1_13_l,p1_14_l,p1_15_l,...
%         p1_16_l,p1_17_l,p1_18_l,p1_19_l,p1_20_l,p1_21_l,p1_22_l,p1_23_l,...
%         p1_24_l,p1_25_l,p1_26_l,p1_27_l,p1_28_l,p1_29_l,p1_30_l,p1_31_l,...
%         p1_32_l,p1_33_l,p1_34_l,p1_35_l,p1_36_l,p1_37_l,p1_38_l,p1_39_l,...
%         p1_40_l,p1_41_l,p1_42_l,p1_43_l,p1_44_l,p1_45_l,p1_46_l,p1_47_l,...
%         p1_48_l,p1_49_l,p1_50_l,p1_51_l,p1_52_l];
% %     disp(p1_l);
%   
% %     disp(sum(p1_l));
%      
%     p1_raw_class=[p1_01;p1_02;p1_03;p1_04;p1_05;p1_06;p1_07;p1_08;p1_09;...
%         p1_10;p1_11;p1_12;p1_13;p1_14;p1_15;p1_16;p1_17;p1_18;p1_19;p1_20;...
%         p1_21;p1_22;p1_23;p1_24;p1_25;p1_26;p1_27;p1_28;p1_29;p1_30;p1_31;...
%         p1_32;p1_33;p1_34;p1_35;p1_36;p1_37;p1_38;p1_39;p1_40;p1_41;p1_42;...
%         p1_43;p1_44;p1_45;p1_46;p1_47;p1_48;p1_49;p1_50;p1_51;p1_52];
%     class=p1_raw_class;
%     n=1:1:length(p1_l);
%     stem(n,p1_l);
%     
    return