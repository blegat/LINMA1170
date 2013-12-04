function q(num, method)

if num == 1
    q_0 = [0.4; 0];
    p_0 = [0; 2];
    n = 10000;
    if strncmp(method, 'symplectique', 12)
        h = 5e-2;
    else
        h = 5e-4;
    end

    f_1 = @f_1_q1;
    f_2 = @f_2_q1;
    H = @H_q1;
else
    q_0 = [0.4; 0; 0; 0];
    p_0 = [0; 2; 0; -2];
    n = 50000;
    h = 1e-4;

    m_1 = 3.343e4;
    m_2 = 1e4;
    G = 2.96e-4;
    f_1 = @f_1_q2;
    f_2 = @(q) f_2_q2(q, G, m_1, m_2);
    H = @(q, p) H_q2(q, p, G, m_1, m_2);
end

t = linspace(0, h * n, n+1);

if strcmp(method, 'explicite')
    [p, q] = euler_explicite(f_1, f_2, q_0, p_0, h, n);
elseif strcmp(method, 'implicite')
    [p, q] = euler_implicite(f_1, f_2, @J_1_q1, @J_2_q1, q_0, p_0, h, n);
elseif strcmp(method, 'symplectique1')
    h = 5e-2;
    [p, q] = euler_symplectique1(f_1, f_2, q_0, p_0, h, n);
elseif strcmp(method, 'symplectique2')
    h = 5e-2;
    [p, q] = euler_symplectique2(f_1, f_2, q_0, p_0, h, n);
end

figure();
plot(q(1,:), q(2,:), 'linewidth', 1);
xlabel('x');
ylabel('y');
if num == 2
    hold on;
    plot(q(3,:), q(4,:), 'r', 'linewidth', 1);
    legend('q_1', 'q_2');
end
saveas(gcf, sprintf('../images/Q%d_%s_q', num, method), 'png');

figure();
plot(p(1,:), p(2,:), 'linewidth', 1);
xlabel('x');
ylabel('y');
if num == 2
    hold on;
    plot(p(3,:), p(4,:), 'r', 'linewidth', 1);
    legend('p_1', 'p_2');
end
saveas(gcf, sprintf('../images/Q%d_%s_p', num, method), 'png');

figure();
h = zeros(1,n+1);
xlabel('temps');
for i = 1:n+1
    h(i) = H(q(:,i), p(:,i));
end
plot(t, h, 'linewidth', 2);
saveas(gcf, sprintf('../images/Q%d_%s_H', num, method), 'png');
end