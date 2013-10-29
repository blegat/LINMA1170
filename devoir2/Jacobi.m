function [X, i] = Jacobi(A, b, eps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

i=0;
err=eps+1;
n=1000;
x1 = zeros(length(A), 1);
x2 = zeros(length(A), 1);
while i<n && err>eps
x2 = D\(-(L+U)*x1 + b);
err = norm(x2-x1);
x1=x2;
i=i+1;
end
X=x2;
end

