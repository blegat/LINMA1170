function [X] = Question2(L, a, k)
%   L = image received 
%   a, k = coef T ( a/k sould be between 0 and 255)
%   

figure(1)
imagesc(L);

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1 
e=ones(M,1); 
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1); 
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR; % initial blurred iamge

figure(2)
imagesc(A);

Ad = A+Delta; % blurred image with perturbation

figure(3)
imagesc(Ad);

Y=zeros(M,N);
X=zeros(N,M);

for i=1:N
[Y(:,i) i1] = Jacobi(TL, Ad(:,i), 0.0001);
%[Y(:,i) i1] = GaussSeidel(TL, Ad(:,i), 0.00001);
end

for i=1:M
  [X(:,i) i2] = Jacobi(TR, Y(i,:)', 0.0001);
%[X(:,i) i2] = GaussSeidel(TR, Y(i,:)', 0.00001);
end

X=X';
figure(4)
imagesc(X);

norm(A-X); % the question is simply why do u do this ? 

end

