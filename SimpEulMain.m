function [X0,Y0] = SimpEulMain()
%Simple Euler Main Program
h = 0.20; %initial step size

for i = 1:3
    
    x = 0; %initial x value
    y = 0; %initial y value
    X0 = zeros(1,(1/h)+1); %vector to save x coordinates
    Y0 = zeros(1,(1/h)+1); %vector to save y coordinates
  for j = 2:(1/h)+1
    Y0(j) = y + h*yp(x,y);
    x = x+h;
    X0(j) = x;
    y = Y0(j);
  end
  
h
X0
Y0
h = h/2;
end
end

