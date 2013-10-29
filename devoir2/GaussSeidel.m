function [X, i] = GaussSeidel(A, b, eps)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

i=0;
n=1000;
x = zeros(length(A), 1);
x0 = zeros(length(A), 1);
err = eps+1;

while i<n && err>eps
x0=x;
x = (D+L)\(-U*x + b);
err = norm(x-x0);
i=i+1;
end
X=x;
end

