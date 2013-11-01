function [x, i] = GaussSeidel(A, b, eps)
%
%   eps = theoretically frobenius norm, not yet implemented

D = diag(diag(A)); % diagonal matrix ( diag(diag()) )
L = tril(A) - D;
U = triu(A) - D;

[x, i] = iterative(D + L, -U, b, eps);

end