load autos
%scatter(autos(:,2), autos(:,3))
hold all;
res = zeros(50,3);
ksrlin(autos(:,2), autos(:,3))
Z = smooth(autos(:,2), autos(:,3),5,'lowess')
subplot(1,2,1)
plot(autos(:,2), Z )
subplot(1,2,2)
res(:,1) = (Z-autos(:,3)).^2.^(1/2);
Z = smooth(autos(:,2), autos(:,3),10,'lowess')
subplot(1,2,1)
plot(autos(:,2), Z )
subplot(1,2,2)
res(:,2) = (Z-autos(:,3)).^2.^(1/2);
Z = smooth(autos(:,2), autos(:,3),30,'lowess')
subplot(1,2,1)
plot(autos(:,2), Z )
subplot(1,2,2)
res(:,3) = (Z-autos(:,3)).^2.^(1/2);
sum(res(:,1))
sum(res(:,2))
sum(res(:,3))