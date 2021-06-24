interval_expansion= linspace(-20,20,20);
for k = 1:size(interval_expansion,2) 
    if mod(k,2) == 0
        expansion(k) = x(k/2)
    else
        expansion(k) = 0
    end
end

subplot(3,1,3)
stem(interval_expansion,expansion)
xlabel("interval")
ylabel("Function expanded")
title("Expansion vs interval")