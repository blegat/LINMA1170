function [X, i] = Jacobi(A, b, eps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

i=0;
n=1e4;
x1 = zeros(length(A));
x2 = zeros(length(A));
while i<n && err>eps
x2 = ((L+U)*x1 + b)/D;
x1=x2;
err = norm(x2-x1);
i=i+1;
end
X=x2;
end

