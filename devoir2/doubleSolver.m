function [i1, i2, X, rho] = doubleSolver (Img, A1, B1, C1, A2, B2, C2, iterator, dir, a, k, task)
% Solve
%   A1 Y  = B1 (Img + Delta) + C1 * mean(Img + Delta)   (1)
%   A2 X' = B2 Y'            + C2 * mean(Img + Delta)   (2)
% where Delta is a normal distribution of mean 0 and variance 1.
% It uses Jacobi if iterator == 'Jacobi' or else it uses Gauss-Seidel
% It stores the images at 'dir/..._a.png'.
% i1 is the number of iterations used to solve (1) and i2 to solve (2)
% task:
%   0 just solve
%   1 solve + export in png
%   2 solve + plot
%   3 just print rho

save_image(Img, sprintf('%s/original_%d', dir, a*100), task);

[M N] = size(Img);

TL = get_T(a, k, M);
TR = get_T(a, k, N);
IB = TL * Img * TR; % initial blurred image

save_image(IB, sprintf('%s/blurred_%d', dir, a*100), graph);

Delta = randn(M, N); % Ok mean = 0 variance = 1
IBN = (IB + Delta); % blurred image with perturbation
save_image(IBN, sprintf('%s/noise_%d', dir, a*100), graph);

meanIBN = mean(mean(IBN));

if strcmp(iterator,'Jacobi')
    [Y, i1, rho] = Jacobi(A1, B1 * IBN + C1 * meanIBN, task);
    [X, i2, rho] = Jacobi(A2, B2 * Y' + C2 * meanIBN, task);
else
    [Y, i1, rho] = GaussSeidel(A1, B1 * IBN + C1 * meanIBN, task);
    [X, i2, rho] = GaussSeidel(A2, B2 * Y' + C2 * meanIBN, task);
end
X=X';

<<<<<<< HEAD
% emax=0;
% for i=1:M
%     for j=1:N
%         if norm(X(i,j)-Img(i,j))/Img(i,j) >emax
%             emax=norm(X(i,j)-Img(i,j))/Img(i,j);
%         end
%     end
% end
% emax

save_image(X, sprintf('%s/unblurred_%d', dir, a*100), graph);
=======
save_image(X, sprintf('Q2/unblurred_%d', a*100), task);
>>>>>>> cfe75ca6c1454e6caa8afe2e45c62ee96dfaeab6
end
