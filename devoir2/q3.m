clear all;
load devoir2_image;
for a = [0.2]
    fprintf('%.2f', a);
    [i1 i2] = Question3(I, a, 1, 'Jacobi');
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question3(I, a, 1, 'Gauss-Seidel');
    fprintf(' & %d & %d', i1, i2);
    fprintf('\\\\\n');
end