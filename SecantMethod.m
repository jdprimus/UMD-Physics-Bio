function [root] = SecantMethod(a, b)
% Uses secant method to find the root of function BCDiff
% located between a and b on the number line

TOL = .0005;        % tolerance for root accuracy
x = ones(1, 1000);  % a matrix for saving iteration values
x(1) = a;
x(2) = b;
i = 3;
while true
  x(i) = x(i-1) - (BCDiff(x(i-1)))*((x(i-1) - x(i-2))/(BCDiff(x(i-1)) - BCDiff(x(i-2))));
  Error = abs(x(i) - x(i-1));
  i = i +1;
  root = x(i-1);
  if i > 100; break; end  % prevents an infinite loop 
  if Error < TOL; break; end
end
end

