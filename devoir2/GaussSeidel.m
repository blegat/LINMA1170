function [x, i, rho] = GaussSeidel(A, b, task, eps)

if nargin < 4
    eps = 1e-5;
    if nargin < 3
        task = 0;
    end
end

D = diag(diag(A)); % diagonal matrix ( diag(diag()) )
L = tril(A) - D;
U = triu(A) - D;

[x, i, rho] = iterative(D + L, -U, b, task, eps);

end