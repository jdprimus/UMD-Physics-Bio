%Function to compute the locations and values of a oscillatory maximums
%returns the location of maximums in the array, as well as the values
%May 5 2015
% values of maxima must be positive, if not, elimate condition 3 in line 9
function [locations,values] = FindMax(x)
d=size(x);
j=0;
for i = 2:(d-1)
    if (x(i) >= x(i-1)) && (x(i) >= x(i+1)  & (x(i) > 0))  
        j= j+1;
        locations(j)=i;
        values(j)=x(i);
        if ((j > 1) && ((i - locations(j-1)) < 3))
            locations(j-1) = (i + locations(j-1))/2;
            j=j-1;
        end
    end
end
end

