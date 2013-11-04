function [rho1 rho2] = find_rho3(L, a, r, n)
%   L = image received 
%   a, k = coef T ( a/k sould be between 0 and 255)
%   

k = 1 + 2*a;

[m n] = size(L);
e=ones(m,1); 
TL = (1/k) * spdiags([a*e e a*e],-1:1, m,m);
f=ones(n,1); 
TR = (1/k) * spdiags([a*f f a*f],-1:1, n,n);

if strcmp(n, 'Jacobi')
    Ay = TL'*TL + eye(m)*r^2;
    
    D = diag(diag(Ay));
    L = tril(Ay) - D;
    U = triu(Ay) - D;
    rho1 = max(abs(eig(-D\(L+U))));
    
    Ax = TR'*TR + eye(n)*r^2;
    
    D = diag(diag(Ax));
    L = tril(Ax) - D;
    U = triu(Ax) - D;
    rho2 = max(abs(eig(-D\(L+U))));
else
    Ay = TL'*TL + eye(m)*r^2;
    
    D = diag(diag(Ay));
    L = tril(Ay) - D;
    U = triu(Ay) - D;
    M = D + L;
    N = -U;
    rho1 = max(abs(eig(M\N)));
    
    Ax = TR'*TR + eye(n)*r^2;
    
    D = diag(diag(Ax));
    L = tril(Ax) - D;
    U = triu(Ax) - D;
    M = D + L;
    N = -U;
    rho2 = max(abs(eig(M\N)));
    
end

end