function [i1, i2] = Question2(L, a, iterator)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=abs(1+2*a);

[M N] = size(L);
TL = get_T(a,k,M);
TR = get_T(a,k,N);

[i1, i2, X] = doubleSolver(L, TL, eye(M), TR, eye(N), iterator, 'Q2', a, k);

%NORM2 = sqrt(sum(sum((X-L).^2)))

Delta = randn(M,N);
emax=0;
deltaMax=0; deltaMax2=0;
for i=1:M
    for j=1:N
        if norm(X(i,j)-L(i,j))>emax
            emax=norm(X(i,j)-L(i,j));
            deltaMax=Delta(i,j);
        end
        if norm(Delta(i,j))>deltaMax2
            deltaMax2=Delta(i,j);
        end
    end
end
end