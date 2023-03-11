function [BaggedEnsemble,val_accuracy] = fn_generic_random_forests(X,Y,iNumBags,str_method)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name - generic_random_forests
% Creation Date - 6th July 2015
% Author - Soumya Banerjee
% Website - https://sites.google.com/site/neelsoumya/
%
% Description - Function to use random forests
%
% Parameters - 
%	Input	
%		X - matrix
%		Y - matrix of response
%		iNumBags - number of bags to use for boostrapping
%		str_method - 'classification' or 'regression'
%
%	Output
%               BaggedEnsemble - ensemble of random forests
%               Plots of out of bag error
%
% Example -
%
%	 load fisheriris
% 	 X = meas;
%	 Y = species;
%	 BaggedEnsemble = generic_random_forests(X,Y,60,'classification')
%	 predict(BaggedEnsemble,[5 3 5 1.8])
%
%
% Acknowledgements -
%           Dedicated to my mother Kalyani Banerjee, my father Tarakeswar Banerjee
%				and my wife Joyeeta Ghose.
%
% License - BSD
%
% Change History - 
%                   7th July 2015 - Creation by Soumya Banerjee
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scores=[];val_vec=[];k=10;
cvFolds = crossvalind('Kfold', Y, k);   %# get indices of 10-fold CV
     for i = 1:k                                  %# for each fold
        testIdx = (cvFolds == i);                %# get indices of test instances
        trainIdx = ~testIdx;                     %# get indices training instances
        %Random Forest
        BaggedEnsemble = TreeBagger(iNumBags,X(trainIdx,:),Y(trainIdx),'OOBPred','On','Method',str_method);
        scores = predict(BaggedEnsemble, X(testIdx,:));
        scores_R = str2double(scores);
        confv1 = confusionmat(Y(testIdx),scores_R);
        conf_chart = confusionchart(scores_R,Y(testIdx));
        val_acc1 = (sum(diag(confv1)))/(sum(sum(confv1)))*100;
        val_vec=[val_vec val_acc1];
%         disp(val_acc1);
        %# evaluate and update performance object
%         cp = classperf(scores, Y(testIdx));
    end
   val_accuracy = mean(val_vec);
%     cp.CorrectRate;
%     disp(cp.CorrectRate*100);
   
% view trees
% view(BaggedEnsemble.Trees{1}); % text description
% view(BaggedEnsemble.Trees{1},'mode','graph'); % graphic description
