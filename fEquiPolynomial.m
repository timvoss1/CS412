function [ p ] = fEquiPolynomial( F, a, b, n )
%%returns a symbolic polynomial:p(t) that fits function F
%on the interval [a,b] spaced at n points.


x = linspace(a,b,n);
y = eval(F);

M = zeros(length(x), length(x)+1);

M(:,1) = x;
M(:,2) = y;
counter = 0;
for i = 3:(length(x)+1)
    counter = counter + 1;
    for j = 1:(length(x))
        if j <= length(x) - counter
            M(j, i) = (M(j,i-1) - M(j+1, i-1))/(M(j,1) - M(i+j-2,1));
        end
    end
end

p = 0;
syms t;
N(1) = (1-t*0);
P(1) = N(1)*M(1,2);
for i = 1:(length(x)-1)
    N(i+1) = N(i)*(t-M(i,1));
    P(i+1) = N(i+1)*M(1,2+i);
end

p = sum(P);

end

