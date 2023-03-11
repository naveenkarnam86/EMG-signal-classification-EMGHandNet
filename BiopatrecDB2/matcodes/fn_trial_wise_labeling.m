function  [j Trial] = fn_trial_wise_labeling(data,samples_per_trial)
Trial=[];
L=length(data);
    j=1;
    step=samples_per_trial;
    p1_data=[];
    for i=1:step:L
        j_vec=j*ones(step,1);
        if(i==1)
         p1_data=[data(1:step,:),j_vec];
        else
         d1=[];
         d1=[data(i:i+step-1,:),j_vec];
         p1_data=[p1_data;d1];
        end
       j=j+1;
    end
    Trial = p1_data;
    j = j-1;
    return