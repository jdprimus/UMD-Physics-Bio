%code to initialize the cubic spline by providing the second derivative

function [second] = NaturalSplineInit(x, f, N)
b1 = 1;
beta(1) = b1;
second = ones(11);
beta = ones(11);
x = ones(11);
b2 = 2.0*(x(3)-x(1));
beta(2) = b2;
if (beta(1) == 0)
    error('Zero diagonal element in NaturalSplineInit');
end
r1 = 0;   %sets second derivative of left endpoint to 0 -->linear
second(1) = r1;
r2 = 6.0*((f(3) - f(2))/(x(3) - x(2)) - (f(2) - f(1))/(x(2) - x(1)));
second(2) = r2;
 for j = 3:N
    if (j == N)
        aj = 0;
        bj = 1;
        rj = 0;   %sets second derivative right endpoint to 0 --> linear
        %for j = 3:N-1, do...
    else
        bj = 2.0*(x(j+1) - x(j-1));
        rj = 6.0*((f(j+1) - f(j))/(x(j+1) - x(j)) - (f(j) - f(j-1))/(x(j)-x(j-1)));
        aj = x(j) - x(j-1);
         c = aj;
    end
    %Evaluate off-diagonal elements 
        c = x(N-j+1)-x(N-j);
        beta(j) = bj - aj * c/beta(j-1);
        second(j) = rj - aj*second(j-1)/beta(j-1);
        second(N-j) = (second(N-j) - c*second(N-j+1))/beta(N-j);
        if(beta(j)==0)
            error('Zero diagonal element in NaturalSplineInit');
        end
 end
    %back substitution
    second(N) = second(N)/beta(N);
end

        