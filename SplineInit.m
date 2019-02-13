%code to initialize the cubic spline by providing the second derivative

function [second] = SplineInit(x, f, fp1, fpN, N)
b1 = 2.0*(x(2)-x(1));
beta(1) = b1;
if (beta(1) == 0)
    error('Zero diagonal element in SplineInit');
end
r1 = 6.0*((f(2)-f(1))/(x(2)-x(1))-fp1);   
second(1) = r1;
 for j = 2:N
    if (j == N)
        bj = 2.0*(x(N) - x(N-1));
        rj = -6.0*((f(N) - f(N-1))/(x(N) - x(N-1)) - fpN);   
        %for j = 2:N-1, do...
    else
        bj = 2.0*(x(j+1) - x(j-1));
        rj = 6.0*((f(j+1) - f(j))/(x(j+1) - x(j)) - (f(j) - f(j-1))/(x(j)-x(j-1)));
    end
    %Evaluate off-diagonal elements
    aj = x(j) - x(j-1);
    c = aj;
    beta(j) = bj - aj * c/beta(j-1);
    second(j) = rj - aj*second(j-1)/beta(j-1);
    if(beta(j)==0), error('Zero diagonal element in NaturalSplineInit');
        end
 end
    %back substitution
    second(N) = second(N)/beta(N);
    for j = 1:N-1
        c = x(N-j+1)-x(N-j);
        second(N-j) = (second(N-j) - c*second(N-j+1))/beta(N-j);
    end
end

        