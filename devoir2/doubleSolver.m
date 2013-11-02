function [i1, i2, X] = doubleSolver (Img, A1, B1, C1, A2, B2, C2, iterator, dir, a, k, graph)
% Solve
%   A1 Y  = B1 (Img + Delta) + C1 * mean(Img + Delta)   (1)
%   A2 X' = B2 Y'            + C2 * mean(Img + Delta)   (2)
% where Delta is a normal distribution of mean 0 and variance 1.
% It uses Jacobi if iterator == 'Jacobi' or else it uses Gauss-Seidel
% It stores the images at 'dir/..._a.png'.
% i1 is the number of iterations used to solve (1) and i2 to solve (2)

save_image(Img, sprintf('%s/original_%d', dir, a*100), graph);

[M N] = size(Img);

TL = get_T(a, k, M);
TR = get_T(a, k, N);
IB = TL * Img * TR; % initial blurred image
save_image(IB, sprintf('Q2/blurred_%d', a*100), graph);

Delta = randn(M, N); % Ok mean = 0 variance = 1
IBN = (IB + Delta); % blurred image with perturbation
save_image(IBN, sprintf('Q2/noise_%d', a*100), graph);

meanIBN = mean(mean(IBN));

if strcmp(iterator,'Jacobi')
    [Y i1] = Jacobi(A1, B1 * IBN + C1 * meanIBN);
    [X i2] = Jacobi(A2, B2 * Y' + C2 * meanIBN);
else
    [Y i1] = GaussSeidel(A1, B1 * IBN + C1 * meanIBN);
    [X i2] = GaussSeidel(A2, B2 * Y' + C2 * meanIBN);
end

X=X';
save_image(X, sprintf('Q2/unblurred_%d', a*100), graph);
end