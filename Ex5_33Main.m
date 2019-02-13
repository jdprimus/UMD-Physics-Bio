% Main
% Jeremy Primus

clc;
clear;

[y, iteration, h, x] = GaussSiedel;
for j = 1:iteration
    fprintf('%3.0f   %3.2f   %3.2f   %3.2f   %3.2f   %3.2f   %3.2f   %3.2f %3.2f   %3.2f   %3.2f   %3.2f\n', j, y(j,1), y(j,2), y(j,3), y(j,4), y(j,5), y(j,6), y(j,7), y(j,8), y(j,9), y(j,10), y(j,11))
end

a = (1/h^2) + (5/(2*h));
b = 10 - (2/h^2);
c = (1/h^2) - (5/(2*h));
B = [1 2 3 4 5 6 7 8 (9-(100*c))];

A = [b c 0 0 0 0 0 0 0;
     a b c 0 0 0 0 0 0;
     0 a b c 0 0 0 0 0;
     0 0 a b c 0 0 0 0;
     0 0 0 a b c 0 0 0;
     0 0 0 0 a b c 0 0;
     0 0 0 0 0 a b c 0;
     0 0 0 0 0 0 a b c;
     0 0 0 0 0 0 0 a b];
 
 [y2] = LUDecomp(A, B, 9);
 
 fprintf(' x   y\n')
 fprintf(' 0.0   0.0\n')
 for i = 1:9
     fprintf(' %1.1f  %3.2f\n',x(i+1),y2(i))
 end
 fprintf(' 1.0   100\n')