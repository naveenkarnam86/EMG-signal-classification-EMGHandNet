function  [Trial,Total_trials_perclass] =fn_trial_labelling_DB2(data,Trial_length)
Trial=[];
p1_01_L=length(data);
    j=1;
    step=Trial_length;
    p1_data=[];
    for i=0:step:p1_01_L-step
        j_vec=j*ones(step,1);
%         if(i==1)
%          p1_data=[data(1:step,:),j_vec];
%         else
         d1=[];
         d1=[data(i+1:i+step,:),j_vec];
         p1_data=[p1_data;d1];
%         end
       j=j+1;
    end
    Trial = p1_data;
    Total_trials_perclass=j;
    return