function [i1, i2, X, rho] = Question2(Img, a, iterator, graph)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=abs(1+2*a);

[M N] = size(Img);
TL = get_T(a,k,M);
TR = get_T(a,k,N);

[i1, i2, X, rho] = doubleSolver(Img, TL, eye(M), 0, TR, eye(N), 0, iterator, 'Q2', a, k, graph);

end
