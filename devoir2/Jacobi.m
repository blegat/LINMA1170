function [x, i, rho] = Jacobi(A, b, task, eps)

if nargin < 4
    eps = 1e-5;
    if nargin < 3
        task = 0;
    end
end

D = diag(diag(A));
%                         = -(U + L)
[x, i, rho] = iterative(D, D - A, b, task, eps);

end