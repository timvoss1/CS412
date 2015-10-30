function [ root, error ] = fBisection( fct, guess1, guess2, accuracy )

F = fct;
a_guess = guess1;
b_guess = guess2;

a(1) = a_guess;
b(1) = b_guess;
i = 1;
error(1) = abs((b(1) - a(1))/2);

while abs(error(i)) > 10^-(accuracy) && i < 50
    i = i + 1; 
    c(i-1) = (a(i-1) + b(i-1))/2;
    
    x = a(i-1);
    f = eval(F);
    
    x = c(i-1);
    g = eval(F);
    
    if g*f < 0 
       a(i) = a(i-1);
       b(i) = c(i-1);
    else
        a(i) = c(i-1);
        b(i) = b(i-1);
    end
    
    error(i) = abs((b(i) - a(i))/2);
    
    
end

root = c;

end

