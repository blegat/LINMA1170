clear all;
load devoir2_image;
for a = [0.2]
    fprintf('%.2f', a);
<<<<<<< HEAD
<<<<<<< HEAD
    [i1 i2] = Question3(I, a, 0.6, 'Jacobi',1);
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question3(I, a, 0.6, 'Gauss-Seidel',1);
=======
    [i1 i2] = Question3(I, a, 0.6, 'Jacobi', 2);
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question3(I, a, 0.6, 'Gauss-Seidel', 2);
>>>>>>> 8f33d91c04c413837750f51cf3acc5f6228342a7
=======
    [i1 i2] = Question3(I, a, 1, 'Jacobi');
    fprintf(' & %d & %d', i1, i2);
    [i1 i2] = Question3(I, a, 1, 'Gauss-Seidel');
>>>>>>> cfe75ca6c1454e6caa8afe2e45c62ee96dfaeab6
    fprintf(' & %d & %d', i1, i2);
    fprintf('\\\\\n');
end