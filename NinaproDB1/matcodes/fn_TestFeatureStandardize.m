function standarddata =  fn_TestFeatureStandardize(data, meandata, stddata)
[M N] = size(data);
%meandata = mean(data);
%stddata = std(data);
for i = 1:N
    standarddata(:,i) =  (data(:,i)-meandata(i))/stddata(i);
end
return