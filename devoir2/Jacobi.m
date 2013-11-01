function [x, i] = Jacobi(A, b, eps)

if nargin < 3
    eps = 1e-5;
end

D = diag(diag(A));

[x, i] = iterative(D, D - A, b, eps);

end