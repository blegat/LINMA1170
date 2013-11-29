function q1
q_0 = [0.4; 0];
p_0 = [0; 2];
n = 100000;
h = 5e-4;
t = linspace(0, h * n, n+1);
%[pe, qe] = euler_explicite(@f_1, @f_2, q_0, p_0);
[pe, qe] = euler_implicite(@f_1, @f_2, @J_1, @J_2, q_0, p_0);
plot(qe(1,:), qe(2,:), pe(1,:), pe(2,:), t, getH(qe,pe));
legend('q', 'p', 'H');
end

function [H] = getH(q, p)
n= 100000;
H = zeros(1,n+1);
for i = 1:n+1
    H(i) = p(:,i)'*p(:,i)/2 - 1/norm(q(:,i));
end
end