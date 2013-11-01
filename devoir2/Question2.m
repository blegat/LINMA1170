function [i1, i2] = Question2(L, a, k, iterator)
%   L = image received 
%   a, k = coef T ( a/k sould be between 0 and 255)
%   

figure(1)
colormap(gray);
image(L);

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1 
e=ones(M,1); 
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1); 
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR % initial blurred image

figure(2)
colormap(gray);
imagesc(A);

Ad = A+Delta; % blurred image with perturbation

figure(3)
colormap(gray);
imagesc(Ad);

Y=zeros(M,N);
X=zeros(N,M);

tic()
for i=1:N
    if strcmp(iterator,'Jacobi')
        [Y(:,i) i1] = Jacobi(TL, Ad(:,i), 0.00001);
    else
        [Y(:,i) i1] = GaussSeidel(TL, Ad(:,i), 0.00001);
    end
end

for i=1:M
    if strcmp(iterator,'Jacobi')
        [X(:,i) i2] = Jacobi(TR, Y(i,:)', 0.00001);
    else
        [X(:,i) i2] = GaussSeidel(TR, Y(i,:)', 0.00001);
    end
end
toc()
X=X';
figure(4)
colormap(gray);
imagesc(X);

end

