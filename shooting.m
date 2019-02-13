function [W] = Ex_5_38()
% Piano Wire Fundamental Note
% This program finds the lowest energy eigenvalue
% of a vibrating string with non-uniform thickness
% by Jeremy Primus, Kyle Thomsen, and Arjun Kafle 
% December 7, 2013

% Analytical result with boundary conditions
% y(0) = 0 and y(L) = 0
% uniform mass density μ0 = 0.000954 kg/m
% ω = 3216.4

% Use secant method to find solution for 
% non-uniform string between 3000 rad * s^(-1) and 3500 rad * s^(-1)

  W = SecantMethod(3000, 3500);

end

function [root] = SecantMethod(a, b)
% Uses secant method to find the root of function BCDiff
% located between a and b on the number line
 
TOL = .0005;        % tolerance for root accuracy
x = ones(1, 1000);  
x(1) = a;
x(2) = b;
i = 3;
while true
  x(i) = x(i-1) - (BCDiff(x(i-1)))*((x(i-1) - x(i-2))/(BCDiff(x(i-1)) - BCDiff(x(i-2))));
  Error = abs(x(i) - x(i-1));
  i = i +1;
  root = x(i-1);
  if Error < TOL; break; end
end
end

function [diff] = BCDiff(wguess)
% returns the difference between Y(L) with input 
% parameter ω, and the boundary value Y(bc)
 
[T, Y, YL] = ModEul2ODE(wguess);
ybc = 0;
diff = ybc - YL;
end

function [X, Y, Yfinal] = ModEul2ODE(wguess)
% Modified Euler Integration to solve second order 
% differential equation by reduction of order
 
% second order to be solved:
% y''(x) = -ω^2*(μ/T)*y(x)
 
% This second order differential equation describes
% the wave of a vibrating string fixed at both ends
 
% Inputs: ω - vibrational frequency 
% Returns: Solution vector Y with corresponding
% coordinates X, as well as the final Y-value at x = L
 
global mu0 T  L ;        % declare global variables for string 
                         % properties
% string properties
T = 1000;                % tension in the string in N
L = 1;                   % length of the string in m
mu0 = 0.000954;          % mass density of the string in kg/m
 
h = 0.001;               % step size
X = zeros(1, (1/h)+1);   % vector to save x coordinates
Yp = zeros(1, (1/h)+1);  % vector to save y' coordinates
Y = zeros(1, (1/h)+1);   % vector to save y coordinates
 
X(1) = 0;
Y(1) = 0;                % boundary condition 1 / initial condition
 
w = wguess;              % vibrational frequency value passed 
ypi = 0.0001;            % arbitrarily designated y'(0)
Yp(1) = ypi;
 
for j = 1:(1/h)
  % delta is the variance per unit length of the mass per unit length
  % 
for delta = 0:0.0005
    % midpoint evaluation
        xmid = X(j) + (h/2);    
        ypmid = Yp(j) + (h/2)*ypp(X(j), Y(j), Yp(j), w, delta); 
        ymid = Y(j) + (h/2)*yp(X(j), Y(j), Yp(j));       
       
    % solution evaluation
        Yp(j+1) = Yp(j) + h*ypp(xmid, ymid, ypmid, w, delta);
        Y(j+1) = Y(j)+h*yp(xmid, ymid, ypmid);
        
        X(j+1) = X(j) + h;      % increment x
        Yfinal = Y(j+1);        % update final y value
  if (delta == 0); hold; plot(X, Y, 'g*'); end
  if (delta == 0.0005); plot(X, Y, 'r.'); hold; end
end
end
end

function [y] = yp(x, y, yp)
% converting the second order differential equation into a system 
% of first order differential equations, we let
y = yp;                         % expression for y'
end

function [ypp] = ypp(x, y, yp, w, delta)
% converted second derivative to first order 
% differential equation
global mu0 T L ;
mu = mu0 + (x - (L/2))*delta;  % evaluates mass density at x 
ypp = -(w^2)*(mu/T)*y;          % expression for y''
 
end