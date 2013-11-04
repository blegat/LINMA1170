function [i1, i2, X, rho] = Question3(Img, a, r, iterator, task)
%   Img = image received 
%   

k=abs(1+2*a);

[M N] = size(Img);
TL = get_T(a,k,M);
TR = get_T(a,k,N);

Ay = TL'*TL + eye(M)*r^2;
By = TL';
Cy = r^2;

Ax = TR'*TR + eye(N)*r^2;
Bx = TR';
Cx = r^2;

[i1, i2, X, rho] = doubleSolver(Img, Ay, By, Cy, Ax, Bx, Cx, iterator, 'Q3', a, k, task);

end