function [x, i] = iterative (M, N, b, eps, n)
% Iterate over x_k using
% Mx_{k+1} = Nx_k + b
% until the frobenius norm of x_{k+1}-x_k < eps or until x_n.
% Arguments
%   eps defaults to 1e-5
%   n   defaluts to 500
% Returns
%   x the last x_k calculated
%   i the index k of the last x_k calculated

if nargin < 5
    n = 500;
    if nargin < 4
        eps = 1e-5;
    end
end

err  = eps + 1;
i    = 0;

x0   = b;
xk   = x0;
xkp1 = x0;
while i < n && err > eps
    xkp1 = M \ (N * xk + b);
    err  = norm(xkp1 - xk, 'fro');
    i    = i + 1;
end
x=xkp1;

end