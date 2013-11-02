function [i1, i2, Norm] = Question2(L, a, iterator)
%   L = image received
%   a, k = coef T ( a/k sould be between 0 and 255)
%

k=sqrt(1 + 4*a + 4*a^2);
%k=0.02;
save_image(L, sprintf('Q2/original_%d',a*100));

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1
e=ones(M,1);
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1);
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR; % initial blurred image

save_image(A, sprintf('Q2/blurred_%d',a*100));

Ad = (A+Delta); % blurred image with perturbation

save_image(Ad, sprintf('Q2/noise_%d',a*100));

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
save_image(X, sprintf('Q2/unblurred_%d',a*100));

%NORM2 = sqrt(sum(sum((X-L).^2)))


Norm = [norm(X-L)/norm(X) , ((1+2*a)/(1-2*a))^2*norm(Delta)/norm(A)];


% emax=0;
% deltaMax1=0; deltaMax2=0;
% for i=1:M
%     for j=1:N
%         if norm(X(i,j)-L(i,j))>emax
%             emax=norm(X(i,j)-L(i,j));
%             deltaMax=Delta(i,j);
%         end
%         if norm(Delta(i,j))>deltaMax2
%             deltaMax2=Delta(i,j);
%         end
%     end
% end
% emax
% deltaMax
% deltaMax2
end
