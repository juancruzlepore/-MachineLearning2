num = xlsread('provincias.xlsx');

[coeff, score, latent] = pca(num);
%%se expresa casi toda la variabilidad de la muestra con solo dos
%%componentes
cumsum(latent)./sum(latent)
%% se clasifican la totalidad de los datos
nClust = [1:9];

plot(nClust,100* cumsum(latent)./sum(latent));

%%se observa que el codo esta en 3, por lo que se haran 3 clusters
k=3;
[idx,C] = kmeans(num,3);

%%analizar si se separaron por region

idx
%%CONSULTA>> tomo el k=3? o k = sqrt(n/2)?