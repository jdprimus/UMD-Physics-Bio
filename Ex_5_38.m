function [] = Ex_5_38()
% Piano Wire Fundamental Note
% This program finds the lowest energy eigenvalue
% of a vibrating string with non-uniform thickness
% by Jeremy Primus, Kyle Thomsen, and Arjun Kafle 
% December 9, 2013

% Analytical result with boundary conditions
% y(0) = 0 and y(L) = 0
% uniform mass density mu0 = 0.000954 kg/m
% omega = 3216.4

% Use secant method to find solution for 
% non-uniform string near this value 

global h;

  W = SecantMethod(3000, 3500);
  [X, Y, YL] = ModEul2ODE(W);

% Display results
fprintf('The natural frequency found by the the shooting for the non-uniform string is: %5.5f Hz, or %5.5f rad/s\n', W/(2*pi), W)

% Plot values
for i = 1:(1/h)+1
    plot(X(i),Y(i), '*k')
    hold on
end
legend('Uniform', 'Non-Uniform')
title('Non-Uniform and Uniform Density Fundamental Eigenvectors')
ylabel(' Displacement (m) ')
xlabel(' x ')

end