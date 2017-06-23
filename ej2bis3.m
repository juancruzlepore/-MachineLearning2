load fisheriris
X = meas;
Y = species;


training  = meas([1:33,51:83,101:133],:);
trainingspecies  = species([1:33,51:83,101:133],:);
testing = meas ([34:50,84:100,134:150],:);

SVMModels = cell(3,1);
classes = unique(Y);
rng(1); % For reproducibility

for j = 1:numel(classes);
    indx = strcmp(trainingspecies,classes(j)); % Create binary classes for each classifier
    SVMModels{j} = fitcsvm(training,indx,'ClassNames',[false true],'Standardize',true,...
        'KernelFunction','rbf','BoxConstraint',1);
end

% d = 0.01;
% [x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
%     min(X(:,2)):d:max(X(:,2)));
% xGrid = [x1Grid(:),x2Grid(:)];
% N = size();
 Scores = zeros(51,numel(classes));

for j = 1:numel(classes)
    [~,score] = predict(SVMModels{j},testing);
    Scores(:,j) = score(:,2); % Second column contains positive-class scores
end



[~,maxScore] = max(Scores,[],2);

