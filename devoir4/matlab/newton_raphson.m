function [u] = newton_raphson (f, J, u_0)
u = u_0;
tol = 1e-10;
err = tol+1;
nmax = 42;
n = 0;
while err > tol && n < nmax
    du = -J(u) \ f(u);
    u = u + du;
    err = norm(du);
    n = n + 1;
end
end