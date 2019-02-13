function [table, iteration, h, x] = GaussSeidel()
% GAUSS-SEIDEL
% Exercise 5.33                                                                  
% Jeremy Primus
% This program uses the GAUSS-SEIDEL iteration method to solve a problem expressed
%  in terms of finite differences.
%
clear; 
tolerance = 2.e-4; 
h = 0.001; 
c1 = 1.0 - 2.5*h; 
c2 = 1.0 + 2.5*h; 
c3 = -10.0 * h * h; 
c4 = 2.0 + c3; 
% Initial guess: 
y = 0:0.1:1;
iteration = 0; 
% Iterate until done...or have iterated too many times. 
x = 0:h:0.5;
done = false; 
while done == false 
    done = true; 
    iteration = iteration+1; 
    if (iteration >= 100)
        error('Too many iterations!');
    end
    table(iteration, 1) = y(1);
    table(iteration, 11) = y(11);
    % Evaluate the function at all the interior points: 
    for i = 2:10 
        yy=(c1*y(i+1)+c2*y(i-1)+c3*x(i))/c4; 
        if (abs( (yy-y(i))/yy ) > tolerance ) % one failure flags "false" 
            done = false; 
            y(i) = yy; 
            table(iteration, i) = yy;
        else
            table(iteration, i) = table(iteration-1, i);
        end 
           
    end 
end 

