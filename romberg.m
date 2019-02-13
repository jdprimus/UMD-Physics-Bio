%Program to perform Romberg integration
%Input: f - Matlab '.m' or inline function
%       a - lower limit of integration
%       b - upper limit of integration
%       n - number of points
%Output: array of computed values for romberg integration 

function [R] = romberg(f,a,b,n)
m = (0:n-1);
h = (b - a) ./ (2.^m);
R(1,1) = (b - a) * (f(a) + f(b)) / 2;
for j = 2:n
    subtotal = 0;
    for i = 1:2^(j-2)
        subtotal = subtotal + f(a + (2 * i - 1) * h(j));
    end
    R(j,1) = R(j-1,1) / 2 + h(j) * subtotal;
    for k = 2:j
        R(j,k) = (4^(k-1) * R(j,k-1) - R(j-1,k-1)) / (4^(k-1) - 1);
        
    end
end;