function [X] = Question2(A, a, k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

figure(1)
imagesc(A);

[M N] = size(A);
Delta = randn(M,N);
e=ones(M,1); 
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1); 
TR = (1/k) * spdiags([a*e e a*e],-1:1, N,N);
I = TL*A*TR;

figure(2)
imagesc(I);

Ad = I+Delta;

figure(3)
imagesc(Ad);

Y=zeros(M,N);
X=zeros(N,M);

for i=1:N
[Y(:,i) i1] = Jacobi(TL, Ad(:,i), 0.0001);
end

for i=1:M
[X(:,i) i2] = Jacobi(TR, Y(i,:)', 0.0001);
end

X=X';
figure(4)
imagesc(X);

norm(A-X);















end

