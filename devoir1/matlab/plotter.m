n = 20;
alpha = zeros(1,n);
beta = 1/2 * ones(1,n);
x = linspace(-1,1);
axis([-1,1,-1,1]);hold on;
pp = polyval_recurrence(alpha, beta, x');
plot(x, pp(:,n+1));