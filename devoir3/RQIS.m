function [rho] = RQIS(A,x)
%RQ Rayleigh Quotient Iteration for symetric matrix
%  
% in :      - 'A' = matrix (real or complex, symetric) n*n
%           - 'x' is a vector n*1
%
% out :     - rho is the approximation of an eigenvalue of A

i = 1;
eLim = 1e-5;
err = eLim +1;
rho= (x'*A*x)/(x'*x);

while i < 500 && err > eLim
    y = (A-rho*eye(size(A)))\x;
    x = y/norm(y);
    rho1 = (x'*A*x)/(x'*x); 
    err = abs(rho1-rho);
    rho = rho1;
    fprintf('iteration number : %d\n error : %f \n rho : %f \n ',i,err,rho)    
    i = i + 1;
end

fprintf('final i : %d\n final rho : %f \n ',i-1, rho1)

end

