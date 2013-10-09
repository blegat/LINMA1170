function N = main(a, b, n)
alpha = zeros(1,n);
beta = -1/2 * ones(1,n);
p_a = polyval_recurrence(alpha, beta, a);
p_b = polyval_recurrence(alpha, beta, b);
V_a = V(p_a);
V_b = V(p_b);
N = V_a - V_b;
fprintf('N(%.1d,%.1d) = V(%.1d) - V(%.1d) = %d - %d = %d\n', ...
    a, b, a, b, V_a, V_b, N);
end
