function [T] = get_T (a, k, n)
e=ones(n,1);
T = (1/k) * spdiags([a*e e a*e], -1:1, n, n);
end