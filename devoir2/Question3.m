function [i1, i2, X, rho] = Question3(Img, a, r, iterator, task)
%   L = image received 
%   a, k = coef T ( a/k sould be between 0 and 255)
%   

k=abs(1+2*a);

[M N] = size(Img);
TL = get_T(a,k,M);
TR = get_T(a,k,N);

%Delta = randn(M,N); % Ok mean = 0 variance = 1 
%A = TL*Img*TR; % initial blurred image
%Ad = A+Delta; % blurred image with perturbation
%Add = mean(mean(Ad))*ones(M,N);

Ay = TL'*TL + eye(M)*r^2;
By = TL';
Cy = r^2;

%D = diag(diag(Ay));
%L = tril(Ay) - D;
%U = triu(Ay) - D;
%max(abs(eig(-D\(L+U))))

Ax = TR'*TR + eye(N)*r^2;
Bx = TR';
Cx = r^2;

%D = diag(diag(Ax));
%L = tril(Ax) - D;
%U = triu(Ax) - D;
%rho = max(abs(eig(-D\(L+U))))
%i1=0;
%i2=0;
%X=0;

[i1, i2, X, rho] = doubleSolver(Img, Ay, By, Cy, Ax, Bx, Cx, iterator, 'Q3', a, k, task);

end