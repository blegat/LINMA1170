function p = polyval_recurrence (alpha, beta, x)
% POLYVAL_RECURRENCE Evalue tous les polynomes p_k en un point x en O(n)
%
%  [p] = polyval_recurrence(alpha, beta, x) renvoie p respectant la recurrence
%         p_k(x) = (x - alpha_k) * p_{k-1}(x) - beta_k^2 * p_{k-2}(x)
%  ou alpha = [alpha_1 alpha_2 ... alpha_n], beta = [beta_2 beta_3 ... beta_n]
%  et p = [p_0 p_1 p_2 ... p_n].
%  On a donc alpha_k = p(k), beta_k = beta(k-1) et p_k = p(k+1).

n = length(alpha);
p = zeros(numel(x), n);

p(:,1) = 1;
p(:,2)= x - alpha(1);

for k = 2:n
  p(:,k+1) = (x - alpha(k)) .* p(:,k) - (beta(k-1))^2 * p(:,k-1);
end

end
