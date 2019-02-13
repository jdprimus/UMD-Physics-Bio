%Program using Richardson Extrapolation for calculation 
% of second derivative
clear;
x = 2.0; %point to be evaluated
h = 0.4; %initial step size 
new = ones(4);
new(1) = 1;
iteration = 0; %records number of iterations
while (iteration < 5)
    iteration = iteration + 1;
    for i = 1:4
        old(i) = new(i);
    end
  %Evaluate second derivative using central differance formula
  new(1) = (f(x+h) - 2*f(x) + f(x-h))/(h^2);

      D(iteration,1) = new(1);
  if (iteration >= 2)
      new(2)=(4*new(1) - old(1))/3;
      D(iteration,2) = new(2);
  end
  if (iteration >= 3)
      new(3)=(16*new(2) - old(2))/15;
      D(iteration,3) = new(3);
  end
  if (iteration >= 4)
      new(4)=(64*new(3) - old(3))/63; 
      D(iteration,4) = new(4);
  end
  
  h = h/2.0;
end
disp(D)
