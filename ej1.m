num = xlsread('provincias.xlsx');

[coeff, score, latent] = pca(num);
%%se expresa casi toda la variabilidad de la muestra con solo dos
%%componentes
cumsum(latent)./sum(latent);
%% se clasifican la totalidad de los datos
%% a partir del biplot.. k = 3?

k=3;
[idx,C] = kmeans(num,3);

%%analizar si se separaron por region

idx
%%CONSULTA>> tomo el k=3? o k = sqrt(n/2)?