function [mu, y] = RQS(A,x)
%RQ Rayleigh Quotient Iteration for symmetric matrix
%  mu returns the approximation of the largest eigenvalue
%  x returns the approximation of the eigenvector linked to this eigenvalue

for i = 1:10
    mu = (x'*A*x)/(x'*x); % shift = rayleigh quotient --> eigenvalue
    y = (A-mu*eye(size(A)))\x;
    x = y/norm(y);
end

end

