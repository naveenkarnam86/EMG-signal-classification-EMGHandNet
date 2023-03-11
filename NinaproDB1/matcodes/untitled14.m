[M1,N1] = size(Y_Test);
key = find(Y_Test==0);
Y_Test(key,:)=2;
[M2,N2] = size(scores_RF2);
win = 2;
Y_Test_majority = []; Y_pred_majority = [];
vote_score = [];
for i1=1:win:M1-win
 L1 = Y_Test(i1:i1+win,:);  
 vote_score = majorityvote(Y_Test(i1:i1+win,:));   
 Y_Test_majority = [Y_Test_majority vote_score];
 vote_score = [];
end
Y_Test_majority = Y_Test_majority(:);
for i2=1:win:M2-win
 vote_score = majorityvote(scores_RF2(i2:i2+win,:));   
 Y_pred_majority = [Y_pred_majority vote_score];
 vote_score = [];
end
Y_pred_majority = Y_pred_majority(:);
conf_maj = confusionmat(Y_Test_majority,Y_pred_majority);
test_acc_maj = (sum(diag(conf_maj)))/(sum(sum(conf_maj)))*100;