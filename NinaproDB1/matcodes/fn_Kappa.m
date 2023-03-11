function [kappa] = fn_Kappa(Pred,Obs,Nc);
%--------------------------------------------------------------------------
%input 
%Pred: The predicted class vector
%Obs:  The original class vector
%Nc: The no. of classes
%Outputs
%confmat: Confusion Matrix
%kappa: Classification accuracy
%pra: relative observed agreement among raters
%pre: hypothetical probability of chance agreement
%--------------------------------------------------------------------------
% [1]  Cohen, Jacob (1960), A coefficient of agreement for nominal scales,
% Educational and Psychological Measurement Vol.20, No.1, pp.37–46.
%--------------------------------------------------------------------------
 [~,~,Obs] = unique(Obs);
 [~,~,Pred] = unique(Pred);
for ix = 1:Nc
    O(ix).list = find(Obs == ix);
    P(ix).list = find(Pred == ix);
    O(ix).list = find(Obs == ix);
end
for ix = 1:Nc
    for iy = 1:Nc
        confmat(ix,iy) = length(intersect(O(ix).list,P(iy).list));
    end
end
 N = sum(sum(confmat));
 pra = sum(diag(confmat))/N;
%  confmat1 = confmat;
%  for ix = 1:Nc
%      confmat1(ix,ix) = 0;
%  end
 
 colsum = sum(confmat);
 rowsum = sum(confmat');
pre =  sum(colsum.*rowsum)/(N^2);
% pre = (a+b)*(a+c)/N^2+(c+d)*(b+d)/N^2;
% pra = (a+d)/N;
kappa = (pra-pre)/(1-pre);
