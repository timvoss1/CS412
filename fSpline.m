function [ s ] = fSpline( F, a, b, n )

x = linspace(a,b,n);
y = eval(F);

s = spline(x,y);


end

