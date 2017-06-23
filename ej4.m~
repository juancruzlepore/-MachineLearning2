load fisheriris;
%%
X=meas(:,1:2);
Y=species;
T = fitctree(X,Y);
view(T,'mode','graph');
view(T);
asd = predict(T,meas(:,1:2));
sfit = predict(T,X);
mean(strcmp(sfit,Y))
%%
X2=meas(:,3:4);
Y2=species;
T2 = fitctree(X2,Y2);
% view(T2,'mode','graph');
view(T2);
asd = predict(T2,meas(:,3:4));
sfit = predict(T2,X2);
mean(strcmp(sfit,Y2))
%%
X3=meas(:,:);
Y3=species;
T3 = fitctree(X3,Y3);
% view(T3,'mode','graph')
view(T3);
asd = predict(T3,meas(:,:));
sfit = predict(T3,X3);
mean(strcmp(sfit,Y3))
