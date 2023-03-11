function  Trial =fn_trial_wise_data_split_E123(data)
Trial=[];
p1_01_L=length(data);
    j=11;
    step=513;
    p1_data=[];
    for i=1:step:p1_01_L-step
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
    return