function [p, q] = euler_implicite (f_1, f_2, J_1, J_2, q_0, p_0)
n = 100000;
h = 5e-4;
m = numel(q_0);
q = zeros(m,n+1);
p = zeros(m,n+1);
q(:,1) = q_0;
p(:,1) = p_0;
for k = 1:n
    fu = @(u) [q(:,k) + h*f_1(u(m+1:2*)); p(:,k) + h*f_2(u(1:m))];
    Ju = @(u) [-eye(m), J_1(u(m+1:2*m)); J_2(u(1:m)), -eye(m)];
    u_0 = [q(:,k); p(:,k)];
    u = newton_raphson(fu, Ju, u_0);
    q(:,k+1) = u(1,m);
    p(:,k+1) = u(m+1,2*m);
end
end