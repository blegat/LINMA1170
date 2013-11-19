function [ rho ] = RQA(A, x, y)
%RQA Asymmetric Rayleigh quotient iteration
%   

for i = 1:10
    rho = (y'*A*x)/(y'*x);
    x = (A-rho*eye(size(A)))\x;
    y = (A-rho*eye(size(A)))\y;
end

