function [ out ] = majorityvote(in)
%This function performs majority voting for an input, ie. Counts the elements of a 1D array and outputs the value with the most occurrences. 
%The input can be an  array , ?char? or ?cell?. Just a note if your input is an array the function will work with non-integer values. 
%Input 
%1D array, cell or char 
%Output 
%out:elements of a 1D array and outputs the value with the most occurrences
%by Joseph Santacangelo 
% determine if input array is a cell array
if (isnumeric(in)==1) 
    %unique(y):Returns elements in an array with no repetitions.
    %count the number of times a element in an array occurs
    [count,values]=hist(in,unique(in));
    
    %Find the array index corresponding to  the value with the most occurrences
    [Vmax,argmax]=max(count);
    %Output function with most occurrences
    out=values(argmax);
      
else % if input is cell or character
    %Returns elements in an array with no repetitions
    [values, mm, nn] = unique(in);
    %count the number of times a element in an array occurs
    count=zeros(length(values),1);
    
    for i=1:length(values)
        count(i)=sum(nn==i);
    end
    %Find the array index corresponding to  the value with the most occurrences
    [Vmax,argmax]=max(count);
    
    %Output function with most occurrences
    out=values(argmax);
end
end
