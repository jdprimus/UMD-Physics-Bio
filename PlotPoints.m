function PlotPoints
x = [0.0; 1.0; 2.0; 3.0; 4.0; 5.0; 6.0; 7.0; 8.0; 9.0; 10.0];
N=11;
f = [0.0; 0.4400505857; 0.5767248078; 0.3390589585; -0.0660433280; -0.3275791376; -0.276683581; -0.0046828235; 0.2346363469; 0.2453117866; 0.043727462];
fp1 = 0.5;
fpN = -0.250283;
second = NaturalSplineInit(x, f,  N);
second = SplineInit(x, f, fp1, fpN, N);
for xvalue = 0:0.1:10
  if (mod(xvalue,1) == 0)
    for j = 1:N
      plot(x(j),f(j))
    end
  else
    y = Spline(xvalue, x, f, second, N);
    plot(xvalue, y, '*r')
    figure (1)
    xlabel ('x')
    ylabel ('Bessel Value')
  end
    hold on
    title ('Natural Spline Interpolation of J1')
end
end
