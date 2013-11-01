function [x, i] = Jacobi(A, b, eps)

D = diag(diag(A));

[x, i] = iterative(D, D - A, b, eps);

end