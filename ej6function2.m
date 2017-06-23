function resp = ej6function2(k, columns)
    load fisheriris;
    N = 150;
    trainingIndexes = 1:N;
    training = meas(trainingIndexes,columns);
    testingIndexes = 1:N;
    sample = meas(testingIndexes, columns);
    group = {};
    for i = 1:length(trainingIndexes)
        group(i) = species(trainingIndexes(i));
    end

    results = knnclassify(sample,training,group,k,'euclidean');
    errors = 0;
    for i = 1:N
        if(~strcmp(results(i), species(testingIndexes(i))))
            errors = errors + 1;
        end
    end
    resp = errors/N;
end