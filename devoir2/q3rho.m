clear all;
load devoir2_image;
Img = I;
q3rho_method('Jacobi', Img);
q3rho_method('Gauss-Seidel', Img);