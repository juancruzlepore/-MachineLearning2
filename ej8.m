load 'colesterol';
x = colesterol(:,2);
y = colesterol(:,3);
% a
plot(x,y, 'x');
% b
hold on;
p = polyfit(x,y,3);
x1 = linspace(0,100);
y1 = polyval(p,x1);
% plot(x1,y1);
Z = smooth(x,y,0.3,'lowess');
plot(x, Z)