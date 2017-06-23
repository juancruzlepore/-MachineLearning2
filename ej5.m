[toignore,tateti] = xlsread('tateti.xlsx');
intTateti = zeros(length(tateti(:,1)), 9);
for i = 1:length(tateti(:,1))
    for j = 1:9
        if(strcmp(tateti(i,j),'x'))
            intTateti(i,j) = 1;
        elseif(strcmp(tateti(i,j),'o'))
            intTateti(i,j) = -1;
        else
            intTateti(i,j) = 0;
        end
    end
end
T = fitctree(intTateti(:,1:9),tateti(:,10))
