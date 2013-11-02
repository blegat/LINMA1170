function [i1, i2, X] = doubleSolver (L, A1, B1, A2, B2, iterator, dir, a, k)
% Solve
%   A1 Y  = B1 (L + Delta)   (1)
%   A2 X' = B2 Y'            (2)
% where Delta is a normal distribution of mean 0 and variance 1.
% It uses Jacobi if iterator == 'Jacobi' or else it uses Gauss-Seidel
% It stores the images at 'dir/..._a.png'.
% i1 is the number of iterations used to solve (1) and i2 to solve (2)

save_image(L, sprintf('%s/original_%d', dir, a*100));

[M N] = size(L);
Delta = randn(M,N); % Ok mean = 0 variance = 1
TL = get_T(a,k,M);
TR = get_T(a,k,N);
A = TL*L*TR; % initial blurred image

save_image(A, sprintf('Q2/blurred_%d',a*100));

Ad = (A+Delta); % blurred image with perturbation

save_image(Ad, sprintf('Q2/noise_%d',a*100));

Y=zeros(M,N);
X=zeros(N,M);

%tic()

if strcmp(iterator,'Jacobi')
    [Y i1] = Jacobi(A1, B1 * Ad);
    [X i2] = Jacobi(A2, B2 * Y');
else
    [Y i1] = GaussSeidel(A1, B1 * Ad);
    [X i2] = GaussSeidel(A2, B2 * Y');
end

%toc()

X=X';
save_image(X, sprintf('Q2/unblurred_%d',a*100));
end