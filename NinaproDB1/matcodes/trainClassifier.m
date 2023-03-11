function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% Returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: A table containing the same predictor and response
%       columns as those imported into the app.
%
%  Output:
%      trainedClassifier: A struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: A function to make predictions on new
%       data.
%
%      validationAccuracy: A double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 23-Nov-2020 15:22:45


% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'Train_feat_E1231', 'Train_feat_E1232', 'Train_feat_E1233', 'Train_feat_E1234', 'Train_feat_E1235', 'Train_feat_E1236', 'Train_feat_E1237', 'Train_feat_E1238', 'Train_feat_E1239', 'Train_feat_E12310', 'Train_feat_E12311', 'Train_feat_E12312', 'Train_feat_E12313', 'Train_feat_E12314', 'Train_feat_E12315', 'Train_feat_E12316', 'Train_feat_E12317', 'Train_feat_E12318', 'Train_feat_E12319', 'Train_feat_E12320', 'Train_feat_E12321', 'Train_feat_E12322', 'Train_feat_E12323', 'Train_feat_E12324', 'Train_feat_E12325', 'Train_feat_E12326', 'Train_feat_E12327', 'Train_feat_E12328', 'Train_feat_E12329', 'Train_feat_E12330', 'Train_feat_E12331', 'Train_feat_E12332', 'Train_feat_E12333', 'Train_feat_E12334', 'Train_feat_E12335', 'Train_feat_E12336', 'Train_feat_E12337', 'Train_feat_E12338', 'Train_feat_E12339', 'Train_feat_E12340', 'Train_feat_E12341', 'Train_feat_E12342', 'Train_feat_E12343', 'Train_feat_E12344', 'Train_feat_E12345', 'Train_feat_E12346', 'Train_feat_E12347', 'Train_feat_E12348', 'Train_feat_E12349', 'Train_feat_E12350', 'Train_feat_E12351', 'Train_feat_E12352', 'Train_feat_E12353', 'Train_feat_E12354', 'Train_feat_E12355', 'Train_feat_E12356', 'Train_feat_E12357', 'Train_feat_E12358', 'Train_feat_E12359', 'Train_feat_E12360', 'Train_feat_E12361', 'Train_feat_E12362', 'Train_feat_E12363', 'Train_feat_E12364', 'Train_feat_E12365', 'Train_feat_E12366', 'Train_feat_E12367', 'Train_feat_E12368', 'Train_feat_E12369', 'Train_feat_E12370', 'Train_feat_E12371', 'Train_feat_E12372', 'Train_feat_E12373', 'Train_feat_E12374', 'Train_feat_E12375', 'Train_feat_E12376', 'Train_feat_E12377', 'Train_feat_E12378', 'Train_feat_E12379', 'Train_feat_E12380', 'Train_feat_E12381', 'Train_feat_E12382', 'Train_feat_E12383', 'Train_feat_E12384', 'Train_feat_E12385', 'Train_feat_E12386', 'Train_feat_E12387', 'Train_feat_E12388', 'Train_feat_E12389', 'Train_feat_E12390', 'Train_feat_E12391', 'Train_feat_E12392', 'Train_feat_E12393', 'Train_feat_E12394', 'Train_feat_E12395', 'Train_feat_E12396', 'Train_feat_E12397', 'Train_feat_E12398', 'Train_feat_E12399', 'Train_feat_E123100'};
predictors = inputTable(:, predictorNames);
response = inputTable.Train_feat_E123101;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationKNN = fitcknn(...
    predictors, ...
    response, ...
    'Distance', 'Euclidean', ...
    'Exponent', [], ...
    'NumNeighbors', 1, ...
    'DistanceWeight', 'Equal', ...
    'Standardize', true, ...
    'ClassNames', [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38; 39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52]);

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
knnPredictFcn = @(x) predict(classificationKNN, x);
trainedClassifier.predictFcn = @(x) knnPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'Train_feat_E1231', 'Train_feat_E12310', 'Train_feat_E123100', 'Train_feat_E12311', 'Train_feat_E12312', 'Train_feat_E12313', 'Train_feat_E12314', 'Train_feat_E12315', 'Train_feat_E12316', 'Train_feat_E12317', 'Train_feat_E12318', 'Train_feat_E12319', 'Train_feat_E1232', 'Train_feat_E12320', 'Train_feat_E12321', 'Train_feat_E12322', 'Train_feat_E12323', 'Train_feat_E12324', 'Train_feat_E12325', 'Train_feat_E12326', 'Train_feat_E12327', 'Train_feat_E12328', 'Train_feat_E12329', 'Train_feat_E1233', 'Train_feat_E12330', 'Train_feat_E12331', 'Train_feat_E12332', 'Train_feat_E12333', 'Train_feat_E12334', 'Train_feat_E12335', 'Train_feat_E12336', 'Train_feat_E12337', 'Train_feat_E12338', 'Train_feat_E12339', 'Train_feat_E1234', 'Train_feat_E12340', 'Train_feat_E12341', 'Train_feat_E12342', 'Train_feat_E12343', 'Train_feat_E12344', 'Train_feat_E12345', 'Train_feat_E12346', 'Train_feat_E12347', 'Train_feat_E12348', 'Train_feat_E12349', 'Train_feat_E1235', 'Train_feat_E12350', 'Train_feat_E12351', 'Train_feat_E12352', 'Train_feat_E12353', 'Train_feat_E12354', 'Train_feat_E12355', 'Train_feat_E12356', 'Train_feat_E12357', 'Train_feat_E12358', 'Train_feat_E12359', 'Train_feat_E1236', 'Train_feat_E12360', 'Train_feat_E12361', 'Train_feat_E12362', 'Train_feat_E12363', 'Train_feat_E12364', 'Train_feat_E12365', 'Train_feat_E12366', 'Train_feat_E12367', 'Train_feat_E12368', 'Train_feat_E12369', 'Train_feat_E1237', 'Train_feat_E12370', 'Train_feat_E12371', 'Train_feat_E12372', 'Train_feat_E12373', 'Train_feat_E12374', 'Train_feat_E12375', 'Train_feat_E12376', 'Train_feat_E12377', 'Train_feat_E12378', 'Train_feat_E12379', 'Train_feat_E1238', 'Train_feat_E12380', 'Train_feat_E12381', 'Train_feat_E12382', 'Train_feat_E12383', 'Train_feat_E12384', 'Train_feat_E12385', 'Train_feat_E12386', 'Train_feat_E12387', 'Train_feat_E12388', 'Train_feat_E12389', 'Train_feat_E1239', 'Train_feat_E12390', 'Train_feat_E12391', 'Train_feat_E12392', 'Train_feat_E12393', 'Train_feat_E12394', 'Train_feat_E12395', 'Train_feat_E12396', 'Train_feat_E12397', 'Train_feat_E12398', 'Train_feat_E12399'};
trainedClassifier.ClassificationKNN = classificationKNN;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2020a.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'Train_feat_E1231', 'Train_feat_E1232', 'Train_feat_E1233', 'Train_feat_E1234', 'Train_feat_E1235', 'Train_feat_E1236', 'Train_feat_E1237', 'Train_feat_E1238', 'Train_feat_E1239', 'Train_feat_E12310', 'Train_feat_E12311', 'Train_feat_E12312', 'Train_feat_E12313', 'Train_feat_E12314', 'Train_feat_E12315', 'Train_feat_E12316', 'Train_feat_E12317', 'Train_feat_E12318', 'Train_feat_E12319', 'Train_feat_E12320', 'Train_feat_E12321', 'Train_feat_E12322', 'Train_feat_E12323', 'Train_feat_E12324', 'Train_feat_E12325', 'Train_feat_E12326', 'Train_feat_E12327', 'Train_feat_E12328', 'Train_feat_E12329', 'Train_feat_E12330', 'Train_feat_E12331', 'Train_feat_E12332', 'Train_feat_E12333', 'Train_feat_E12334', 'Train_feat_E12335', 'Train_feat_E12336', 'Train_feat_E12337', 'Train_feat_E12338', 'Train_feat_E12339', 'Train_feat_E12340', 'Train_feat_E12341', 'Train_feat_E12342', 'Train_feat_E12343', 'Train_feat_E12344', 'Train_feat_E12345', 'Train_feat_E12346', 'Train_feat_E12347', 'Train_feat_E12348', 'Train_feat_E12349', 'Train_feat_E12350', 'Train_feat_E12351', 'Train_feat_E12352', 'Train_feat_E12353', 'Train_feat_E12354', 'Train_feat_E12355', 'Train_feat_E12356', 'Train_feat_E12357', 'Train_feat_E12358', 'Train_feat_E12359', 'Train_feat_E12360', 'Train_feat_E12361', 'Train_feat_E12362', 'Train_feat_E12363', 'Train_feat_E12364', 'Train_feat_E12365', 'Train_feat_E12366', 'Train_feat_E12367', 'Train_feat_E12368', 'Train_feat_E12369', 'Train_feat_E12370', 'Train_feat_E12371', 'Train_feat_E12372', 'Train_feat_E12373', 'Train_feat_E12374', 'Train_feat_E12375', 'Train_feat_E12376', 'Train_feat_E12377', 'Train_feat_E12378', 'Train_feat_E12379', 'Train_feat_E12380', 'Train_feat_E12381', 'Train_feat_E12382', 'Train_feat_E12383', 'Train_feat_E12384', 'Train_feat_E12385', 'Train_feat_E12386', 'Train_feat_E12387', 'Train_feat_E12388', 'Train_feat_E12389', 'Train_feat_E12390', 'Train_feat_E12391', 'Train_feat_E12392', 'Train_feat_E12393', 'Train_feat_E12394', 'Train_feat_E12395', 'Train_feat_E12396', 'Train_feat_E12397', 'Train_feat_E12398', 'Train_feat_E12399', 'Train_feat_E123100'};
predictors = inputTable(:, predictorNames);
response = inputTable.Train_feat_E123101;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Perform cross-validation
partitionedModel = crossval(trainedClassifier.ClassificationKNN, 'KFold', 5);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
validationAccuracy = validationAccuracy*100;