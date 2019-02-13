function [X, Y, Yfinal] = ModEul2ODE(wguess)
% Modified Euler Integration to solve second order 
% differential equation by reduction of order

% second order to be solved:
% y''(x) = -w^2*(u/T)*y(x)

% This second order differential equation describes
% the wave of a vibrating string fixed at both ends

% Inputs: omega - vibrational frequency 
% Returns : Solution vector Y with corresponding
% coordinates X, as well as the final Y-value at x = L

global mu0 T  L h;        % declare global variables for string 
                         % properties
% string properties
T = 1000;                % tension in the string - Newtons
L = 1;                   % length of the string - meters
mu0 = 0.000954;          % mass density of the string - kg/m

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
    % midpoint evaluation
        xmid = X(j) + (h/2);    
        ypmid = Yp(j) + (h/2)*ypp(X(j), Y(j), Yp(j), w); 
        ymid = Y(j) + (h/2)*yp(X(j), Y(j), Yp(j));       
       
    % solution evaluation
        Yp(j+1) = Yp(j) + h*ypp(xmid, ymid, ypmid, w);
        Y(j+1) = Y(j)+h*yp(xmid, ymid, ypmid);
        
        X(j+1) = X(j) + h;  % step x
        Yfinal = Y(j+1);
end
end
    
