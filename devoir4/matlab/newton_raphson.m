function [q, p] = newton_raphson (f, J, u_0)
u = u_0;
tol = 1e-4;
err = tol+1;
nmax = 42;
n = 0;
while err > tol && n < nmax
    du = -J(u) \ f(u);
    u = u + du;
    tol = norm(u);
    n = n + 1;
end
end