function [ rho ] = RQIA(A, x, y)
% RQA Asymmetric Rayleigh quotient iteration
%   
 

i = 1;
eLim = 1e-5;
err = eLim +1;
rho = (y'*A*x)/(y'*x);

while i < 100 && err > eLim
    x = (A-rho*eye(size(A)))\x;
    y = (A-rho*eye(size(A)))'\y;
    rho1 = (y'*A*x)/(y'*x);
    err = abs(rho1-rho);
    rho= rho1;
    fprintf('iteration number : %d\n error : %f \n rho : %f \n ',i,err,rho)
    i = i + 1;
end


end


