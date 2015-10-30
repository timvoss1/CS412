function [ root, error ] = fNewton( fct, guess, accuracy )

syms x
F = fct;
G = x - F/diff(F);

G_prime = diff(G);
g(1) = guess;
i = 2;
error(1) = 1;

while abs(error(i-1)) > 10^-(accuracy) && i < 30
    x = g(i-1);
    g(i) = eval(G);
    error(i) = abs(g(i) - g(i-1));
   
    %This divergence checking assumes non osscilating iterations (+, -, +,..) 
    %Check upper bound of solution range for divergence
    x = g(i) + error(i)/2;
    if abs(eval(G_prime)) > 1
       root = 0;
       break
    end    
    
    i = i + 1; 
end

root = g;

end

