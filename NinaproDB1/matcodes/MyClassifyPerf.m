function metrics = MyClassifyPerf(targets, outputs)
Mv = max(targets);
M = Mv(1);

prec_sum = 0;
rec_sum = 0;

for ix = 1:M
    clear hx;
    clear y;
    hx = length(find(targets == ix));
    y = length(find(outputs == ix));
    clear temp_targ;
    clear temp_out;
    
    temp_targ = find(targets == ix);
    temp_out = find(outputs == ix);
    
    clear match;
    match =  intersect(temp_targ,temp_out);
    
    prec_sum =  prec_sum+ length(match)/y;
    
    rec_sum =  rec_sum+length(match)/hx;
end

metrics.precision = prec_sum/M;
metrics.recall = rec_sum/M;
metrics.F1 =  2*(metrics.precision)*metrics.recall/(metrics.precision+metrics.recall);
return;
    
   
    
    

