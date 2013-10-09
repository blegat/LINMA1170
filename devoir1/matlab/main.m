function N = main(a, b, n)
% auteurs : groupe 3 (Arnaud Cerckel and Benoit Legat and
% Nicolas Stevens and Harold Taeter)
alpha = zeros(1,n);
beta = [-sqrt(2)/2 -1/2 * ones(1,n-1)];
p_a = polyval_recurrence(alpha, beta, a);
p_b = polyval_recurrence(alpha, beta, b);
V_a = V(p_a);
V_b = V(p_b);
N = V_a - V_b;
fprintf('N(%.1d,%.1d) = V(%.1d) - V(%.1d) = %d - %d = %d\n', ...
    a, b, a, b, V_a, V_b, N);
end
