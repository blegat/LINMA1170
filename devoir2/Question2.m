function [i1, i2] = Question2(L, a, iterator)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=sqrt(1 + 4*a + 4*a^2);
%k=0.02;
figure();
plot = subplot(2,2,1);
title(plot, 'Original');
colormap(gray);
imagesc(L);

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1
e=ones(M,1);
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1);
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR; % initial blurred image

plot = subplot(2,2,2);
title(plot, 'Blurred');
colormap(gray);
imagesc(A);

Ad = (A+Delta); % blurred image with perturbation

plot = subplot(2,2,3);
title(plot, 'Blurred + noise');
colormap(gray);
imagesc(Ad);

Y=zeros(M,N);
X=zeros(N,M);

tic()
% for i=1:N
%     if strcmp(iterator,'Jacobi')
%         [Y(:,i) i1] = Jacobi(TL, Ad(:,i), 0.00001);
%     else
%         [Y(:,i) i1] = GaussSeidel(TL, Ad(:,i), 0.00001);
%     end
% end

if strcmp(iterator,'Jacobi')
    [Y i1] = Jacobi(TL, Ad);
    [X i2] = Jacobi(TR, Y');
else
    [Y i1] = GaussSeidel(TL, Ad);
    [X i2] = GaussSeidel(TR, Y');
end

% for i=1:M
%     if strcmp(iterator,'Jacobi')
%         [X(:,i) i2] = Jacobi(TR, Y(i,:)', 0.00001);
%     else
%         [X(:,i) i2] = GaussSeidel(TR, Y(i,:)', 0.00001);
%     end
% end

toc()
X=X';
plot = subplot(2,2,4);
title(plot, '(blured + noise) unblurred');
colormap(gray);
imagesc(X);

NORM2 = sqrt(sum(sum((X-L).^2)))

emax=0;
deltaMax1=0; deltaMax2=0;
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
emax
deltaMax
deltaMax2
end
