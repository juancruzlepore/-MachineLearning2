load fisheriris;
%% kmedias
[idx,C] = kmeans(meas,3);
%%clusterjerarquico?
Y = pdist(meas,'euclidean');
Z = linkage(Y,'average');
T = cluster(Z,'MaxClust',3);
%%visualizar el dendrograma del arbol completo (P=0)
%dendrogram(Z,0);

%%support vector machines
%svmstruct = svmtrain(meas(1:35-51:85-101:135), species(1:35-51:85-101:135));
Tbl=meas([1:35 51:85 101:135]);
Y=species([1:35 51:85 101:135]);
Mdl = fitcsvm(Tbl, Y);