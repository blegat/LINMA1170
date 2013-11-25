function [rho] = RQIS(A,x)
%RQ Rayleigh Quotient Iteration for symmetric matrix
%  rho returns the approximation of the eigenvalue
%  x returns the approximation of the eigenvector linked to this rho
% 

i = 1;
eLim = 1e-5;
err = eLim +1;
rho= (x'*A*x)/(x'*x);

while i < 500 && err > eLim
    y = (A-rho*eye(size(A)))\x;
    x = y/norm(y);
    rho1 = (x'*A*x)/(x'*x); % shift = rayleigh quotient --> eigenvalue
    err = abs(rho1-rho);
    rho = rho1;
    fprintf('iteration number : %d\n error : %f \n rho : %f \n ',i,err,rho)    
    i = i + 1;
end

fprintf('final i : %d\n final rho : %f \n ',i-1, rho1)

end

