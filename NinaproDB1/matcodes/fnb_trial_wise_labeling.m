function  [j Trial] = fnb_trial_wise_labeling(data)
Trial=[];
L=length(data);
    j=1;
    data= data;
    step=513;
    p1_data=[];
    for i=1:step:L
        if(i==1)
         d1=data(1:step,:);  
         Label = unique(d1(:,end));
         d1(:,end) =[];
         d1=d1(:);
         d1 =d1';
         d1=[d1,Label];
         p1_data=[p1_data;d1];
        else
         d1=[];
         d1=data(i:i+step-1,:);
         Label = unique(d1(:,end));
         d1(:,end) =[];
         d1=d1(:);
         d1 =d1';
         d1=[d1,Label];
         p1_data=[p1_data;d1];
        d1 =[];
        end
       j=j+1;
    end
    Trial = p1_data;
    j = j-1;
    return