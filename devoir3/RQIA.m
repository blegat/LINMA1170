function [ rho ] = RQIA(A, x, y)
% RQA Asymmetric Rayleigh quotient iteration
%   
% Tested with  x = [1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]'; y = [1 0 0];
% A = [1 2 3; 1 2 1; 3 2 1] => mu = 5.2361 ok 

i = 1;
eLim = 1e-5;
err = eLim +1;
rho = (y'*A*x)/(y'*x);

while i < 100 && err > eLim
    x = (A-rho*eye(size(A)))\x;
    y = (A-rho*eye(size(A)))\y;
    rho1 = (y'*A*x)/(y'*x);
    err = norm(rho1-rho);
    rho= rho1;
    i = i + 1
end

