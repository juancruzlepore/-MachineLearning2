load fisheriris
X = meas;
Y = species;



SVMModels = cell(3,1);
classes = unique(Y);
rng(1); % For reproducibility

for j = 1:numel(classes);
    indx = strcmp(Y,classes(j)); % Create binary classes for each classifier
    SVMModels{j} = fitcsvm(X,indx,'ClassNames',[false true],'Standardize',true,...
        'KernelFunction','rbf','BoxConstraint',1);
end

% d = 0.01;
% [x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
%     min(X(:,2)):d:max(X(:,2)));
% xGrid = [x1Grid(:),x2Grid(:)];
% N = size();
 Scores = zeros(150,numel(classes));

for j = 1:numel(classes);
    [~,score] = predict(SVMModels{j},meas);
    Scores(:,j) = score(:,2); % Second column contains positive-class scores
end



[~,maxScore] = max(Scores,[],2);

