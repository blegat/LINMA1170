clear all;
load devoir2_image;
for a = [0.2 0.4 0.45 0.5]
    fprintf('%.2f', a);
    [i1 i2] = Question2(I, a, 'Jacobi');
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question2(I, a, 'Gauss-Seidel');
    fprintf(' & %d & %d', i1, i2);
    fprintf('\\\\\n');
end