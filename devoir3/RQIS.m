function [mu] = RQIS(A,x)
%RQ Rayleigh Quotient Iteration for symmetric matrix
%  mu returns the approximation of the eigenvalue
%  x returns the approximation of the eigenvector linked to this mu
% Tested with  x = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]'; A = [1 2 3; 1 2 1; 3 2
% 1] => mu = 5.2361 ok (cf. wikipedia)

i = 1;
eLim = 1e-5;
err = eLim +1;
mu = (x'*A*x)/(x'*x);
while i < 100 && err > eLim
    y = (A-mu*eye(size(A)))\x;
    x = y/norm(y);
    mu1 = (x'*A*x)/(x'*x); % shift = rayleigh quotient --> eigenvalue
    err = norm(mu1-mu);
    mu= mu1;
    i = i + 1
end

end

