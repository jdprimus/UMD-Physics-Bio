function [spline] = Spline(xvalue, x, f, second, N)

%This function performs cubic spline interpolation, after 
%'second' has been initialized by NaturalSplineInit
%Arrays 'f', 'second', and 'x' contain N values of the 
%function, its second derivative, and the positions at 
%which they were evaluated

%The function returns the cubic spline approximation 
%to the function at 'xvalue'

%Verify that 'xvalue' is between x(1) and x(N)
if (xvalue < x(1))
    error('xvalue is less than x(1) in Spline');
end
if (xvalue > x(N))
    error('xvalue is greater than x(N) in Spline');
end
% Determine the interval containing xvalue
j=1;
while (xvalue > x(j+1))
    j = j + 1;
end
spline = f(j) + ((f(j+1) - f(j))/(x(j+1) - x(j)) - ((x(j+1) - x(j))*second(j+1))/6 -((x(j+1) - x(j))*second(j))/3)*(xvalue-x(j))+ second(j)/2*(xvalue-x(j))^2 + (second(j+1) - second(j))/(6*(x(j+1) - x(j)))*(xvalue-x(j))^3;
end