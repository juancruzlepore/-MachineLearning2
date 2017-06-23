load fisheriris;
%% kmedias
[idx,C] = kmeans(meas,3);
%%clusterjerarquico?
Y = pdist(meas(:,:),'euclidean');
Z = linkage(Y,'complete');
T = cluster(Z,'MaxClust',3);
%%visualizar el dendrograma del arbol completo (P=0)
%dendrogram(Z,0);


check=T;
c1=0;
c2=0;
c3=0;
for i=1:50
    if (check(i) == 1)
        c1=c1+1;
    elseif (check(i) == 2)
        c2=c2+1;
    else 
        c3=c3+1;
    end
end
c4=0;
c5=0;
c6=0;
for i=51:100
    if (check(i) == 1)
        c4=c4+1;
    elseif (check(i) == 2)
        c5=c5+1;
    else 
        c6=c6+1;
    end
end
c7=0;
c8=0;
c9=0;
for i=101:150
    if (check(i) == 1)
        c7=c7+1;
    elseif (check(i) == 2)
        c8=c8+1;
    else 
        c9=c9+1;
    end
end
c1
c2
c3
c4
c5
c6
c7
c8
c9