function [X2,Y2] = RK4Main()
%Fourth Order Runge-Kutta main
h = 0.20; %initial step size

for i = 1:3
    
    x = 0; %initial x value
    y = 0; %initial y value
    X2 = zeros(1,(1/h)+1); %vector to save x coordinates
    Y2 = zeros(1,(1/h)+1); %vector to save y coordinates
    
    for j = 2:((1/h)+1)
        f0 = yp(x, y);
        f1 = yp(x+(h/2), y+(h/2)*f0);
        f2 = yp(x+(h/2), y+(h/2)*f1);
        f3 = yp(x+h,y+h*f2);
    
        y = y + (h/6)*(f0 + 2*f1 + 2*f2 + f3);
    
        Y2(j) = y;
        X2(j) = x;

        x = x+h;
    end
h
X2
Y2
h = h/2;
end 
end
