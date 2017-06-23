dialectos = xlsread('dialectos.xlsx');
for i = 1 : length(dialectos(:,1))
    for j = i + 1 : length(dialectos(1,:))
        if(j == i + 1)
            dialectos(i,j) = 100;
        else
            dialectos(i,j) = dialectos(j - 1, i);
        end
    end
end
% knnclassify(dialectos, dialectos, 1:length(dialectos(:,1)))
condados = zeros(length(dialectos(:,1)),40);
dialectosFull = zeros(length(dialectos(:,1)) + 1,length(dialectos(1,:)) + 1);

for i = 1 : length(dialectos(:,1))
    dialectosFull(i, end) = dialectos(end, i);
    dialectosFull(1, i + 1) = dialectos(i, 1);
    for j = 1 : length(dialectos(1,:))
        dialectosFull(i + 1, j) = dialectos(i,j);
    end
end
dialectosFull(1,1) = 100;
dialectosFull(end,end) = 100;
dialectosFull;

for i = 1 : length(dialectos(:,1))
    if(i<=3)
        condados(i, 1) = 'A';
    elseif(i<=12)
        condados(i, 1) = 'B';
    elseif(i<=16)
        condados(i, 1) = 'C';
    elseif(i<=17)
        condados(i, 1) = 'D';
    elseif(i<=21)
        condados(i, 1) = 'E';
    elseif(i<=22)
        condados(i, 1) = 'F';
    elseif(i<=23)
        condados(i, 1) = 'G';
    elseif(i<=24)
        condados(i, 1) = 'H';
    elseif(i<=25)
        condados(i, 1) = 'I';
    end
end

Y = pdist(dialectosFull, 'euclidean');
Z = linkage(Y, 'complete');
N = 10;
T = cluster(Z, 'MaxClust', N);
P = 9;
dendrogram(Z,P);


