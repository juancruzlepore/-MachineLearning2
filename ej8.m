load 'colesterol';
x = colesterol(:,2);
y = colesterol(:,3);
% a
%%plot(x,y, 'x');
% b
%%hold on;
p = polyfit(x,y,3);
x1 = linspace(0,100);
y1 = polyval(p,x1);
%plot(x1,y1);

ECM = zeros (1,200);
for i=1:200
    p=polyfit(x,y,i);
    ecm=0;
    for j=1:length(x)
        ecm= ecm + (y(j)-polyval(p,x(j)))^2;
    end
    ECM(i)=ecm/length(x);
end

%plot(10:25,ECM(10:25));
min (ECM);
% Z = smooth(x,y,0.3,'lowess');
% scatter(x, Z);