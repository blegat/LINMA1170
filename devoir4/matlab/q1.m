function q1(method)
num = 1; % Question 1
q_0 = [0.4; 0];
p_0 = [0; 2];
n = 10000;
h = 5e-4;
t = linspace(0, h * n, n+1);
if strcmp(method, 'explicite')
    [p, q] = euler_explicite(@f_1_q1, @f_2_q1, q_0, p_0);
elseif strcmp(method, 'implicite')
    [p, q] = euler_implicite(@f_1_q1, @f_2_q1, @J_1_q1, @J_2_q1, q_0, p_0, h, n);
end
figure();
plot(q(1,:), q(2,:));
saveas(gcf, sprintf('../images/Q%d_%s_q', num, method), 'png');
figure();
plot(p(1,:), p(2,:));
saveas(gcf, sprintf('../images/Q%d_%s_p', num, method), 'png');
figure();
H = getH(q, p, n);
plot(t, H);
saveas(gcf, sprintf('../images/Q%d_%s_H', num, method), 'png');
end

function [H] = getH(q, p, n)
H = zeros(1,n+1);
for i = 1:n+1
    H(i) = p(:,i)'*p(:,i)/2 - 1/norm(q(:,i));
end
end