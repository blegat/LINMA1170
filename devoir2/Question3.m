function [X] = Question3(L, a, k, r, n)
%   L = image received 
%   a, k = coef T ( a/k sould be between 0 and 255)
%   

save_image(L, 'Q3/original');

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1 
e=ones(M,1); 
TL = (1/k) * spdiags([a*e e a*e],-1:1, M,M);
f=ones(N,1); 
TR = (1/k) * spdiags([a*f f a*f],-1:1, N,N);
A = TL*L*TR; % initial blurred iamge

figure(2)
imagesc(A);
colormap(gray)

Ad = A+Delta; % blurred image with perturbation

figure(3)
imagesc(Ad);
colormap(gray)

Add = mean(mean(Ad))*ones(M,N);

Y=zeros(M,N);
X=zeros(N,M);

if n==1
    Ay = TL'*TL + eye(M)*r^2;
    by = TL'*Ad + Add*r^2;
    
    D = diag(diag(Ay));
    L = tril(Ay) - D;
    U = triu(Ay) - D;
    max(abs(eig(-D\(L+U))))
    
    for i=1:N
        Y(:,i) = Jacobi(Ay, by(:,i), 0.00001);
    end
    
    Ax = TR'*TR + eye(N)*r^2;
    bx = TR'*Y' + Add'*r^2;
    
    D = diag(diag(Ax));
    L = tril(Ax) - D;
    U = triu(Ax) - D;
    max(abs(eig(-D\(L+U))))
    
    for i=1:M
        X(:,i) = Jacobi(Ax, bx(:,i), 0.00001);
    end
end

if n==2
    Ay = TL'*TL + eye(M)*r^2;
    by = TL'*Ad + Add*r^2;
    
    D = diag(diag(Ay));
    L = tril(Ay) - D;
    U = triu(Ay) - D;
    max(abs(eig(-(D+L)\U)))
    
    for i=1:N
        Y(:,i) = GaussSeidel(Ay, by(:,i), 0.00001);
    end
    
    Ax = TR'*TR + eye(N)*r^2;
    bx = TR'*Y' + Add'*r^2;
    
    D = diag(diag(Ax));
    L = tril(Ax) - D;
    U = triu(Ax) - D;
    max(abs(eig(-(D+L)\U)))
    
    for i=1:M
        X(:,i) = GaussSeidel(Ax, bx(:,i), 0.00001);
    end
end

X=X';
figure(4)
imagesc(X);
colormap(gray)

end