% Modified Euler Integration to solve
% second order differential equation 
% by reduction of order

% second order to be solved:
% y''(t) = -y'(t)^2 - y(t) + ln(t)

h = 0.25; %intial step size
T = zeros(1, (2/h)+1);  %vector to save x coordinates
Y = zeros(1, (2/h)+1);  %vector to save y coordinates

Y(1) = 0;  % boundary condition 1
y((2/h)+1) = log(2);  % boundary condition 2

for j = 2:(2/h)+1
        tmid = T(j) + (h/2);
        ymid = Y(j) + (h/2)*yp(T(j), Y(j));
        Y(j+1) = Y(j) + h*yp(tmid, ymid);
        T(j+1) = T(j) + h;
    end
    
