function [mu] = RQIS(A,x, muGiven)
%RQ Rayleigh Quotient Iteration for symmetric matrix
%  mu returns the approximation of the eigenvalue
%  x returns the approximation of the eigenvector linked to this mu
% Tested with  x = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]'; A = [1 2 3; 1 2 1; 3 2
% 1] => mu = 5.2361 ok (cf. wikipedia)

i = 1;
eLim = 1e-8;
err = eLim +1;
mu = muGiven; %(x'*A*x)/(x'*x);
mu
while (i < 100 && err > eLim) || i<3
    y = (A-mu*eye(size(A)))\x;
    x = y/norm(y);
    x
    mu1 = (x'*A*x)/(x'*x); % shift = rayleigh quotient --> eigenvalue
    err = abs(mu1-mu);
    mu= mu1;
    fprintf('iteration number : %d\n error : %f \n mu : %f \n ',i,err,mu)
    i = i + 1;
end
x
fprintf('final i : %d\n final mu : %f \n ',i-1, mu1)

end

