clear all;
load devoir2_image;
for a = 0.2:0.2:0.4
    find_r(I, a, 'Jacobi');
end