function [x, i] = GaussSeidel(A, b, eps)
%
%   eps = theoretically frobenius norm, not yet implemented

if nargin < 3
    eps = 1e-5;
end

D = diag(diag(A)); % diagonal matrix ( diag(diag()) )
L = tril(A) - D;
U = triu(A) - D;

[x, i] = iterative(D + L, -U, b, eps);

end