function [ root, error ] = fSecant( fct, guess1, guess2, accuracy )
%Description:
%
%   Finds a route of the input function nearest to the guess.
%   Uses the secant approximation for finding roots.
%
%Inputs:
%
%   fct in terms of symbolic x

F = fct;
y(1) = guess1;
y(2) = guess2;

x = y(1);
f(1) = eval(F);

x = y(2);
f(2) = eval(F);

error(1) = abs(f(1) - f(2));
i = 2;

    while abs(error(i-1)) > 10^-accuracy && i < 50
        i = i + 1;
        y(i) = y(i-1) - (f(i-1) * (y(i-1) - y(i-2)))/(f(i-1) - f(i-2));
        x = y(i);
        f(i) = eval(F);
        error(i-1) = abs(f(i) - f(i-1));
    end

    root = y;

end

