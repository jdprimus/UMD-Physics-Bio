function [] = FiniteDiff
% Code to evaluate the fundamental frequency of vibration
% of a non-uniform piano wire.
% by Jeremy Primus, Kyle Thomsen, and Arjun Kafle 
% December 9, 2013

clear;
global mu0 T  L h delta;      % declare global variables for string 
                         % properties
% string properties
T = 1000;                % tension in the string - Newtons
L = 1;                   % length of the string - meters
mu0 = 0.000954;          % mass density of the string - kg/m
delta = 0.0005;          % rate of change in mass density - kg/m^2

h = 0.001;               % step size
nx = L/h;                % the number of INTERIOR points!
x = (0:h:L);             % vector of x coordinates

% Note that there are (N+1) points, but the solution is already known 
% at the endpoints f(0) and f(N). (fixed boundary conditions)

% Initialize a, b, and c. A scaling factor, (mu0*h*h)/T is included 
% to scale matrices 
mu =  mu0+(x-(L/2.0))*delta;        % string density as function of x 
a  = -(T./(h*h*mu))*((mu0*h*h)/T);  
b  = -2*a;
c  = a; 


% Analytical result with boundary conditions
% y(0) = 0 and y(L) = 0
% uniform mass density mu0 = 0.000954 kg/m
% omega = 3216.4
 
% Use secant method to find solution for 
% non-uniform string near this value 

lo = 3000^2*((mu0*h*h)/T);           % lower limit for lambda
lf = 3500^2*((mu0*h*h)/T);           % upper limit for lambda

lambda = Sec_Meth(lo,lf,a,b,c,nx)/((mu0*h*h)/T);
omega = sqrt(lambda);      % frequency is given as the 
                           % square root of the eigenvalue lambda

% Display results
%fprintf('The natural frequency found by the finite differences method for the non-uniform string is: %5.5f Hz, or %5.5f rad/s\n', omega/(2*pi), omega)

% Extract the shape of the piano wire using Modified Euler
% Method with omega
%[X, Y, Yfinal] = ModEul2ODE(omega);

% Plot values
for i = 1:nx+1
    plot(X(i),Y(i), '.k')
    hold on
end
legend('Uniform', 'Non-Uniform')
title('Non-Uniform and Uniform Density Fundamental Eigenvectors')
ylabel(' Displacement (m) ')
xlabel(' x ')


end





