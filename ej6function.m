function resp = ej6function(k, ratio, columns)
    load fisheriris;
    totalerrors = 0;
    for it = 1:30
        N = 150;
        n = floor(ratio * N);
        trainingIndexes = randperm(N, n);
        trainingIndexes = sort(trainingIndexes);
        training = meas(trainingIndexes,columns);
        testingIndexes = 1:(N-n);
        auxIndex = 1;
        currentIndex = 1;
        for i = 1:N
            if(auxIndex <= length(trainingIndexes) && trainingIndexes(auxIndex) == i)
                auxIndex = auxIndex + 1;
            else
                testingIndexes(currentIndex) = i;
                currentIndex = currentIndex + 1;
            end
        end
        sample = meas(testingIndexes, columns);
        group = {};
        for i = 1:length(trainingIndexes)
            group(i) = species(trainingIndexes(i));
        end

        results = knnclassify(sample,training,group,k,'euclidean');
        errors = 0;
        for i = 1:N-n
            if(~strcmp(results(i), species(testingIndexes(i))))
                errors = errors + 1;
            end
        end
        totalerrors = totalerrors + errors;
    end
    resp = totalerrors/((N-n)*30);
end