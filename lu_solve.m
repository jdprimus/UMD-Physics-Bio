function [x] = lu_solve(A, b)
% function to solve a linear system of equations 
% of the form Ax = b by Gaussian elimination
A = lu_gauss(A);     % returns a row-reduced form of matrix A
[n,n] = size(A);     % sets variable n to the size of A
y(1) = b(1); 
for i=2:n; 
    y = [y;b(i)-A(i,1:i-1)*y(1:i-1)]; 
end
    x(n) = y(n)/A(n,n);
for i=n-1:-1:1;     % back substitution 
    x(i) = (y(i)-A(i,i+1:n)*transpose(x(i+1:n)))/A(i,i); 
end
end
 