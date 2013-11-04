function [x, i, rho] = iterative (M, N, b, task, eps, n)
% Iterate over x_k using
% Mx_{k+1} = Nx_k + b
% until the frobenius norm of x_{k+1}-x_k < eps or until x_n.
% Arguments
%   eps  defaults to 1e-5
%   n    defaluts to 500
%   task if 3, only does rho defaults to 0
% Returns
%   x the last x_k calculated
%   i the index k of the last x_k calculated

if nargin < 6
    n = 500;
    if nargin < 5
        eps = 1e-5;
        if nargin < 4
            task = 0;
        end
    end
end

if task == 3
    opts.maxit = 1000;
    rho = max(abs(eigs(M \ N,1,'LM',opts)));
    x = b;
    i = 0;
else
    rho = 0;
    err  = eps + 1;
    i    = 0;

    x0   = b;
    xk   = x0;
    xkp1 = x0;
    while i < n && err > eps
        xkp1 = M \ (N * xk + b);
        err  = norm(xkp1 - xk, 'fro');
        i    = i + 1;
        xk = xkp1;
    end
    x=xkp1;
end

end