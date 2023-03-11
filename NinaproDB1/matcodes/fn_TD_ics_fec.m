function cross_corr=fn_TD_ics_fec(data)
y=[];
[M,N]=size(data);
for i=1:1:N-1
    for j=i+1:1:N
        if(i~=j)
            x=max(xcorr(data(:,i),data(:,j)));
            y=[y x];
        end
    end
end

cross_corr=y;
            
end